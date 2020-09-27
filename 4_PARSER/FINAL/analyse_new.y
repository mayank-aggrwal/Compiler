
%{
    #include <stdio.h>
    #include<stdlib.h> 
    extern FILE *yyin;
%}
%token op dec_num oct_num hex_num pre_pro_dir header_file endStmt struct_KW main_KW for_KW while_KW if_KW else_KW assign_op string id dataT return_KW hash leftAng rightAng rightCB leftCB leftP rightP equal comma 

 
%%
S : E    {printf("Successfully parsed the program ...\n");}
;

E : hash pre_pro_dir leftAng header_file rightAng EDash {printf("e1\n");}
;

EDash : E {printf("e2\n");}| 
        var_dec endStmt EDash {printf("e3\n");}|
        func_declaration endStmt EDash {printf("e4\n");}| 
        func_def EDash {printf("e5\n");}|
        struct_KW id leftCB var_dec rightCB endStmt EDash {printf("e6\n");}|
        F {printf("e7\n");}|

;

F : dataT main_KW leftP rightP leftCB body rightCB H {printf("e8\n");}
;

H : func_def {printf("e9\n");}| 
	{printf("e10\n");}
;

body : stmts return_KW dec_num endStmt {printf("e11\n");}
;

stmts : stmt endStmt stmts {printf("e12\n");}|
        whileLoop {printf("e13\n");}|
        forLoop {printf("e14\n");}| 
        ifStmt {printf("e15\n");}|

;

stmt : void_func_call {printf("e16\n");}|
       return_func_call {printf("e17\n");}|
       var_dec {printf("e18\n");}|
       var_update {printf("e19\n");}
;

void_func_call : id leftP argu_list rightP {printf("e20\n");}
;

return_func_call : dataT id equal void_func_call {printf("e21\n");}
;

argu_list : expr comma argu_list | expr  {printf("e22\n");}
;

expr : expr op expr {printf("e23\n");}|
       leftP expr rightP {printf("e24\n");}|
       number {printf("e25\n");}|
       id {printf("e26\n");}
;

var_update : id assign_op expr{printf("e27\n");}
;

var_dec : var_dec comma id {printf("e28\n");}|
          dataT id {printf("e28a\n");}|
          var_assign {printf("e29\n");}
;

var_assign : var_assign comma id equal expr {printf("e30\n");}|
             dataT id equal expr {printf("e30b\n");}|
	     id equal expr {printf("e30a\n");}
;

whileLoop : while_KW leftP expr rightP leftCB stmts rightCB {printf("e31\n");}

ifStmt : if_KW leftP expr rightP leftCB stmts rightCB {printf("e32\n");}|
         if_KW leftP expr rightP leftCB stmts rightCB elseStmt {printf("e33\n");}
;

elseStmt : else_KW ifStmt {printf("e34\n");}|
           else_KW leftCB stmts rightCB {printf("e35\n");}
;

forLoop : for_KW leftP var_assign endStmt expr endStmt stmt rightP leftCB stmts rightCB {printf("e36\n");}
;

func_def : dataT id leftP para_list rightP leftCB stmts rightCB {printf("e37\n");}
; 

para_list : comma dataT para_list {printf("e38\n");}|
            dataT id para_list {printf("e39\n");}	
	{printf("e40\n");}
;

func_declaration : dataT id leftP dec_para_list rightP {printf("e41\n");}
;

dec_para_list : para_list {printf("e45\n");}|
                dataT dec_para_list {printf("e42\n");}|
                comma dataT dec_para_list {printf("e43\n");}|
	{printf("e46\n");}
;

number : oct_num {printf("e47\n");}|
         dec_num {printf("e48\n");}| 
         hex_num {printf("e49\n");}
;

%%

int yyerror(char *str) {
    printf("String not matching %s\n", str);
    exit(0);
}

int main() {

  FILE *fp = fopen("text", "r+term");
  if(!fp) {
    printf("Cannot open file\n");
    exit(0);
  }
  printf("PARSING...\n");
  yyin = fp;
  yyparse();

  return 0;
}

/*//////////////////////////////////////////////////////////////////////////////////////////

%{
#include<stdio.h>
#include<stdlib.h> 
extern FILE *yyin;
%}

%token identifier datatype string number operator hash pre_processor_dir endline keyword pre_def_fun comma main_fun
%left '(' ')' '{' '}' '<' '>' '[' ']' 

%%

edash : e 						{ printf("done");}
;
e: hash pre_processor_dir '<' identifier '>'  e		{printf("e1\n");}
  | var_dec endline e  					{printf("e2\n");}
  | datatype var_assign endline e			{printf("e3\n");}
  | datatype main_fun '('')' '{' f_body '}' e   	{printf("e4\n");}
  | datatype identifier '(' par_list ')' '{' f_body '}' {printf("e5\n");}
  | hash						{printf("e6\n");}
  |							{printf("e7\n");}
;

par_list : datatype identifier comma par_list 		{printf("par1\n");}
  | datatype identifier 				{printf("par2\n");}
  |
;

f_body : stmts endline f_body 				{printf("fun_body1\n");}
  | fun_call '{' f_body '}' f_body			{printf("fun_body2\n");}
  | pre_def_fun '(' exp ')' '{' f_body '}' f_body	{printf("fun_body3\n");}
  |
;
 
stmts : var_dec 					{printf("stmts1 %s\n",$1);}
  | var_assign 						{printf("stmts2\n");}
  | constant 						{printf("stmts3\n");}
  | keyword						{printf("stmts4\n");}
  | keyword exp					        {printf("stmts5\n");}
  | datatype var_assign 				{printf("stmts6\n");}
;

fun_call : identifier '(' arg_list ')'			{printf("fun_call\n");}
;

arg_list: const_or_iden comma arg_list  		{printf("alglist1\n");}
  | const_or_iden 					{printf("arg_list\n");}
;

var_dec : datatype identifier
  | datatype operator identifier			{printf("var_dec\n");}
;
var_assign : identifier operator exp 			{printf("var_assign\n");}
;
exp : const_or_iden operator exp 			{printf("exp\n");}
  | const_or_iden
;
const_or_iden : identifier | constant  			{printf("const_or_iden\n");}
;
constant : string | number  				{printf("constant \n");}
;

%%

int yyerror(char *msg) 
{ 
 printf("string does not match \n"); 
 exit(0); 
} 
while_KW

//driver code 
main() 
{ 

 yyin=fopen("test.txt","r+term");
 if(yyin==NULL)
 {
      printf("\n Error ! \n");
      exit(0);
 }
 else 
 {
     printf("startrd	 parsing !\n");
     yyparse();
 } 

} 

/////////////////////////////////////////////////////////////////////////////////


%{
#include<stdio.h>
%}
%union
{
double dval;
}
%token <dval> DIGIT
%type <dval> expr
%type <dval> term
%type <dval> factor
%%
line: expr '\n' {
printf("%g\n",$1);
}
;
expr: expr '+' term {$$=$1 + $3 ;}
| term
;
term: term '*' factor {$$=$1 * $3 ;}
| factor
;
factor: '(' expr ')' {$$=$2 ;}
| DIGIT
;
%%
int main()
{
yyparse();
}
yyerror(char *s)
{
printf("%s",s);
}





*/

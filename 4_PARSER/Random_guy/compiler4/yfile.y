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


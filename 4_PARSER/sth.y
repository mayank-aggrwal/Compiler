%{
#include<stdio.h>
#include<stdlib.h> 
extern FILE *yyin;
%}

%token op dec_num oct_num hex_num pre_pro_dir header_file endStmt struct_KW main_KW for_KW while_KW if_KW else_KW string id dataT return_KW hash leftAng rightAng rightCB leftCB leftP rightP equal comma 
%left '(' ')' '{' '}' '<' '>' '[' ']' '#'

%%

edash : e 						{ printf("done");}
;
e: dataT id equal dec_num endStmt		{printf("e1\n");}|
	dataT id endStmt {printf("e3");}
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

 yyin=fopen("text","r+term");
 if(yyin==NULL)
 {
      printf("\n Error ! \n");
      exit(0);
 }
 else 
 {
     printf("start43d	 parsing !\n");
     yyparse();
 } 

} 


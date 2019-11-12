
%{
    #include <stdio.h>
    #include <string.h>
%}
%option noyywrap

%%


[+-/*^&] {return op;}
[1-9][0-9]* {return dec_num;}
[0][0-9]* {return oct_num};
[0]["x"][0-9a-f] {return hex_num;}
"include" {return preprocessor_dir;}
("iostream") {return header_file;}
";" {return endStmt;}
"struct" {return struct_KW;}
"return" {return return_KW;}
"main" {return main_KW;}
"for" {return for_KW;}
"while" {return while_KW;}
("int"|"float"|"char"|"double"|"long") {return dataT;}
[a-zA-Z_][a-zA-Z0-9_]* {return id;}
"else" {return else_KW;}
["+="|"-="|"*="|"&="|"/="|"^="] {return assign_op;}
\".*\" {return string;}
%%



int main() {
    string fileLoc = "myCProgram";
    FILE *fp = fopen(fileLoc, "r");

    if(!fp) {
        printf("File not available\n");
        exit(0);
    }

    yyin = fp;

    yylex();
    return 0;
}

/*

(auto|struct|break|continue|void|case|enum|register|typedef|default|goto|volatile|extern|return|union) { return keyword;}

(char|double|int|float|const|short|unsigned|long|static|signed) {return datatype; printf("datatype %s\n",yytext);}

(do|if|while|else|switch|for|sizeof) {return pre_def_fun;}

(main) {return main_fun; }

\".*\" {return string;}

[0-9]+ {return number; printf("number %s\n",yytext);}

, {return comma;}

# {return hash;}

(define|include|IF|ENDIF) { return pre_processor_dir;}

[+/.?><:\|=%&*] {return operator;}

; {return endline;}

[ ]+ {yytext=""; }

\n {yytext="";}

[_a-z](_|[a-z]|[0-9])* {return identifier;}

\[.*\] {printf("%s array\n",yytext); } 

. return yytext[0]; 


*/
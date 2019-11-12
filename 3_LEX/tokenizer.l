
%{
    #include <stdio.h>
    #include <string.h>
%}
%option noyywrap

%%
("int"|"long") {printf("DATA_TYPE");}
["#"][a-z]+ {printf("PREPROCESSOR_DIRECTIVE");}
"return" {printf("RETURN_STMT ");}
"main()" {printf("MAIN_FUNC");}
"{" {printf("\nFUNC_START\n");}
";" {printf("STMT_END\n");}
"}" {printf("\nFUNC_END\n");}
[a-zA-Z][a-zA-Z0-9]* {printf("ID ");}
"=" {printf("ASSIGNMENT ");}
[0-9]+ {printf("NUMBER ");}
\".*\" {printf("STRING ");}
[+-/*&^] {printf("OPERATOR ");}
"printf(" {printf("PRINT_FUNC_START ");}
")" {printf("FUNC_END ");}
%%

int main() {
    char *fileLoc = "myCProgram";
    FILE *fp = fopen(fileLoc, "r");

    if(!fp) {
        printf("File not available\n");
        exit(0);
    }

    yyin = fp;

    yylex();
    return 0;
}

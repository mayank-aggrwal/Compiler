
%{
    #include <stdio.h>
    #include <string.h>
    #include "y.tab.h"
    extern int yylval;
%}

%%
(#) {printf("\rTOKEN: Hash\n");return hash;}
(<) {printf("\rTOKEN: LeftAng\n");return leftAng;}
(>) {printf("\rTOKEN: RightAng\n");return rightAng;}
(\() {printf("\rTOKEN: LeftP\n");return leftP;}
(\)) {printf("\rTOKEN: RightP\n");return rightP;}
(\{) {printf("\rTOKEN: LeftCB\n");return leftCB;}
(\}) {printf("\rTOKEN: RightCB\n");return rightCB;}
(=) {printf("\rTOKEN: Equal\n");return equal;}
(,) {printf("\rTOKEN: Comma\n");return comma;}
[0-9]+ {printf("\rTOKEN: Decimal\n");return dec_num;}
[0](x)[0-9a-f] {printf("\rTOKEN: Hexadecimal\n");return hex_num;}
(include) {printf("\rTOKEN: Include\n");return pre_pro_dir;}
(iostream|stdio.h|string.h) {printf("\rTOKEN: Header\n");return header_file;}
(;) {printf("\rTOKEN: Colon\n");return endStmt;}
(struct) {printf("\rTOKEN: Struct\n");return struct_KW;}
(return) {printf("\rTOKEN: Return\n");return return_KW;}
(main) {printf("\rTOKEN: Main\n");return main_KW;}
(for) {printf("\rTOKEN: For\n");return for_KW;}
(while) {printf("\rTOKEN: While\n");return while_KW;}
(int|float|char|double|long) {printf("\rTOKEN: Datatype\n");return dataT;}
(else) {printf("\rTOKEN: Else\n");return else_KW;}
[a-z]* {printf("\rTOKEN: Id\n");return id;}
[+-/*^&] {printf("\rTOKEN: Operator\n");return op;}
\".*\" {printf("\rTOKEN: String\n");return string;}

%%

int yywrap() {
    return 1;
}


/*
int main() {
    char *fileLoc = "text";
    FILE *fp = fopen(fileLoc, "r");

    if(!fp) {
        printf("File not available\n");
        exit(0);
    }

    yyin = fp;

    yylex();
    return 0;
}*/

/*
[0][0-9]* {printf("octa\n");return oct_num;}
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

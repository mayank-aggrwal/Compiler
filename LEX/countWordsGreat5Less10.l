%{
    #include <stdio.h>
    #include <string.h>
    int count = 0, len = 0;
%}

%%
([a-zA-Z0-9])* {len = strlen(yytext);if(len > 5 && len < 10)count++;}
"\n" {printf("Count of words : %d\n", count);count = 0;}
%%

int yywrap(void) {}

int main() {
    yylex();
    return 0;
}
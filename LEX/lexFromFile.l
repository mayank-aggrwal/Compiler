
%{
    #include <stdio.h>
    #include <string.h>
    int countVowels = 0, countConsonants = 0;
%}
%option noyywrap
%%
([a-zA-Z])+ {
    int len = strlen(yytext);
    for(int i=0; i<yyleng; i++) {
        if(yytext[i] == 'a' || yytext[i] == 'e' || yytext[i] == 'i' || yytext[i] == 'o' || yytext[i] == 'u' || yytext[i] == 'A' || yytext[i] == 'E' || yytext[i] == 'I' || yytext[i] == 'O' || yytext[i] == 'U') {
            countVowels++;
        }
        else {
            countConsonants++;
        }
    }
}
"\n" {printf("\rVowels : %d\nConsonants : %d\n", countVowels, countConsonants);countConsonants = 0;countVowels = 0;}
%%

// int yywrap() {return 0;}

int main() {
    FILE *fp = fopen("txt", "r");
    yyin = fp;
    yylex();
    printf("\nENDED\n");
    return 0;
}
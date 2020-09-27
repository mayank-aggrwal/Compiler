
%{
    #include <stdio.h>
    #include <string.h>
    int countVowels = 0, countConsonants = 0;
%}

%%
([a-zA-Z])+ {
    int len = strlen(yytext);
    for(int i=0; i<len; i++) {
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

int yywrap(void) {}

int main() {
    yylex();
    printf("ENDED\n");
    return 0;
}


%{
    #include <stdio.h>
    #include <string.h>
%}

%%
([a-zA-Z])+ {
    int len = strlen(yytext), i = 0, j = len-1;
    while(i < j) {
        if(yytext[i] != yytext[j])
            break;
        i++;j--;
    }
    if(i < j) {
        printf("Not a palindrome\n");
    }
    else {
        printf("Is palindrome\n");
    }

}
%%

int yywrap(void) {}

int main() {
    yylex();
    return 0;
}
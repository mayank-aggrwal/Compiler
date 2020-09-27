
%{
    #include <stdio.h>
    #include <string.h>
    int op = 0;
    float num1 = 0, num2 = 0;
%}

%%
([0-9]+)|([0-9]*"."[0-9]+) {
    gotNumCalc();
}
"+" {op = 1;}
"-" {op = 2;}
"/" {op = 3;}
"*" {op = 4;}
%%

void gotNumCalc() {
    if(op == 0) {
        num1 = atof(yytext);
    }
    else {
        num2 = atof(yytext);
        float ans = 0;
        switch(op) {
            case 1: {
                ans = num1 + num2;
                break;
            }
            case 2: {
                ans = num1 - num2;
                break;
            }
            case 3: {
                ans = num1 / num2;
                break;
            }
            case 4: {
                ans = num1 * num2;
                break;
            }
        }
        printf("\rAnswer: %f\n", ans);
        op = 0;
        num1 = 0;
        num2 = 0;
    }
}

int yywrap(void) {}

int main() {
    yylex();
    return 0;
}
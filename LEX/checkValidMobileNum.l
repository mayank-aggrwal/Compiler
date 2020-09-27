
%{
    #include <stdio.h>
    #include <string.h>
%}

%%
([1-9][0-9]{9})+ {
    printf("\rValid");
}
.+ {
    printf("Invalid");
}
%%

int main() {
    printf("Enter Mobile Number: ");
    yylex();
    printf("\n");
    return 0;
}
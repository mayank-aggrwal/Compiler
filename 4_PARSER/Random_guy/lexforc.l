%{
#include<iostream>
using namespace std;
%}

%option noyywrap
%%
[+|-|*|/|==|<=|>=|<|>|=|.] {printf("operator ");}
[0-9]* {printf("digit ");}

(auto|double|int|struct|break|else|long|switch|case|enum|register|typedef|char|extern|return|union|continue|for|signed|void|do|if|static|while|default|goto|sizeof|volatile|const|float|short|unsigned) {printf("keyword ");}
[(a-z)+(A-Z)]*[0-9]*[(a-z)+(A-Z)]* {printf("identifier ");}
[#][(a-z)+(A-Z)+(0-9)+(+|-|*|/|==|<=|>=|<|>|=|.)]*[(a-z)+(A-Z)+(0-9)+(+|-|*|/|==|<=|>=|<|>|=|.)]* {printf("preprocessor ");}
%%

int main(){
	FILE *myfile = fopen("/home/addrija/sem 5/Compiler/input2" , "r");
	
	if(myfile==NULL){
		cout<<"can not open file\n";		
		return -1;
	}
	yyin = myfile;
	yylex();
	return 0;
}

/*

commands to run this on terminal:-
lex lexforc.l
g++ lex.yy.c -o output1
./output1

*/



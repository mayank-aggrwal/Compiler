%{ 
#include<stdio.h> 
#include "y.tab.h" 
extern int yylval; 
%} 

%% 

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
%% 

int yywrap(){ return 1; } 





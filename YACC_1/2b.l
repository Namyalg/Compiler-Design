%{
    #include "y.tab.h"
    #include<stdlib.h>
    extern yylval;
%}

%%
"+" return plus;
"-" return minus;
"*" return mult;
"/" return divide;
"(" return opb;
")" return cpb;

[0-9]+ { yylval = atoi(yytext); return num;}
\n return 0; 
. ; 
%% 

int yywrap(){
    return 1;
}

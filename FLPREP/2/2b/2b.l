%{
    #include<stdio.h>
    #include "y.tab.h"
%}

%%
"+" {return plus;}
"*" {return mult;}
"/" {return divi;}
"-" {return sub;}
[0-9]+ {yylval = atoi(yytext); return num;}
\n {return 0;}
"(" {return op;}
")" {return cp;}
. ;
%%

int yywrap(){
    return 1;
}
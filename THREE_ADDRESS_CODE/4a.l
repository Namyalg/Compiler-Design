%{
#include"y.tab.h"
extern char yyval;
%}
num [0-9]+
letr [a-zA-Z]+
%%
{num} {yylval.sym=(char)yytext[0]; return num;}
{letr} {yylval.sym=(char)yytext[0];return letr;}
\n {return 0;}
. {return yytext[0];}
%%
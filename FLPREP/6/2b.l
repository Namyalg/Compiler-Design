%{
#include"y.tab.h"
extern char yyval;
%}
num [0-9]+
letr [a-zA-Z]+
%% 
[0-9]+ {yylval.sym=(char)yytext[0]; return num;}
[a-zA-Z]+ {yylval.sym=(char)yytext[0];return letr;}
\n {return 0;}
. {return yytext[0];}
%%
%{
    #include<stdio.h>
    #include "y.tab.h"
    extern char yyval;
%}

%%
[0-9]+ {yylval.sym = (char)yytext[0]; return num;}
"+" {yylval.sym = (char)yytext[0]; return plus;}
"*" {yylval.sym = (char)yytext[0]; return mul;}
"/" {yylval.sym = (char)yytext[0]; return di;}
"-" {yylval.sym = (char)yytext[0]; return sub;}
\n return 0;
%%

int yywrap(){
    return 1;
}
%{
    #include "y.tab.h"
    extern char yyval;
%}

%%
[0-9]+ {yylval.sym = (char)yytext[0]; return num;}
"+" {yylval.sym = (char)yytext[0]; return plus;}
"-" {yylval.sym = (char)yytext[0]; return minus;}
"*" {yylval.sym = (char)yytext[0]; return mult;}
"/" {yylval.sym = (char)yytext[0]; return divi;}
\n return 0;
. ;
%%

int yywrap(){
    return 1;
}
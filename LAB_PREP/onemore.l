%{
#include<stdio.h>
int keyword =0, identifier =0, num=0;
%}
%%
"int"|"char"|"string" { keyword++; }
[a-zA-Z_][a-zA-Z0-9_]* { identifier++; }
[0-9]+ {num++;}
. ;
%%
int yywrap() {
return 1;
}
void main(){
yyin = fopen("in.txt","r");
yyout = fopen("out.txt","w");
yylex();
//fprintf(yyout,"Keywords are : %d\nIdentifiers are : %d\n",keyword,identifier);
printf("Keywords are : %d\nIdentifiers are : %d\n Numbers are : %d\n",keyword,identifier,num);
}
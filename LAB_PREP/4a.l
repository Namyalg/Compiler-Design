%{
    #include<stdio.h>
    #include<stdlib.h>
    int keywords = 0;
    int identifiers = 0;
    int op = 0;
%}

%%
"int"|"float"|"main"|"const"|"char"|"if"|"while" {keywords +=1;}
[a-zA-Z_][a-zA-Z0-9]* {identifiers += 1;}
"++"|"--" {op += 1;}
"+"|"-"|"*"|"/"|"^" {op += 1;}
# {return 0;}
. ;
%%

int main(){
    yylex();
    printf("Keywords are %d \n", keywords);
    printf("identifiers are %d \n", identifiers);
    printf("operators are %d \n", op);
    return 0;
}

int yywrap(){
    return 1;
}
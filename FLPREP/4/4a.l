%{
    #include<stdio.h>
    int k = 0, op = 0, iden = 0;
%}

%%
"int"|"float"|"char"|"string"|"main"|"for" {k += 1;}
[a-zA-Z]+ {iden += 1;}
"+"|"-"|"*"|"/"|"--"|"++" {op += 1;}
\n {return 0;}
. ;
%%

int main(){
    // read from a file in this format 
    
    yyin = fopen("input.txt", "r");
    yylex();
    printf("The operators are %d \n", op);
    printf("The identi are %d \n", iden);
    printf("The keywo are %d \n", k);
    return 0;
}

int yywrap(){
    return 1;
}
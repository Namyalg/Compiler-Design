%{
    #include<stdio.h>
    int op = 0;
    int identifier = 0;
    int keyword = 0;
%}

%%
"++" {op += 1; }
"--" {op += 1; }
"&&" {op += 1;}
[+\-*/">=""!""<=""<"">""!=""="] {op += 1;}

auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while {keyword += 1;}

[a-zA-Z_][a-zA-Z0-9_]* {identifier += 1;}

# return 0;
. ;
%%

int yywrap(){return 0;}

int main(){
    printf("Enter the input \n");
    yylex();
    printf("The number of keywords are %d \n", keyword);
    printf("The number of identifiers are %d \n", identifier);
    printf("The number of operators are %d \n", op);
    
    return 0;
}
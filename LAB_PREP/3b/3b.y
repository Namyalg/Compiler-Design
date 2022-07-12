%{
    #include<stdio.h>
    #include "y.tab.h"
    int count = 0;
    #include<stdlib.h>
%}

%token fory
%token semi
%token op cp 
%token text 
%token ofb cfb inc incp

%%
S : T 
;
T : fory op text inc incp cp ofb T cfb {count += 1;}
  | fory op text inc incp cp ofb cfb { count += 1;}
;
%%

int main(){
    yyparse();
    printf("No error \n");
    printf("The level of nesting is %d \n", count);
    return 0;
}

int yyerror(){
    printf("There is an error \n");
    exit(1);
}
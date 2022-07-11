%{
    #include<stdio.h>
    #include "y.tab.h"
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
T : fory op text inc incp cp ofb T cfb 
  | fory op text inc incp cp ofb cfb
;
%%

int main(){
    yyparse();
    printf("No error \n");
    return 0;
}

int yyerror(){
    printf("There is an error \n");
    exit(1);
}
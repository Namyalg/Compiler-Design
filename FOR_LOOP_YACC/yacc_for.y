%{
    #include<stdio.h>
    #include<stdlib.h>
    int c = 0;
%}

%token initial num semicolon
%token var 
%token equalto
%token ops 
%token inc opb cb fo fc forl

%%
S : T {printf("Number of nested fors are %d \n", c);}
;
T : E fo T fc { c += 1;}
  | E fo fc  {c += 1;}
I : initial var equalto num semicolon
;
C : var ops num semicolon
;
H : var inc num
;
E : forl opb I C H cb
;
%% 

int main(){
    yyparse();
    printf("No error \n");
}

int yyerror(){
    printf("There is an error \n");
    exit(0);
}
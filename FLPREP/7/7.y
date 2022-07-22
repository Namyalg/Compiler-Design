%{
    #include<stdio.h> 
    #include<stdlib.h>  
%}

%token wcom 
%token wocom
%token cp 
%token op

%%
S : G
;
E : wcom E 
  | wocom
;
G : wocom op E cp
  | wocom op cp
;
%%

int main(){
    yyparse();
    printf("No error \n");
    return 0;
}

int yyerror(){
    printf("There is an ERROR \n");
    exit (1);
}
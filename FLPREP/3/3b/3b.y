%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%token forp
%token op
%token cp
%token fp 
%token fc 
%token innt inc
%token var
%token semi num
%token relop eq

%%
S : E 
;
E : forp op T cp fp fc 
  | forp op T cp fp E fc 
;
T : innt var eq num semi var relop num semi var inc num
%%

int main(){
    yyparse();
    printf("Matches for loop pattern \n");
    return 0;
}

int yyerror(){
    printf("There is an ERROR \n");
    exit (1);
}
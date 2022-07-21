%{
    #include<stdio.h>
    #include <stdlib.h>
%}

%token a1
%token b1

%%
S : a1 S b1 
  | 
;
%%

int main(){
    //get the tokens from the lex and then read it here and do the logic
    //dont use the symbols a and b as they have a predefined meaning
    yyparse();
    printf("There is no error \n");
    return 0;
}

int yyerror(){
    printf("There is an error \n");
    exit(1);
}
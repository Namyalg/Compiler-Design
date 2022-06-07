%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%token a1
%token b1

%% 
S : a1 S a1
  | b1
  ;
%%

int main(){
    //this will call yylex by itself as the syntax analyser needs tokens one by one
    yyparse(); 
    printf("No error \n");
}

int yyerror(){
    printf("The string is erroneous \n");
    exit(0);
}
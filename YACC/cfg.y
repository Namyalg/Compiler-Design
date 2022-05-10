%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%% 
S : 'a'S'a'
  | 'b'
  ;
%%

int main(){
    //this will call yylex by itself as the syntax analyser needs tokens one by one
    yyparse(); 
    printf("No error \n");
}

int yyerror(){
    printf("The string is erroneous \n");
    exit(1);
}
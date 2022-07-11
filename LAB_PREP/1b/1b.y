%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%token a1 b1 c1 

%%
S : A B 
;
A : a1 A b1
  |
;
B : b1 B c1 
  |
;
%%

int main(){
    yyparse();
    printf("There is no error \n"); //only if it does not go into the yyerror() block
    //will come here 
    return 0;
}

int yyerror(){
    printf("There is an error \n");
    exit(1); // the minute there is an error here it will leave and go 
    //wont go back to main, this is the best way to break from here
}
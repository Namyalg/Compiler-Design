%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%token plus
%token mult
%token num 
%token sub 
%token divi
%token op 
%token cp
%left plus sub   
%left mult divi

%%
S : E {printf("The result is %d \n", $$);}
;
E : E plus T {$$ = $1 + $3;}
  | E sub T {$$ = $1 - $3;}
  | T   {$$ = $1;}     
;
T : T mult F {$$ = $1 * $3;}
  | T divi F {$$ = $1 / $3;}
  | F {$$ = $1;}
;
F : num {$$ = $1;}
  | op E cp {$$ = $2;}
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
%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%token plus 
%token minus
%token num 
%token opb
%token cpb
%left plus minus
%left mult divide

%%

S : T {printf("Result is %d \n", $$); return 0;} 
;
T : T plus T {$$ = $1 + $3;}
  | T minus T {$$ = $1 - $3;}
  | T mult T {$$ = $1 * $3;}
  | T divide T {$$ = $1 / $3;}
  | opb T cpb {$$ = $2;}
  | num {$$ = $1;}
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
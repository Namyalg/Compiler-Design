%{
    #include<stdio.h>
    #include<stdlib.h>
    int ifs = 0;
%}

%token what
%token op
%token cp
%token fb
%token cb exp

%%
S : E
;
E : what op exp cp fb cb {ifs += 1;}
  | what op exp cp fb E cb {ifs += 1;}
;
%%

int main(){
    yyparse();
    printf("Matches for IF pattern, level of nesting is %d \n", ifs);
    return 0;
}

int yyerror(){
    printf("There is an ERROR \n");
    exit (1);
}
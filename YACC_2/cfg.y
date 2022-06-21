%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%token itype var ob cb comma fob fcb

%%
S : T
;
T : itype var ob E cb fob fcb
;
E : itype var comma E 
  | itype var 
  | 
;

%% 

int main(){
    yyparse();
    printf("No error \n");
}

int yyerror(){
    printf("There is an error \n");
    exit(1);
}
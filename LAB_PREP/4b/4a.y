%{
    #include<stdio.h>
    #include<stdlib.h>
    int count = 0;
%}

%token ifk op cp ofb cfb text semi

%%
S : T
;
T : ifk op text cp ofb T cfb {count += 1;}
  | ifk op text cp ofb cfb {count += 1;}
  | ifk op text cp semi {count += 1;}
;
%%

int main(){
    yyparse();
    printf("Level of nesting is %d \n", count);
    printf("There is no error \n");
    return 0;
}

int yyerror(){
    printf("There is an error \n");
    exit(1);
}
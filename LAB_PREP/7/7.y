%{
    #include<stdio.h>
    #include<stdlib.h>

%}

%token typ op cp iden semi comma

%%
S : G
;
G : typ op T cp semi 
  | typ op cp semi 
;
T : typ comma T 
  | E
;
E : typ 
;
%%

int main(){
    yyparse();
    printf("Matches function declaration syntax \n");
    return 0;
    // G handled {// handles the case when there are no parameters passed to the funciton;}
    // T handles {// here it has to end with an type followed by identifier, and can only end with the same;}
    // does not allow comma at the end of the declaration parameters, needs to end with semi colon since this is a function definition
}

int yyerror(){
    printf("There is an error \n");
    exit(1);
}
%{
    #include<stdio.h>
    #include<stdlib.h>
    char toTAC(char, char, char);
    void showTAC();
    char t = 'A';
    int idx = 0;
    struct inc{
        char op1;
        char op2;
        char op;
    } tac[20];
%}

%union 
{
    char sym;
}

%token <sym> num plus sub di mul
%type <sym> expr
%left plus sub 
%left div mult
%%
S : expr
;
expr : expr plus expr {$$ = toTAC((char)$1, (char)$3, (char)$2);}
     | expr sub expr {$$ = toTAC((char)$1, (char)$3, (char)$2);}
     | expr mul expr {$$ = toTAC((char)$1, (char)$3, (char)$2);}
     | expr di expr {$$ = toTAC((char)$1, (char)$3, (char)$2);}
     | num {$$ = (char)$1;}
     | 

%%

char toTAC(char op1, char op2, char op){
    tac[idx].op1 = op1;
    tac[idx].op2 = op2;
    tac[idx].op = op;
    idx += 1;
    return t++;
}

void showTAC(){
    for(int i = 0; i < 5; i++){
        printf("%c %c %c \n", tac[i].op1, tac[i].op2, tac[i].op);
    }
}

int main(){
    yyparse();
    showTAC();   
    return 0;
}

int yyerror(){
    printf("******ERROR************ \n");
}
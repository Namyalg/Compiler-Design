%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<ctype.h>
    struct incod{
        char op1;
        char op2;
        char op;
    } tac[10];
    void targetCode();
    char toTAC(char a, char b, char c);
    char temp = 'A';
    int ct = 0;
%}

%union{
    char sym;
}

%token <sym> num plus minus mult divi
%type <sym> E T
%left plus minus 
%left mult divi

%%
E : T 
;
T : T plus T {$$ = toTAC((char)$1, (char)$3, (char)$2);}
  | T minus T {$$ = toTAC((char)$1, (char)$3, (char)$2);}
  | T mult T {$$ = toTAC((char)$1, (char)$3, (char)$2);}
  | T divi T {$$ =  toTAC((char)$1, (char)$3, (char)$2);}
  | num {$$ = (char)$1;}
%%

char toTAC(char a, char b, char c){
    //printf("%c %c %c \n", a, c, b);
    tac[ct].op1 = a;
    tac[ct].op2 = b;
    tac[ct].op = c;
    ++ct;
    return temp++;
}

void quadruple(){
    char st = 'A';
    for(int i = 0; i < ct; i++){
        printf("%c      %c      %c      %c      \n", tac[i].op, tac[i].op1, tac[i].op2, st++);
    }
}

void triple(){
    char st = 'A';
    for(int i = 0; i < ct; i++){

        printf("%c      ", tac[i].op);
        if(isalpha(tac[i].op1)){
            printf("(%d)      ", tac[i].op1-65);
        }
        else{
            printf("%c      ", tac[i].op1);
        }
        if(isalpha(tac[i].op2)){
            printf("(%d)      \n", tac[i].op2-65);
        }
        else{
            printf("%c      \n", tac[i].op2);
        }
    }
}

void showTAC(){
    for(int i = 0; i < ct; i++){
        printf("%c      %c      %c      \n", tac[i].op1, tac[i].op, tac[i].op2);
    }
}

int main(){

    yyparse();
    //showTAC();
    printf("\n QUADRUPLE \n");
    quadruple();
    printf("\n TRIPLE \n");
    triple();
    printf("\n TARGET CODE \n");
    targetCode();
    return 0;
}

void targetCode(){

    char st = 'A';
    char var = 'a';
    for(int i = 0; i < ct; i++){
        char op1 = tac[i].op1;
        char op2 = tac[i].op2;
        char op = tac[i].op;
        if(!isalpha(tac[i].op1)){
            op1 = var++;
            printf("LOAD    %c     %c \n", op1, tac[i].op1);
        }
        if(!isalpha(tac[i].op2)){
            op2 = var++;
            printf("LOAD    %c     %c \n", op2, tac[i].op2);
        }
        
        if(tac[i].op == '+'){
            printf("ADD     %c      %c       %c \n", st, op1, op2);
        }
        else if(tac[i].op == '-'){
            printf("SUB     %c      %c       %c \n", st, op1, op2);
        }
        else if(tac[i].op == '/'){
            printf("DIV     %c      %c       %c \n", st, op1, op2);
        }
        else if(tac[i].op == '*'){
            printf("MULT    %c      %c       %c \n", st, op1, op2);
        }
        st++;
    }



}

int yyerror(){
    printf("There is an error \n");
    exit(1);
}
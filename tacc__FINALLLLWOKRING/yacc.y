%{
    #include<stdio.h>
    #include<stdlib.h>
    int idx = 0;
    char temp = 'A';
    char toTAC(char, char, char);
    void showTAC();
    void quad();
    void TargetCode();
    void triple();
    int ct = 0;
    struct incod{
        char op1;
        char op2;
        char op;
    } tac[10];
%}

%union{
    char sym;
}
%token <sym> num plus sub mul di 
%type <sym> E 
%left plus sub 
%left mul di
%%
S : E 
;
E : E plus E {$$ = toTAC((char)$1, (char)$3, (char)$2);}
  | E sub E {$$ = toTAC((char)$1, (char)$3, (char)$2);}
  | E mul E {$$ = toTAC((char)$1, (char)$3, (char)$2);}
  | E di E {$$ = toTAC((char)$1, (char)$3, (char)$2);}
  | num {$$ = (char)$1;}
;
%%

char toTAC(char a, char b, char c){
    tac[idx].op1 = a;
    tac[idx].op2 = b;
    tac[idx].op = c;
    idx += 1;
    ct += 1;
    return temp++;
    
}

void showTAC(){
    char samp = 'A';
    for(int i = 0; i < ct; i++){
        printf("%c = %c %c %c \n", samp, tac[i].op1, tac[i].op, tac[i].op2);
        samp += 1;
    }
}

void quad(){
    printf("op1\t       op2\t      op\t       target \n");
    char samp = 'A';
    for(int i = 0; i < ct; i++){
        printf("%c\t       %c\t      %c\t        %c\n", tac[i].op1, tac[i].op2, tac[i].op, samp);
        samp += 1;
    }
}

void triple(){
    printf("op1\t       op2\t      op\t\n");
    char samp = 'A';
    for(int i = 0; i < ct; i++){
        if(isalpha(tac[i].op1)){
            printf("(%d)\t", tac[i].op1-65);
        }
        else{
            printf("%c\t", tac[i].op1);
        }
        printf("%c\t", tac[i].op);
        if(isalpha(tac[i].op2)){
            printf("(%d)\t", tac[i].op2-65);
        }
        else{
            printf("%c\t\n", tac[i].op2);
        }
        samp += 1;
    }
}

void TargetCode(){
int cnt=0;
printf("\n\n\t TARGET CODE\n\n");
while(cnt<ct){
printf("LOAD  %c\n", tac[cnt].op1);
printf("LOAD  %c\n", tac[cnt].op2);

switch(tac[cnt].op){
case '+':
printf("ADD   %c %c %c\n", temp,tac[cnt].op1, tac[cnt].op2);
temp++;
break;
case '*':
printf("MULT  %c %c %c\n", temp, tac[cnt].op1, tac[cnt].op2);
temp++;
break;
case '-':
printf("SUB   %c %c %c\n", temp,tac[cnt].op1, tac[cnt].op2);
temp++;
break;
case '/':
printf("DIV   %c %c %c\n", temp,tac[cnt].op1, tac[cnt].op2);
temp++;
break;
case '=': printf("MOV   %c %c\n", tac[cnt].op2, tac[cnt].op1);
temp++;
break;
}
cnt++;

}
}

int pp(char s){
    if(isalpha(s)){
        return s-65;
    }
}


int main(){
    yyparse();
    showTAC();
    quad();
    triple();
    TargetCode();
    printf("\nNo error \n");
}

int yyerror(){
    printf("There is an error \n");
    exit(1);
}

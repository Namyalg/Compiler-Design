#include<stdio.h>
#include<stdlib.h>
#include<string.h>

char stk[30];
char inp[30];
char op[30];

int ip = 0;
int oc = 0;

void pr(int x, char msg[]){
    printf("\n");
    printf("$%s", stk); 
    printf("\t\t");
    for(int i = x; i < strlen(inp); i++){
        printf("%c", inp[i]);
    }
    printf("$\t\t");
    printf("%s\n", msg);
}


int main(){
    printf("Enter the input string \n");
    scanf("%s", inp);
    printf("The input is %s \n", inp);

    for(int i = 0; i < strlen(inp); i++){

        char cr = inp[i];

        if(cr == 'a'){
           stk[ip++] = 'a';
           //printf("InP IS %d ", ip);
           pr(i+1, "Shift");
           stk[ip-1] = 'E';
           pr(i+1, "Reduce E->a");
        }
        else{
            if(oc == 0){
                op[oc++] = cr;
                stk[ip++] = cr;
                pr(i+1, "Shift");
            }
            else{
                if(cr == '+' && op[oc-1] == '+'){
                    // this means you need to reduce as same precedence 
                    stk[--ip] = ' ';
                    stk[--ip] = ' ';
                    op[--oc] = ' ';
                    pr(i, "Reduce E->E+E");

                    stk[ip++] = cr;
                    op[oc++] = cr;
                    pr(i+1, "Shift");
                }
                else if(cr == '*' && op[oc-1] == '*'){
                    stk[--ip] = ' ';
                    stk[--ip] = ' ';
                    op[--oc] = ' ';
                    pr(i, "Reduce E->E*E");

                    stk[ip++] = cr;
                    op[oc++] = cr;
                    pr(i+1, "Shift");
                }
                else if(cr == '+' && op[oc-1] == '*'){
                    stk[--ip] = ' ';
                    stk[--ip] = ' ';
                    op[--oc] = ' ';
                    pr(i, "Reduce E->E*E");
                    stk[ip++] = cr;
                    op[oc++] = cr;
                    pr(i+1, "Shift");
                }
                else if(cr == '*' && op[oc-1] == '+'){
                    stk[ip++] = cr;
                    op[oc++] = cr;
                    pr(i+1, "Shift");
                }
            }
        }
    }

    //printf("ATH THE END STACK IS %s and ip is %d \n", stk, ip);

    while(ip > 0){
        char b ;
       
        stk[--ip] = ' ';
        b = stk[ip-1];
        stk[--ip] = ' ';
        stk[--ip] = 'E';
        op[--oc] = ' ';

        if(b == '+' || b == 'E'){
            pr(strlen(inp), "Reduce E->E+E");
        }
        else{
            pr(strlen(inp), "Reduce E->E*E");
        }
    }
    return 0;
}
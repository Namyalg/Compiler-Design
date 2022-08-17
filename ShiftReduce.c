#include<stdio.h>
#include<stdlib.h>
#include<string.h>

char stk[30];
char inp[30];
char ops[30];

int ip = 0;
int oc = 0;

void pr(int x, char msg[]){
    printf("\n");
    printf("%s\t\t", stk);
    for(int y = x; y < strlen(inp); y++){
        printf("%c", inp[y]);
    }
    printf("\t\t%s\n", msg);
}

int main(){
    printf("\n\t\t SHIFT REDUCE PARSER\n");
    printf("Enter the input string: ");
    scanf("%s",inp);
    printf("The input string is: %s\n",inp);

    for(int i = 0; i < strlen(inp); i++){
        char cr = inp[i];

        if(cr == 'a'){
            stk[ip++] = 'a';
            pr(i+1, "Shift");
            stk[ip-1] = 'E';
            pr(i+1, "Reduce E->a");
        }
        else{
            if(oc == 0){
                stk[ip++] = cr;
                ops[oc++] = cr;
                pr(i+1, "Shift");
            }
            else{
                if(cr == '+' && ops[oc-1] == '+'){
                    stk[--ip] = ' ';
                    stk[--ip] = ' ';
                    ops[--oc] = ' ';
                    pr(i, "Reduce E->E+E");
                }
                else if(cr == '+' && ops[oc-1] == '*'){
                    stk[--ip] = ' ';
                    stk[--ip] = ' ';
                    ops[--oc] = ' ';
                    pr(i, "Reduce E->E*E");
                }
                else if(cr == '*' && ops[oc-1] == '*'){
                    stk[--ip] = ' ';
                    stk[--ip] = ' ';
                    ops[--oc] = ' ';
                    pr(i, "Reduce E->E*E");
                }
                stk[ip++] = cr;
                ops[oc++] = cr;
                pr(i+1, "Shift");
            }
        }
    }

    while(ip > 0){
        stk[--ip] = ' ';
        stk[--ip] = ' ';
        stk[--ip] = 'E';
        if(ops[--oc] == '+'){
            pr(30, "Reduce E->E+E");
        }
        else{
            pr(30, "Reduce E->E*E");
        }
    }
    return 0;
}


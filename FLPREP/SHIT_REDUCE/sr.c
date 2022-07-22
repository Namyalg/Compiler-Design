#include<stdio.h>
#include<string.h>
#include<stdlib.h>

/*
grammr is E : E + E | E * E | a

logic is read input and compare the incoming operator with the operator on the top of the stack

Maintain an operator stack and an exp stack ?
Exp stack add everything and in operator stack basically add ops to find out whether to shift or reduce 

St      in      action
+       +       reduce
+       *       shift
*       +       reduce
*       *       reduce

*/

void print(char inp[], int i, int k, char tp[]){
    printf("DS : %s\n", tp);
    for(int j = i; j < k; j++){
        printf("%c", inp[j]);
    }
    printf("\n");
}


int main(){

    int p, q, r;
    char p1, p2, p3;
    char inp[20];
    printf("Enter the input \n");
    scanf("%s",inp);
    printf("Input exp is %s\n",inp);

    int expl = strlen(inp);

    int idx = 0;

    char ops[10];
    int opc = 0;

    char fs[10];
    int fc = 0;

    while(idx < expl){
        if(fc == 0 || inp[idx] == 'a'){
            fs[fc] = 'E';
            printf("Shift %c \n", inp[idx]);
            printf("Reduce %c to E \n", inp[idx]);
            
            fc = fc + 1;
            idx += 1;
            
            print(inp, idx, 10, "INPUT");
            print(fs, 0, fc, "STACK");

            continue;
        }
        if(opc == 0){
            ops[opc] = inp[idx];
            fs[fc] = inp[idx];
            printf("Shift %c \n", inp[idx]);
            opc = opc + 1;
            idx += 1;
            fc +=1 ;
            print(inp, idx, 10, "INPUT");
            print(fs, 0, fc, "STACK");
            continue;
        }
        else{
            if(inp[idx] == '+' && ops[opc-1] == '+'){
                //printf("ONLY PLUSS \n");
                // Case of reduction but first need to reduce the a to E and then do the reduction
                //first shift the a to E
                fs[fc] = 'E';
                printf("Shift %c \n", inp[idx]);
                fc = fc + 1;
                idx += 1;
                print(inp, idx, 10, "INPUT");
                print(fs, 0, fc, "STACK");
                

                //now time for reduction, reduce the counter, pop 3 from fs and add E back as reduced to E

                fc -= 1;
                p3 = fs[fc];
                fc -= 1;
                p2 = fs[fc];
                fc -= 1;
                p1 = fs[fc];
                
                printf("Reduce %c %c %c to E \n", p1, p2, p3);
                fs[fc] = 'E';
                fc += 1;
                opc -= 1;
                ops[opc] =  inp[idx];
                opc += 1;
                idx += 1;
                print(inp, idx, 10, "INPUT");
                print(fs, 0, fc, "STACK");
            }
        }
        idx += 1;
    }
    return 0;
}

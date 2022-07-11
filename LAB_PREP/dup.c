#include<stdio.h>
#include<stdlib.h>
#include<string.h>

/* The main logic here is  : 

Read the input, and maintain a pointer to the input and add it to the stack
Here there are 2 things to keep in mind : 

Top             Input       Action
*               *           Reduce
*               +           Reduce 
+               +           Reduce
+               *           Shift

*/
int ct = 0;
void print(char d[]){
    //  printf("-------------------------\n");
    // for(int i = 0; i <= ct; i++){
    //     printf("%c ", d[i]);
    // }
    // printf("\n-------------------------\n");
}

int main(){
    char stack[100]; // add everything here ig and manipulate this thing
    char ops[100]; // add all the operators onto this stack
    char input[100];
    int steps = 1;
    int opc = 0;
    printf("Enter the input string \n");
    scanf("%s", input);
    printf("The input is %s \n", input);
    //printf("the length is %d \n", strlen(input)) 
    for(int i = 0; i < strlen(input); i++){
        //printf("\nStack after iteration %d \n", i);
        //printf("Counter is %d \n", ct);
        if(input[i] == 'a' || input[i] == 'b' || input[i] == 'c'){
            printf("Step %d . Shift %c at index %d \n", steps, input[i], i);
            //print(stack);
            
             stack[ct++] = input[i];
            steps += 1;
             print(stack);
            printf("Step %d . Reduce %c at index %d to E \n", steps, input[i], i);
            stack[ct-1] = 'E';
             print(stack);
            steps += 1;
        }
        else{
            if(opc == 0){
                ops[opc++] = input[i];
                stack[ct++] = input[i];
                printf("Step %d . Shift operator %c \n", steps, input[i]);
                steps += 1;
                print(stack);
                continue;
            }
            else{
                //printf("debug %c %c \n", input[i], ops[opc-1]);
                if(input[i] == '*' && ops[opc-1] == '*'){
                    printf("Step %d . Reduce %c %c %c to E \n", steps, stack[--ct], stack[--ct], stack[--ct]);
//print(stack);;
                    stack[ct++] = 'E';
                    ops[--opc];
                    print(stack);
                    steps += 1;
                    
                }
                else if(input[i] == '+' && ops[opc-1] == '*'){
                    printf("Step %d . Reduce %c %c %c to E \n", steps, stack[--ct], stack[--ct], stack[--ct]);
//print(stack);;
                    ops[--opc];
                    stack[ct++] = 'E';
                    print(stack);
                    steps += 1;
                }
                else if(input[i] == '+' && ops[opc-1] == '+'){
                    printf("Step %d . Reduce %c %c %c to E \n", steps, stack[--ct], stack[--ct], stack[--ct]);
//print(stack);;

                    stack[ct++] = 'E';
                    ops[--opc];
                    print(stack);
                    steps += 1;
                }
                
                printf("Step %d . Shift operator %c at index %d \n", steps, input[i], i);
                steps += 1;
                
                stack[ct++] = input[i];
                ops[opc++] = input[i];
                print(stack);
            }
        }
    }

    // printf("STACK AT END IS \n");
    // //print(stack);

    while(ct){
        printf("Step %d . Reduce %c %c %c to E \n", steps, stack[--ct], stack[--ct], stack[--ct]);
        print(stack);
        steps += 1;
        
        
        //print(stack);
        if(ct == 0){
            break;
        }
        stack[ct++] = 'E';
        
    }

    return 0;
}
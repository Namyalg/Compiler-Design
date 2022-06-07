%{
    #include<stdio.h>
    int v = 0;
    int c = 0;
%}

%%
[aeiouAEIOU] {v++;}
[A-Za-z] {c++;}
\n return 0;
. ;
%%
// This returns an error if not included, doesnt mean anything but include this function prototype
int yywrap(){return 1;}
// Sets flag if done or not 
int main(){
    printf("Enter the input \n");
    //has scanf in this 
    yylex();
    printf("The number of vowels are %d \n" , v);
    printf("The number of consonants are %d \n ", c);
    return 0;
}
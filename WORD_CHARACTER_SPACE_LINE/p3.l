%{
    #include<stdio.h>
    #include<string.h>
    int word = 0;
    int chars = 0;
    int space = 0;
    int line = 0;
%}
%%
[a-zA-Z]+ {word += 1;  chars += strlen(yytext);}
\n {line += 1;}
[ ] {space += 1;}
# return 0;
. ;
%%
// This returns an error if not included, doesnt mean anything but include this function prototype
//longest match is done here and then it breaks if nothing is found here 

int yywrap(){return 0;}
int main(){
    printf("Enter the input \n");
    yylex();
    printf("The number of words are %d \n" , word);
    printf("The number of characters are %d \n ", chars);
    printf("The number of lines are %d \n ", line);
    printf("The number of spaces are %d \n ", space);
    return 0;
}
%{
    #include<stdio.h>
    #include<string.h>
    int word = 0;
    int chars = 0;
%}
%%
[a-zA-Z]+ {word += 1;  chars += strlen(yytext);}
# return 0;
. ;
%%
// This returns an error if not included, doesnt mean anything but include this function prototype
int yywrap(){return 0;}
int main(){
    printf("Enter the input \n");
    yylex();
    printf("The number of words are %d \n" , word);
    printf("The number of characters are %d \n ", chars);
    return 0;
}
%{
    #include<stdio.h>
    #include<string.h>
    int single = 0;
    int multi = 0;
%}
%%

["/"]["*"][a-zA-Z0-9 ]*["*"]["/"] {multi += 1; printf("%s % d \n", yytext, multi);}
["/"]["/"][a-zA-Z0-9 ]*
# return 0;
. ;
%%
// This returns an error if not included, doesnt mean anything but include this function prototype
int yywrap(){return 0;}
int main(){
    printf("Enter the input \n");
    yylex();
    printf("The number of single are %d \n" , single);
    printf("The number of multi are %d \n ", multi / 2);
    return 0;
}
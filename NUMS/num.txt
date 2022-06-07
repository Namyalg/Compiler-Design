%{
    #include<stdio.h>
    #include<string.h>
    int posnum = 0;
    int negnum = 0;
    int zero = 0;
    int posfrac = 0;
    int negfrac = 0;
%}

%%

[0][ ] { zero += 1; printf("%s \n", yytext);}
[0]$ {zero += 1; printf("%s \n", yytext);}


[1-9][0-9]*[/][1-9][0-9]*[ ]  {posfrac += 1; printf("%s \n", yytext);}
[+][1-9][0-9]*[/][1-9][0-9]*[ ]  {posfrac += 1; printf("%s \n", yytext);}
[-][1-9][0-9]*[/][1-9][0-9]*[ ]  {negfrac += 1; printf("%s \n", yytext);}
[+][1-9][0-9]*[/][1-9][0-9]*$  {posfrac += 1; printf("%s \n", yytext);}
[-][1-9][0-9]*[/][1-9][0-9]*$  {negfrac += 1; printf("%s \n", yytext);}
[1-9][0-9]*[/][1-9][0-9]$  {posfrac += 1; printf("%s \n", yytext);}
--[1-9][0-9]*[/][1-9][0-9][ ]  {negfrac += 1; printf("%s \n", yytext);}

[+][1-9][0-9]*[ ]  {posnum += 1; printf("%s \n", yytext);}
[-][1-9][0-9]*[ ]  {negnum += 1; printf("%s \n", yytext);}
[1-9][0-9]*[ ]  {posnum += 1; printf("%s \n", yytext);}
[+][1-9][0-9]*$  {posnum += 1; printf("%s \n", yytext);}
[-][1-9][0-9]*$  {negnum += 1; printf("%s \n", yytext);}
[1-9][0-9]*$  {posnum += 1; printf("%s \n", yytext);}
--[1-9][0-9]*[ ]  {posnum += 1; printf("%s \n", yytext);}


# return 0;
. ;
%%

int yywrap(){return 0;}

int main(){
    printf("Enter the input \n");
    yylex();
    printf("The pos numbers are %d \n", posnum);
    printf("The number of zeroes %d \n", zero);
    printf("The number of negatives are %d \n", negnum);
    printf("The pos fractions are %d \n", posfrac);
    printf("The neg fractions are %d \n", negfrac);
    return 0;
}
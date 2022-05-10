%{
    #include<stdio.h>
    int v = 0;
    int c = 0;
%}
%%
[ ][0-9][0-9][0-9]$ {v++; printf("%s0 %d \n", yytext, v);}
[0-9][0-9][0-9][ ] {v++; printf("%s0 %d \n", yytext, v);}
[ ][0-9][0-9][0-9][ ] {v++; printf("%s0 %d \n", yytext, v);}
\n return 0;
%%
// This returns an error if not included, doesnt mean anything but include this function prototype
int yywrap(){return 0;}
int main(){
    printf("Enter the input \n");
    yylex();
    printf("Count of 3 digit numbers %d \n" , v);
    return 0;
}
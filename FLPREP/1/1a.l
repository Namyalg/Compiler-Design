%{
    #include<stdio.h>
    int w = 0;
    int c = 0;
    int l = 0;
    int s = 0;
%}

%%
[a-zA-Z]+ {w += 1; c += yyleng;}
\n {l += 1;}
[ ] {s += 1;}
# {l += 1; return 0;}
. ;
%%

int main(){
    /* This program takes the lex input and will stop at # 
      this is the number of lines
    */
    yylex();
    printf("The number of words are %d \n", w);
    printf("The number of chars are %d \n", c);
    printf("The number of lines are %d \n", l);
    printf("The number of spaces are %d \n", s);

    return 0;
}

int yywrap(){
    return 1;
}
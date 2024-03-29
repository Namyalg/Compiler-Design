%{
    #include<stdio.h>
    #include<stdlib.h>
    int posnum = 0;
    int negnum = 0;
    int posfrac = 0;
    int negfrac = 0;
    int posdec = 0;
    int negdec = 0;
%}

%%
("+"|"--")?[1-9]+[/][1-9][0-9]*  {posfrac += 1;}
"-"[1-9]+[/][1-9][0-9]*  {negfrac += 1;}
("+"|"--")?[1-9][0-9]* {posnum += 1;}
"-"[1-9][0-9]* {negnum += 1;}
("+"|"--")?[0-9]+["."][0-9]* {posdec += 1;}
"-"[0-9]+["."][0-9]* {negdec += 1;}
. ;
\n {return 0;}
%%

int main(){
    // anything can be a delimiter like space or comma  the answer is correct have checked
    // this works with commas
    yylex();
    // input is space separated
    printf("The number of posfractions are %d \n", posfrac);
    printf("The number of negfractions are %d \n", negfrac);
    printf("The number of pos nums are %d \n", posnum);
    printf("The number of neg nums are %d \n", negnum);
    printf("The number of pos decs are %d \n", posdec);
    printf("The number of neg decs are %d \n", negdec);
    return 0;
}

int yywrap(){
    return 1;
}
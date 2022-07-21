%{
    #include<stdio.h>
    int p = 0;
    int n = 0;
    int pf = 0;
    int nf = 0;
    int pd = 0;
    int nd = 0;
    
%}

%%
[1-9][0-9]*[.][1-9][0-9]* {pd += 1;}
[+]?[1-9][0-9]*[.][1-9][0-9]* {pd +=1;}
"--"[1-9][0-9]*[.][1-9][0-9]* {pd += 1;}

[-][1-9][0-9]*[.][1-9][0-9]* {nd += 1;}

[1-9][0-9]*[/][1-9][0-9]* {pf += 1;}
[+]?[1-9][0-9]*[/][1-9][0-9]* {pf +=1;}
"--"[1-9][0-9]*[/][1-9][0-9]* {pf += 1;}

[-][1-9][0-9]*[/][1-9][0-9]* {nf += 1;}

[1-9][0-9]* {p += 1;}
[+]?[1-9][0-9]* {p +=1;}
"--"[1-9][0-9]* {p += 1;}

[-][1-9][0-9]* {n += 1;}

\n {return 0;}
. ;
%%

int main(){
    // handles numbers of the form --, + or a number without the positive sign at the start
    // for neg with - and can have decimals or fractions
    yylex();
    printf("The number of pos numbers %d \n", p);
    printf("The number of neg numbers %d \n", n);
    printf("The number of pos fractions %d \n", pf);
    printf("The number of neg fractions %d \n", nf);
    printf("The number of pos decimals %d \n", pd);
    printf("The number of neg decimals %d \n", nd);
    return 0;
}

int yywrap(){
    return 1;
}
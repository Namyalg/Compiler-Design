%{
    #include<stdio.h>   
    #include "y.tab.h"
%}

%%
"int"[ ][a-zA-Z]+[","] {return wcom;}
"int"[ ][a-zA-Z]+ {return wocom;}
"(" {return op;}
")" {return cp;}
\n return 0;
. ;
%%

int yywrap(){
    return 1;
}
%{
    #include<stdio.h>
    #include<stdlib.h>
    #include "y.tab.h"
%}

%%
("int"|"float"|"char"|"void")[ ][a-zA-Z_][a-zA-Z0-9_]* {return typ;}
"(" {return op;}
")" {return cp;}
";" {return semi;}
"," {return comma;}
\n {return 0;}
. ;
%%

int yywrap(){
    return 1;
}
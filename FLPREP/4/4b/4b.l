%{
    #include<stdio.h>
    #include "y.tab.h"
%}

%%
"if" {return what;}
"(" {return op;}
")" {return cp;}
"{" {return fb;}
"}" {return cb;}
\n {return 0;}
[a-zA-Z0-9]* {return exp;}
. ;
%%

int yywrap(){
    return 1;
}
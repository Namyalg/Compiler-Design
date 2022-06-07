%{
    #include "y.tab.h"
%}

%%
"a" return a1;
"b" return b1;
\n return 0;
. ;
%%

int yywrap(){
    return 1;
}

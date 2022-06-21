%{
    #include "y.tab.h"
%}

%%
int|float return itype;
[a-zA-Z0-9]+ return var;
, return comma;
"{" return fob;
"}" return fcb;
"(" return ob;
")" return cb;
\n return 0;
. ;

%% 

int yywrap() { return 0;}
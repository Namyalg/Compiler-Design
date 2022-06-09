%{
    #include "y.tab.h"
%}

%%
"for" return forl;
= return equalto;
"(" return opb;
")" return cb;
"{" return fo;
"}" return fc;
"+="|"-="|"*="|"/=" return inc;
"<="|"<"|">"|">=" return ops;
; return semicolon;
int|float return initial;
[a-zA-Z]+ return var;
[0-9]+ return num;
\n return 0;
. ;
%%

int yywrap(){return 1;}
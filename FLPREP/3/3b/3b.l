%{
    #include<stdio.h>
    #include "y.tab.h"
%}

%%
"=" {return eq;}
"+="|"-="|"*="|"/=" {return inc;}
"int" {return innt;}
"for" {return forp;}
";" {return semi;}
"(" {return op;}
")" {return cp;}
"{" {return fp;}
"}" {return fc;}
">"|"<"|">="|"<=" {return relop;}
[1-9][0-9]* {return num;}
[a-zA-Z]+ {return var;}
\n {return 0;}
%%

int yywrap(){
    return 1;
}
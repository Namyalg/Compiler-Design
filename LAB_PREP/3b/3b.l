%{
    #include<stdio.h>
    #include "y.tab.h"
%}

%%
"for" {return fory;}
";" {return semi;}
"(" {return op;}
")" {return cp;}
("int"|"float")?[a-zA-Z]+["="][0-9]+[";"] {return text;}
[a-zA-Z]+("<"|">"|"<="|">=")[0-9]+[";"] {return inc;}
[a-zA-Z]+("+="|"-="|"*="|"/=")[0-9]+ {return incp;}
"{" {return ofb;}
"}" {return cfb;}
\n {return 0;}
. ;

%%

int yywrap(){
    return 1;
}
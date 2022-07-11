%{
    #include "y.tab.h"
%}

%%
"if" {return ifk;}
"(" {return op;}
")" {return cp;}
"{" {return ofb;}
"}" {return cfb;}
[a-zA-Z]*? {return text;}
";" {return semi;}
# {return 0;}
. ;
%%

int yywrap(){
    return 1;

    /* 
        this works for this case without any error her
        if(wwf){if(dd){}}
        Level of nesting is 2
        There is no error
    */
}


Syntax anaslyser to evalute an expression

1. Expressions with constants can be evaluated at runtime
eg : a = 1+2 can be done at compile time 

2. For expressions with 

recognise tokens in cfg, +,-,/,(), num - as digit+

$$ = $1 + $3

E : E'+E -> 
In E'+ E 

E' is $1, 
+ is $2 
E is $3 

so to get the value of the expression then use $1 + $3 to get the result of the expression 
and store it in $$ - indicates the lvalue of the expression


$$ : $1 + $3 
this is the lvalue

why no dollar 2,$2 not there why ?

construct the parse tree and evaluate it using exprrssions

use yyerror to raise errors

use -d for the yacc to generate the header as there are tokens in the program 

For integers yylval = atoi(yytext)
return num



How to compile :


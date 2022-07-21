## Important points

"/*"[a-zA-Z0-9\n ]*"*/" {multi += 1; } // writing this \n in multiline is important as a multiline comment needs to handle new line as welllllll 
"//"[a-zA-Z0-9 ]* {single += 1;} // do not add the \n here as single line means no \n in the thing
_ {return 0;}
. ; {fprintf(yyout, yytext); }

For the comments pls include spaces for both single and multi line comments in the regex
It is important

to read it
yyin = fopen("input.txt", "r");

then call to append the non comments, on . append it to the file 
yyout = fopen("output.txt", "a");

and then call yylex() as it has to parse input
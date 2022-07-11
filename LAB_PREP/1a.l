%{
    #include<stdio.h>
    #include<stdlib.h>
    int words = 0;
    int characters = 0;
    int lines = 0;
    int spaces = 0;
%}

%%
[ ] {spaces += 1;} // spaces just write an empty thing like this
[a-zA-Z]+ {words += 1; characters += strlen(yytext);}
\n {lines += 1;}
[$] {return 0;} // termination condition, anything works here not a problem, include this in the file also as this is where it will end this is used for the end
. ;
%%

int main(){
    //yylex();
    yyin = fopen("in.txt", "rw");
    yyout = fopen("out.txt", "a");
    yylex(); // even with the file input you need to use yylex for the input indicating that it needs to write to it
    printf("The number of words are %d \n", words);    
    printf("The number of lines are %d \n", lines);  
    printf("The number of spaces are %d \n", spaces);
    printf("The number of characters are %d \n", characters);    
    return 0;
}

int yywrap(){
    return 1;
}
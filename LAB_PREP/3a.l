%{
    #include<stdio.h>
    #include<stdlib.h>
    int single = 0;
    int multi = 0;
%}

%%

"/*"[a-zA-Z0-9\n ]*"*/" {multi += 1;} // writing this \n in multiline is important as a multiline comment needs to handle new line as welllllll 
"//"[a-zA-Z0-9 ]* {single += 1;} // do not add the \n here as single line means no \n in the thing
_ {return 0;}
. ; {writefile(yytext);}
%%

int main(){
    yylex();
    printf("Number of multi line comments %d \n", multi);
    printf("Number of single line comments %d \n", single);
    return 0;
}

int writefile(char s[100]){
    FILE *fptr;
    fptr = fopen("without_comments.txt", "a");
    fprintf(fptr, "%s", s);
    return fclose(fptr);
}

int yywrap(){
    return 1;
}
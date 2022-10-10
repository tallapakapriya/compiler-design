%{
#include <stdio.h>
#include <stdbool.h>
int comment_lines = 0;
bool in_comment = false;
%}

%%
"/*".*\n { in_comment = true; ++comment_lines; }
.*"*/"\n { in_comment = false; ++comment_lines; }
"//".*\n { ++comment_lines; }
.*\n { 
    if (in_comment) {
    ++comment_lines;
    } else {
    fprintf(yyout, yytext);  
    }
}

%%

int yywrap() {
    return 1;
}

int main(void) {
    printf("Enter input file: ");
    char filename[64];
    scanf("%s", filename);
    yyin = fopen(filename, "r");
 printf("Enter output file: ");
    scanf("%s", filename);
    yyout = fopen(filename, "w");

    yylex();
    printf("Number of comments: %d\n", comment_lines);
}

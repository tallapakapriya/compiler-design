%{
int len=0;
%}

// Rules to identify if a character apart from alphabets
// occurs in a string

%%
[a-zA-Z]+ {printf("No character other than alphabets");}

/* here . will match any other character than alphabets
because alphabets are already matched above
* will matches 0 or more characters in front of it.
*/

.* {printf("character other than alphabets present"); }
%%

// code section
int yywrap() { }

int main()
{
yylex();
return 0;
}

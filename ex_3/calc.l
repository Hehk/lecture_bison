/* recognize tokens for the calculator and print them out */
%{
# include "calc.tab.h"
%}

%%

"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
"|"     { return ABS; }
"("     { return OP;  }
")"     { return CP;  }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
\n      { return EOL; }
[ \t]   { }
.       { printf("Mysterious character %c\n", *yytext); }

%%

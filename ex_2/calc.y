/* simple calculator */

%{
  #include <stdio.h>
%}

/* declare tokens */

%token NUMBER
%token ADD SUB MUL DIV
%token EOL

%%

calclist: /* nothing */
  | calclist exp EOL { printf("= %d\n", $2); }
  ;

exp: factor
  | exp ADD factor { $$ = $1 + $3; }
  | exp SUB factor { $$ = $1 - $3; }
  ;

factor: NUMBER
  | factor MUL NUMBER { $$ = $1 * $3; }
  | factor DIV NUMBER { $$ = $1 / $3; }
  ;

%%

int main (int argc, char **argv) {
  yyparse();
}

int yyerror(char *s) {
  fprintf(stderr, "error: %s\n", s);
}

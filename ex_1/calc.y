/* simple calculator */

%{
  #include <stdio.h>
%}

%token NUMBER
%token ADD SUB
%token EOL

%%

calclist: /* nothing */
  | calclist exp EOL { printf("= %d\n", $2); }
  ;

exp: NUMBER
  | exp ADD NUMBER { $$ = $1 + $3; }
  | exp SUB NUMBER { $$ = $1 - $3; }
  ;

%%

int main (int argc, char **argv) {
  yyparse();
}

int yyerror(char *s) {
  fprintf(stderr, "error: %s\n", s);
}

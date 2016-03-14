/*
 * Declaration for a calculator CALC
 */

// Inteface to the lexer
extern int yylineno;
void yyerror(char *s, ...);

// Nodes in the abstract syntax tree
struct ast {
  int nodetype;
  struct ast *l;
  struct ast *r;
};

struct numval {
  int nodetype;
  double number;
};

// Build an AST
struct ast *newast(int nodetype, struct ast *l, struct ast *r);
struct ast *newnum(double d);

// Evaluate an AST
double eval(struct ast *);

// Delete and free an AST
void treefree(struct ast *);

%{
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "loc.h"
// #include "ast.h"
#include "error.h"
#include "node.h"
#include "node.c"
#include "info.h"
// #include "symbol.h"
// #include "symbol.c"

#define YYLTYPE LocType

#define MAX_LINE_LENG      256
extern int line_no, col_no, opt_list;
extern char buffer[MAX_LINE_LENG];
extern FILE *yyin;        /* declared by lex */
extern char *yytext;      /* declared by lex */
extern int yyleng;

struct nodeType *root;

extern
#ifdef __cplusplus
"C"
#endif
int yylex(void);
static void yyerror(const char *msg);
extern int yylex_destroy(void);

%}

%locations

%union {
    int val;
    char* text;
    double dval;
    struct nodeType * node;
}

%token <node> PROGRAM VAR ARRAY OF INTEGER REAL STRING FUNCTION PROCEDURE PBEGIN END IF THEN ELSE WHILE DO NOT AND OR
%token <node> LPAREN RPAREN SEMICOLON DOT COMMA COLON LBRACE RBRACE DOTDOT ASSIGNMENT ADDOP SUBOP MULOP DIVOP LTOP GTOP EQOP GETOP LETOP NEQOP
/* %token <node> IDENTIFIER REALNUMBER INTEGERNUM SCIENTIFIC LITERALSTR */

/* %token <number> NUM
%token <string> String Char ID */
%token <node> IDENTIFIER LITERALSTR
%token <node> INTEGERNUM 
%token <node> REALNUMBER SCIENTIFIC


/* %type <node> prog */
%type <node> prog identifier_list declarations type standard_type subprogram_declarations
%type <node> subprogram_declaration subprogram_head arguments parameter_list optional_var
%type <node> compound_statement optional_statements statement_list statement variable
%type <node> tail procedure_statement expression_list expression simple_expression term
%type <node> factor addop mulop relop boolexpression num

%%

    /* define your snytax here */
    /* @n return the sturct LocType of "n-th node", ex: @1 return the PROGRAM node's locType
       $n return the $$ result you assigned to the rule, ex: $1 */
prog : PROGRAM 
    /* { */
        // root = NULL;

        /*
        printf("program node is @ line: %d, column: %d\n",
                    @1.first_line, @1.first_column);
        yylval.val, yylval.text, yylval.dval to get the data (type defined in %union) you assigned by scanner.
        */
    /* } */
    IDENTIFIER LPAREN identifier_list RPAREN SEMICOLON 
    declarations
    subprogram_declarations
    compound_statement
    DOT
    {
        $$=newNode(NODE_prog);
        addChild($$,newNode(NODE_PROGRAM));
        addChild($$,$2);
        addChild($$,newNode(NODE_LPAREN));
        addChild($$,$4);
        addChild($$,newNode(NODE_RPAREN));
        addChild($$,newNode(NODE_SEMICOLON));
        addChild($$,$7);
        addChild($$,$8);
        addChild($$,$9);
        addChild($$,newNode(NODE_DOT));
        root = $$;
        // printf("Reduction(prog -> PROGRAM IDENTIFIER ( identifier_list ) ; declartions subprogram_declartions compound_statement.\n");
    }
    ;

identifier_list : IDENTIFIER
        {
            $$=newNode(NODE_identifier_list);
            addChild($$,$1);
        }
        | identifier_list COMMA IDENTIFIER
        {
            $$=newNode(NODE_identifier_list);
            addChild($$,$1);
            addChild($$,newNode(NODE_COMMA));
            addChild($$,$3);
        }
    ;

declarations : declarations VAR identifier_list COLON type SEMICOLON
        {
            $$=newNode(NODE_declarations);
            addChild($$,$1);
            addChild($$,newNode(NODE_VAR));
            addChild($$,$3);
            addChild($$,newNode(NODE_COLON));
            addChild($$,$5);
            addChild($$,newNode(NODE_SEMICOLON));
        }
        | 
        {
			$$=newNode(NODE_declarations);
		}
    ;

type : standard_type
        {
            $$=newNode(NODE_type);
            addChild($$,$1);
        }  
        | ARRAY LBRACE num DOTDOT num RBRACE OF type
        {
            $$=newNode(NODE_type);
            addChild($$,newNode(NODE_ARRAY));
            addChild($$,newNode(NODE_LBRACE));
            addChild($$,$3);
            addChild($$,newNode(NODE_DOTDOT));
            addChild($$,$5);
            addChild($$,newNode(NODE_RBRACE));
            addChild($$,newNode(NODE_OF));
            addChild($$,$8);
        }
    ;

standard_type : INTEGER
        {
            $$=newNode(NODE_standard_type);
            addChild($$,newNode(NODE_INTEGER));
        }
        | REAL
        {
            $$=newNode(NODE_standard_type);
            addChild($$,newNode(NODE_REAL));
        }
        | STRING
        {
            $$=newNode(NODE_standard_type);
            addChild($$,newNode(NODE_STRING));
        }
    ;

subprogram_declarations : subprogram_declarations subprogram_declaration SEMICOLON
        {
            $$=newNode(NODE_subprogram_declarations);
            addChild($$,$1);
            addChild($$,newNode(NODE_SEMICOLON));
        }
        | 
        {
            $$=newNode(NODE_subprogram_declarations);
        }
    ;

subprogram_declaration :
        subprogram_head
        declarations
        subprogram_declarations
        compound_statement
        {
            $$=newNode(NODE_subprogram_declaration);
            addChild($$,$1);
            addChild($$,$2);
            addChild($$,$3);
            addChild($$,$4);
        }
    ;

subprogram_head : FUNCTION IDENTIFIER arguments COLON standard_type SEMICOLON
        {
            $$=newNode(NODE_subprogram_head);
            addChild($$,newNode(NODE_FUNCTION));
            addChild($$,$2);
            addChild($$,$3);
            addChild($$,newNode(NODE_COLON));
            addChild($$,$5);
            addChild($$,newNode(NODE_SEMICOLON));
        }
        | PROCEDURE IDENTIFIER arguments SEMICOLON
        {
            $$=newNode(NODE_subprogram_head);
            addChild($$,newNode(NODE_PROCEDURE));
            addChild($$,$2);
            addChild($$,$3);
            addChild($$,newNode(NODE_SEMICOLON));
        }
    ;

arguments : LPAREN parameter_list RPAREN
        {
            $$=newNode(NODE_arguments);
            addChild($$,newNode(NODE_LPAREN));
            addChild($$,$2);
            addChild($$,newNode(NODE_RPAREN));
        }
        | 
        {
            $$=newNode(NODE_arguments);
        }
    ;

parameter_list : optional_var identifier_list COLON type
        {
            $$=newNode(NODE_parameter_list);
            addChild($$,$1);
            addChild($$,$2);
            addChild($$,newNode(NODE_COLON));
            addChild($$,$4);
        }
        | optional_var identifier_list COLON type SEMICOLON parameter_list
        {
            $$=newNode(NODE_parameter_list);
            addChild($$,$1);
            addChild($$,$2);
            addChild($$,newNode(NODE_COLON));
            addChild($$,$4);
            addChild($$,newNode(NODE_SEMICOLON));
            addChild($$,$6);
        }
    ;

optional_var : VAR
        {
            $$=newNode(NODE_optional_var);
            addChild($$,newNode(NODE_VAR));
        }
        | 
        {
            $$=newNode(NODE_optional_var);
        }
    ;

compound_statement : PBEGIN optional_statements END
        {
            $$=newNode(NODE_compound_statement);
            addChild($$,newNode(NODE_PBEGIN));
            addChild($$,$2);
            addChild($$,newNode(NODE_END));
        }
    ;

optional_statements : statement_list
        {
            $$=newNode(NODE_optional_statements);
            addChild($$,$1);
        }
        | 
        {
            $$=newNode(NODE_optional_statements);
        }
    ;

statement_list : statement
        {
            $$=newNode(NODE_statement_list);
            addChild($$,$1);
        }
        | statement_list SEMICOLON statement
        {
            $$=newNode(NODE_statement_list);
            addChild($$,$1);
            addChild($$,newNode(NODE_SEMICOLON));
            addChild($$,$3);
        }
    ;

statement : variable ASSIGNMENT expression
        {
            $$=newNode(NODE_statement);
            addChild($$,$1);
            addChild($$,newNode(NODE_ASSIGNMENT));
            addChild($$,$3);
        }
        | procedure_statement
        {
            $$=newNode(NODE_statement);
            addChild($$,$1);
        }
        | compound_statement
        {
            $$=newNode(NODE_statement);
            addChild($$,$1);
        }
        | IF expression THEN statement ELSE statement
        {
            $$=newNode(NODE_statement);
            addChild($$,newNode(NODE_IF));
            addChild($$,$2);
            addChild($$,newNode(NODE_THEN));
            addChild($$,$4);
            addChild($$,newNode(NODE_ELSE));
            addChild($$,$6);
        }
        | WHILE expression DO statement
        {
            $$=newNode(NODE_statement);
            addChild($$,newNode(NODE_WHILE));
            addChild($$,$2);
            addChild($$,newNode(NODE_DO));
            addChild($$,$4);
        }
        | 
        {
            $$=newNode(NODE_statement);
        }
    ;

variable : IDENTIFIER tail
        {
            $$=newNode(NODE_variable);
            addChild($$,$1);
            addChild($$,$2);
        }
    ;

tail : LBRACE expression RBRACE tail
        {
            $$=newNode(NODE_tail);
            addChild($$,newNode(NODE_LBRACE));
            addChild($$,$2);
            addChild($$,newNode(NODE_RBRACE));
            addChild($$,$4);
        }
        | 
        {
            $$=newNode(NODE_tail);
        }
    ;

procedure_statement : IDENTIFIER
        {
            $$=newNode(NODE_procedure_statement);
            addChild($$,$1);
        }
        | IDENTIFIER LPAREN expression_list RPAREN
        {
            $$=newNode(NODE_procedure_statement);
            addChild($$,$1);
            addChild($$,newNode(NODE_LPAREN));
            addChild($$,$3);
            addChild($$,newNode(NODE_RPAREN));
        }
    ;

expression_list : expression
        {
            $$=newNode(NODE_expression_list);
            addChild($$,$1);
        }
        | expression_list COMMA expression
        {
            $$=newNode(NODE_expression_list);
            addChild($$,$1);
            addChild($$,newNode(NODE_COMMA));
            addChild($$,$3);
        }
    ;

expression : boolexpression
        {
            $$=newNode(NODE_expression);
            addChild($$,$1);
        }
        | boolexpression AND boolexpression
        {
            $$=newNode(NODE_expression);
            addChild($$,$1);
            addChild($$,newNode(NODE_AND));
            addChild($$,$3);
        }
        | boolexpression OR boolexpression
        {
            $$=newNode(NODE_expression);
            addChild($$,$1);
            addChild($$,newNode(NODE_OR));
            addChild($$,$3);
        }
    ;

boolexpression : simple_expression
        {
            $$=newNode(NODE_boolexpression);
            addChild($$,$1);
        }
        | simple_expression relop simple_expression
        {
            $$=newNode(NODE_boolexpression);
            addChild($$,$1);
            addChild($$,newNode(NODE_relop));
            addChild($$,$3);
        }
    ;

simple_expression : term
        {
            $$=newNode(NODE_simple_expression);
            addChild($$,$1);
        }
        | simple_expression addop term
        {
            $$=newNode(NODE_simple_expression);
            addChild($$,$1);
            addChild($$,newNode(NODE_addop));
            addChild($$,$3);
        }
    ;

term : factor
        {
            $$=newNode(NODE_term);
			addChild($$,$1);
        }
        | term mulop factor
        {
            $$=newNode(NODE_term);
			addChild($$,$1);
            addChild($$,newNode(NODE_mulop));
            addChild($$,$3);
        }
    ;

factor : IDENTIFIER tail
        {
            $$=newNode(NODE_factor);
            addChild($$,$1);
			addChild($$,$2);
        }
        | IDENTIFIER LPAREN expression_list RPAREN
        {
            $$=newNode(NODE_factor);
            addChild($$,$1);
            addChild($$,newNode(NODE_LPAREN));
			addChild($$,$3);
            addChild($$,newNode(NODE_RPAREN));
        }
        | num
        {
            $$=newNode(NODE_factor);
            addChild($$,$1);
        }
        | LITERALSTR
        {
            $$=newNode(NODE_factor);
            addChild($$,$1);
        }
        | LPAREN expression RPAREN
        {
            $$=newNode(NODE_factor);
            addChild($$,newNode(NODE_LPAREN));
			addChild($$,$2);
            addChild($$,newNode(NODE_RPAREN));
        }
        | NOT factor
        {
            $$=newNode(NODE_factor);
            addChild($$,newNode(NODE_NOT));
			addChild($$,$2);
        }
        | SUBOP factor
        {
            $$=newNode(NODE_factor);
            addChild($$,newNode(NODE_SUBOP));
			addChild($$,$2);
        }
    ;

addop : ADDOP 
        {
            $$=newNode(NODE_addop);
            addChild($$,newNode(NODE_ADDOP));
        }
        | SUBOP
        {
            $$=newNode(NODE_addop);
            addChild($$,newNode(NODE_SUBOP));
        }
    ;

mulop : MULOP 
        {
            $$=newNode(NODE_mulop);
            addChild($$,newNode(NODE_MULOP));
        }
        | DIVOP
        {
            $$=newNode(NODE_mulop);
            addChild($$,newNode(NODE_DIVOP));
        }
    ;

relop : LTOP
        {
            $$=newNode(NODE_relop);
            addChild($$,newNode(NODE_LTOP));
        }
        | GTOP
        {
            $$=newNode(NODE_relop);
            addChild($$,newNode(NODE_GTOP));
        }
        | EQOP
        {
            $$=newNode(NODE_relop);
            addChild($$,newNode(NODE_EQOP));
        }
        | LETOP
        {
            $$=newNode(NODE_relop);
            addChild($$,newNode(NODE_LETOP));
        }
        | GETOP
        {
            $$=newNode(NODE_relop);
            addChild($$,newNode(NODE_GETOP));
        }
        | NEQOP
        {
            $$=newNode(NODE_relop);
            addChild($$,newNode(NODE_NEQOP));
        }
    ;

num : REALNUMBER 
        {
            $$=newNode(NODE_num);
            addChild($$,$1);
        }
        | INTEGERNUM 
        {
            $$=newNode(NODE_num);
            addChild($$,$1);
        }
        | SCIENTIFIC
        {
            $$=newNode(NODE_num);
            addChild($$,$1);
        }
    ;

%%

void yyerror(const char *msg) {
    fprintf(stderr,
            "[ERROR] line %4d:%3d %s, Unmatched token: %s\n",
            line_no, col_no - yyleng, buffer, yytext);
}

int main(int argc, const char *argv[]) {

    if(argc > 2)
        fprintf( stderr, "Usage: ./parser [filename]\n" ), exit(0);

    FILE *fp = argc == 1 ? stdin : fopen(argv[1], "r");

    if(fp == NULL)
        fprintf( stderr, "Open file error\n" ), exit(-1);

    yyin = fp;
    yyparse();
    if(root){
        // do pass here
    }
    printTree(root,0);
    /* SymbolTable.size = 0;
    SymbolTable.status=1;
    ScopeStack[0]=&SymbolTable;
    printf("Create a new Scope\n");
    printf("Create a new SymbolTable\n");
    semanticCheck(root);
    printf("Close a scope\n");
    printf("Close a SymbolTable\n"); */
    return 0;
}


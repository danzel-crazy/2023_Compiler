#ifndef __NODE_H__
#define __NODE_H__

struct nodeType;
enum ntype {
    VALUE_INVALID,NODE_PROGRAM,NODE_VAR,NODE_ARRAY,NODE_OF,NODE_INTEGER,NODE_REAL,NODE_STRING,NODE_FUNCTION,NODE_PROCEDURE,NODE_PBEGIN,NODE_END,NODE_IF,NODE_THEN,NODE_ELSE,NODE_WHILE,NODE_DO,NODE_NOT,NODE_AND,NODE_OR,
    NODE_LPAREN,NODE_RPAREN,NODE_SEMICOLON,NODE_DOT,NODE_COMMA,NODE_COLON,NODE_LBRACE,NODE_RBRACE,NODE_DOTDOT,NODE_ASSIGNMENT,NODE_ADDOP,NODE_SUBOP,NODE_MULOP,NODE_DIVOP,NODE_LTOP,NODE_GTOP,NODE_EQOP,NODE_GETOP,NODE_LETOP,NODE_NEQOP,
    NODE_begin,
    NODE_IDENTIFIER,NODE_REALNUMBER,NODE_INTEGERNUM,NODE_SCIENTIFIC,NODE_LITERALSTR,
    NODE_prog,NODE_identifier_list,NODE_num,
    NODE_declarations,NODE_type,NODE_standard_type,NODE_subprogram_declaration,NODE_subprogram_declarations,
    NODE_subprogram_head,NODE_arguments,NODE_parameter_list,NODE_optional_var,NODE_compound_statement,
    NODE_optional_statements,NODE_statement_list,NODE_variable,NODE_tail,NODE_procedure_statement,
    NODE_expression_list,NODE_expression,NODE_simple_expression,NODE_term,NODE_factor,
    NODE_addop,NODE_mulop,NODE_relop,NODE_statement,NODE_boolexpression,
    NODE_NUM, NODE_String, NODE_Char, NODE_ID
};

#include "symbol.h"
struct nodeType {
    int nodeType;
    struct nodeType *parent;
    struct nodeType *child;
    struct nodeType *lsibling;
    struct nodeType *rsibling;

    /* Attribute for NODE_TOKEN */
    int tokenType;

    /* items for Array */
    int idxstart;
    int idxend;
    int arraydepth;
    struct nodeType *ref;

    /* Values for general use */
    int iValue;
    double rvalue;//for float,int,scientific sign
    char valueValid;
    char *string;
    
    /* Indicates which OP */
    char op;
    int branch;

    enum StdType valueType;
    enum dataType dtype;
    struct SymTableEntry *entry;

    int argstart;
    int argsize;
    int arglevel;
    int argdtype;
    int argvtype;

    int lineno;

};

struct nodeType* newNode(int type);
void deleteNode(struct nodeType* node);
void addChild(struct nodeType *node, struct nodeType *child);
void printTree(struct nodeType *node, int ident);

#endif
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "node.h"

struct nodeType* newNode(int type) {
    struct nodeType *node = (struct nodeType*)malloc(sizeof(struct nodeType));
    node->nodeType = type;
    node->valueValid = VALUE_INVALID;
    node->string = NULL;
    node->parent = NULL;
    node->child = NULL;
    node->lsibling = node;
    node->rsibling = node;

    return node;
}

void addChild(struct nodeType *node, struct nodeType *child) {
    child->parent = node;
    if(node->child == NULL) {
        node->child = child;
    }
    else {
        child->lsibling = node->child->lsibling;
        child->rsibling = node->child;
        node->child->lsibling->rsibling = child;
        node->child->lsibling = child;
    }
}

void deleteNode(struct nodeType *node) {
    if(node->string != NULL)
        free(node->string);
    free(node);
}

void printTree(struct nodeType *node, int ident) {
    static char blank[1024];
    for(int i=0; i<ident; i++)
        blank[i] = ' ';
    blank[ident] = 0;
    
    switch(node->nodeType) {
        /********* modified **********/
        case NODE_ADDOP:
            printf("%s/+\n", blank);
            break;
        case NODE_SUBOP:
            printf("%s/-\n", blank);
            break;
        case NODE_MULOP:
            printf("%s/*\n", blank);
            break;
        case NODE_DIVOP:
            printf("%s/ /\n", blank);
            break;    
        case NODE_INTEGERNUM:
            printf("%s%d\n", blank, node->iValue);
            ident += 8;
            break;
        case NODE_REALNUMBER:
            printf("%s%lf\n", blank, node->rvalue);
            ident += 8;
            break;
        case NODE_SCIENTIFIC:
            printf("%s%lf\n", blank, node->rvalue);
            ident += 8;
            break;
        case NODE_IDENTIFIER:
            printf("%s%s\n", blank, node->string);
            ident += 8;
            break;
        case NODE_PROGRAM:
            printf("%s/PROGRAM\n", blank);
            ident += 8;
            break;            
        case NODE_IF:
            printf("%s/IF\n", blank);
            break;
        case NODE_ELSE:
            printf("%s/ELSE\n", blank);
            break;
        case NODE_WHILE:
            printf("%s/WHILE\n", blank);
            break;
        case NODE_DO:
            printf("%s/DO\n", blank);
            break;
        case NODE_THEN:
            printf("%s/THEN\n", blank);
            break;
        case NODE_OF:
            printf("%s/OF\n", blank);
            break;
        case NODE_FUNCTION:
            printf("%s/FUNCTION\n", blank);
            break;
        case NODE_PROCEDURE:
            printf("%s/PROCEDURE\n", blank);
            break;
        case NODE_STRING:
            printf("%s/STRING\n", blank);
            break;
        case NODE_ASSIGNMENT:
            printf("%s/:=\n", blank);
            break;
        case NODE_COLON:
            printf("%s/:\n", blank);
            break;
        case NODE_INTEGER:
            printf("%s/INTEGER\n", blank);
            break;                            
        case NODE_COMMA:
            printf("%s/,\n", blank);
            break;
        case NODE_begin:
            printf("%s/BEGIN\n", blank);
            break;
        case NODE_END:
            printf("%s/END\n", blank);
            break;
        case NODE_ARRAY:
            printf("%s/ARRAY\n", blank);
            break;
        case NODE_VAR:
            printf("%s/VAR\n", blank);
            break;
        case NODE_NOT:
            printf("%s/NOT\n", blank);
            break;                            
        case NODE_DOT:
            printf("%s/.\n", blank);
            break;
         case NODE_DOTDOT:
            printf("%s/..\n", blank);
            break;
        case NODE_EQOP:
            printf("%s/=\n", blank);
            break;
        case NODE_NEQOP:
            printf("%s/!=\n", blank);
            break;
        case NODE_GETOP:
            printf("%s/>=\n", blank);
            break;
        case NODE_GTOP:
            printf("%s/>\n", blank);
            break;
        case NODE_LBRACE:
            printf("%s/[\n", blank);
            break;                            
        case NODE_LPAREN:
            printf("%s/(\n", blank);
            break;
        case NODE_LETOP:
            printf("%s/<=\n", blank);
            break;                            
        case NODE_LTOP:
            printf("%s/<\n", blank);
            break;
        case NODE_RBRACE:
            printf("%s/]\n", blank);
            break;
        case NODE_REAL:
            printf("%s/REAL\n", blank);
            break;
        case NODE_RPAREN:
            printf("%s/)\n", blank);
            break;
        case NODE_SEMICOLON:
            printf("%s/;\n", blank);
            break;
        case NODE_AND:
            printf("%s/AND\n", blank);
            break;
        case NODE_OR:
            printf("%s/OR\n", blank);
            break;
        // case NODE_CHAR:
        //     printf("%s/CHAR\n", blank);
        //     break;                            
        case NODE_LITERALSTR:
            printf("%s%s\n", blank,node->string);
            break;
        case NODE_Char:
            printf("%s%s\n", blank,node->string);
            break;
                                                  
        case NODE_prog:
            printf("%s/prog\n", blank);
            ident += 8;
            break;
        case NODE_identifier_list:
            printf("%s/identifier_list\n", blank);
            ident += 8;
            break;
        case NODE_num:
            printf("%s/num\n", blank);
            ident += 8;
            break;
        case NODE_declarations:
            printf("%s/declarations\n", blank);
            ident += 8;
            break;
        case NODE_type:
            printf("%s/type\n", blank);
            ident += 8;
            break;
        case NODE_standard_type:
            printf("%s/standard_type\n", blank);
            ident += 8;
            break;
        case NODE_subprogram_declaration:
            printf("%s/subprogram_declaration\n", blank);
            ident += 8;
            break;
        case NODE_subprogram_declarations:
            printf("%s/subprogram_declarations\n", blank);
            ident += 8;
            break;
        case NODE_subprogram_head:
            printf("%s/subprogram_head\n", blank);
            ident += 8;
            break;
        case NODE_arguments:
            printf("%s/arguments\n", blank);
            ident += 8;
            break;
        case NODE_parameter_list:
            printf("%s/parameter_list\n", blank);
            ident += 8;
            break;
        case NODE_optional_var:
            printf("%s/optional_var\n", blank);
            ident += 8;
            break;
        case NODE_compound_statement:
            printf("%s/compound_statement\n", blank);
            ident += 8;
            break;
        case NODE_optional_statements:
            printf("%s/optional_statements\n", blank);
            ident += 8;
            break;
        case NODE_statement_list:
            printf("%s/statement_list\n", blank);
            ident += 8;
            break;
        case NODE_variable:
            printf("%s/variable\n", blank);
            ident += 8;
            break;
        case NODE_tail:
            printf("%s/tail\n", blank);
            ident += 8;
            break;
        case NODE_procedure_statement:
            printf("%s/procedure_statement\n", blank);
            ident += 8;
            break;            
        case NODE_expression_list:
            printf("%s/expression_list\n", blank);
            ident += 8;
            break;    
        case NODE_expression:
            printf("%s/expression\n", blank);
            ident += 8;
            break;
        case NODE_simple_expression:
            printf("%s/simple_expressiong\n", blank);
            ident += 8;
            break;
        case NODE_term:
            printf("%s/term\n", blank);
            ident += 8;
            break;
        case NODE_factor:
            printf("%s/factor\n", blank);
            ident += 8;
            break;
        case NODE_addop:
            printf("%s/addop\n", blank);
            ident += 8;
            break;
        case NODE_mulop:
            printf("%s/mulop\n", blank);
            ident += 8;
            break;
        case NODE_relop:
            printf("%s/relop\n", blank);
            ident += 8;
            break;
        case NODE_statement:
            printf("%s/statement\n", blank);
            ident += 8;
            break;  
        case NODE_PBEGIN:
            printf("%s/statement\n", blank);
            break;    
        case NODE_boolexpression:
            printf("%s/boolexpression\n", blank);
            ident += 8;
            break;  
        /*****************************************/        
        
        default:
            printf("%sdefault:%d\n", blank, node->nodeType);
          break;
    }

    struct nodeType *child = node->child;
    if(child != NULL) {
        do {
            printTree(child, ident);
            child = child->rsibling;
        } while(child != node->child);
    }
}
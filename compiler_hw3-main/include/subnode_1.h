#ifndef _SUBHEADNODE_H
#define _SUBHEADNODE_H

#include "ast.h"
#include "standtypenode.h"
#include "argumentsnode.h"
#include "declarnode.h"
#include "compoundstatementnode.h"

typedef struct subheadnode{
    Node node;
    int type;   // 0: FUNCTION, 1: PROCEDURE
    char* id;
    StandTypeNode* standard_type;
    ArgumentsNode* arguments;

} SubHeadNode;

int* SubHeadNode_visit(void*);

SubHeadNode* newSubHeadNode( int, int, int, char*, StandTypeNode*, ArgumentsNode*, int, int );



struct subdeclarnode;

typedef struct subdeclarsnode{
    Node node;
    struct subdeclarsnode* PrevNode;
    struct subdeclarnode* NextNode;

} SubDeclarSNode;

typedef struct subdeclarnode{
    Node node;
    SubHeadNode* head;
    DeclarNode* declarnode;
    SubDeclarSNode* subdeclarsnode;
    CompoundStatementNode* compoundstatementnode;

} SubDeclarNode;

SubDeclarNode* newSubDeclarNode( int, int, SubHeadNode*, DeclarNode*, SubDeclarSNode*, CompoundStatementNode*, int, int );

int* SubDeclarNode_visit(void*);

int* SubDeclarSNode_visit(void*);

SubDeclarSNode* newSubDeclarSNode( int, int, SubDeclarSNode*, SubDeclarNode*, int, int );

int checkExist( StatementNode*, char* );

#endif
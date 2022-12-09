#ifndef _SUBDECLARNODE_H
#define _SUBDECLARNODE_H

#include "ast.h"
#include "subheadnode.h"
#include "declarnode.h"
#include "compoundstatementnode.h"

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

int SubDeclarNode_visit(void*);

int SubDeclarSNode_visit(void*);

SubDeclarSNode* newSubDeclarSNode( int, int, SubDeclarSNode*, SubDeclarNode*, int, int );

int checkExist( StatementNode*, char* );

#endif

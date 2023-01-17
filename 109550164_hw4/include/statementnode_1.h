#ifndef _STATEMENTNODE_H
#define _STATEMENTNODE_H

#include "ast.h"
#include "varnode.h"
#include "expnode_1.h"
#include "procedstatementnode.h"
#include "compoundstatementnode.h"

typedef struct compoundstatementnode CompoundStatementNode;

typedef struct statementnode{
    Node node;
    int type;
    VarNode* varnode;
    ExpNode* expnode;
    ProcedStatementNode* procedstatementnode;
    CompoundStatementNode* compoundstatementnode;
    struct statementnode* statementnode1;
    struct statementnode* statementnode2;

} StatementNode;

Node* newStatementNode( int, int, int, VarNode*, ExpNode*, ProcedStatementNode*, CompoundStatementNode*, StatementNode*, StatementNode*, int, int );

void* StatementNode_visit(void*);

typedef struct statementnode StatementNode;

typedef struct statementlistnode{
    Node node;
    struct statementlistnode* nextList;
    StatementNode* statementnode;

} StatementListNode;

Node* newStatementListNode( int, int, struct statementlistnode*, StatementNode*, int, int );

void* StatementListNode_visit(void*);

#endif

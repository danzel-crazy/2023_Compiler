#ifndef _STATEMENTLISTNODE_H
#define _STATEMENTLISTNODE_H

#include "ast.h"
#include "statementnode.h"

typedef struct statementnode StatementNode;

typedef struct statementlistnode{
    Node node;
    struct statementlistnode* nextList;
    StatementNode* statementnode;

} StatementListNode;

StatementListNode* newStatementListNode( int, int, struct statementlistnode*, StatementNode*, int, int );

int StatementListNode_visit(void*);

#endif

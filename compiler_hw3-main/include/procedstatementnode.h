#ifndef _PROCEDSTATEMENTNODE_H
#define _PROCEDSTATEMENTNODE_H

#include "ast.h"
#include "explistnode.h"

typedef struct procedstatementnode{
    Node node;
    char* id;
    ExpListNode* explistnode;

} ProcedStatementNode;

ProcedStatementNode* newProcedStatementNode( int, int, char*, ExpListNode*, int, int );

int ProcedStatementNode_visit(void*);

#endif
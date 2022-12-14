#ifndef _EXPLISTNODE_H
#define _EXPLISTNODE_H

#include "ast.h"
#include "expnode.h"

typedef struct expnode ExpNode;

typedef struct explistnode{
    Node node;
    struct explistnode* explistnode;
    ExpNode* expnode;

} ExpListNode;

ExpListNode* newExpListNode( int, int, ExpListNode*, ExpNode*, int, int );

int ExpListNode_visit(void*);

#endif
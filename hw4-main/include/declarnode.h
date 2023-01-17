#ifndef _DECLARNODE_H
#define _DECLARNODE_H

#include "ast.h"
#include "typenode.h"
#include "identlistnode.h"

typedef struct declarnode{
    Node node;
    struct declarnode* NextNode;
    IdentListNode* identlistnode;
    TypeNode* typenode;

} DeclarNode;

DeclarNode* newDeclarNode( int, int, DeclarNode*, IdentListNode*, TypeNode*, int, int );

int DeclarNode_visit(void*);

#endif
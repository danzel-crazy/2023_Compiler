#ifndef _IDENTLISTNODE_H
#define _IDENTLISTNODE_H

#include "ast.h"

typedef struct identlistnode{
    Node node;
    char* id;
    struct identlistnode* PrevNode;

} IdentListNode;

IdentListNode* newIdentListNode( int, int, char*, IdentListNode*, int, int );

int IdentListNode_visit(void*);

#endif
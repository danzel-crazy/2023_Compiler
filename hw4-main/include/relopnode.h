#ifndef _RELOPNODE_H
#define _RELOPNODE_H

#include "ast.h"

typedef struct relopnode{
    Node node;
    int type;

} RelopNode;

RelopNode* newRelopNode( int, int, int, int, int );

int RelopNode_visit(void*);

#endif
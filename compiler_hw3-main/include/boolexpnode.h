#ifndef _BOOLEXPNODE_H
#define _BOOLEXPNODE_H

#include "ast.h"
#include "simpleexpnode.h"
#include "relopnode.h"

typedef struct simpleexpnode SimpleExpNode;

typedef struct boolexpnode{
    Node node;
    SimpleExpNode* first;
    RelopNode* relop;
    SimpleExpNode* least;

} BoolExpNode;

BoolExpNode* newBoolExpNode( int, int, SimpleExpNode*, RelopNode*, SimpleExpNode*, int, int );

int BoolExpNode_visit(void*);

#endif
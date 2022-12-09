#ifndef _EXPNODE_H
#define _EXPNODE_H

#include "ast.h"
#include "boolexpnode.h"

typedef struct boolexpnode BoolExpNode;

typedef struct expnode{
    Node node;
    int type;   // 0: bool, 1: bool AND bool, 2: bool OR bool
    BoolExpNode* first;
    BoolExpNode* least;
    
} ExpNode;

ExpNode* newExpNode( int, int, BoolExpNode*, int, BoolExpNode*, int, int );

int ExpNode_visit(void*);

#endif
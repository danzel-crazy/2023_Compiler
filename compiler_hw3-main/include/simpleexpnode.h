#ifndef _SIMPLEEXPNODE_H
#define _SIMPLEEXPNODE_H

#include "ast.h"
#include "simpleexpnode.h"
#include "addnode.h"
#include "termnode.h"

typedef struct termnode TermNode;
typedef struct simpleexpnode SimpleExpNode;
typedef struct addnode AddNode;

typedef struct simpleexpnode{
    Node node;
    TermNode* termnode;
    SimpleExpNode* simpleexpnode;
    AddNode* addnode;

} SimpleExpNode;

SimpleExpNode* newSimpleExpNode( int, int, SimpleExpNode*, AddNode*, TermNode*, int, int );

int SimpleExpNode_visit(void*);

#endif
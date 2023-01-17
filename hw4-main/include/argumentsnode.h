#ifndef _ARGUMENTSNODE_H
#define _ARGUMENTSNODE_H

#include "ast.h"
#include "parameterlistnode.h"

typedef struct argumentsnode{
    Node node;
    ParameterListNode* parameterlist;

} ArgumentsNode;

ArgumentsNode* newArgumentsNode( int, int, ParameterListNode*, int, int );

int ArgumentsNode_visit(void*);

#endif
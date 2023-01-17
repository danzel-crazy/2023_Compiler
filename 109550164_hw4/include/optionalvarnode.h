#ifndef _OPTIONALVARNODE_H
#define _OPTIONALVARNODE_H

#include "ast.h"

typedef struct optionalvarnode{
    Node node;
    
} OptionalVarNode;

int OptionalVarNode_visit(void*);

OptionalVarNode* newOptionalVarNode( int, int );

#endif
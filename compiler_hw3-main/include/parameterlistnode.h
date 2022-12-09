#ifndef _PARAMETERLISTNODE_H
#define _PARAMETERLISTNODE_H

#include "ast.h"
#include "optionalvarnode.h"
#include "identlistnode.h"
#include "typenode.h"

typedef struct parameterlistnode{
    Node node;
    OptionalVarNode* optionalvarnode;
    IdentListNode* identlistnode;
    TypeNode* typenode;
    struct parameterlistnode* NextNode;

} ParameterListNode;

ParameterListNode* newParameterListNode( int, int, OptionalVarNode*, IdentListNode*, TypeNode*, ParameterListNode*, int, int );

int ParameterListNode_visit(void*);

#endif
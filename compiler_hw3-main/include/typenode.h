#ifndef _TYPENODE_H
#define _TYPENODE_H

#include "ast.h"
#include "standtypenode.h"

typedef struct typenode{
    Node node;
    StandTypeNode* standtypenode;
    int array_start;
    int array_end;
    struct typenode* type;
    
} TypeNode;

int TypeNode_visit(void*);

TypeNode* newTypeNode( int, int, StandTypeNode*, int, int, TypeNode*, int, int );

#endif
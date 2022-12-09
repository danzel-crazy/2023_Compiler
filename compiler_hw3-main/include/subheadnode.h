#ifndef _SUBHEADNODE_H
#define _SUBHEADNODE_H

#include "ast.h"
#include "standtypenode.h"
#include "argumentsnode.h"

typedef struct subheadnode{
    Node node;
    int type;   // 0: FUNCTION, 1: PROCEDURE
    char* id;
    StandTypeNode* standard_type;
    ArgumentsNode* arguments;

} SubHeadNode;

int SubHeadNode_visit(void*);

SubHeadNode* newSubHeadNode( int, int, int, char*, StandTypeNode*, ArgumentsNode*, int, int );

#endif
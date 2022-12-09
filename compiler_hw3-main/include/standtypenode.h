#ifndef _STANDTYPENODE_H
#define _STANDTYPENODE_H

#include "ast.h"

typedef struct standtypenode{
    Node node;
    int type; // 0: integer, 1: real, 2: string
} StandTypeNode;

int StandTypeNode_visit(void*);

StandTypeNode* newStandTypeNode( int, int, int, int, int );



#endif
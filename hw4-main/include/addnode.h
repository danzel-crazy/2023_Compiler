#ifndef _ADDNODE_H
#define _ADDNODE_H

#include "ast.h"

typedef struct addnode{
    Node node;
    int positive; 
    
} AddNode;

AddNode* newAddNode( int, int, int, int, int );

int AddNode_visit(void*);

#endif
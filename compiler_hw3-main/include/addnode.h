#ifndef _ADDNODE_H
#define _ADDNODE_H

#include "ast.h"

typedef struct addnode{
    Node node;
    int positive; 
    
} AddNode;

Node* newAddNode( int, int, int, int, int );

void* AddNode_visit(void*);

#endif
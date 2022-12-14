#ifndef _NUMNODE_H
#define _NUMNODE_H

#include "ast.h"

typedef struct numnode{
    Node node;
    int type;
    double num;
    double exp;

} NumNode;

NumNode* newNumNode( int, int, int, double, char*, int, int );

int NumNode_visit(void*);

#endif
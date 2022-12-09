#ifndef _PROGNODE_H
#define _PROGNODE_H

#include "ast.h"
#include "identlistnode.h"
#include "declarnode.h"
#include "subdeclarnode.h"
#include "compoundstatementnode.h"


void* ProgNode_visit();

typedef struct prognode{
    Node node;
    char* id;
    IdentListNode* identlist;
    DeclarNode* declar;
    SubDeclarSNode* subdeclar;
    CompoundStatementNode* compoundstatement;

} ProgNode;

ProgNode* newProgNode( int firstLine, int firstColumn, char* id, IdentListNode* identlist, DeclarNode* declars, SubDeclarSNode* subdeclars, CompoundStatementNode* compoundstatement, int lastLine, int lastColumn );

#endif
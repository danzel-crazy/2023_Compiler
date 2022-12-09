#ifndef _OPTIONALSTATEMENTSNODE_H
#define _OPTIONALSTATEMENTSNODE_H

#include "ast.h"
#include "statementnode_1.h"

typedef struct statementlistnode StatementlistNode;

typedef struct optionalstatementsnode{
    Node node;
    StatementlistNode* statementlistnode;

} OptionalStatementSNode;

Node* newOptionalStatementSNode( int, int, StatementlistNode*, int, int );

void* OptionalStatementSNode_visit(void*);

typedef struct optionalvarnode{
    Node node;
    
} OptionalVarNode;

void* OptionalVarNode_visit(void*);

Node* newOptionalVarNode( int, int );

#endif
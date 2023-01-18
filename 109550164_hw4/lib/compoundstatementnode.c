#include "compoundstatementnode.h"
#include "list.h"
#include <ast_gen.h>

extern list* listRoot;
extern int scope;

CompoundStatementNode* newCompoundStatementNode( int firstLine, int firstColumn, OptionalStatementSNode* optionalstatementsnode, int lastLine, int lastColumn ){
    CompoundStatementNode* temp = (CompoundStatementNode*) malloc ( sizeof(CompoundStatementNode) );
    temp->statements = optionalstatementsnode;
    temp->node.type = _CompoundStatementNode;
    temp->node.visit = CompoundStatementNode_visit;
    temp->node.loc.first_line = firstLine;
    temp->node.loc.first_column = firstColumn;
    temp->node.loc.last_line = lastLine;
    temp->node.loc.last_column = lastColumn;

    return temp;
}

int CompoundStatementNode_visit(void* node){
    CompoundStatementNode* temp = (CompoundStatementNode*) node;
    // printf("%d: %d CompoundStatementNode\n", temp->node.loc.first_line, temp->node.loc.first_column);
    // PBEGIN_gen();
    if (temp->statements != NULL)
        temp->statements->node.visit(temp->statements);
    
    // END_gen();
    return 0;
}
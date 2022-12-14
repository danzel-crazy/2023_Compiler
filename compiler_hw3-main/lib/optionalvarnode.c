#include "optionalvarnode.h"
#include <stdlib.h>

int OptionalVarNode_visit(void* node){
    
    return 0;
}

OptionalVarNode* newOptionalVarNode( int firstLine, int firstColumn ){
    OptionalVarNode* temp = (OptionalVarNode*) malloc ( sizeof(OptionalVarNode) );
    temp->node.type = _OptionalVarNode;
    temp->node.visit = OptionalVarNode_visit;
    temp->node.loc.first_line = firstLine;
    temp->node.loc.first_column = firstColumn;
    temp->node.loc.last_line = firstLine;
    temp->node.loc.last_column = firstColumn;

    return temp;
}
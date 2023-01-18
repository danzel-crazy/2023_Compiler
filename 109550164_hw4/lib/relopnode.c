#include "relopnode.h"
#include <stdlib.h>
#include <ast_gen.h>

RelopNode* newRelopNode( int firstLine, int firstColumn, int type, int lastLine, int lastColumn ){
    RelopNode* temp = (RelopNode*) malloc ( sizeof(RelopNode) );
    temp->type = type;
    temp->node.type = _RelopNode;
    temp->node.visit = RelopNode_visit;
    temp->node.loc.first_line = firstLine;
    temp->node.loc.first_column = firstColumn;
    temp->node.loc.last_line = lastLine;
    temp->node.loc.last_column = lastColumn;

    return temp;
}

int RelopNode_visit(void* node){
    RelopNode* temp = (RelopNode*) node;
    if_c(temp->type);
    return temp->type;
}

#include <stdlib.h>
#include <ast_gen.h>
#include "subdeclarnode.h"

SubDeclarSNode* newSubDeclarSNode( int firstLine, int firstColumn, SubDeclarSNode* prevnode, SubDeclarNode* nextnode, int lastLine, int lastColumn ){
    SubDeclarSNode* temp = (SubDeclarSNode*) malloc ( sizeof(SubDeclarSNode) );
    temp->PrevNode = prevnode;
    temp->NextNode = nextnode;
    temp->node.type = _SubDeclarSNode;
    temp->node.visit = SubDeclarSNode_visit;
    temp->node.loc.first_line = firstLine;
    temp->node.loc.first_column = firstColumn;
    temp->node.loc.last_line = lastLine;
    temp->node.loc.last_column = lastLine;

    return temp;
}

int SubDeclarSNode_visit(void* node){
    SubDeclarSNode* temp = (SubDeclarSNode*) node;
    
    func_in();
    if(temp->PrevNode != NULL){
        temp->PrevNode->node.visit(temp->PrevNode);
    }
    
    temp->NextNode->node.visit(temp->NextNode);
    func_end();
    return 0;
}

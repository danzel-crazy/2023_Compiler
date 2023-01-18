#include <stdio.h>

#include "simpleexpnode.h"
#include "list.h"
#include <ast_gen.h>

SimpleExpNode* newSimpleExpNode( int firstLine, int firstColumn, SimpleExpNode* simpleexpnode, AddNode* addnode, TermNode* termnode, int lastLine, int lastColumn ){
    SimpleExpNode* temp = (SimpleExpNode*) malloc ( sizeof(SimpleExpNode) );
    temp->termnode = termnode;
    temp->simpleexpnode = simpleexpnode;
    temp->addnode = addnode;
    temp->node.type = _SimpleExpNode;
    temp->node.visit = SimpleExpNode_visit;
    temp->node.loc.first_line = firstLine;
    temp->node.loc.first_column = firstColumn;
    temp->node.loc.last_line = lastLine;
    temp->node.loc.last_column = lastColumn;

    return temp;
}

int SimpleExpNode_visit(void* node){
    SimpleExpNode* temp = (SimpleExpNode*) node;

    // debug
    // fprintf(stderr, "%d: %d has an Node\n", temp->node.loc.first_line, temp->node.loc.first_column);
    int temp1, temp2; 
    int datatype = -1;

    if ( temp->addnode != 0 ){
        addnode_check();
        temp1 = (int)temp->simpleexpnode->node.visit(temp->simpleexpnode);
        int positive = temp->addnode->node.visit(temp->addnode);
        temp2 = (int)temp->termnode->node.visit(temp->termnode);
        
        // debug
        // fprintf(stderr, "test: %d %d\n", (int)temp1, (int)temp2);

        if ( ((int)temp1 >= 0) && ((int)temp2 >= 0) && ((int)temp1 != temp2) ){
            if (temp->addnode->positive)
                fprintf(stderr, ARITH_TYPE, temp->addnode->node.loc.first_line, temp->addnode->node.loc.first_column, "+");
            else
                fprintf(stderr, ARITH_TYPE, temp->addnode->node.loc.first_line, temp->addnode->node.loc.first_column, "-");
            
        }
        if ( ((int)temp1 >= 0) && ((int)temp2 >= 0) && ((int)temp1 == temp2) ){
            datatype = (int)temp1;
            addnode_gen(positive, datatype);
            return datatype;
        }
            
    }else{
        // factor_gen_string();
        return temp->termnode->node.visit(temp->termnode);
    }
    return datatype;
}
#include <stdio.h>

#include "factornode.h"
#include "list.h"
#include <ast_gen.h>

extern list* listRoot;
extern int scope;

int checkArguments(ExpListNode* listNode, symbolobj** curr, int num){
    if (listNode->explistnode != 0){
        if (checkArguments(listNode->explistnode, curr, num+1))
            return 1;
    }

    if ( ((passinobj*)*curr)->data->type == (int)listNode->expnode->node.visit(listNode->expnode) ){
        if (((passinobj*)*curr) != 0)
            *curr = ((passinobj*)*curr)->next;
        else
            return 1;
        if ( (num == 0) && ( ((passinobj*)*curr) != 0) )
            return 1;

        return 0;
    }

    return 1;
}

FactorNode* newFactorNode( int firstLine, int firstColumn, int type, char* id, TailNode* tailnode, ExpListNode* explistnode, NumNode* numnode, ExpNode* expnode, FactorNode* factornode, int lastLine, int lastColumn ){
    FactorNode* temp = (FactorNode*) malloc ( sizeof(FactorNode) );
    temp->type = type;
    temp->id = id;
    temp->tailnode = tailnode;
    temp->explistnode = explistnode;
    temp->num = numnode;
    temp->expnode = expnode;
    temp->factornode = factornode;
    temp->node.type = _FactorNode;
    temp->node.visit = FactorNode_visit;
    temp->node.loc.first_line = firstLine;
    temp->node.loc.first_column = firstColumn;
    temp->node.loc.last_line = lastLine;
    temp->node.loc.last_column = lastColumn;

    return temp;
}

int FactorNode_visit(void* node){
    FactorNode* temp = (FactorNode*)node;

    // debug
    // fprintf(stderr, "%d: %d has an FactorNode\n", temp->node.loc.first_line, temp->node.loc.first_column);
    
    int datatype = -1;
    list* listTemp = NULL;
    symbolobj* currTemp = NULL;

    switch (temp->type)
    {
    case 0:
        // IDENTIFIER tail
        
        if ( GetList( listRoot, &listTemp, temp->id ) ){
            currTemp = listTemp->data;
            datatype = currTemp->type;
        }else{
            fprintf(stderr, UNDEC_VAR, temp->node.loc.first_line, temp->node.loc.first_column, temp->id );
        }
        // factor_tail_gen(temp->id);
        factor_gen_global(temp->id);
        TailNode* curr = temp->tailnode;
        if (listTemp != 0)
            while (curr != 0){
                curr = curr->tailnode;
                if (currTemp->type == Array){
                    currTemp = ((arraysymbolobj*)currTemp)->data;
                }else{
                    fprintf(stderr, INDEX_MANY, temp->node.loc.first_line, temp->node.loc.first_column, temp->id);
                    break;
                }
                datatype = currTemp->type;
            }

        if (temp->tailnode != 0){

            // debug
            // fprintf(stderr, "%d: %d has an Node\n", temp->tailnode->node.loc.first_line, temp->tailnode->node.loc.first_column);
            
            array_in();
            // arr_assign_gen();
            array_in_assign_in();
            factor_gen_func(temp->id);
            temp->tailnode->node.visit(temp->tailnode);
            // array_in_assign_out();
            func_array_end();
            array_out();
        }
        find_func(temp->id, 0);
        return datatype;
        break;

    case 1:
        // IDENTIFIER LPAREN expression_list RPAREN
        
        if ( GetList( listRoot, &listTemp, temp->id ) ){
            currTemp = listTemp->data;
            while (currTemp->type == Array){
                currTemp = ((arraysymbolobj*)currTemp)->data;
            }
            datatype = currTemp->type;
        }else{
            fprintf(stderr, UNDEC_FUN, temp->node.loc.first_line, temp->node.loc.first_column, temp->id );
        }

        if (temp->explistnode != 0)
        {
            temp->explistnode->node.visit(temp->explistnode);
        }
        find_func(temp->id, 1);
        if (listTemp != 0){
            // check arguments
            symbolobj* tempnode = ((funcsymbolobj*)listTemp->data)->passInType;
            if ( checkArguments( temp->explistnode, &tempnode, 0 ) )
                fprintf(stderr, WRONG_ARGS, temp->node.loc.first_line, temp->node.loc.first_column, temp->id);
            
        }
        
        return datatype;
        break; 

    case 2:
        // num

        // debug
        // fprintf(stderr, "test: %d\n", temp->num->node.visit(temp->num));
        
        return temp->num->node.visit(temp->num);
        break;
    
    case 3:
        // LITERALSTR
        // factor_gen_id(temp->id);
        factor_num_gen_string(temp->id);
        factor_num_gen_id(temp->id);
        return 3;
        break;

    case 4:
        // LPAREN expression RPAREN

        if (temp->expnode != 0)
            return temp->expnode->node.visit(temp->expnode);
        break;

    case 5:
        // NOT factor

        if (temp->factornode != 0)
            temp->factornode->node.visit(temp->factornode);
        factor_not_gen();
        break;

    case 6:
        // SUBOP factor

        if (temp->factornode != 0)
            temp->factornode->node.visit(temp->factornode);
        factor_neg_gen();
        break;
    
    default:
        break;
    }

    return -1;
}

#ifndef AST_GEN_H
#define AST_GEN_H

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <stdint.h>
// #include <unistd.h>
#include "loc.h"
#include "ast.h"
#include <list.h>
// #include "error.h"
#include "addnode.h"
#include "argumentsnode.h"
#include "boolexpnode.h"
#include "compoundstatementnode.h"
#include "declarnode.h"
// #include "explistnode.h"
// #include "expnode.h"
#include "expnode_1.h"
#include "factornode.h"
#include "identlistnode.h"
#include "mulnode.h"
// #include "optionalstatementsnode.h"
// #include "optionalvarnode.h"
#include "optionalnode_1.h"
#include "parameterlistnode.h"
#include "procedstatementnode.h"
#include "prognode.h"
#include "relopnode.h"
#include "simpleexpnode.h"
#include "standtypenode.h"
// #include "statementlistnode.h"
// #include "statementnode.h"
#include "statementnode_1.h"
// #include "subdeclarnode.h"
// #include "subheadnode.h"
#include "subnode_1.h"
#include "tailnode.h"
#include "termnode.h"
#include "typenode.h"
#include "varnode.h"
#include "numnode.h"

void CodeGen(ProgNode* root);
void Genclose();
void find_func(char* str, int type);
void func_gen_init(list* root, int index);
void prognode_gen(char* id);
void declar_gen_real(char* id);
void declar_gen_int(char* id);
void declar_gen_string(char* id);
void declar_gen_array(list* arr, int type);
void genBuiltins();
void PBEGIN_gen();
void END_gen();
void procdeure_id_gen(char* id);
void num_gen_int(int num);
void num_gen_real(double num);
void factor_gen_global(char *str);
void factor_gen_id(char *str);
// void factor_tail_gen(char *str);
void factor_num_gen_string(char* str);
// void factor_num_gen_id(char* str, int type);
void factor_gen_string();
void factor_num_gen_id(char* str);

void factor_not_gen();
void factor_neg_gen();
void addnode_check();
void addnode_gen(int pos, int type);
void mulnode_gen(int pos, int type);
void relopnode_gen(int pos, int type);
void array_in();
void array_out();
void func_array_end();
void array_gen_add(char* str);
void variable_gen(char* str);
void if_c(int type);
void if_gen();
void if_else_gen();
void if_then_gen();
void while_gen();
void while_jump_gen();
void while_end_gen();
void cur_gen_real(char* id);
void cur_gen_int(char* id);
void cur_gen_string(char* id);
void arr_assign_in();
void arr_assign_out();
void arr_assign_gen();
void func_gen_list(list* root);
void func_gen();
void func_end();
void func_in();
void func_out();

#endif
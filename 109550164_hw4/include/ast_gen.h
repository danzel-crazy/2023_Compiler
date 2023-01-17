#ifndef AST_GEN_H
#define AST_GEN_H

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <stdint.h>
// #include <unistd.h>
#include "loc.h"
#include "ast.h"
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
void prognode_gen(char* id);
void declar_gen_real(char* id);
void declar_gen_int(char* id);
void declar_gen_string(char* id);
void genBuiltins();
void PBEGIN_gen();
void END_gen();
void procdeure_id_gen(char* id);
void num_gen_int(int num);
void num_gen_real(double num);
void factor_num_gen_string(char* str);
void factor_gen_string();
void factor_num_gen_id(char* str);
void addnode_gen(int pos, int type);
void mulnode_gen(int pos, int type);
void relopnode_gen(int pos, int type);

#endif
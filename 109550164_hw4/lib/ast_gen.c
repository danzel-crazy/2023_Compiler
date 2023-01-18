#include <ast_gen.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <stdint.h>
#include <list.h>
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

#define gen(fmt, ...) fprintf(fd, fmt)
#define BOOL int
#define TRUE 1
#define FALSE 0

FILE *fd;
char *prog;
extern char *output;
char* arr[100];
char label[100];
int arr_index = 0;
int relop_index = 1;
char* fac_str[100];
int fac_str_index = 0;

//var
char* cur[100];
char cur_label[100];
int cur_index = 0;

//list
list* func[100];
int func_index = 0;
BOOL func_check = FALSE;

// array
list* array[100];
int array_label[100];
int array_index = 0;
BOOL array_check = FALSE;

//add
BOOL add_check = FALSE;

//if
BOOL if_check = FALSE;

void CodeGen(ProgNode* root){
    
    char fn[128];
    // ProgNode* temp = (ProgNode*)root;
    prog = root->id;
    // Output format *.j
    sprintf(fn, "%s.j", root->id);
    fd = fopen(output ? output : fn, "w"); 
    // root->visit(root);
    // fprintf(fd, "Illegal option:-%c\n", isprint(optopt)?optopt:'#');
    /* gen("..."); // Generate your assembly... */
    // genBuiltins();
    // fclose(fd);
}

void Genclose()
{
    fclose(fd);
}

void genBuiltins(){
  gen(
      ".method public static writelnI(I)V\n"
      ".limit locals 5\n"
      ".limit stack 5\n"
      "    getstatic java/lang/System/out Ljava/io/PrintStream;\n"
      "    iload 0\n"
      "    invokevirtual java/io/PrintStream/println(I)V\n"
      "    return\n"
      ".end method\n"
      "\n"
      ".method public static writelnR(F)V\n"
      "    .limit locals 5\n"
      "    .limit stack 5\n"
      "    getstatic java/lang/System/out Ljava/io/PrintStream;\n"
      "    fload 0\n"
      "    invokevirtual java/io/PrintStream/println(F)V\n"
      "    return\n"
      ".end method\n"
      "\n"
      ".method public static writelnS(Ljava/lang/String;)V\n"
      "    .limit locals 5\n"
      "    .limit stack 5\n"
      "    getstatic java/lang/System/out Ljava/io/PrintStream;\n"
      "    aload 0\n"
      "    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V\n"
      "    return\n"
      ".end method\n"
      "\n"
      ".method public static readlnI()I\n"
      "    .limit locals 10\n"
      "    .limit stack 10\n"
      "    ldc 0\n"
      "    istore 1\n"
      "LAB1:\n"
      "    getstatic java/lang/System/in Ljava/io/InputStream;\n"
      "    invokevirtual java/io/InputStream/read()I\n"
      "    istore 2\n"
      "    iload 2\n"
      "    ldc 10\n"
      "    isub\n"
      "    ifeq LAB2\n"
      "    iload 2\n"
      "    ldc 32\n"
      "    isub\n"
      "    ifeq LAB2\n"
      "    iload 2\n"
      "    ldc 48\n"
      "    isub\n"
      "    ldc 10\n"
      "    iload 1\n"
      "    imul\n"
      "    iadd\n"
      "    istore 1\n"
      "    goto LAB1\n"
      "LAB2:\n"
      "    iload 1\n"
      "    ireturn\n"
      ".end method\n");
}

//prognode
void prognode_gen(char* id)
{
    fprintf(fd, ".class public %s\n",id);
    fprintf(fd, ".super java/lang/Object\n");
}

//declarnode
void declar_gen_real(char* id)
{
    arr[arr_index] = id;
    label[arr_index] = 'F';
    arr_index+=1;
    fprintf(fd, ".field public static %s F\n",id);
}

void declar_gen_int(char* id)
{
    arr[arr_index] = id;
    label[arr_index] = 'I';
    arr_index+=1;
    fprintf(fd, ".field public static %s I\n",id);
}

void declar_gen_string(char* id)
{
    arr[arr_index] = id;
    label[arr_index] = 'S';
    arr_index+=1;
    fprintf(fd, ".field public static %s Ljava/lang/String;\n",id);
}

void declar_gen_array(list* arr, int type)
{
    array[array_index] = arr;
    array_label[arr_index] = type;
    array_index += 1;
    symbolobj* temp = arr->data;
    temp = ((arraysymbolobj*)temp)->data;
    // fprintf(fd, "%d\n",temp->type);
    switch (type)
    {
    case 0:
        if (temp->type == Array)
            fprintf(fd, ".field public static %s [[I\n",arr->id);
        else 
            fprintf(fd, ".field public static %s [I\n",arr->id);
        break;
    case 1:
        if (temp->type == Array)
            fprintf(fd, ".field public static %s [[F\n",arr->id);
        else 
            fprintf(fd, ".field public static %s [F\n",arr->id);
        break;
    case 2:
        if (temp->type == Array)
            fprintf(fd, ".field public static %s [[Ljava/lang/String;\n",arr->id);
        else 
            fprintf(fd, ".field public static %s [Ljava/lang/String;\n",arr->id);
        break;
    }
}

//PBEGIN
void PBEGIN_gen()
{
    fprintf(fd, ".method public static main([Ljava/lang/String;)V\n");
    fprintf(fd, ".limit locals 50\n");
    fprintf(fd, ".limit stack 50\n");
    for (int i = 0; i < arr_index; i++){
        switch (label[i])
        {
        case 'F':
            fprintf(fd, "    ldc 0.0\n");
            fprintf(fd, "    putstatic %s/%s F\n",prog,arr[i]);
            break;
        case 'I':
            fprintf(fd, "    ldc 0\n");
            fprintf(fd, "    putstatic %s/%s I\n",prog,arr[i]);
            break;
        case 'S':
            fprintf(fd, "    ldc \"\"\n");
            fprintf(fd, "    putstatic %s/%s Ljava/lang/String;\n",prog,arr[i]);
            break;
        }
    }

    for (int i = 0; i < array_index; i++){
        symbolobj* temp = array[i]->data;
        symbolobj* temp_sceond = ((arraysymbolobj*)temp)->data;
        
        // fprintf(fd, "%d\n",temp->type);
        switch (array_label[i])
        {
        case 0:
            if (temp_sceond->type == Array)
            {
                fprintf(fd, "    ldc %d\n",((arraysymbolobj*)temp)->end);
                fprintf(fd, "    ldc %d\n",((arraysymbolobj*)temp_sceond)->end);
                fprintf(fd, "    multianewarray [[I 2\n");
                fprintf(fd, "    putstatic %s/%s [[I\n",prog,array[i]->id);
            }
            else
            {
                fprintf(fd, "    ldc %d\n",((arraysymbolobj*)temp)->end);
                fprintf(fd, "    multianewarray [I 1\n");
                fprintf(fd, "    putstatic %s/%s [I\n",prog,array[i]->id);
            }
            break;
        case 1:
            if (temp->type == Array)
            {
                fprintf(fd, "    ldc %d\n",((arraysymbolobj*)temp)->end);
                fprintf(fd, "    ldc %d\n",((arraysymbolobj*)temp_sceond)->end);
                fprintf(fd, "    multianewarray [[F 2\n");
                fprintf(fd, "    putstatic %s/%s [[F\n",prog,array[i]->id);
            }
            else
            {
                fprintf(fd, "    ldc %d\n",((arraysymbolobj*)temp)->end);
                fprintf(fd, "    multianewarray [F 1\n");
                fprintf(fd, "    putstatic %s/%s [F\n",prog,array[i]->id);
            }
            break;
        case 2:
            if (temp->type == Array)
            {
                fprintf(fd, "    ldc %d\n",((arraysymbolobj*)temp)->end);
                fprintf(fd, "    ldc %d\n",((arraysymbolobj*)temp_sceond)->end);
                fprintf(fd, "    multianewarray [[Ljava/lang/String; 2\n");
                fprintf(fd, "    putstatic %s/%s [[Ljava/lang/String;\n",prog,array[i]->id);
            }
            else
            {
                fprintf(fd, "    ldc %d\n",((arraysymbolobj*)temp)->end);
                fprintf(fd, "    multianewarray [Ljava/lang/String; 1\n");
                fprintf(fd, "    putstatic %s/%s [Ljava/lang/String;\n",prog,array[i]->id);
            }
            break;
        }
    }
}

//END
void END_gen()
{
    fprintf(fd, "    return\n");
    fprintf(fd, ".end method\n");
}

//procdeure_id
void find_func(char* str, int type)
{
    // fprintf(fd, "    %d\n",type);
    for(int i = 0; i < func_index; i++){
        int ch = strcmp(func[i]->id, str);
        if (ch == 0) {
            func_gen_init(func[i],i); 
            return;
        }
    }
}

void func_gen_init(list* root, int index)
{
    symbolobj* temp = root->data;
        char* pass;
        passinobj* tempPassInType = (passinobj*)((funcsymbolobj*)temp)->passInType;
        if(tempPassInType == NULL)
        {
             pass = "";
        }
        else{
            switch (tempPassInType->data->type)
                {
                    case Int:
                        //int
                        pass = "I";
                        break;
                    case Real:
                        //real
                        pass = "F";
                        break;
                    case String:
                        //str
                        pass = "Ljava/lang/String;";
                        break;
                    default:
                        break;
                }
        }
        
        switch (temp->type)
        {
        case Int:
            //int
            fprintf(fd, "    invokestatic %s/%s_%d(%s)I\n",prog,root->id,index,pass);
            break;
        case Real:
            //real
            fprintf(fd, "    invokestatic %s/%s_%d(%s)F\n",prog,root->id,index,pass);
            /* code */
            break;
        case String:
            //str
            fprintf(fd, "    invokestatic %s/%s_%d(%s)Ljava/lang/String;\n",prog,root->id,index,pass);
            /* code */
            break;
        default:
            break;
        }
}

void procdeure_id_gen(char* id)
{
    // fprintf(fd, "invokestatic %s/%sV\n",prog,id);
    if (!(strcmp(id, "writelnI")))
        fprintf(fd, "    invokestatic %s/writelnI(I)V\n",prog);
    else if(!(strcmp(id, "writelnR")))
        fprintf(fd, "    invokestatic %s/writelnR(F)V\n",prog);
    else if(!(strcmp(id, "writelnS")))
        fprintf(fd, "    invokestatic %s/writelnS(Ljava/lang/String;)V\n",prog);
}

//numnode
void num_gen_int(int num)
{
    fprintf(fd, "    ldc %d\n",num);
}

void num_gen_real(double num)
{
    fprintf(fd, "    ldc %f\n",num);
}

void factor_gen_id(char *str)
{
    fprintf(fd, "    ldc %s\n",str);
}

// void factor_tail_gen(char *str)
// {
//     fprintf(fd, "    invokestatic %s/%s()I\n",prog,str);
// }

// factor node
void factor_gen_global(char *str)
{
    if(arr_index != 0){
        for (int i = 0; i < arr_index; i++){
            int ch = strcmp(arr[i], str);
            if (ch == 0) {
                switch (label[i])
                {
                case 'F':
                    fprintf(fd, "    getstatic %s/%s F\n",prog,arr[i]);
                    break;
                case 'I':
                    fprintf(fd, "    getstatic %s/%s I\n",prog,arr[i]);
                    break;
                case 'S':
                    fprintf(fd, "    getstatic %s/%s Ljava/lang/String;\n",prog,arr[i]);
                    break;
                }
                
                return;
            }
        }
    }

    // if(array_index != 0){
    //     for (int i = 0; i < array_index; i++){
    //         int ch = strcmp(array[i]->id, str);
    //         if (ch == 0) {
    //             symbolobj* temp = array[i]->data;
    //             symbolobj* temp_sceond = ((arraysymbolobj*)temp)->data;
                
    //             // fprintf(fd, "%d\n",temp->type);
    //             switch (array_label[i])
    //             {
    //                 case 0:
    //                     if (temp_sceond->type == Array)
    //                     {
    //                         fprintf(fd, "    getstatic %s/%s [[I\n",prog,array[i]->id);
    //                     }
    //                     else
    //                     {
    //                         fprintf(fd, "    getstatic %s/%s [I\n",prog,array[i]->id);
    //                     }
    //                     break;
    //                 case 1:
    //                     if (temp->type == Array)
    //                     {
    //                         fprintf(fd, "    getstatic %s/%s [[F\n",prog,array[i]->id);
    //                     }
    //                     else
    //                     {
    //                         fprintf(fd, "    getstatic %s/%s [F\n",prog,array[i]->id);
    //                     }
    //                     break;
    //                 case 2:
    //                     if (temp->type == Array)
    //                     {
    //                         fprintf(fd, "    getstatic %s/%s [[Ljava/lang/String;\n",prog,array[i]->id);
    //                     }
    //                     else
    //                     {
    //                         fprintf(fd, "    getstatic %s/%s [Ljava/lang/String;\n",prog,array[i]->id);
    //                     }
    //                     break;
    //                 }    
    //                 return;
    //         }
    //     }
    // }

    if (!func_check)
    {
        if(func_index != 0)
        {
            for(int i = 0; i < func_index; i++){
                int ch = strcmp(func[i]->id, str);
                if (ch == 0) {
                    // func_gen_init(func[i],i); 
                    return;
                }
        }
        }
        fprintf(fd, "    invokestatic %s/%s()I\n",prog,str);
    }
    
}

void factor_num_gen_id(char* str)
{
    if (!add_check)
        fprintf(fd, "    ldc %s\n",str);
    // fprintf(fd, "    invokestatic %s/%s()I\n",prog,str);
}

void factor_num_gen_string(char* str)
{
    fac_str[fac_str_index] = str;
    fac_str_index += 1;
    // fprintf(fd, "    ldc %s\n",str);
}

void factor_gen_string()
{
    // fprintf(fd, "    ldc %s\n",fac_str[fac_str_index-1]);
}

void factor_not_gen(){
    fprintf(fd, "    ldc 1\n");
    fprintf(fd, "    ifne L%d\n",relop_index);
    fprintf(fd, "    ldc 1\n");
    fprintf(fd, "    goto L%d\n",relop_index+1);
    fprintf(fd, "L%d:\n",relop_index);
    fprintf(fd, "    ldc 0\n");
    relop_index += 1;
    fprintf(fd, "L%d:\n",relop_index);
}

void factor_neg_gen()
{
    fprintf(fd, "    fneg\n");
}
//addnode
void addnode_check()
{
    add_check = TRUE;
}
void addnode_gen(int pos, int type)
{
    // fprintf(fd, "    %d\n",type);
    if (type == 0)
    {
        if (pos) 
        {
            fprintf(fd, "    iadd\n");
        }
        else
        {
            fprintf(fd, "    isub\n");
        }
    }
    else if(type == 3 && add_check)
    {   
        fprintf(fd, "new java/lang/StringBuffer\n");
        fprintf(fd, "dup\n");
        fprintf(fd, "invokespecial java/lang/StringBuffer/<init>()V\n");
        fprintf(fd, "    ldc %s\n",fac_str[0]);
        fprintf(fd, "invokevirtual java/lang/StringBuffer/append(Ljava/lang/String;)Ljava/lang/StringBuffer;\n");
        fprintf(fd, "    ldc %s\n",fac_str[fac_str_index-1]);
        fprintf(fd, "invokevirtual java/lang/StringBuffer/append(Ljava/lang/String;)Ljava/lang/StringBuffer;\n");
        fprintf(fd, "invokevirtual java/lang/StringBuffer/toString()Ljava/lang/String;\n");
    }
    else
    {
        if (pos) 
        {
            fprintf(fd, "    fadd\n");
        }
        else
        {
            fprintf(fd, "    fsub\n");
        }
    }
}

//mulnode
void mulnode_gen(int pos, int type)
{
    // fprintf(fd, "    %d\n",type);
    if (type == 0)
    {
        if (pos) 
        {
            fprintf(fd, "    idiv\n");
        }
        else
        {
            fprintf(fd, "    imul\n");
        }
    }
    else
    {
        if (pos) 
        {
            fprintf(fd, "    fdiv\n");
        }
        else
        {
            fprintf(fd, "    fmul\n");
        }
    }
    
}

//relopnode
void relopnode_gen(int pos, int type)
{
    // fprintf(fd, "    %d\n",type);
    if (type == 2)
    {
        switch (pos)
        {
        case 0:
            fprintf(fd, "    fcmpg\n");
            fprintf(fd, "    ldc -1\n");
            fprintf(fd, "    if_icmpeq L%d\n",relop_index);
            fprintf(fd, "    ldc 0\n");
            fprintf(fd, "    goto L%d\n",relop_index+1);
            fprintf(fd, "L%d:\n",relop_index);
            fprintf(fd, "    ldc 1\n");
            relop_index += 1;
            fprintf(fd, "L%d:\n",relop_index);
            break;
        case 1:
            fprintf(fd, "    fcmpg\n");
            fprintf(fd, "    ldc 1\n");
            fprintf(fd, "    if_icmpeq L%d\n",relop_index);
            fprintf(fd, "    ldc 0\n");
            fprintf(fd, "    goto L%d\n",relop_index+1);
            fprintf(fd, "L%d:\n",relop_index);
            fprintf(fd, "    ldc 1\n");
            relop_index += 1;
            fprintf(fd, "L%d:\n",relop_index);
            break;
        case 2:
            fprintf(fd, "    fcmpg\n");
            fprintf(fd, "    ldc 0\n");
            fprintf(fd, "    if_icmpeq L%d\n",relop_index);
            fprintf(fd, "    ldc 0\n");
            fprintf(fd, "    goto L%d\n",relop_index+1);
            fprintf(fd, "L%d:\n",relop_index);
            fprintf(fd, "    ldc 1\n");
            relop_index += 1;
            fprintf(fd, "L%d:\n",relop_index);
            break;
        case 3:
            fprintf(fd, "    fcmpg\n");
            fprintf(fd, "    ldc -1\n");
            fprintf(fd, "    if_icmpgt L%d\n",relop_index);
            fprintf(fd, "    ldc 0\n");
            fprintf(fd, "    goto L%d\n",relop_index+1);
            fprintf(fd, "L%d:\n",relop_index);
            fprintf(fd, "    ldc 1\n");
            relop_index += 1;
            fprintf(fd, "L%d:\n",relop_index);
            break;
        case 4:
            fprintf(fd, "    fcmpg\n");
            fprintf(fd, "    ldc 1\n");
            fprintf(fd, "    if_icmplt L%d\n",relop_index);
            fprintf(fd, "    ldc 0\n");
            fprintf(fd, "    goto L%d\n",relop_index+1);
            fprintf(fd, "L%d:\n",relop_index);
            fprintf(fd, "    ldc 1\n");
            relop_index += 1;
            fprintf(fd, "L%d:\n",relop_index);
            break;
        case 5:
            fprintf(fd, "    fcmpg\n");
            fprintf(fd, "    ldc 0\n");
            fprintf(fd, "    if_icmpne L%d\n",relop_index);
            fprintf(fd, "    ldc 0\n");
            fprintf(fd, "    goto L%d\n",relop_index+1);
            fprintf(fd, "L%d:\n",relop_index);
            fprintf(fd, "    ldc 1\n");
            relop_index += 1;
            fprintf(fd, "L%d:\n",relop_index);
            break;
        }
    }
    else
    {
        switch (pos)
        {
        case 0:
            fprintf(fd, "    if_icmplt L%d\n",relop_index);
            fprintf(fd, "    ldc 0\n");
            fprintf(fd, "    goto L%d\n",relop_index+1);
            fprintf(fd, "L%d:\n",relop_index);
            fprintf(fd, "    ldc 1\n");
            relop_index += 1;
            fprintf(fd, "L%d:\n",relop_index);
            break;
        case 1:
            fprintf(fd, "    if_icmpgt L%d\n",relop_index);
            fprintf(fd, "    ldc 0\n");
            fprintf(fd, "    goto L%d\n",relop_index+1);
            fprintf(fd, "L%d:\n",relop_index);
            fprintf(fd, "    ldc 1\n");
            relop_index += 1;
            fprintf(fd, "L%d:\n",relop_index);
            break;
        case 2:
            fprintf(fd, "    if_icmpeq L%d\n",relop_index);
            fprintf(fd, "    ldc 0\n");
            fprintf(fd, "    goto L%d\n",relop_index+1);
            fprintf(fd, "L%d:\n",relop_index);
            fprintf(fd, "    ldc 1\n");
            relop_index += 1;
            fprintf(fd, "L%d:\n",relop_index);
            break;
        case 3:
            fprintf(fd, "    if_icmpge L%d\n",relop_index);
            fprintf(fd, "    ldc 0\n");
            fprintf(fd, "    goto L%d\n",relop_index+1);
            fprintf(fd, "L%d:\n",relop_index);
            fprintf(fd, "    ldc 1\n");
            relop_index += 1;
            fprintf(fd, "L%d:\n",relop_index);
            break;
        case 4:
            fprintf(fd, "    if_icmple L%d\n",relop_index);
            fprintf(fd, "    ldc 0\n");
            fprintf(fd, "    goto L%d\n",relop_index+1);
            fprintf(fd, "L%d:\n",relop_index);
            fprintf(fd, "    ldc 1\n");
            relop_index += 1;
            fprintf(fd, "L%d:\n",relop_index);
            break;
        case 5:
            fprintf(fd, "    if_icmpne L%d\n",relop_index);
            fprintf(fd, "    ldc 0\n");
            fprintf(fd, "    goto L%d\n",relop_index+1);
            fprintf(fd, "L%d:\n",relop_index);
            fprintf(fd, "    ldc 1\n");
            relop_index += 1;
            fprintf(fd, "L%d:\n",relop_index);
            break;
        }
    }
    
    relop_index += 1;
}

//variabale
void array_gen_add(char* str){
    fprintf(fd, "    %s\n",str);
    // if(array_index != 0){
    //     for (int i = 0; i < array_index; i++){
    //         int ch = strcmp(array[i]->id, str);
    //         if (ch == 0) {
    //             symbolobj* temp = array[i]->data;
    //             symbolobj* temp_sceond = ((arraysymbolobj*)temp)->data;
    //             switch (array_label[i])
    //             {
    //                 case 0:
    //                     if (temp_sceond->type == Array)
    //                     {
    //                         fprintf(fd, "    getstatic %s/%s [[I\n",prog,array[i]->id);
    //                     }
    //                     else
    //                     {
    //                         fprintf(fd, "    getstatic %s/%s [I\n",prog,array[i]->id);
    //                     }
    //                     break;
    //                 case 1:
    //                     if (temp->type == Array)
    //                     {
    //                         fprintf(fd, "    getstatic %s/%s [[F\n",prog,array[i]->id);
    //                     }
    //                     else
    //                     {
    //                         fprintf(fd, "    getstatic %s/%s [F\n",prog,array[i]->id);
    //                     }
    //                     break;
    //                 case 2:
    //                     if (temp->type == Array)
    //                     {
    //                         fprintf(fd, "    getstatic %s/%s [[Ljava/lang/String;\n",prog,array[i]->id);
    //                     }
    //                     else
    //                     {
    //                         fprintf(fd, "    getstatic %s/%s [Ljava/lang/String;\n",prog,array[i]->id);
    //                     }
    //                     break;
    //                 }    
    //             return;
    //         }
    //     }
    // }
}
void variable_gen_add(char* str, int type)
{   
    switch (type)
    {
        case 0:
            cur_gen_int(str);
            break;
        case 1:
            cur_gen_real(str);
            break;
        case 2:
            cur_gen_string(str);
            break;
        }
}

void cur_gen_real(char* id)
{
    cur[cur_index] = id;
    cur_label[cur_index] = 'F';
    cur_index+=1;
    // fprintf(fd, ".field public static %s F\n",id);
}

void cur_gen_int(char* id)
{
    cur[cur_index] = id;
    cur_label[cur_index] = 'I';
    cur_index+=1;
    // fprintf(fd, ".field public static %s I\n",id);
}

void cur_gen_string(char* id)
{
    cur[cur_index] = id;
    cur_label[cur_index] = 'S';
    cur_index+=1;
    // fprintf(fd, ".field public static %s Ljava/lang/String;\n",id);
}

//statement
void variable_gen(char* str)
{
    if (!func_check)
    {
        for (int i = 0; i <= cur_index; i++){
            if (!(strcmp(cur[i], str))) {
                switch (cur_label[i])
                {
                case 'F':
                    fprintf(fd, "    putstatic %s/%s F\n",prog,cur[i]);
                    break;
                case 'I':
                    fprintf(fd, "    putstatic %s/%s I\n",prog,cur[i]);
                    break;
                case 'S':
                    fprintf(fd, "    putstatic %s/%s Ljava/lang/String;\n",prog,cur[i]);
                    break;
                }
                return;
            }
        }
    }
}

void if_c(int type)
{
    if(type == 2) if_check = TRUE;
}
void if_gen(){
    if (if_check)
        fprintf(fd, "    ifeq L%d\n",relop_index);
    else 
        fprintf(fd, "    ifne L%d\n",relop_index);
    relop_index += 1;
}

void if_else_gen()
{
    fprintf(fd, "    goto L%d\n",relop_index);
    fprintf(fd, "L%d:\n",relop_index-1);
}

void if_then_gen()
{
    fprintf(fd, "L%d:\n",relop_index);
    relop_index += 1;
    if_check = FALSE;
}

void while_gen()
{
    fprintf(fd, "L%d:\n",relop_index);
    relop_index += 1;
}

void while_jump_gen()
{
    fprintf(fd, "    ifeq L%d\n",relop_index);
}
void while_end_gen()
{
    fprintf(fd, "    goto L%d\n",relop_index-3);
    fprintf(fd, "L%d:\n",relop_index);
    relop_index += 1;
}

void func_gen_list(list* root)
{
    func[func_index] = root;
    func_index += 1;
}

//componenet
void func_in()
{
    func_check = TRUE;
}

void func_out()
{
    func_check = FALSE;
}
void func_gen()
{   
    if (func_index != 0)
    {
        symbolobj* temp = func[func_index-1]->data;
        char* pass;
        passinobj* tempPassInType = (passinobj*)((funcsymbolobj*)temp)->passInType;
        if(tempPassInType == NULL)
        {
             pass = "";
        }
        else{
            switch (tempPassInType->data->type)
                {
                    case Int:
                        //int
                        pass = "I";
                        break;
                    case Real:
                        //real
                        pass = "F";
                        break;
                    case String:
                        //str
                        pass = "Ljava/lang/String;";
                        break;
                    default:
                        break;
                }
        }
        
        switch (temp->type)
        {
        case Int:
            //int
            fprintf(fd, ".method public static %s_%d(%s)I\n",func[func_index-1]->id,func_index-1,pass);
            break;
        case Real:
            //real
            fprintf(fd, ".method public static %s_%d(%s)F\n",func[func_index-1]->id,func_index-1,pass);
            /* code */
            break;
        case String:
            //str
            fprintf(fd, ".method public static %s_%d(%s)Ljava/lang/String;\n",func[func_index-1]->id,func_index-1,pass);
            /* code */
            break;
        default:
            break;
        }
        fprintf(fd, ".limit locals 50\n");
        fprintf(fd, ".limit stack 50\n");
    
        if(tempPassInType != NULL)
        {
            switch (tempPassInType->data->type)
            {
                case Int:
                    fprintf(fd, "    iload 0\n");
                    break;
                case Real:
                    // fprintf(fd, "    ldc 0.0\n    fstore 1\n");                
                    break;
                case String:
                    // fprintf(fd, "    ldc ""\n    istore 1\n");                
                    break;
                default:
                    break;
            }
        }
    }
}

void func_end()
{
    if (func_index != 0)
    {
        int t = func_index-1;
        symbolobj* temp = func[t]->data;
        switch (temp->type)
        {
        case Void:
            break;
        case Int:
            //int
            
            fprintf(fd, "    ireturn\n");
            fprintf(fd, "    ireturn\n");
            break;
        case Real:
            //real
            // fprintf(fd, ".method public static %s_%d(F)F\n",func[func_index-1]->id,func_index-1);
            /* code */
            break;
        case String:
            //str
            // fprintf(fd, ".method public static %s_%d(Ljava/lang/String;)Ljava/lang/String;\n",func[func_index-1]->id,func_index-1);
            /* code */
            break;
        default:
            break;
        }
    }
    fprintf(fd, ".end method\n");
}



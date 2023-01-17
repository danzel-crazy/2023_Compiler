/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_OBJ_PARSER_H_INCLUDED
# define YY_YY_OBJ_PARSER_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 77 "parser.y"

    #include "ast.h"
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

#line 83 "obj/parser.h"

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    PROGRAM = 258,
    VAR = 259,
    ARRAY = 260,
    OF = 261,
    INTEGER = 262,
    REAL = 263,
    STRING = 264,
    FUNCTION = 265,
    PROCEDURE = 266,
    PBEGIN = 267,
    END = 268,
    IF = 269,
    THEN = 270,
    ELSE = 271,
    WHILE = 272,
    DO = 273,
    NOT = 274,
    AND = 275,
    OR = 276,
    LPAREN = 277,
    RPAREN = 278,
    SEMICOLON = 279,
    DOT = 280,
    COMMA = 281,
    COLON = 282,
    LBRACE = 283,
    RBRACE = 284,
    DOTDOT = 285,
    ASSIGNMENT = 286,
    ADDOP = 287,
    SUBOP = 288,
    MULOP = 289,
    DIVOP = 290,
    LTOP = 291,
    GTOP = 292,
    EQOP = 293,
    GETOP = 294,
    LETOP = 295,
    NEQOP = 296,
    IDENTIFIER = 297,
    REALNUMBER = 298,
    INTEGERNUM = 299,
    SCIENTIFIC = 300,
    LITERALSTR = 301
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 112 "parser.y"

    int val;
    char* text;
    double dval;
    ProgNode* node;
    IdentListNode* identlist;
    DeclarNode* declar;
    SubDeclarSNode* subdeclar;
    CompoundStatementNode* compoundstatement;
    TypeNode* type;
    StandTypeNode* standtypenode;
    SubDeclarNode* nextnode;
    SubHeadNode* subheadnode;
    ArgumentsNode* arguments;
    ParameterListNode* parameterlist;
    OptionalVarNode* optionalvarnode;
    OptionalStatementSNode* optionalstatementsnode;
    StatementListNode* statementlistnode;
    StatementNode* statementnode;
    VarNode* varnode;
    TailNode* tailnode;
    ProcedStatementNode* procedstatementnode;
    ExpListNode* explistnode;
    ExpNode* expnode;
    BoolExpNode* boolexpnode;
    SimpleExpNode* simpleexpeode;
    RelopNode* relop;
    MulNode* mulnode;
    TermNode* termnode;
    FactorNode* factornode;
    AddNode* addnode;
    NumNode* numnode;

#line 175 "obj/parser.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;
int yyparse (void);

#endif /* !YY_YY_OBJ_PARSER_H_INCLUDED  */

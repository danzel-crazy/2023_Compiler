%{
/*
 * scanner.l
 *
 * lex input file for pascal scanner
 *
 */

#include <stdio.h>
#include <string.h>
// #include "ast.h"
#include "parser.h"
#include "node.h"

struct nodeType* newTokenNode(int tokenType);

int fileno(FILE *);

#define YY_USER_ACTION \
    yylloc.first_line = line_no; \
    yylloc.first_column = col_no; \
    col_no += yyleng;

#define MAX_LINE_LENG      256
#define LIST       strcat(buffer, yytext)
#define LIST_FLUSH do{ if(opt_list) printf("%s", buffer); *buffer = 0; }while(0)
#define LOG(TYPE) \
    do{ LIST; \
        if(opt_token) \
        fprintf(stderr, "token(type:%-10s) on line %4d, %3d : %s\n", \
            #TYPE, line_no, col_no - yyleng, yytext); \
    } while(0)

#ifdef __cplusplus
extern "C" int yylex(void);
#endif

int opt_list = 1, opt_token = 0;
int line_no = 1, col_no = 1;
char buffer[MAX_LINE_LENG];

%}
%x comment
%x pragma

%option nounput
%option noinput
token_on "#pragma token on" 
token_off "#pragma token off"
list_on  "#pragma list on"
list_off "#pragma list off"
A [aA]
B [bB]
C [cC]
D [dD]
E [eE]
F [fF]
G [gG]
H [hH]
I [iI]
J [jJ]
K [kK]
L [lL]
M [mM]
N [nN]
O [oO]
P [pP]
Q [qQ]
R [rR]
S [sS]
T [tT]
U [uU]
V [vV]
W [wW]
X [xX]
Y [yY]
Z [zZ]

%%
                             /* v could do something */

{P}{R}{O}{G}{R}{A}{M}       {yylval.node = newTokenNode(NODE_PROGRAM);yylval.node->lineno=line_no; return(PROGRAM);    }
{V}{A}{R}                   {yylval.node = newTokenNode(NODE_VAR);return(VAR);}
{A}{R}{R}{A}{Y}             {yylval.node = newTokenNode(NODE_ARRAY);yylval.node->lineno=line_no; return(ARRAY);}
{O}{F}                      {yylval.node = newTokenNode(NODE_OF);return(OF);}
{I}{N}{T}{E}{G}{E}{R}       {yylval.node = newTokenNode(NODE_INTEGER);yylval.node->lineno=line_no; return(INTEGER);    }
{R}{E}{A}{L}                {yylval.node = newTokenNode(NODE_REAL);yylval.node->lineno=line_no; return(REAL);       }
{S}{T}{R}{I}{N}{G}          {yylval.node = newTokenNode(NODE_STRING);yylval.node->lineno=line_no;return(STRING);     }
{F}{U}{N}{C}{T}{I}{O}{N}    {yylval.node = newTokenNode(NODE_FUNCTION);yylval.node->lineno=line_no; return(FUNCTION);   }
{P}{R}{O}{C}{E}{D}{U}{R}{E} {yylval.node = newTokenNode(NODE_PROCEDURE);yylval.node->lineno=line_no;return(PROCEDURE);  }
{B}{E}{G}{I}{N}             {yylval.node = newTokenNode(NODE_PBEGIN); return(PBEGIN);     }
{E}{N}{D}                   {yylval.node = newTokenNode(NODE_END);yylval.node->lineno=line_no; return(END);        }
{I}{F}                      {yylval.node = newTokenNode(NODE_IF); return(IF);         }
{T}{H}{E}{N}                {yylval.node = newTokenNode(NODE_THEN); return(THEN);       }
{E}{L}{S}{E}                {yylval.node = newTokenNode(NODE_ELSE); return(ELSE);       }
{W}{H}{I}{L}{E}             {yylval.node = newTokenNode(NODE_WHILE);return(WHILE);      }
{D}{O}                      {yylval.node = newTokenNode(NODE_DO); return(DO);         }
{N}{O}{T}                   {yylval.node = newTokenNode(NODE_NOT); return(NOT);        }
{A}{N}{D}                   {yylval.node = newTokenNode(NODE_AND); return(AND);        }
{O}{R}                      {yylval.node = newTokenNode(NODE_OR); return(OR);         }

"("                         {yylval.node = newTokenNode(NODE_LPAREN); return(LPAREN);     }
")"                         {yylval.node = newTokenNode(NODE_RPAREN); return(RPAREN);     }
";"                         {yylval.node = newTokenNode(NODE_SEMICOLON); return(SEMICOLON);  }
"."                         {yylval.node = newTokenNode(NODE_DOT); return(DOT);        }
","                         {yylval.node = newTokenNode(NODE_COMMA); return(COMMA);      }
":"                         {yylval.node = newTokenNode(NODE_COLON); return(COLON);      }
"["                         {yylval.node = newTokenNode(NODE_LBRACE); return(LBRACE);     }
"]"                         {yylval.node = newTokenNode(NODE_RBRACE); return(RBRACE);     }
".."                        {yylval.node = newTokenNode(NODE_DOTDOT); return(DOTDOT);     }
":="                        {yylval.node = newTokenNode(NODE_ASSIGNMENT); return(ASSIGNMENT); }
"+"                         {yylval.node = newTokenNode(NODE_ADDOP);yylval.node->lineno=line_no;yylval.node->op = NODE_ADDOP; return(ADDOP);      }
"-"                         {yylval.node = newTokenNode(NODE_SUBOP);yylval.node->lineno=line_no;yylval.node->op = NODE_SUBOP; return(SUBOP);      }
"*"                         {yylval.node = newTokenNode(NODE_MULOP);yylval.node->lineno=line_no;yylval.node->op = NODE_MULOP; return(MULOP);      }
"/"                         {yylval.node = newTokenNode(NODE_DIVOP);yylval.node->lineno=line_no;yylval.node->op = NODE_DIVOP; return(DIVOP);      }
">"                         {yylval.node = newTokenNode(NODE_GTOP);yylval.node->lineno=line_no;yylval.node->op = NODE_GTOP; return(GTOP);       }
"<"                         {yylval.node = newTokenNode(NODE_LTOP);yylval.node->lineno=line_no;yylval.node->op = NODE_LTOP; return(LTOP);       }
"="                         {yylval.node = newTokenNode(NODE_EQOP);yylval.node->lineno=line_no;yylval.node->op = NODE_EQOP; return(EQOP);       }
">="                        {yylval.node = newTokenNode(NODE_GETOP);yylval.node->lineno=line_no;yylval.node->op = NODE_GETOP; return(GETOP);      }
"<="                        {yylval.node = newTokenNode(NODE_LETOP);yylval.node->lineno=line_no;yylval.node->op = NODE_LETOP; return(LETOP);      }
"!="                        {yylval.node = newTokenNode(NODE_NEQOP);yylval.node->lineno=line_no;yylval.node->op = NODE_NEQOP; return(NEQOP);      }

  /* define identifier here */
  ([a-zA-Z]([a-zA-Z0-9"_"])*[a-zA-Z0-9]+|[a-zA-Z])    {yylval.node = newTokenNode(NODE_IDENTIFIER);yylval.node->string=strdup(yytext); return(IDENTIFIER); }
  /* define INTEGERNUM, REALNUMBER, SCIENTIFIC here */
  [0-9]+              {yylval.node = newTokenNode(NODE_INTEGERNUM);yylval.node->valueValid = VALUE_INVALID;yylval.node->iValue = atoi(yytext);LOG(NUMBER); return(INTEGERNUM); }
	[0-9]+"."[0-9]+     {yylval.node = newTokenNode(NODE_REALNUMBER);yylval.node->valueValid = VALUE_INVALID;yylval.node->rvalue = atof(yytext);LOG(NUMBER);  return(REALNUMBER);}
	[0-9][0-9]*"."*[0-9]*[eE]"-"*"+"*[0-9]+ {yylval.node = newTokenNode(NODE_SCIENTIFIC);yylval.node->valueValid = VALUE_INVALID;yylval.node->rvalue = atof(yytext);LOG(NUMBER);  return(SCIENTIFIC);  }
  /* define single/multiple line comment here */
  "//".*              {LIST;} 

	"/*"                {LIST, BEGIN(comment);}
	<comment>\n         {
  LIST;
  LIST_FLUSH;
  line_no++, col_no = 1;
  }
	<comment>[^*\n]*      {LIST;}
	<comment>"*"+[^*/\n]* {LIST;}
	<comment>"*"+"/"      {LIST, BEGIN(INITIAL);} 
  /* define string constant (LITERALSTR) here */
  \"(\\.|[^"\\])*\"   {yylval.node = newTokenNode(NODE_LITERALSTR);yylval.node->string=strdup(yytext);LOG(STRING);return(LITERALSTR);}

  /* define pragma here */
  {list_off} opt_list = 0;
	{list_on} {opt_list = 1, LIST;}
  {token_on} {opt_list = 1, LIST;}
  {token_off} opt_list = 0;
 /*
    yylval.text = strdup, strndup ... (yytext)
    yylval.dval = atoi, atof, strtod, strtol ... (yytext)
 */

[ \t\f\r]    LIST;

\n {
  LIST;
  LIST_FLUSH;
  line_no++, col_no = 1;
}

.  { LIST; fprintf(stderr, "[ERROR] line %4d:%3d lexical analyzer error %s\n", line_no, col_no - yyleng, yytext); }

%%


struct nodeType* newTokenNode(int tokenType) {
    struct nodeType *node = newNode(tokenType);//all the node's default type is Node_Token.
    node->tokenType = tokenType;
    return node;
}
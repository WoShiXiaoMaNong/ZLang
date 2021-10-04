%{
	#include<stdio.h>
	#include "tokens.h"
	#include "errormsg.h"
	#include "util.h"
	union{int ival; string sval; double fval;} yylval;
	int charPos = 1;
	#define  ADJ (EM_tokPos=charPos, charPos+=yyleng)
%}
digits [0-9]+
%%

 /* Reserved Word*/
while		{ADJ;printf("IF \n");return IF;}
for		{ADJ;printf("FOR \n");return 	FOR;}
to		{ADJ;printf("TO \n");return TO;}
break		{ADJ;printf("BREAK \n");return BREAK;}
let		{ADJ;printf("LET \n");return LET;}
in		{ADJ;printf("IN \n");return IN;}
end		{ADJ;printf("END \n");return END;}
function	{ADJ;printf("FUNC \n");return FUNC;}
var		{ADJ;printf("VAR \n");return VAR;}
type		{ADJ;printf("TYPE \n");return TYPE;}
array		{ADJ;printf("ARRAY \n");return ARRAY;}
if		{ADJ;printf("IF \n");return IF;}
then		{ADJ;printf("THEN \n");return THEN;}
else		{ADJ;printf("ELSE \n");return ELSE;}
do		{ADJ;printf("DO \n");return DO;}
of		{ADJ;printf("OF \n");return OF;}
nil		{ADJ;printf("NIL \n");return NIL;}

 /*ID*/

[a-zA-Z][0-9a-zA-Z]*	{ADJ;yylval.sval=String(yytext);printf("ID (%s)\n",yylval.sval);return ID;}


 /*Number*/
{digits}		{ADJ;yylval.ival=atoi(yytext);printf("INT10 (%d)\n",yylval.ival); return NUM;}
{digits}"."{digits}		{ADJ;yylval.fval=atof(yytext);printf("Float (%f)\n",yylval.fval);return REAL;}

 /*String*/
"\""[a-zA-Z0-9_\s\\r\\n]+"\""		{ADJ;yylval.sval=String(yytext);printf("String (%s)",yylval.sval);return STRING;}

 /* Comments & blank*/
"--".*$	{ADJ;}


 /*Operation*/
 ":="			{ADJ;printf("Assgin");return ASSGIN;}
 "="			{ADJ;printf("Equal");return EQU;}


"("			{ADJ;printf("LPAREN ");return LPAREN;}
")"			{ADJ;printf("RPAREN ");return RPAREN;}
"["			{ADJ;printf("LSQUAREBRACKET ");return LSQUAREBRACKET;}
"]"			{ADJ;printf("RSQUAREBRACKET ");return RSQUAREBRACKET;}


 /* Error */
[a-eg-z]	{ADJ; EM_error("illegal charchter");}
%%

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
if		{ADJ;printf("IF \n");return IF;}

 /*ID*/

[a-zA-Z][0-9a-zA-Z]*	{ADJ;yylval.sval=String(yytext);printf("ID (value %s)\n",yylval.sval);return ID;}
 /*Number*/
{digits}		{ADJ;yylval.ival=atoi(yytext);printf("INT10 (value %d)\n",yylval.ival); return NUM;}
{digits}"."{digits}		{ADJ;yylval.fval=atof(yytext);printf("Float (value %f)\n",yylval.fval);return REAL;}
 /* Comments & blank*/
"--".*$	{ADJ;}

 /* Error */
[a-eg-z]	{ADJ; EM_error("illegal charchter");}
%%

/*
* Author:   Cashton Christensen
* Date:     12/4/2018
* Purpose:  Lexical analysis using linux lex tool.
*/
%{
		#include <stdio.h>
		#include <stdlib.h>
%}

%%

[0-9]+		{ return 200; }
[0-9]+\.[0-9]+	{ return 200; }

[+]   { return 301; }
[-]   { return 302; }
[<]   { return 303; }
[>]   { return 304; }
[=]   { return 305; }
[!=]  { return 306; }
"<="  { return 307; }
">="  { return 308; }
[&&]  { return 309; }
[||]  { return 310; }

[;]   { return 401; }
[,]   { return 402; }
":="  { return 403; }
[:]   { return 404; }
[?]   { return 405; }
"^"   { return 406; }

"PROGRAM"  { return 501; }
"BEGIN"    { return 502; }
"END"      { return 503; }
"IF"       { return 504; }
"THEN"     { return 505; }
"ELSE"     { return 506; }
"WHILE"    { return 507; }
"INTEGER"  { return 508; }
"REAL"     { return 509; }
"FOR"      { return 510; }

[a-zA-Z]*    {return 100; }

" "     ;
.  { return 600; }
\n			;

%%

		int main()
{
   int tokentype;
   while (tokentype = yylex())
      printf("%d\n", tokentype);
}

%{
#include <string.h>
#include "while.tab.h"
%}

%%

"="      { return IGUAL; }
"+"      { return SUMA; }
"-"      { return RESTA; }
"*"      { return MULTI; }
"/"      { return DIV; }
"{"      { return CI; }
"}"      { return CF; }
"("      { return PI; }
")"      { return PF; }
"while"    { return WHILE; }
"=="     { return IGUALDAD; }
"<>"     { return DIFERENTE; }
"<"      { return MENOR; }
">"      { return MAYOR; }
"<="     { return MENORIGUAL; }
">="     { return MAYORIGUAL; }
"&&"     { return AND; }
"||"     { return OR; }
";"      { return PCOMA; }
","      { return COMA; }
"MAIN"   { return MAIN; }
"DEC"   { return DEC; }
"INPUT"  { return INPUT; }
"OUTPUT" { return OUTPUT; }
"/*"[a-zA-Z0-9_ ][a-zA-Z0-9_ ]*"*/"     { /* Ignorar comentarios */ }
[a-zA-Z_][a-zA-Z0-9_]* {return IDENTIFICADOR; }
[0-9]+   { return NUMERO; }
\n  {}
.        { /* Ignorar cualquier otro carácter inválido */ }

%%
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(char *mensaje);
int yylex();
%}


%token MAIN DEC INPUT OUTPUT
%token CI CF COMA PI PF PCOMA
%token IGUAL SUMA RESTA MULTI DIV
%token FOR
%token COMENTARIO
%token IGUALDAD DIFERENTE MENOR MAYOR MENORIGUAL MAYORIGUAL AND OR IDENTIFICADOR NUMERO

%%


programa: MAIN CI bloque CF CF { printf("Declaración de variables exitosa\n"); }
        ;

bloque: declara sentencia PCOMA otra_sentencia
        ;

declara: DEC lista_factors PCOMA
        | vacio
        ;
lista_factors: factor otra_factors
        ;

otra_factors: COMA factor otra_factors
        | vacio
        ;
        
otra_sentencia: sentencia PCOMA otra_sentencia
        | vacio
        ;
        
for_stmt: FOR PI asignacion PCOMA condition PCOMA asignacion PF CI sentencia
        ;

sentencia: asignacion
        | lectura 
        | COMENTARIO
        | for_stmt
        | escritura
        ;

condition: expresion comparacion expresion
        ;

comparacion: IGUALDAD
        | DIFERENTE
        | MENOR
        | MAYOR
        | MENORIGUAL
        | MAYORIGUAL
        | AND
        | OR
        ;

asignacion: IDENTIFICADOR IGUAL expresion
        ;

expresion: expresion SUMA termino
        | expresion RESTA termino
        | termino
        ;

termino: termino MULTI factor
        | termino DIV factor
        | factor
        ;

factor: NUMERO
        | IDENTIFICADOR
        ;

lectura: INPUT factor
        ;

escritura: OUTPUT factor
        ;

vacio:
        ;

%%

int main(int argc, char **argv) {
    yyparse();
    return 0;
}

void yyerror(char *mensaje) {
    fprintf(stderr,"Error de sintaxis: %s\n", mensaje);
}
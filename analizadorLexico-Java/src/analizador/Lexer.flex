package analizador;
import static analizador.Token.*;
%%
%class Lexer
%type Token
L = [a-zA-Z_]
D = [0-9]
WHITE=[ \t\r\n]

%{
public String lexeme;
%}
%%
//*********INICIO RECLAS LEXICAS *******
//DEFINIDAS POR EXPRESIONES REGULARES
{WHITE} {/*Ignore*/}//ES UN ESPACIO EN BLANCO Y LO VAMOS A IGNORAR
"=" {return ASSIGN;}
"+" {return SUMA;}
"*" {return MULT;}
"-" {return RESTA;}
"/" {return DIV;}
{L}({L}|{D})* {lexeme=yytext(); return ID;}
 ("(-"{D}+")")|{D}+ {lexeme=yytext(); return INT;}
. {return ERROR;}
//**********FIN REGLAS LEXICAS******

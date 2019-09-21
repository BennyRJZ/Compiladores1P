# Parcial 1
## Compiladores.
### Benny A. Ruiz Jimenez. A01328177

Reglas
```c
LETRA	[a-zA-Z]
DIGITO	[0-9]
BIN 	[0-1]
SIMB    [$|_]
```

Ejemplo de Palabras y Símbolos Reservados y su retorno.

`[101-199] Palabras Reservadas.`

`[301-399] Condicionales.`

`[501-599] Operadores.`

```c
"program"	{return 101;}
"if"    	{return 301;}
"<="        {return 504;}
```

Expresión Regular para reconocer un identificador.
```c
({SIMB}|{LETRA})({LETRA}|{DIGITO}|{SIMB})* {return 901;}

```
Expresión Regular para reconocer un entero.
```c
({DIGITO})({DIGITO})* {return 902;}
```
Expresión Regular para reconocer un punto flotante.
```c
({DIGITO})*"."({DIGITO})({DIGITO})* {return 903;}
```

Lector de archivos.
```c
FILE* archivo = stdin;
char palabra[32];
while(fscanf(archivo,"%s",palabra )==1)
```

Manejador.
*  Palabras Reservadas
    ```c
    if((res>100)&&(res<200))
    {
        switch(res)
        {
            case 101:
            printf("~Reserved Word: program \n");
            break;
    ```
*  Condicionales
    ```c
     else if((res>300)&&(res<400))
    {
        switch(res)
        {
            case 301:
            printf("~Reserved Word - CONDITIONAL: if \n");
            break;
    ```
*  Símbolos
    ```c
    else if((res>500)&&(res<600))
    {
        switch(res)
        {
            case 501:
            printf("~Reserved Word - Symbol: :=\n");
            break;
    ```
 * Identificador.
    ```c
    else if(res==901)
    {
        printf("~Identifier: %s\n",yytext);
    ```
* Enteros.
    ```c
    else if(res==902)
    {
        printf("~Integer: %s\n",yytext);
    }
    ```
* Puntos Flotantes.
    ```c
    else if(res==903)
    {
        printf("~Float: %s\n",yytext);
    }
    ```
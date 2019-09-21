
LETRA	[a-zA-Z]
DIGITO	[0-9]
BIN	[0-1]
SIMB [$|_]
%%
"program"	{return 101;}
"begin"     {return 102;}
"end"       {return 103;}

"if"    	{return 301;}
"then"  	{return 302;}
"else"      {return 303;}
"while"     {return 304;}
"for"	    {return 305;}
"until"     {return 306;}
"return"    {return 307;}

":="        {return 501;}
"="         {return 502;}
"<"         {return 503;}
"<="        {return 504;}
">"         {return 505;}
">="        {return 506;}
";"         {return 507;}
"("         {return 508;}
")"         {return 509;}
"["         {return 510;}
"]"         {return 511;}


({SIMB}|{LETRA})({LETRA}|{DIGITO}|{SIMB})* {return 901;}

({DIGITO})({DIGITO})* {return 902;}

({DIGITO})*"."({DIGITO})({DIGITO})* {return 903;}

.*		{ return 0;}
%%
int main() {
FILE* archivo = stdin;
char palabra[32];
while(fscanf(archivo,"%s",palabra ))
{
  yy_scan_string(palabra);
  int res = yylex();
    if((res>100)&&(res<200))
    {
        switch(res)
        {
            case 101:
            printf("~Reserved Word: program \n");
            break;

            case 102:
            printf("~Reserved Word: begin\n");
            break;

            case 103:
            printf("~Reserved Word: end\n");
            break;

            default:
            printf("NOT RECOGNIZED.\n");
        }
    }
    else if((res>300)&&(res<400))
    {
        switch(res)
        {
            case 301:
            printf("~Reserved Word - CONDITIONAL: if \n");
            break;

            case 302:
            printf("~Reserved Word - CONDITIONAL: then\n");
            break;

            case 303:
            printf("~Reserved Word - CONDITIONAL: else\n");
            break;
            
            case 304:
            printf("~Reserved Word - CONDITIONAL: while\n");
            break;

            case 305:
            printf("~Reserved Word - CONDITIONAL: for\n");
            break;

            case 306:
            printf("~Reserved Word - CONDITIONAL: until\n");
            break;
            
            case 307:
            printf("~Reserved Word - CONDITIONAL: return\n");
            break;

            default:
            printf("NOT RECOGNIZED.\n");
        }
    }else if((res>500)&&(res<600))
    {
        switch(res)
        {
            case 501:
            printf("~Reserved Word - Symbol: :=\n");
            break;

            case 502:
            printf("~Reserved Word - Symbol: =\n");
            break;

            case 503:
            printf("~Reserved Word - Symbol: <\n");
            break;
            
            case 504:
            printf("~Reserved Word - Symbol: <=\n");
            break;

            case 505:
            printf("~Reserved Word - Symbol: >\n");
            break;

            case 506:
            printf("~Reserved Word - Symbol: >=\n");
            break;
            
            case 507:
            printf("~Reserved Word - Symbol: ;\n");
            break;

            case 508:
            printf("~Reserved Word - Symbol: (\n");
            break;

            case 509:
            printf("~Reserved Word - Symbol: )\n");
            break;

            case 510:
            printf("~Reserved Word - Symbol: [\n");
            break;

            case 511:
            printf("~Reserved Word - Symbol: ]\n");
            break;

            default:
            printf("NOT RECOGNIZED.\n");
        }
    }else if(res==901)
    {
        printf("~Identifier\n");
    }else if(res==902)
    {
        printf("~Integer\n");
    }
    else if(res==903)
    {
        printf("~Float\n");
    }
}
}


/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD 'data.tsv' USING PigStorage('\t') AS (columna1:chararray, columna2:BAG{dict:TUPLE(letter:chararray)}, columna3:MAP[]);

seleccion = FOREACH datos GENERATE columna2;
letras = FOREACH seleccion GENERATE FLATTEN(columna2) AS letra;
grupo_letras = GROUP letras BY letra;
cuenta_letras = FOREACH grupo_letras GENERATE group, COUNT(letras);

STORE cuenta_letras INTO 'output' USING PigStorage(',');
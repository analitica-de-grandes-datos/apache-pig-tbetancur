/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD 'data.tsv' USING PigStorage('\t') AS (columna1:chararray, columna2:BAG{dict:TUPLE(letter:chararray)}, columna3:MAP[]);
seleccion = FOREACH datos GENERATE columna2, columna3;
clave_valor = FOREACH seleccion GENERATE FLATTEN(columna2),FLATTEN(columna3);
grupos = GROUP clave_valor BY ($0, $1);
salida = FOREACH grupos GENERATE group , COUNT($1);

STORE salida INTO 'output/' using PigStorage(',') ;
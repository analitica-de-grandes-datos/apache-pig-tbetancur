/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD './data.tsv' AS (columna1:chararray, columna2:bag{}, columna3:map[]);
seleccion = FOREACH datos GENERATE columna1, (int)COUNT(columna2) AS total_columna2 , (int) SIZE(columna3) AS total_columna3;
salida = ORDER seleccion BY columna1, total_columna2, total_columna3;
STORE salida INTO 'output/' using PigStorage(',');
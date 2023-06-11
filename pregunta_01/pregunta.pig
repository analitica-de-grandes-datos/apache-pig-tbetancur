/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD './data.tsv' AS (letra:chararray, fecha:chararray, monto:int);
grupo_letras = GROUP datos BY letra;
conteo = FOREACH grupo_letras GENERATE group, COUNT(datos);

STORE conteo INTO 'output/' using PigStorage(',');
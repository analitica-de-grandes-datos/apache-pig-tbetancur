/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD './data.tsv' AS (letra:chararray, fecha:chararray, monto:int);
datos_ordenados = ORDER datos BY monto;
seleccion = limit datos_ordenados 5;
resultado = FOREACH seleccion GENERATE monto;

STORE resultado INTO 'output/' using PigStorage(',');
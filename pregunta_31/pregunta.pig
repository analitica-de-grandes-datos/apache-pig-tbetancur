/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD './data.csv' using PigStorage(',') AS (id:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, nivel:int);
seleccion = FOREACH datos GENERATE SUBSTRING(fecha, 0, 4) AS ano;
grupos = GROUP seleccion BY ano;
salida = FOREACH grupos GENERATE $0, COUNT($1);
STORE salida INTO 'output/' using PigStorage(',');
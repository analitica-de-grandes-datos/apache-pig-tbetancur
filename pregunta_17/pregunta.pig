/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, color 
   FROM 
       u
   WHERE color IN ('blue','black');

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */

datos = LOAD './data.csv' using PigStorage(',') AS (id:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, nivel:int);
seleccion = FILTER datos BY (color matches 'blue') or (color matches 'black');
salida = FOREACH seleccion GENERATE nombre, color;
STORE salida INTO 'output/' using PigStorage(',');
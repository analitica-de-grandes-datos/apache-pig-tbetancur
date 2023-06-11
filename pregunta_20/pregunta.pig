/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT
       firstname,
       color
   FROM 
       u 
   WHERE 
      color REGEXP '^[^b]';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD './data.csv' using PigStorage(',') AS (id:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, nivel:int);
seleccion = FOREACH datos GENERATE nombre, color;
salida = FILTER seleccion BY NOT STARTSWITH(color,'b');
STORE salida INTO 'output' USING PigStorage(',');

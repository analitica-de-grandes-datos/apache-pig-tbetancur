/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT  
       firstname,
       SUBSTRING_INDEX(firstname, 'a', 1)
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD './data.csv' using PigStorage(',') AS (id:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, nivel:int);
salida = FOREACH datos GENERATE INDEXOF(nombre,'a');
STORE salida INTO 'output' USING PigStorage(',');
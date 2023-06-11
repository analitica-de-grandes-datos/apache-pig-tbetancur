/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD './data.csv' using PigStorage(',') AS (id:int,  nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, nivel:int);
seleccion = FOREACH datos GENERATE apellido , SIZE(apellido) AS longitud;
datos_ordenados = ORDER seleccion BY longitud desc, apellido;
salida = LIMIT datos_ordenados 5;
STORE salida INTO 'output' USING PigStorage(',');

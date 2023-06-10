/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
A = LOAD './data.csv' using PigStorage(',') AS (driverId:int, truckId:int, eventTime:chararray, eventType:chararray, longitude:double, latitude:double, eventKey:chararray, correlationId:chararray, driverName:chararray,routeId:biginteger,routeName:chararray, eventDate:chararray );
B = limit A 10;
C = FOREACH B GENERATE driverId,truckId,eventTime;
D = ORDER C BY driverId,truckId,eventTime;

STORE D INTO 'output/' using PigStorage(',');
/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código en Pig para manipulación de fechas que genere la siguiente 
salida.

   1971-07-08,jul,07,7
   1974-05-23,may,05,5
   1973-04-22,abr,04,4
   1975-01-29,ene,01,1
   1974-07-03,jul,07,7
   1974-10-18,oct,10,10
   1970-10-05,oct,10,10
   1969-02-24,feb,02,2
   1974-10-17,oct,10,10
   1975-02-28,feb,02,2
   1969-12-07,dic,12,12
   1973-12-24,dic,12,12
   1970-08-27,ago,08,8
   1972-12-12,dic,12,12
   1970-07-01,jul,07,7
   1974-02-11,feb,02,2
   1973-04-01,abr,04,4
   1973-04-29,abr,04,4

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
A = LOAD './data.csv' using PigStorage(',') AS (id:int,  name:chararray, lastname:chararray,   date:chararray,  color:chararray, other:int);
B = FOREACH A GENERATE date,  LOWER(ToString(ToDate(date,'yyyy-MM-dd', 'America/Bogota'),'MMM')),  ToString(ToDate(date,'yyyy-MM-dd', '-05:00'),'MM'), GetMonth(ToDate(date));
C = FOREACH B GENERATE $0, REPLACE($1,'apr','abr'), $2, $3;
D = FOREACH C GENERATE $0, REPLACE($1,'jan','ene'), $2, $3;
E = FOREACH D GENERATE $0, REPLACE($1,'dec','dic'), $2, $3;
F = FOREACH E GENERATE $0, REPLACE($1,'aug','ago'), $2, $3;

STORE F INTO 'output/' using PigStorage(',');

data_table = LOAD 'data.csv' USING PigStorage(',')
    AS (
        Id:int,
        firstname:chararray,
        Apellido:chararray,
        date:chararray,
        color:chararray,
        Cantidad:int
    );

B = FOREACH data_table GENERATE date,  ToString(ToDate(date,'yyyy-MM-dd',
    'America/Bogota'),'dd'), ToString(ToDate(date,'yyyy-MM-dd',
    'America/Bogota'),'d'), ToString(ToDate(date,'yyyy-MM-dd',
    'America/Bogota'),'EEEE');
C = FOREACH B GENERATE $0, REPLACE($3,'Monday','lunes'), $1, $2;

D = FOREACH C GENERATE $0, REPLACE($1,'Tuesday','martes'), $2, $3;
E = FOREACH D GENERATE $0, REPLACE($1,'Wednesday','miercoles'), $2, $3;
F = FOREACH E GENERATE $0, REPLACE($1,'Thursday','jueves'), $2, $3;
G = FOREACH F GENERATE $0, REPLACE($1,'Friday','viernes'), $2, $3;
H = FOREACH G GENERATE $0, REPLACE($1,'Saturday','sabado'), $2, $3;
I = FOREACH H GENERATE $0, REPLACE($1,'Sunday','domingo'), $2, $3;
J = FOREACH I  GENERATE $0,$2,$3, SUBSTRING($1, 0, 3),$1;

STORE J  INTO 'output' USING PigStorage(',');

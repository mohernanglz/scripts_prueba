-- generamos un nuevo tablespace para las imagenes

create bigfile tablespace TBS_IMAGENES
datafile '/ora02/PRUEBAS/data/tbs_imagen_01.dbf' size 2G;

-- creamos usuario dueño de los objetos --

create user usr_imagen
identified by passw123
default tablespace tbs_imagenes
temporary tablespace temp01
profile bddesa
account unlock;

grant unlimited tablespace to usr_imagen;

 -- crear directorio --

create or replace directory imagenes as '/u02/oracle/IMAGENES';

-- se otorgan permisos --

grant read, write, execute on directory IMAGENES to usr_imagen;

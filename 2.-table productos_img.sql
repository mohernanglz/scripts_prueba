create table productos_img(
id_img primary key,  -- id unico
nombre_img varchar2(30), -- nombre de la imagen 
imagen blob default empty_blob()  -- tipo imagen con la opcion empty (si no hay imagen, no ocupa espacio)
tablespace TBS_IMAGENES;

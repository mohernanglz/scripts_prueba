CREATE materialized view v_lista_img
tablespace tbs_imagenes
lob("IMAGEN") store as
tablespace TBS_IMAGENES
REFRESH COMPLETE ON DEMAND
as select id_img,nombre_imagen, imagen
from productos_img;

CREATE OR REPLACE PROCEDURE P_INSERTA_IMAGEN (
  p_id NUMBER, 
  p_image_name IN VARCHAR2)

IS
   v_file   BFILE;
   v_bfile   BLOB;
   v_longfile   BINARY_INTEGER;
BEGIN
   v_file := BFILENAME ('IMAGENES', p_image_name);

   -- insertamos

   INSERT INTO productos_img
               (ID_IMG, NOMBRE_IMG, IMAGEN
               )
        VALUES (p_id, p_image_name, EMPTY_BLOB ()
               )
     RETURNING IMAGEN
          INTO v_bfile;

   SELECT     IMAGEN
         INTO v_bfile
         FROM productos_img
        WHERE id_img = p_id AND nombre_img = p_image_name
   FOR UPDATE;

   -- abrimos archivo
   DBMS_LOB.fileopen (v_file, DBMS_LOB.file_readonly);
   -- validamos longitud del campo
   v_longfile := DBMS_LOB.getlength (v_bfile);
   -- read the file
   DBMS_LOB.loadfromfile (v_bfile, v_file, v_longfile);

   -- update the blob field
   UPDATE productos_img
      SET imagen = v_bfile
    WHERE id_img = p_id and nombre_img = p_image_name;

   -- close file
   DBMS_LOB.fileclose (v_file);
END P_INSERTA_IMAGEN;
 /

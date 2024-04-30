DROP PROCEDURE insert_curso;

DELIMITER $
CREATE PROCEDURE insert_curso(
	curso_titulo VARCHAR(100)
)
BEGIN
	INSERT INTO tbl_cursos (Curso_Titulo) VALUES (Curso_Titulo);
    SELECT * FROM tbl_cursos WHERE Curso_Titulo = curso_titulo;
END $
DELIMITER ;
DROP PROCEDURE show_cursos;

DELIMITER $
CREATE PROCEDURE show_cursos()
BEGIN
	SELECT 
		Curso_Titulo AS Nome
	FROM tbl_cursos
	;
END $
DELIMITER ;
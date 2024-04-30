DROP PROCEDURE show_professores;

DELIMITER $
CREATE PROCEDURE show_professores()
BEGIN
	SELECT 
		CONCAT(Professor_Nome, ' ', Professor_Sobrenome) AS Nome,
        Professor_CPF AS CPF,
        Professor_Email AS Email,
        tbl_cursos.Curso_Titulo AS Curso
	FROM tbl_professores
    LEFT JOIN tbl_professores_cursos 
		ON tbl_professores.Professor_Id = tbl_professores_cursos.Professor_Id
	LEFT JOIN tbl_cursos
		ON tbl_cursos.Curso_Id = tbl_professores_cursos.Curso_Id
	;
END $
DELIMITER ;
DROP PROCEDURE show_alunos;

DELIMITER $
CREATE PROCEDURE show_alunos()
BEGIN
	SELECT 
		CONCAT(Aluno_Nome, ' ', Aluno_Sobrenome) AS Nome,
        Aluno_Ra AS No_Registro,
        Aluno_Email AS Email,
        tbl_cursos.Curso_Titulo AS Curso
	FROM tbl_alunos
    LEFT JOIN tbl_alunos_cursos 
		ON tbl_alunos.Aluno_Id = tbl_alunos_cursos.Aluno_Id
	LEFT JOIN tbl_cursos
		ON tbl_cursos.Curso_Id = tbl_alunos_cursos.Curso_Id
	;
END $
DELIMITER ;
DROP PROCEDURE insert_aluno;

DELIMITER $
CREATE PROCEDURE insert_aluno(
	aluno_ra_var INT,
    aluno_nome_var VARCHAR(50),
    aluno_sobrenome_var VARCHAR(50),
    aluno_curso_var VARCHAR(100)
)
BEGIN
	SET @aluno_nome_inteiro = CONCAT(aluno_nome_var, ' ', aluno_sobrenome_var);

	SET @aluno_email = LOWER((
	CASE 
		WHEN aluno_nome_var = (SELECT Aluno_Nome FROM tbl_alunos WHERE Aluno_Nome = aluno_nome_var LIMIT 1)
        AND aluno_sobrenome_var = (SELECT Aluno_Sobrenome FROM tbl_alunos WHERE Aluno_Sobrenome = aluno_sobrenome_var LIMIT 1)
		THEN
			CONCAT(aluno_nome_var, '.', aluno_sobrenome_var, '.', 
                (SELECT COUNT(*) FROM tbl_alunos WHERE Aluno_Nome = aluno_nome_var AND Aluno_Sobrenome = aluno_sobrenome_var),
                '@facens.br')
		ELSE
			CONCAT(aluno_nome_var, '.', aluno_sobrenome_var, '@facens.br')
	END));

    SET @aluno_curso_id = (SELECT Curso_Id FROM tbl_cursos WHERE Curso_Titulo = aluno_curso_var);
    	
    INSERT INTO tbl_alunos (Aluno_RA, Aluno_Nome, Aluno_Sobrenome, Aluno_Email) 
    VALUES (aluno_ra_var, aluno_nome_var, aluno_sobrenome_var, @aluno_email);
    
    SET @NEW_aluno_id = (SELECT Aluno_Id FROM tbl_alunos WHERE Aluno_RA = aluno_ra_var);

    INSERT INTO tbl_alunos_cursos 
    VALUES (
		@NEW_aluno_id, 
        @aluno_curso_id
	);
    
    SELECT * FROM tbl_alunos WHERE Aluno_Id = @NEW_aluno_id;
END $
DELIMITER ;
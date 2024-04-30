DROP PROCEDURE insert_professor;

DELIMITER $
CREATE PROCEDURE insert_professor(
	professor_cpf_var VARCHAR(20),
    professor_nome_var VARCHAR(50),
    professor_sobrenome_var VARCHAR(50),
    professor_curso_var VARCHAR(100)
)
BEGIN
	SET @professor_nome_inteiro = CONCAT(professor_nome_var, ' ', professor_sobrenome_var);

	SET @no_prof_igual = (SELECT COUNT(*) FROM tbl_professores 
    WHERE Professor_Nome LIKE professor_nome_var AND Professor_Sobrenome LIKE professor_sobrenome_var);
    
    SELECT @no_prof_igual;

	SET @professor_email = LOWER((
	CASE 
		WHEN @no_prof_igual > 0
		THEN
			CONCAT(professor_nome_var, '.', professor_sobrenome_var, '.', 
                (SELECT COUNT(*) FROM tbl_professores WHERE Professor_Nome LIKE professor_nome_var AND Professor_Sobrenome LIKE professor_sobrenome_var),
                '@facens.br')
		ELSE
			CONCAT(professor_nome_var, '.', professor_sobrenome_var, '@facens.br')
	END));

    SET @professor_curso_id = (SELECT Curso_Id FROM tbl_cursos WHERE Curso_Titulo LIKE professor_curso_var);
    	
    INSERT INTO tbl_professores (Professor_CPF, Professor_Nome, Professor_Sobrenome, Professor_Email) 
    VALUES (professor_cpf_var, professor_nome_var, professor_sobrenome_var, @professor_email);
    
    SET @NEW_professor_id = (SELECT MAX(Professor_Id) FROM tbl_professores);

    INSERT INTO tbl_professores_cursos 
    VALUES (
		@NEW_professor_id, 
        @professor_curso_id
	);
    
    SELECT * FROM tbl_professores WHERE Professor_Id = @NEW_professor_id;
END $
DELIMITER ;
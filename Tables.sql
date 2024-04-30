DROP TABLE tbl_alunos;
CREATE TABLE tbl_alunos (
	Aluno_Id 			INT 			PRIMARY KEY 	AUTO_INCREMENT,
    Aluno_RA 			INT 			NOT NULL 		UNIQUE,
    Aluno_Nome 			VARCHAR(50) 	NOT NULL,
    Aluno_Sobrenome		VARCHAR(50) 	NOT NULL,
    Aluno_Email 		VARCHAR(100)	UNIQUE
);

DROP TABLE tbl_professores;
CREATE TABLE tbl_professores (
	Professor_Id 			INT 			PRIMARY KEY 	AUTO_INCREMENT,
    Professor_CPF 			VARCHAR(20) 	NOT NULL 		UNIQUE,
    Professor_Nome 			VARCHAR(50) 	NOT NULL,
    Professor_Sobrenome		VARCHAR(50) 	NOT NULL,
    Professor_Email 		VARCHAR(100)	UNIQUE
);

DROP TABLE tbl_cursos;
CREATE TABLE tbl_cursos (
	Curso_Id 		INT 			PRIMARY KEY 	AUTO_INCREMENT,
    Curso_Titulo 	VARCHAR(100) 	NOT NULL 		UNIQUE
);

DROP TABLE tbl_alunos_cursos;
CREATE TABLE tbl_alunos_cursos (
	Aluno_Id 	INT 	REFERENCES tbl_alunos (Aluno_Id),
    Curso_Id 	INT 	REFERENCES tbl_cursos (Curso_Id)
);

DROP TABLE tbl_professores_cursos;
CREATE TABLE tbl_professores_cursos (
	Professor_Id 	INT 	REFERENCES tbl_professores (Professor_Id),
    Curso_Id 		INT 	REFERENCES tbl_cursos (Curso_Id)
);
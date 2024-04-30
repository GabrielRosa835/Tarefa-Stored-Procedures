TRUNCATE TABLE tbl_alunos;
TRUNCATE TABLE tbl_alunos_cursos;
TRUNCATE TABLE tbl_professores;
TRUNCATE TABLE tbl_professores_cursos;
TRUNCATE TABLE tbl_cursos;

SELECT * FROM tbl_alunos;
SELECT * FROM tbl_professores;
SELECT * FROM tbl_cursos;

CALL insert_curso('Análise e Desenvolvimento de Sistemas');
CALL insert_curso('Engenharia da Computação');
CALL insert_professor('123.456.789-01', 'Daniel', 'Ohata', 'Análise e Desenvolvimento de Sistemas');
CALL insert_professor('234.567.890-12', 'Ovídio', 'José', 'Engenharia da Computação');
CALL insert_professor('345.678.901-23', 'Ovídio', 'José', 'Análise e Desenvolvimento de Sistemas');
CALL insert_professor('456.789.012-34', 'Ovídio', 'José', 'Engenharia da Computação');
CALL insert_professor('567.890.123-45', 'Eliney', 'Sabino', 'Análise e Desenvolvimento de Sistemas');
CALL insert_aluno(237069, 'Gabriel', 'Rosa', 'Análise e Desenvolvimento de Sistemas');
CALL insert_aluno(236896, 'Wesley', 'Silva', 'Engenharia da Computação');

CALL show_alunos();
CALL show_professores();
CALL show_cursos();
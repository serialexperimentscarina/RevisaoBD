CREATE DATABASE escola
GO
USE escola
GO
CREATE TABLE aluno (
ra					INT				NOT NULL,
nome				VARCHAR(100)	NOT NULL,
idade				INT				NOT NULL	CHECK(idade > 0)
PRIMARY KEY (ra)
)
GO
CREATE TABLE disciplina (
codigo				INT				NOT NULL,
nome				VARCHAR(80)		NOT NULL,
carga_horaria		INT				NOT NULL	CHECK(carga_horaria >= 32)
PRIMARY KEY (codigo)
)
GO
CREATE TABLE titulacao (
codigo				INT				NOT NULL,
titulo				VARCHAR(40)		NOT NULL
PRIMARY KEY (codigo)
)
GO
CREATE TABLE professor (
registro			INT				NOT NULL,
nome				VARCHAR(100)	NOT NULL,
titulacao			INT				NOT NULL
PRIMARY KEY (registro),
FOREIGN KEY (titulacao)	REFERENCES titulacao (codigo)
)
GO
CREATE TABLE curso (
codigo				INT				NOT NULL,
nome				VARCHAR(50)		NOT NULL,
area				VARCHAR(50)		NOT NULL
PRIMARY KEY (codigo)
)
GO
CREATE TABLE aluno_disciplina (
alunora				INT				NOT NULL,
disciplinacodigo	INT				NOT NULL
PRIMARY KEY (alunora, disciplinacodigo),
FOREIGN KEY (alunora) REFERENCES aluno (ra),
FOREIGN KEY (disciplinacodigo) REFERENCES disciplina (codigo)
)
GO
CREATE TABLE disciplina_professor (
disciplinacodigo	INT				NOT NULL,
professorregistro	INT				NOT NULL
PRIMARY KEY (disciplinacodigo, professorregistro),
FOREIGN KEY (disciplinacodigo) REFERENCES disciplina (codigo),
FOREIGN KEY (professorregistro) REFERENCES professor (registro)
)
GO
CREATE TABLE curso_disciplina (
cursocodigo			INT				NOT NULL,
disciplinacodigo	INT				NOT NULL
PRIMARY KEY (cursocodigo, disciplinacodigo),
FOREIGN KEY (cursocodigo) REFERENCES curso (codigo),
FOREIGN KEY (disciplinacodigo) REFERENCES disciplina (codigo)
)
GO
INSERT INTO aluno VALUES 
(3416,	'DIEGO PIOVESAN DE RAMOS',	18),
(3423,	'LEONARDO MAGALHÃES DA ROSA',	17),
(3434,	'LUIZA CRISTINA DE LIMA MARTINELI',	20),
(3440,	'IVO ANDRÉ FIGUEIRA DA SILVA',	25),
(3443,	'BRUNA LUISA SIMIONI',	37),
(3448,	'THAÍS NICOLINI DE MELLO',	17),
(3457,	'LÚCIO DANIEL TÂMARA ALVES',	29),
(3459,	'LEONARDO RODRIGUES',	25),
(3465,	'ÉDERSON RAFAEL VIEIRA',	19),
(3466,	'DAIANA ZANROSSO DE OLIVEIRA',	21),
(3467,	'DANIELA MAURER',	23),
(3470,	'ALEX SALVADORI PALUDO',	42),
(3471,	'VINÍCIUS SCHVARTZ',	19),
(3472,	'MARIANA CHIES ZAMPIERI',	18),
(3482,	'EDUARDO CAINAN GAVSKI',	19),
(3483,	'REDNALDO ORTIZ DONEDA',	20),
(3499,	'MAYELEN ZAMPIERON',	22)
GO
INSERT INTO disciplina VALUES
(1,	'Laboratório de Banco de Dados',	80),
(2,	'Laboratório de Engenharia de Software',	80),
(3,	'Programação Linear e Aplicações',	80),
(4,	'Redes de Computadores',	80),
(5,	'Segurança da informação',	40),
(6,	'Teste de Software',	80),
(7,	'Custos e Tarifas Logísticas',	80),
(8,	'Gestão de Estoques',	40),
(9,	'Fundamentos de Marketing',	40),
(10,	'Métodos Quantitativos de Gestão',	80),
(11,	'Gestão do Tráfego Urbano',	80),
(12,	'Sistemas de Movimentação e Transporte',	40)
GO
INSERT INTO titulacao VALUES
(1,	'Especialista'),
(2,	'Mestre'),
(3,	'Doutor')
GO
INSERT INTO professor VALUES
(1111,	'Leandro',	2),
(1112,	'Antonio',	2),
(1113,	'Alexandre',	3),
(1114,	'Wellington',	2),
(1115,	'Luciano',	1),
(1116,	'Edson',	2),
(1117,	'Ana',	2),
(1118,	'Alfredo',	1),
(1119,	'Celio',	2),
(1120,	'Dewar',	3),
(1121,	'Julio',	1)
GO
INSERT INTO curso VALUES
(1,	'ADS',	'Ciências da Computação'),
(2,	'Logística',	'Engenharia Civil')
GO
INSERT INTO aluno_disciplina VALUES
(3416, 1),
(3416, 4),
(3423, 1),
(3423, 2),
(3423, 5),
(3423, 6),
(3434, 2),
(3434, 5),
(3434, 6),
(3440, 1),
(3443, 5),
(3443, 6),
(3448, 4),
(3448, 5),
(3448, 6),
(3457, 2),
(3457, 4),
(3457, 5),
(3457, 6),
(3459, 1),
(3459, 6),
(3465, 7),
(3465, 11),
(3466, 8),
(3466, 11),
(3467, 8),
(3467, 12),
(3470, 8),
(3470, 9),
(3470, 11),
(3470, 12),
(3471, 7),
(3472, 7),
(3472, 12),
(3482, 9),
(3482, 11),
(3483, 8),
(3483, 11),
(3483, 12),
(3499, 8)
GO
INSERT INTO disciplina_professor VALUES
(1,	1111),
(2,	1112),
(3,	1113),
(4,	1114),
(5,	1115),
(6,	1116),
(7,	1117),
(8,	1118),
(9,	1117),
(10,	1119),
(11,	1120),
(12,	1121)
GO
INSERT INTO curso_disciplina VALUES
(1,	1),
(1,	2),
(1,	3),
(1,	4),
(1,	5),
(1,	6),
(2,	7),
(2,	8),
(2,	9),
(2,	10),
(2,	11),
(2,	12)


------------  QUERIES ------------

-- Listas de chamadas, com RA e nome por disciplina
-- Todas as disciplinas
SELECT a.ra, a.nome, d.nome AS 'disciplina'
FROM aluno a, disciplina d, aluno_disciplina ad
WHERE a.ra = ad.alunora AND d.codigo = ad.disciplinacodigo
ORDER BY d.nome
-- Laboratório de Banco de Dados
SELECT a.ra, a.nome
FROM aluno a, disciplina d, aluno_disciplina ad
WHERE a.ra = ad.alunora AND d.codigo = ad.disciplinacodigo AND d.codigo = 1
-- Laboratório de Engenharia de Software
SELECT a.ra, a.nome
FROM aluno a, disciplina d, aluno_disciplina ad
WHERE a.ra = ad.alunora AND d.codigo = ad.disciplinacodigo AND d.codigo = 2
-- Programação Linear e Aplicações
SELECT a.ra, a.nome
FROM aluno a, disciplina d, aluno_disciplina ad
WHERE a.ra = ad.alunora AND d.codigo = ad.disciplinacodigo AND d.codigo = 3
-- Redes de Computadores
SELECT a.ra, a.nome
FROM aluno a, disciplina d, aluno_disciplina ad
WHERE a.ra = ad.alunora AND d.codigo = ad.disciplinacodigo AND d.codigo = 4
-- Segurança da informação
SELECT a.ra, a.nome
FROM aluno a, disciplina d, aluno_disciplina ad
WHERE a.ra = ad.alunora AND d.codigo = ad.disciplinacodigo AND d.codigo = 5
-- Teste de Software
SELECT a.ra, a.nome
FROM aluno a, disciplina d, aluno_disciplina ad
WHERE a.ra = ad.alunora AND d.codigo = ad.disciplinacodigo AND d.codigo = 6
-- Custos e Tarifas Logísticas
SELECT a.ra, a.nome
FROM aluno a, disciplina d, aluno_disciplina ad
WHERE a.ra = ad.alunora AND d.codigo = ad.disciplinacodigo AND d.codigo = 7
-- Gestão de Estoques
SELECT a.ra, a.nome
FROM aluno a, disciplina d, aluno_disciplina ad
WHERE a.ra = ad.alunora AND d.codigo = ad.disciplinacodigo AND d.codigo = 8
-- Fundamentos de Marketing
SELECT a.ra, a.nome
FROM aluno a, disciplina d, aluno_disciplina ad
WHERE a.ra = ad.alunora AND d.codigo = ad.disciplinacodigo AND d.codigo = 9
--Métodos Quantitativos de Gestão
SELECT a.ra, a.nome
FROM aluno a, disciplina d, aluno_disciplina ad
WHERE a.ra = ad.alunora AND d.codigo = ad.disciplinacodigo AND d.codigo = 10
-- Gestão do Tráfego Urbano
SELECT a.ra, a.nome
FROM aluno a, disciplina d, aluno_disciplina ad
WHERE a.ra = ad.alunora AND d.codigo = ad.disciplinacodigo AND d.codigo = 11
-- Sistemas de Movimentação e Transporte
SELECT a.ra, a.nome
FROM aluno a, disciplina d, aluno_disciplina ad
WHERE a.ra = ad.alunora AND d.codigo = ad.disciplinacodigo AND d.codigo = 12

-- Fazer uma pesquisa que liste o nome das disciplinas e o nome dos professores que as ministram
SELECT d.nome AS 'disciplina', p.nome AS 'professor'
FROM disciplina d, professor p, disciplina_professor dp
WHERE d.codigo = dp.disciplinacodigo AND p.registro = dp.professorregistro

-- Fazer uma pesquisa que , dado o nome de uma disciplina, retorne o nome do curso								
SELECT d.nome AS 'disciplina', c.nome AS 'curso'
FROM disciplina d, curso_disciplina cd, curso c
WHERE d.codigo = cd.disciplinacodigo AND c.codigo = cd.cursocodigo

-- Fazer uma pesquisa que , dado o nome de uma disciplina, retorne sua área		
SELECT d.nome AS 'disciplina', c.area AS 'área'
FROM disciplina d, curso_disciplina cd, curso c
WHERE d.codigo = cd.disciplinacodigo AND c.codigo = cd.cursocodigo

-- Fazer uma pesquisa que , dado o nome de uma disciplina, retorne o título do professor que a ministra		
SELECT d.nome AS 'disciplina', t.titulo AS 'título do professor'
FROM disciplina d, professor p, disciplina_professor dp, titulacao t
WHERE d.codigo = dp.disciplinacodigo AND p.registro = dp.professorregistro AND p.titulacao = t.codigo

-- Fazer uma pesquisa que retorne o nome da disciplina e quantos alunos estão matriculados em cada uma delas								
SELECT d.nome AS 'disciplina', COUNT(a.ra) AS 'alunos matriculados'
FROM aluno_disciplina ad 
RIGHT JOIN disciplina d ON d.codigo = ad.disciplinacodigo
LEFT JOIN aluno a ON a.ra = ad.alunora
GROUP BY d.nome

-- Fazer uma pesquisa que, dado o nome de uma disciplina, retorne o nome do professor.  Só deve retornar de disciplinas que tenham, no mínimo, 5 alunos matriculados													
SELECT d.nome AS 'disciplina', p.nome AS 'professor'
FROM disciplina d, professor p, disciplina_professor dp, aluno a, aluno_disciplina ad
WHERE d.codigo = dp.disciplinacodigo AND p.registro = dp.professorregistro AND a.ra = ad.alunora AND d.codigo = ad.disciplinacodigo
GROUP BY d.nome, p.nome
HAVING COUNT(a.ra) >= 5

-- Fazer uma pesquisa que retorne o nome do curso e a quatidade de professores cadastrados que ministram aula nele. A coluna deve se chamar quantidade													
SELECT c.nome AS 'curso', COUNT(DISTINCT(p.registro)) AS 'quantidade'
FROM disciplina d, professor p, disciplina_professor dp, curso c, curso_disciplina cd
WHERE d.codigo = dp.disciplinacodigo AND p.registro = dp.professorregistro AND c.codigo = cd.cursocodigo AND cd.disciplinacodigo = d.codigo
GROUP BY c.nome

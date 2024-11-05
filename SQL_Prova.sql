USE Sistema_Escolar
-- O tema escolhido foi sistema de gerenciamento escolar.

-- Criado as tabelas:

CREATE TABLE Alunos (
	ID_Aluno INT  PRIMARY KEY,
	NomeCompletoAluno VARCHAR(100),
	IdadeAluno INT,
	CPF VARCHAR(11),
	RG VARCHAR(9),
	ID_Notas INT
)

CREATE TABLE Notas (
	ID_Notas INT PRIMARY KEY,
	ID_Aluno INT,
	Lingua_Portuguesa FLOAT,
	Matematica FLOAT,
	Historia FLOAT,
	Geografia FLOAT,
	Fisica FLOAT,
	Quimica FLOAT,
	Biologia FLOAT
)

CREATE TABLE Professores (
	ID_Professor INT PRIMARY KEY,
	NomeCompletoProfessor VARCHAR(100),
	IdadeProfessor INT,
	CPF VARCHAR(11),
	RG VARCHAR(9),
	DataContratacao DATETIME,
	DataDemissao DATETIME,
	Telefone VARCHAR(12),
	Email VARCHAR(80),
	Materia VARCHAR(20)
)

ALTER TABLE Professores
ADD ID_Materia INT


CREATE TABLE Materias (
	ID_Materia INT PRIMARY KEY,
	Materia VARCHAR(20)
)



-- Inserindo colunas que v�o se tornar estrangeiras:

-- Convertendo colunas como chave estrangeira:
ALTER TABLE Alunos
ADD CONSTRAINT FK_ID_Notas FOREIGN KEY (ID_Notas)
REFERENCES Notas(ID_Notas);

ALTER TABLE Notas
ADD CONSTRAINT FK_ID_Aluno FOREIGN KEY (ID_Aluno)
REFERENCES Alunos(ID_Aluno);

ALTER TABLE Professores
ADD CONSTRAINT FK_ID_Materia FOREIGN KEY (ID_Materia)
REFERENCES Materias(ID_Materia);

alter table Alunos
drop CONSTRAINT FK_ID_Notas

-- Inserindo alguns dados:

-- Dados de alunos:
INSERT INTO Alunos(ID_Aluno, NomeCompletoAluno, IdadeAluno, CPF, RG, ID_Notas)
VALUES
	(1, 'Henrique Cardoso Santos', 16, 11122233344, 112223334, 1),
	(2, 'Jorge Garcia Pereira', 15, 12122233344, 122223334, 2),
	(3, 'Camilla Cristica Silva', 17, 13122233344, 132223334, 3),
	(4, 'Rafaela Campos Pinho', 16, 14122233344, 142223334, 4),
	(5, 'Pedro Figueiras Souza', 16, 15122233344, 152223334, 5),
	(6, 'Gabriel Matias Toledo', 17, 16122233344, 112223334, 6),
	(7, 'Ana Beatriz Strogonoff Gagliaso', 16, 17122233344, 112227334, 7),
	(8, 'Val�ria Rodrigues Pinheiro', 16, 12222233344, 112553334, 8)

-- Dados das Notas:
INSERT INTO Notas(ID_Notas, ID_Aluno, Lingua_Portuguesa, Matematica, Historia, Geografia, Fisica, Quimica, Biologia)
VALUES
	(1, 1, 9.0, 8.5, 9.2, 9.1, 8.9, 9.7, 8.7),
	(2, 2, 8.8, 8.7, 8.4, 8.5, 8.4, 8.1, 8.3),
	(3, 3, 6.9, 6.0, 7.0, 6.5, 6.1, 6.8, 7.2),
	(4, 4, 10.0, 9.9, 10.0, 10.0, 9.7, 9.9, 10.0),
	(5, 5, 7.0, 10.0, 7.8, 7.5, 10.0, 9.9, 8.7),
	(6, 6, 9.5, 6.5, 9.2, 9.0, 6.9, 6.7, 8.0),
	(7, 7, 9.3, 8.0, 9.9, 7.1, 5.9, 8.7, 7.7),
	(8, 8, 5.8, 6.5, 7.2, 8.1, 4.9, 7.7, 6.7)

INSERT INTO Professores(ID_Professor, NomeCompletoProfessor, IdadeProfessor,CPF, RG, DataContratacao, DataDemissao, Telefone, Email, Materia)
VALUES
	(1, 'Carlos Rodrigues', 40, '11133344422', '223334445', '28-10-2024 14:30:00', NULL, '11999998888', 'carlosroberto123@gmail.com', 'Lingua Portuguesa'),
	(2, 'Marcela Antunes', 35, '21133344422', '723334445', '28-10-2024 14:30:00', NULL, '11989998888', 'marcela123@gmail.com', 'Matem�tica'),
	(3, 'Roberto Fraga', 57, '31133344422', '923334445', '28-10-2024 14:30:00', NULL, '11979998888', 'roberto123@gmail.com', 'Hist�ria'),
	(4, 'Carolina do Norte Siva', 27, '51133344232', '723344455', '28-10-2024 14:30:00', NULL, '11969998888', 'carolina123@gmail.com', 'Geografia'),
	(5, 'Marcos Toledo', 44, '81133344422', '553344455', '28-10-2024 14:30:00', NULL, '11959998888', 'marcos123@gmail.com', 'F�sica'),
	(6, 'Michelle Obama', 69, '21133344422', '623344455', '28-10-2024 14:30:00', NULL, '11949998888', 'michelle123@gmail.com', 'Qu�mica'),
	(7, 'Carmen Salvador', 50, '51133394422', '666644455', '28-10-2024 14:30:00', NULL, '11939998888', 'carmen123@outlook.com', 'Biologia')


INSERT INTO Materias(ID_Materia, Materia)
VALUES
	(1, 'Lingua_Portuguesa'),
	(2, 'Matematica'),
	(3, 'Historia'),
	(4, 'Geografia'), 
	(5, 'Fisica'),
	(6, 'Quimica'),
	(7, 'Biologia')

-- Verificando tabelas:
select *
from Alunos

select *
from Notas

select *
from Professores


-- Criando uma tabela que relaciona os alunos com suas respectivas notas: USANDO AS VIEWS
CREATE VIEW vw_Boletim  AS
SELECT
	NomeCompletoAluno,
	IdadeAluno,
	CPF,
	Lingua_Portuguesa,
	Matematica,
	Historia,
	Geografia,
	Fisica,
	Quimica,
	Biologia
FROM Alunos

INNER JOIN
	Notas
ON Alunos.ID_Notas = Notas.ID_Notas


SELECT *
FROM vw_Boletim


-- Criando uma tabela que faz a m�dia de notas para cada mat�ria: USANDO UMA CTE
WITH Media_Notas_CTE AS (
SELECT
	AVG(Lingua_Portuguesa) AS 'Media_Notas_LP'
FROM Notas
)
	SELECT
		NomeCompletoProfessor
	FROM Professores
	GROUP BY 'Media_Notas_LP'

-- Criando tabela com soma das notas de cada mat�ria(objetivo: encontrar a mat�ria com maiores notas): USANDO WINDOW FUNCTION (SUM)
SELECT 
	SUM(Lingua_Portuguesa) AS Lingua_Portuguesa,
	SUM(Matematica) AS Matematica,
	SUM(Historia) AS Historia,
	SUM(Geografia) AS Geografia,
	SUM(Fisica) AS Fisica,
	SUM(Quimica) AS Quimica,
	SUM(Biologia) AS Biologia
FROM Notas


-- Criando uma function que analisa a nota e avalia se o aluno foi aprovado:
CREATE FUNCTION fn_Conclusao_Semestre (@var_aluno VARCHAR(20))
RETURNS VARCHAR(20)

BEGIN
    DECLARE @var_nota
	SET @var_nota = (SELECT @var_materia FROM Notas)
	

    RETURN @var_Valor_Total;
END;


-- Criando um TRIGGER para impedir que alguma coluna seja apagada:
CREATE OR ALTER TRIGGER Seguranca_Delete_Alunos
ON Alunos
INSTEAD OF DELETE
AS
BEGIN
	PRINT 'Esses dados n�o podem ser deletados!'
END
GO

CREATE OR ALTER TRIGGER Seguranca_Delete_Professores
ON Professores
INSTEAD OF DELETE
AS
BEGIN
	PRINT 'Esses dados n�o podem ser deletados!'
END
GO

CREATE OR ALTER TRIGGER Seguranca_Delete_Notas
ON Notas
INSTEAD OF DELETE
AS
BEGIN
	PRINT 'Esses dados n�o podem ser deletados!'
END
GO

-- Otimizando a forma de inserir dados dos alunos: Usando uma PROCEDURE
IF EXISTS (SELECT 1 FROM SYS.objects WHERE TYPE = 'P' AND NAME = 'SP_ADD_Aluno')
BEGIN
DROP PROCEDURE SP_ADD_Aluno
END
GO

CREATE PROCEDURE SP_ADD_Aluno
@ID_Aluno INT,
@NomeCompletoAluno VARCHAR(100),
@IdadeAluno INT,
@CPF VARCHAR(11),
@RG VARCHAR(9),
@ID_Notas INT
   
AS
    INSERT INTO Alunos(ID_Aluno, NomeCompletoAluno, IdadeAluno, CPF, RG, ID_Notas)
    VALUES (@ID_Aluno, @NomeCompletoAluno, @IdadeAluno, @CPF, @RG, @ID_Notas);
GO

EXEC SP_ADD_Aluno
@ID_Aluno = 9,
@NomeCompletoAluno = 'Corn�lios Rezendo Macedo',
@IdadeAluno = 17,
@CPF = 66677788899,
@RG = 667773332,
@ID_Notas = 9

-- Verificando a adi��o da procedure:
select *
from Alunos


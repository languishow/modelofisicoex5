create database cursos;

use cursos;

create table cursos (
CursoID int primary key,
NomeCurso varchar(255) unique not null,
Professor varchar(255) not null,
DataInicio date not null,
DataFim date 
);

insert into cursos (CursoID,NomeCurso,Professor,DataInicio,DataFim) values
('1', "TI", "Ricardo", "2014-06-05", "2015-12-10"),
('2', "ADS", "Linaldo", "2015-06-05", "2016-12-10"),
('3', "REDES", "Carlos", "2016-06-05", "2017-12-10"),
('4', "MECATRONICA", "Anderson", "2017-06-05", "2018-12-10"),
('5', "ADMINISTRACAO", "Michael", "2018-06-05", "2019-12-10");

create table alunos (
Matricula int primary key,
NomeAluno varchar(255) not null,
DataNascimento date not null,
Endereco varchar (255) not null,
Telefone varchar(15) 
);

insert into alunos (Matricula,NomeAluno,DataNascimento,Endereco,Telefone) values
("101", "Gabriel", "2003-06-05", "Ribeira", "71992020375"),
("102", "Diogo", "2002-02-05", "Massaranduba", "71992020374"),
("103", "Matheus", "2003-08-05", "Bonfim", "71992020373"),
("104", "Diego", "2005-04-05", "Teresinha", "71992020372"),
("105", "Gustavo", "2004-07-05", "Brotas", "71992020371");

create table inscricoes (
InscricaoID int primary key,
MatriculaAluno int,
CursoID int,
foreign key (MatriculaAluno) references alunos (Matricula),
foreign key (CursoID) references cursos (CursoID)
);

insert into inscricoes (InscricaoID,MatriculaAluno,CursoID) values
(1, 101 , 1),
(2, 102 , 2),
(3, 103, 3),
(4, 104 , 4),
(5, 105 , 5);

SELECT Alunos.NomeAluno, Cursos.NomeCurso
FROM Alunos
JOIN Inscricoes ON Alunos.Matricula = Inscricoes.MatriculaAluno
JOIN Cursos ON Inscricoes.CursoID = Cursos.CursoID;

drop database cursos;
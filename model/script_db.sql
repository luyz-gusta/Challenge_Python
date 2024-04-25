create database db_challenge_formulae;

use db_challenge_formulae;

create table tbl_question_quiz_py(
	id int not null auto_increment primary key,
	question text not null,
    
    unique index(id)
);
#drop table tbl_question_quiz_py;

create table tbl_response_quiz_py(
	id int not null auto_increment primary key,
    id_question int not null,
	response varchar(80) not null,
    is_true bit not null,
    
	constraint FK_question_response
    foreign key (id_question)
    references tbl_question_quiz_py(id),
    
    unique index(id)
);

create table tbl_ranking_quiz_py(
	id int not null auto_increment primary key,
	user_name varchar(50) not null,
    points int not null,
    
    unique index(id)
);

-- Pergunta 1
insert into tbl_question_quiz_py(question) values ('Qual é a sigla da Fórmula E?');

-- Respostas da Pergunta 1
insert into tbl_response_quiz_py(response, id_question, is_true) values ('FE', 1, true);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('F1E', 1, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('FEE', 1, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('FIAE', 1, false);

-- Pergunta 2
insert into tbl_question_quiz_py(question) values ('Em que ano a Fórmula E realizou sua primeira temporada?');

-- Respostas da Pergunta 2
insert into tbl_response_quiz_py(response, id_question, is_true) values ('2013-2014', 2, true);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('2014-2015', 2, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('2015-2016', 2, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('2016-2017', 2, false);

-- Pergunta 3
insert into tbl_question_quiz_py(question) values ('Qual é a duração aproximada de uma corrida na Fórmula E?');

-- Respostas da Pergunta 3
insert into tbl_response_quiz_py(response, id_question, is_true) values ('1 hora', 3, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('30 minutos', 3, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('45 minutos', 3, true);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('2 horas', 3, false);

-- Pergunta 4
insert into tbl_question_quiz_py(question) values ('Qual é a velocidade máxima dos carros da Fórmula E?');

-- Respostas da Pergunta 4
insert into tbl_response_quiz_py(response, id_question, is_true) values ('280 km/h', 4, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('220 km/h', 4, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('300 km/h', 4, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('250 km/h', 4, true);

-- Pergunta 5
insert into tbl_question_quiz_py(question) values ('Qual é a marca de pneus oficial da Fórmula E?');

-- Respostas da Pergunta 5
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Michelin', 5, true);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Pirelli', 5, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Bridgestone', 5, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Continental', 5, false);

-- Pergunta 6
insert into tbl_question_quiz_py(question) values ('Quantos títulos de pilotos já foram disputados na Fórmula E até o momento?');

-- Respostas da Pergunta 6
insert into tbl_response_quiz_py(response, id_question, is_true) values ('5', 6, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('6', 6, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('8', 6, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('7', 6, true);

-- Pergunta 7
insert into tbl_question_quiz_py(question) values ('Qual é o nome do circuito de rua em Nova York, onde a Fórmula E realiza uma corrida?');

-- Respostas da Pergunta 7
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Brooklyn Circuit', 7, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Manhattan Street Circuit', 7, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('New York City Circuit', 7, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Brooklyn Street Circuit', 7, true);

-- Pergunta 8
insert into tbl_question_quiz_py(question) values ('Quem é o atual campeão de pilotos na Fórmula E?');

-- Respostas da Pergunta 8
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Lucas di Grassi', 8, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Sébastien Buemi', 8, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Jean-Éric Vergne', 8, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('António Félix da Costa', 8, true);

-- Pergunta 9
insert into tbl_question_quiz_py(question) values ('Qual é a nacionalidade da equipe DS Techeetah?');

-- Respostas da Pergunta 9
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Francesa', 9, true);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Alemã', 9, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Britânica', 9, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Chinesa', 9, false);

-- Pergunta 10
insert into tbl_question_quiz_py(question) values ('Qual é a potência máxima do motor dos carros da Fórmula E durante as corridas?');

-- Respostas da Pergunta 10
insert into tbl_response_quiz_py(response, id_question, is_true) values ('250 kW', 10, true);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('200 kW', 10, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('300 kW', 10, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('180 kW', 10, false);

-- Pergunta 11
insert into tbl_question_quiz_py(question) values ('Qual é o sistema de pontuação utilizado na Fórmula E para a corrida e a pole position?');

-- Respostas da Pergunta 11
insert into tbl_response_quiz_py(response, id_question, is_true) values ('25 pontos para a vitória, 3 pontos para a pole position', 11, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('30 pontos para a vitória, 1 ponto para a pole position', 11, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('20 pontos para a vitória, 5 pontos para a pole position', 11, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('30 pontos para a vitória, 3 pontos para a pole position', 11, true);

-- Pergunta 12
insert into tbl_question_quiz_py(question) values ('Qual é o nome do troféu dado ao vencedor do campeonato de equipes na Fórmula E?');

-- Respostas da Pergunta 12
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Spark Award', 12, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Electric Cup', 12, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('E-Trophy', 12, true);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Team Championship Trophy', 12, false);

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
#drop table tbl_response_quiz_py;

create table tbl_ranking_quiz_py(
	id int not null auto_increment primary key,
	user_name varchar(20) not null,
    points int not null,
    
    unique index(id)
);

DELIMITER //

CREATE PROCEDURE getUserRankingPosition(
    IN p_username VARCHAR(50),
    in p_id int
)
BEGIN
    DECLARE posicao INT;
    SET @posicao := 0;

    SELECT
        posicao_na_ordem
    INTO
        posicao
    FROM
        (SELECT *, (@posicao := @posicao + 1) AS posicao_na_ordem FROM tbl_ranking_quiz_py ORDER BY points DESC) AS tabela_ordenada
    WHERE
        user_name = p_username and id = p_id
    LIMIT 1;

    SELECT posicao;
END//

DELIMITER ;

insert into tbl_ranking_quiz_py(user_name, points) values ('gui', 70);
insert into tbl_ranking_quiz_py(user_name, points) values ('silva', 100);
insert into tbl_ranking_quiz_py(user_name, points) values ('enzo', 60);
insert into tbl_ranking_quiz_py(user_name, points) values ('miguel', 80);
CALL getUserRankingPosition('luyz', '12');
#drop procedure getUserRankingPosition;
select * from tbl_ranking_quiz_py order by points desc;



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

-- Pergunta 13
insert into tbl_question_quiz_py(question) values ('Qual é o circuito de rua em Mônaco que faz parte do calendário da Fórmula E?');

-- Respostas da Pergunta 13
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Circuito de Mônaco', 13, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Circuito da Riviera', 13, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Circuito de Montecarlo', 13, true);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Circuito da Baía', 13, false);

-- Pergunta 14
insert into tbl_question_quiz_py(question) values ('Quem foi o primeiro piloto a vencer o campeonato de pilotos da Fórmula E?');

-- Respostas da Pergunta 14
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Nelson Piquet Jr.', 14, true);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Lucas di Grassi', 14, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Sébastien Buemi', 14, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Jean-Éric Vergne', 14, false);

-- Pergunta 15
insert into tbl_question_quiz_py(question) values ('Quantas equipes competiram na primeira temporada da Fórmula E?');

-- Respostas da Pergunta 15
insert into tbl_response_quiz_py(response, id_question, is_true) values ('10', 15, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('8', 15, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('12', 15, true);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('6', 15, false);

-- Pergunta 16
insert into tbl_question_quiz_py(question) values ('Qual é o sistema de recarga utilizado pelos carros da Fórmula E durante as corridas?');

-- Respostas da Pergunta 16
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Troca de carro', 16, true);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Recarga por indução', 16, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Recarga por painéis solares', 16, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Recarga por cabo de alta tensão', 16, false);

-- Pergunta 17
insert into tbl_question_quiz_py(question) values ('Qual é o país que mais sediou corridas da Fórmula E até o momento?');

-- Respostas da Pergunta 17
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Estados Unidos', 17, true);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Alemanha', 17, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('França', 17, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Reino Unido', 17, false);

-- Pergunta 18
insert into tbl_question_quiz_py(question) values ('Qual é o ex-piloto de Fórmula 1 que fundou a equipe Venturi Racing na Fórmula E?');

-- Respostas da Pergunta 18
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Gildo Pastor', 18, true);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Alain Prost', 18, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Nelson Piquet Jr.', 18, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Michael Schumacher', 18, false);

-- Pergunta 19
insert into tbl_question_quiz_py(question) values ('Qual é o nome do sistema de regeneração de energia usado pelos carros da Fórmula E?');

-- Respostas da Pergunta 19
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Sistema de Recuperação de Energia Cinética (KERS)', 19, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Sistema de Recuperação de Energia Térmica (TERS)', 19, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Sistema de Recuperação de Energia de Travagem (BERS)', 19, true);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Sistema de Recuperação de Energia Solar (SERS)', 19, false);

-- Pergunta 20
insert into tbl_question_quiz_py(question) values ('Qual é o nome do prêmio dado ao piloto que faz a volta mais rápida durante a corrida na Fórmula E?');

-- Respostas da Pergunta 20
insert into tbl_response_quiz_py(response, id_question, is_true) values ('E-Prix Fastest Lap Award', 20, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('Speed Trophy', 20, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('FanBoost Prize', 20, false);
insert into tbl_response_quiz_py(response, id_question, is_true) values ('TAG Heuer Fastest Lap Award', 20, true);
select * from campeonato_brasileiro_full


select * from campeonato_brasileiro_cartoes cbc
where cartao = 'Amarelo'

select * from campeonato_brasileiro_cartoes cbc
where cartao = 'Vermelho'

select first_value(uf)
over(order by estado) , estado, latitude, longitude from latlong
where uf = 'RJ'

select *  from campeonato_brasileiro_gols cbg 
where tipo_de_gol ='Penalty'


select *  from campeonato_brasileiro_gols cbg 
where tipo_de_gol ='Gol Contra'

select *  from campeonato_brasileiro_gols cbg 
where tipo_de_gol is null

select * from campeonato_brasileiro_estatisticas_full cbef 

select * from campeonato_brasileiro_classificacao_2003_2022

select * from campeonato_brasileiro_classificacao_2023

select * from campeonato_brasileiro_rodadas_2003_2022

select * from campeonato_brasileiro_rodadas_2023



CREATE TABLE campeonato_brasileiro_classificacao_2003_2022 (
    Time varchar(255),
    Temporada int,
    Rodada int,
    Posicao int,
    Pontos int,
    Vitoria int,
    Derrota int,
    Empate int,
    Gols_pro int,
    Gols_contra int,
    Saldo_de_gols int,
    Vitorias_consecutivas int,
    Derrotas_consecutivas int,
    Jogos_marcando int,
    Jogos_sem_sofrer_gols int

);



CREATE TABLE campeonato_brasileiro_classificacao_2023 (
    Time varchar(255),
    Temporada int,
    Rodada int,
    Posicao int,
    Pontos int,
    Vitoria int,
    Derrota int,
    Empate int,
    Gols_pro int,
    Gols_contra int,
    Saldo_de_gols int,
    Vitorias_consecutivas int,
    Derrotas_consecutivas int,
    Jogos_marcando int,
    Jogos_sem_sofrer_gols int

);




CREATE TABLE campeonato_brasileiro_rodadas_2003_2022 (
    Temporada int,
    Rodada int,
    Mandante varchar(255),
    Visitante varchar(255),
    Mandante_Placar int,
    Visitante_Placar int

);



CREATE TABLE campeonato_brasileiro_rodadas_2023 (
    Temporada int,
    Rodada int,
    Mandante varchar(255),
    Visitante varchar(255),
    Mandante_Placar int,
    Visitante_Placar int

);

uf)

SELECT estado, latitude, longitude,
FIRST_VALUE(uf) 
OVER(
ORDER BY latitude
) 
FROM latlong;


select distinct a.uf, b.latitude, b.longitude, b.estado, b.regiao from latlong a
left join 
(
select * from latlong) b
on a.uf = b.uf




select max(qtd) as qtd, formacao_mandante, rodada  from 
(
select count(formacao_mandante ) qtd, formacao_mandante,  rodada  from campeonato_brasileiro_full cbf 
where formacao_mandante is not null
group by formacao_mandante, rodada
order by rodada asc, qtd desc
)
group by formacao_mandante, rodada
order by rodada asc, qtd desc


select max(qtd) as qtd, arena from (
select count(mandante) qtd, arena , rodada from campeonato_brasileiro_full cbef 
group by arena, rodada
order by qtd desc
) 
group by arena
order by qtd desc

select * from campeonato_brasileiro_full cbef 

select * from campeonato_brasileiro_full cbef 


SELECT mode() WITHIN GROUP ( ORDER BY arena ), rodada, count(distinct arena) as qtd,  SUBSTRING(data from 7 for 10) as ANO
FROM campeonato_brasileiro_full
group by  ano, rodada



extract(year from D.dt_ficha)

-- formação mandante 
SELECT mode() WITHIN GROUP ( ORDER BY formacao_mandante ) as qtd, rodada, count(distinct formacao_mandante) as qtd,  SUBSTRING(data from 7 for 10) as ANO
FROM campeonato_brasileiro_full
where formacao_mandante is not null
group by  ano, rodada
order by ano asc, rodada asc

-- formação visitante

SELECT mode() WITHIN GROUP ( ORDER BY formacao_visitante ), rodada, count(distinct formacao_mandante) as qtd,  SUBSTRING(data from 7 for 10) as ANO
FROM campeonato_brasileiro_full
where formacao_visitante is not null
group by  ano, rodada
order by ano asc, rodada asc


 
select formacao_mandante  from campeonato_brasileiro_full

where formacao_mandante is not null


ALTER TABLE campeonato_brasileiro_full ALTER COLUMN data type date;



select sum(Pontos) , time from campeonato_brasileiro_classificacao_2023
group by time
order by pontos desc

select * from campeonato_brasileiro_classificacao_2023 

select * from (
select "ID", rodada,SUBSTRING(data from 7 for 10) as ANO, data, tecnico_mandante as tecnico from campeonato_brasileiro_full cbf 
union all
select "ID", rodada, SUBSTRING(data from 7 for 10) as ANO,data, tecnico_visitante as tecnico from campeonato_brasileiro_full cbf 
)
where tecnico is not null

select * from latlong

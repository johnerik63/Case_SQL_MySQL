USE hashtagmovie;

# --- ANÁLISES DE DADOS COM SQL --- #

-- Agrupamentos
-- Filtragem em agrupamentos
-- Subqueries
-- Criação de Views

-- Lembrando das tabelas do banco de dados...

SELECT * FROM alugueis;
SELECT * FROM atores;
SELECT * FROM atuacoes;
SELECT * FROM clientes;
SELECT * FROM filmes;

# =======        PARTE 1:        =======#
# =======  CRIANDO AGRUPAMENTOS  =======#

-- CASE 1. Você deverá começar fazendo uma análise para descobrir o preço médio de aluguel dos filmes.

SELECT AVG(preco_aluguel) as Média FROM filmes;


/*CASE 2. Agora que você sabe o preço médio para se alugar filmes na hashtagmovie, 
você deverá ir além na sua análise e descobrir qual é o preço médio para cada gênero de filme.*/

SELECT 
	genero,
    ROUND(AVG(preco_aluguel), 2) AS Media_genero,
    COUNT(*) AS total_filme
FROM filmes
GrOUP BY genero;

# =======              PARTE 2:               =======#
# =======       FILTROS EM AGRUPAMENTOS       =======#

-- Você deve alterar a consulta DO CASE 2 e considerar o seguinte cenário:

-- CASE 3: Fazer a mesma análise, mas considerando apenas os filmes com ANO_LANCAMENTO igual a 2011.

SELECT 
	genero,
    ROUND(AVG(preco_aluguel), 2) AS Media_genero,
    COUNT(*) AS total_filme
FROM filmes WHERE ano_lancamento = 2011
GROUP BY genero;


# =======                         PARTE 3:                           =======#
# =======  SUBQUERIES: UTILIZANDO UM SELECT DENTRO DE OUTRO SELECT   =======#

/*CASE 4. Você precisará fazer uma análise de desempenho dos alugueis.
 Para isso, uma análise comum é identificar quais aluguéis tiveram nota acima da média. Você seria capaz de fazer isso?*/

SELECT AVG(nota) FROM alugueis; -- 7.94

SELECT nota FROM alugueis
 WHERE nota >= (SELECT AVG(nota) FROM alugueis);


# =======           PARTE 4:             =======#
# =======  Criando Views - CREATE VIEW   =======#

-- CREATE/DROP VIEW: Guardando o resultado de uma consulta no nosso banco de dados

-- CASE 5. Crie uma view para guardar o resultado do SELECT abaixo.

CREATE VIEW resultado AS
SELECT
	genero,
	ROUND(AVG(preco_aluguel), 2) AS media_preco,
    COUNT(*) AS qtd_filmes
FROM filmes
GROUP BY genero;

SELECT * FROM resultado;


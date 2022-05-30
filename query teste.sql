-- 1. Com base no modelo acima, escreva um comando SQL que liste a quantidade de processos por Status com sua descrição.

SELECT COUNT(a.idStatus) AS QuantidadeProcessos, b.dsStatus FROM tb_processo AS a
INNER JOIN tb_Status AS b ON a.idStatus = b.idStatus GROUP BY(b.dsStatus);


-- 2. Com base no modelo acima, construa um comando SQL que liste a maior data de andamento por número de processo, com processos encerrados no ano de 2013.

SELECT MAX(a.dtAndamento) FROM tb_Andamento AS a  
INNER JOIN  tb_processo AS b on b.idProcesso = a.idProcesso 
and b.dtEncerramento > '2013-01-01';


-- 3.Com base no modelo acima, construa um comando SQL que liste a quantidade de Data de Encerramento agrupada por ela mesma onde a quantidade da contagem seja maior que 5.

SELECT a.dtEncerramento FROM tb_processo a
GROUP BY dtEncerramento HAVING COUNT(a.dtEncerramento) > 5;


-- 4. Possuímos um número de identificação do processo, onde o mesmo contém 12 caracteres com zero à esquerda,
--    contudo nosso modelo e dados ele é apresentado como bigint. Como fazer para apresenta-lo com 12 caracteres considerando os zeros a esquerda?

SELECT REPLICATE ('0', (12 - LEN(nroProcesso))) + CAST(nroProcesso AS VARCHAR(12)) AS nroProcesso
FROM tb_processo;
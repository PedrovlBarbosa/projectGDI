---- ALTER TABLE: adiciona atributo validade para indicar se o desconto está válido.
ALTER TABLE Desconto
ADD (validade char(1)) DEFAULT '1';

---- create index
CREATE INDEX indice_nome ON Pessoa(nome);

--- update
UPDATE Pessoa
	SET email = 'joao.s@hotmail.com'
	WHERE email = 'joao.silva@gmail.com'

---- delete from 


---- select
SELECT id_cliente, matricula_funcionario, chassis_carro, data_venda
	FROM Vender_Promo WHERE (valor >= 7000);

---- between
SELECT cpf, nome, salario FROM Pessoa, Funcionario
	WHERE Pessoa.cpf = Funcionario.cpf_funcionario AND
	idade BETWEEN 25 AND 35;

---- IN
SELECT P.nome AS Nome, F.salario AS Salário
	FROM Pessoa P
	INNER JOIN Funcionario F
	ON P.cpf = F.cpf_funcionario
WHERE F.salario IN (2000, 3000)
ORDER BY salario;

----- avg
SELECT ROUND(AVG(P.idade)) AS Media_idade_Funcionarios FROM Pessoa P
	INNER JOIN Funcionario F
	ON F.cpf_funcionario = P.cpf;

----- null ou is not null
UPDATE Endereco SET complemento = 'SEM COMPLEMENTO' 
WHERE complemento IS NULL;

--- INNER JOIN
SELECT P.nome, P.idade FROM Pessoa P
	INNER JOIN Funcionario F
	ON P.cpf = F.cpf_funcionario;

-- ORDER BY
SELECT salario FROM Funcionario
ORDER BY salario DESC;

---- min
SELECT MIN(salario)
	FROM Funcionario;

---- LIKE
SELECT F.nome FROM Fabrica F
	INNER JOIN Carro C
    ON F.cnpj = C.cnpj_fabrica
WHERE C.chassi LIKE '00003';

---- MAX
SELECT MAX(idade) 
	FROM Pessoa;

---- COUNT
SELECT COUNT(CASE WHEN IDADE >25 THEN 1 END) AS Maiores_25
	FROM PESSOA;

---- LEFT JOIN
SELECT P.nome, E.rua, E.bairro, T.numero FROM Pessoa P
	INNER JOIN Endereco E ON P.cep = E.cep 
	LEFT OUTER JOIN Telefone_pessoa T ON P.cpf = T.cpf_pessoa 
	WHERE P.idade >= 25;


---- SUBCONSULTA COM OPERADOR RELACIONAL, AVG, ORDER BY 
SELECT matricula, cpf_funcionario
FROM Funcionario
WHERE
    salario> (
        SELECT
            AVG(SALARIO)
            FROM Funcionario
    )
ORDER BY SALARIO;

--CREATE VIEW
CREATE VIEW NOM_Cliente AS  
	SELECT PESSOA.NOME, CLIENTE.cpf_cliente
		FROM Cliente INNER JOIN PESSOA 
			ON CLIENTE.cpf_cliente = PESSOA.cpf;

-- UNION  
SELECT cpf_cliente FROM Cliente
	UNION SELECT cpf_funcionario FROM Funcionario;

-- HAVING, GROUP BY
SELECT P.nome AS Nome_Funcionario, COUNT(*) AS Vendas FROM Pessoa P
	INNER JOIN Funcionario F ON P.cpf = F.cpf_funcionario
	INNER JOIN Vender_Promo VP ON F.matricula = VP.matricula_funcionario
	GROUP BY P.nome
	HAVING Count(*) > 1;

--- SUBCONSULTA COM ANY
SELECT C.Modelo, C.Ano FROM Carro C 
	WHERE C.chassi = ANY (SELECT VP.chassis_carro FROM Vender_Promo VP WHERE VP.valor > 6500);


--- SUBCONSULTA COM ALL
SELECT C.Modelo, C.Ano 
FROM Carro C 
INNER JOIN Vender_Promo VP ON C.chassi = VP.chassis_carro
INNER JOIN Desconto D ON VP.codigo_desconto = D.codigo
WHERE D.percentual_desconto > ALL (SELECT A.percentual_desconto FROM Desconto A WHERE A.codigo = 'DESC20');

--- SUBCONSULTA COM IN
SELECT Chassi, cnpj_fabrica AS Fabrica, Modelo, Ano, Cor
	FROM Carro
	WHERE Ano < '20-APR-22' AND chassi IN (SELECT chassis_carro FROM Vender_Promo 
										WHERE valor < (SELECT AVG(VALOR) FROM Vender_Promo));

--- GRANT
CREATE USER JOAO IDENTIFIED BY ABCD1234;
GRANT INSERT, DELETE ON PESSOA TO JOAO;

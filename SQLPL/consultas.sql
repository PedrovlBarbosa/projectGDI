--- update
UPDATE Pessoa
	SET email = 'joao.s@hotmail.com'
	WHERE email = 'joao.silva@gmail.com'

---- delete from 
DELETE FROM Funcionario
	WHERE Funcionario.cpf_funcionario = (
	SELECT Pessoa.cpf FROM Pessoa
WHERE email LIKE 'brenno.augusto%'
);

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

---- min
SELECT MIN(salario)
	FROM Funcionario;

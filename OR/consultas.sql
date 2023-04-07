SELECT C.Nome AS Nome, C.cpf AS CPF, C.endereco.Rua AS Rua, C.endereco.cep AS CEP, C.idade AS Idade FROM TB_CLIENTE C;

-- DEREF
SELECT C.Nome AS Nome, C.cpf AS CPF, DEREF(C.endereco).Rua AS Rua, DEREF(C.endereco).cep AS CEP, C.idade AS Idade FROM TB_CLIENTE C WHERE C.idade < 30;

-- VARRAY
SELECT F.Nome AS Nome, F.Matricula AS Matricula, F.Salario AS Salario, DEREF(F.Supervisor).Nome AS Nome_Supervisor, T.* FROM tb_funcionario F, TABLE(F.Fone_Pessoa) T WHERE F.idade < 24;

-- Nested Table
SELECT T.CNPJ_FABRICA AS Cnpj, T.NUMERO AS Numero, T.DDD AS Estado_DDD FROM TABLE(SELECT F.FONE_FABRICA FROM TB_FABRICA F WHERE F.Nome = 'chevrolet') T;


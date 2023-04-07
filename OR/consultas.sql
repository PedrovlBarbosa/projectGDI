SELECT C.Nome AS Nome, C.cpf AS CPF, C.endereco.Rua AS Rua, C.endereco.cep AS CEP, C.idade AS Idade FROM TB_CLIENTE C;

-- REF
INSERT INTO TB_ENDERECO(
    CEP,
    NUMERO,
    BAIRRO,
    RUA,
    COMPLEMENTO
) VALUES (
    '1010',
    10,
    'Bairro T',
    'rua sil',
    'da orla'
);
INSERT INTO TB_FUNCIONARIO VALUES (
    '75678952041',
    'Billie',
    42,
    'billie@gmail.com',
    TP_ARRAY_TELEFONE_PESSOA( TP_TELEFONE_PESSOA( '75678952041', '101010101', '11'), TP_TELEFONE_PESSOA( '75678952041', '999999999', '81'), TP_TELEFONE_PESSOA( '75678952041', '40028922', '81')),
    (SELECT REF(E) FROM TB_ENDERECO E WHERE E.CEP = '1010' ),
    147,
    TO_DATE('12/10/2016', 'dd/mm/yyyy'),
    1600,
    (SELECT REF(F) FROM tb_funcionario F WHERE F.Matricula = 234)
);

-- DEREF
SELECT C.Nome AS Nome, C.cpf AS CPF, DEREF(C.endereco).Rua AS Rua, DEREF(C.endereco).cep AS CEP, C.idade AS Idade FROM TB_CLIENTE C WHERE C.idade < 30;

-- VARRAY
SELECT F.Nome AS Nome, F.Matricula AS Matricula, F.Salario AS Salario, DEREF(F.Supervisor).Nome AS Nome_Supervisor, T.* FROM tb_funcionario F, TABLE(F.Fone_Pessoa) T WHERE F.idade < 43;

-- Nested Table
SELECT T.CNPJ_FABRICA AS Cnpj, T.NUMERO AS Numero, T.DDD AS Estado_DDD FROM TABLE(SELECT F.FONE_FABRICA FROM TB_FABRICA F WHERE F.Nome = 'chevrolet') T;


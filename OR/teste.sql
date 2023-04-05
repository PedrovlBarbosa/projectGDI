-- MAP MEMBER FUNCTION get_cep()
DECLARE cp tp_endereco;
BEGIN
SELECT VALUE(e) INTO cp FROM tb_endereco e
WHERE e.rua = 'rua soldadinho';
cp.get_cep();
END;
/

-- MEMBER FUNCTION get_salario()
SELECT F.GET_SALARIO() FROM tb_funcionario F WHERE F.matricula = '88587498565';

-- MEMBER PROCEDURE 
DECLARE pessoa TP_PESSOA;
BEGIN
    SELECT VALUE(P) INTO pessoa FROM tb_pessoa P WHERE P.cpf = '53267498565';
    pessoa.IMPRIMIR_INFORMACAO();
END;
/

-- OVERRIDING MEMBER PROCEDURE
DECLARE funcionario TP_FUNCIONARIO;
BEGIN
    SELECT VALUE(F) INTO funcionario FROM TB_FUNCIONARIO F WHERE F.salario = 2000;
    funcionario.IMPRIMIR_INFORMACAO();
END;
/

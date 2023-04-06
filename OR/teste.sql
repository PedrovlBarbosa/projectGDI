-- MAP MEMBER FUNCTION get_cep()
SELECT e.get_cep() FROM tb_endereco e WHERE e.rua = 'rua soldadinho';

-- MEMBER FUNCTION get_salario()
SELECT F.GET_SALARIO() FROM tb_funcionario F WHERE F.matricula = 256;

-- OVERRIDING MEMBER PROCEDURE
DECLARE funcionario TP_FUNCIONARIO;
BEGIN
    SELECT VALUE(F) INTO funcionario FROM TB_FUNCIONARIO F WHERE salario = 2000;
    funcionario.IMPRIMIR_INFORMACAO();
END;

-- OVERRIDING/ORDER MEMBER FUNCTION
DECLARE 
    aux NUMBER;
    idade1 tp_cliente;
    idade2 tp_cliente;
BEGIN
    SELECT VALUE(C) INTO idade1 FROM tb_cliente C WHERE C.CPF = '65247498565';
    SELECT VALUE(C) INTO idade2 FROM tb_cliente C WHERE C.CPF = '85624498565';
    aux := idade1.COMPARA_IDADE(idade2);
    IF aux = 1 THEN
        DBMS_OUTPUT.PUT_LINE('A idade de: ' || TO_CHAR(idade1.nome) 
                    || ' é maior que a idade de: ' || TO_CHAR(idade2.nome));
    ELSIF aux = -1 THEN 
        DBMS_OUTPUT.PUT_LINE('A idade de: ' || TO_CHAR(idade2.nome) 
                    || ' é maior que a idade de: ' || TO_CHAR(idade1.nome));            
    ELSE
        DBMS_OUTPUT.PUT_LINE('A idade de ambos são iguais.');
    END IF;
END;

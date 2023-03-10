--Listar pessoas (CURSOR (OPEN, FETCH e CLOSE), LOOP-EXIT-WHEN , RECORD)
SET serveroutput ON;
DECLARE
    TYPE REG_PESSOA IS record (Nome VARCHAR2 (30), CPF VARCHAR2 (11)); 
    V_PESSOA REG_PESSOA;
    CURSOR C_Pessoa IS
    SELECT Nome, CPF
    FROM Pessoa;
BEGIN
    OPEN C_Pessoa;

    LOOP
        FETCH C_Pessoa INTO V_PESSOA;
        EXIT WHEN C_Pessoa%NOTFOUND;

        dbms_output.put_line (
            'Nome: ' || TO_CHAR (V_PESSOA.NOME) ||
            ' CPF: ' || TO_CHAR (V_PESSOA.CPF)
        );
    END LOOP;
    CLOSE C_Pessoa;
END;
/

-- INSERIR DESCONTO (procedure, in, package, package body, %TYPE) 
CREATE OR REPLACE PACKAGE CadastroPackage
AS 
 PROCEDURE InserirDesconto(
    P_Codigo Desconto.codigo%TYPE,
    P_Percentual_desconto Desconto.percentual_desconto%TYPE
);
END CadastroPackage;
/
CREATE OR REPLACE PACKAGE BODY CadastroPackage
AS
    PROCEDURE InserirDesconto (
        P_Codigo Desconto.codigo%TYPE,
        P_Percentual_desconto Desconto.percentual_desconto%TYPE
    ) IS
    BEGIN
    INSERT INTO Desconto (codigo, percentual_desconto) VALUES (P_Codigo, P_Percentual_desconto);
    COMMIT;
    END InserirDesconto;
END CadastroPackage;
/
-- CONFIRMAÇÃO APOS INSERIR NOVO DESCONTO (Trigger comando)
CREATE OR REPLACE TRIGGER ConfirmacaoInsertDesconto 
AFTER INSERT ON Desconto
BEGIN
    dbms_output.put_line('Um novo Desconto foi inserido com sucesso');
END;

-- Procurando fabrica (TIPO TABLE, BLOCO ANONIMO, %TYPE, %ROWTYPE, IF-ELSIF, CASE-WHEN, FOR-IN-LOOP)
CREATE OR REPLACE FUNCTION procura_fabrica(nome_fabrica Fabrica.nome%TYPE)
RETURN Fabrica.nome%TYPE IS 
    RespostaBusca Fabrica.nome%TYPE;
    BEGIN
        FOR F_Fabrica IN (SELECT * FROM FABRICA) LOOP
                CASE F_Fabrica.nome
                    WHEN 'Fabrica A' THEN
                        RespostaBusca := 'Fabrica A encontrada';
                    ELSE
                        IF F_Fabrica.nome = nome_fabrica THEN
                            RespostaBusca := 'Outra fabrica foi encontrada';
                        ELSIF
                            F_Fabrica.nome <> nome_fabrica THEN
                            RespostaBusca := 'Fabrica A não encontrada';
                        END IF;
                END CASE;
            END LOOP;
        RETURN RespostaBusca;
    END;    
/

-- CREATE FUNCTION, IN
CREATE OR REPLACE FUNCTION getFuncionario(
    matricula_input IN Funcionario.matricula%TYPE
) RETURN Funcionario%ROWTYPE IS
    funcionarioRecord Funcionario%ROWTYPE;
    BEGIN
        SELECT * INTO funcionarioRecord FROM Funcionario WHERE matricula = matricula_input;
        RETURN funcionarioRecord;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END getFuncionario;
/

----- WHILE LOOP
DECLARE
  i NUMBER := 1;
  v_nome Pessoa.nome%TYPE;
BEGIN
  WHILE i <= 10 LOOP
    SELECT nome INTO v_nome FROM Pessoa WHERE idade >= 18 AND ROWNUM = i;
    DBMS_OUTPUT.PUT_LINE('Pessoa ' || i || ': ' || v_nome);
    i := i + 1;
  END LOOP;
END;
/

--- SELECT INTO
DECLARE
  v_nome VARCHAR2(100) := 'João da Silva';
  v_pessoa_id pessoa.cpf%TYPE;
BEGIN
  SELECT pessoa.cpf INTO v_pessoa_id FROM pessoa WHERE nome = v_nome;
  DBMS_OUTPUT.PUT_LINE('O ID da pessoa ' || v_nome || ' é ' || v_pessoa_id);
END;
/

--- CREATE OR REPLACE TRIGGER (LINHA)

CREATE OR REPLACE TRIGGER aumenta_salario_funcionario
    AFTER INSERT ON vender_promo
    FOR EACH ROW
DECLARE
    valor_venda vender_promo.valor%TYPE;
    salario_funcionario funcionario.salario%TYPE;
BEGIN
    SELECT valor INTO valor_venda
    FROM vender_promo
    WHERE valor= :NEW.valor;
    
    SELECT salario INTO salario_funcionario
    FROM funcionario
    WHERE matricula = :NEW.matricula_funcionario;
    
    UPDATE funcionario
    SET salario = salario_funcionario + (valor_venda * 0.1)
    WHERE matricula = :NEW.matricula_funcionario;
END;
/







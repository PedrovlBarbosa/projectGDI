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
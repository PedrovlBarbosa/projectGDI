CREATE OR REPLACE TYPE TP_ENDERECO AS
  OBJECT (
    CEP VARCHAR2(8),
    NUMERO INTEGER,
    BAIRRO VARCHAR2(10),
    RUA VARCHAR2(30),
    COMPLEMENTO VARCHAR2(30),
    FINAL MAP MEMBER FUNCTION GET_CEP RETURN VARCHAR
  );
/

ALTER TYPE TP_ENDERECO DROP ATTRIBUTE NUMERO INVALIDATE;

/

ALTER TYPE TP_ENDERECO ADD ATTRIBUTE NUMERO NUMBER CASCADE;

/

CREATE OR REPLACE TYPE BODY TP_ENDERECO AS
  FINAL MAP MEMBER FUNCTION GET_CEP RETURN VARCHAR IS
    CEP_ENDERECO VARCHAR(8) := CEP;
  BEGIN
    RETURN CEP;
  END;
END;
/

CREATE OR REPLACE TYPE TP_TELEFONE_PESSOA AS
  OBJECT (
    CPF_PESSOA VARCHAR2(11),
    NUMERO VARCHAR2(9),
    DDD VARCHAR(2)
  );
/

CREATE OR REPLACE TYPE TP_ARRAY_TELEFONE_PESSOA AS
  VARRAY(
    3
  ) OF TP_TELEFONE_PESSOA;
/

CREATE OR REPLACE TYPE TP_PESSOA AS
  OBJECT (
    CPF VARCHAR2(11),
    NOME VARCHAR2(30),
    IDADE INTEGER,
    EMAIL VARCHAR2(40),
    FONE_PESSOA TP_ARRAY_TELEFONE_PESSOA,
    ENDERECO REF TP_ENDERECO,
    MEMBER PROCEDURE IMPRIMIR_INFORMACAO,
    ORDER MEMBER FUNCTION COMPARA_IDADE ( SELF IN OUT NOCOPY TP_PESSOA, E TP_PESSOA ) RETURN NUMBER
  ) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE BODY TP_PESSOA AS
  MEMBER PROCEDURE IMPRIMIR_INFORMACAO (SELF IN OUT NOCOPY TP_PESSOA) IS
    BEGIN
      DBMS_OUTPUT.PUT_LINE('Nome: '
        || NOME);
      DBMS_OUTPUT.PUT_LINE('CPF: '
        || CPF);
      DBMS_OUTPUT.PUT_LINE('Telefone: '
        || FONE_PESSOA(0).DDD
        || FONE_PESSOA(0).NUMERO);
    END;
  ORDER MEMBER FUNCTION COMPARA_IDADE ( SELF IN OUT NOCOPY TP_PESSOA, E TP_PESSOA ) RETURN NUMBER IS
    BEGIN
      IF SELF.IDADE < E.IDADE THEN
        RETURN -1;
      ELSIF SELF.IDADE > E.IDADE THEN
        RETURN 1;
      ELSE
        RETURN 0;
      END IF;
    END;
END;
/

CREATE OR REPLACE TYPE TP_TELEFONE_FABRICA AS
  OBJECT (
    CNPJ_FABRICA VARCHAR2(14),
    NUMERO VARCHAR2(9),
    DDD VARCHAR(2)
  );
/

CREATE OR REPLACE TYPE TP_NT_TELEFONE_FABRICA AS
  TABLE OF TP_TELEFONE_FABRICA;
/

CREATE OR REPLACE TYPE TP_FABRICA AS
  OBJECT (
    CNPJ VARCHAR2(14),
    NOME VARCHAR2(30),
    EMAIL VARCHAR2(30),
    FONE_FABRICA TP_NT_TELEFONE_FABRICA,
    ENDERECO REF TP_ENDERECO
  );
/

CREATE OR REPLACE TYPE TP_FUNCIONARIO UNDER TP_PESSOA (
  MATRICULA NUMBER,
  DATA_EMISSAO DATE,
  SALARIO INTEGER,
  SUPERVISOR REF TP_FUNCIONARIO,
  CONSTRUCTOR FUNCTION TP_FUNCIONARIO (FUNCIONARIO TP_FUNCIONARIO) RETURN SELF AS RESULT,
  MEMBER FUNCTION GET_SALARIO RETURN INTEGER,
  OVERRIDING MEMBER PROCEDURE IMPRIMIR_INFORMACAO
);
/

CREATE OR REPLACE TYPE BODY TP_FUNCIONARIO AS
  CONSTRUCTOR FUNCTION TP_FUNCIONARIO ( FUNCIONARIO TP_FUNCIONARIO ) RETURN SELF AS RESULT IS
    BEGIN 
      CPF := FUNCIONARIO.CPF;
      NOME         := FUNCIONARIO.NOME;
      IDADE        := FUNCIONARIO.IDADE;
      MATRICULA    := FUNCIONARIO.MATRICULA;
      TELEFONE     := FUNCIONARIO.FONE_PESSOA;
      ENDERECO     := FUNCIONARIO.ENDERECO;
      DATA_EMISSAO := FUNCIONARIO.DATA_EMISSAO;
      SALARIO      := FUNCIONARIO.SALARIO;
      SUPERVISOR   := FUNCIONARIO.SUPERVISOR;
      RETURN;
    END;
  MEMBER FUNCTION GET_SALARIO RETURN INTEGER IS
    BEGIN
      RETURN SALARIO;
    END;
  OVERRIDING MEMBER PROCEDURE IMPRIMIR_INFORMACAO IS
    BEGIN
      DBMS_OUTPUT.PUT_LINE('CPF: '
        || CPF);
      DBMS_OUTPUT.PUT_LINE('Nome: '
        || NOME);
      DBMS_OUTPUT.PUT_LINE('Salario: '
        || SALARIO);
      DBMS_OUTPUT.PUT_LINE('Idade: '
        || IDADE);
      DBMS_OUTPUT.PUT_LINE('Data admissão: '
        || DATA_EMISSAO);
      DBMS_OUTPUT.PUT_LINE('Telefone primário: '
        || TELEFONE(0).DDD || TELEFONE(0).NUMERO );
      DBMS_OUTPUT.PUT_LINE('CPF do supervisor '
        || VALUE(SUPERVISOR).CPF);
    END;
END;
/

CREATE OR REPLACE TYPE TP_CLIENTE UNDER TP_PESSOA (
  ID_CLIENTE NUMBER
);
/

CREATE OR REPLACE TYPE TP_MODELO_CARRO AS
  OBJECT (
    MODELO VARCHAR2(10),
    CAPACIDADE INTEGER
  );
/

CREATE OR REPLACE TYPE TP_CARRO AS
  OBJECT (
    CHASSI VARCHAR2(5),
    ANO DATE,
    COR VARCHAR2(10),
    CNPJ_FABRICA REF TP_FABRICA,
    MODELO REF TP_MODELO_CARRO
  );
/

CREATE OR REPLACE TYPE TP_DESCONTO AS
  OBJECT (
    CODIGO VARCHAR2(20),
    PERCENTUAL_DESCONTO INTEGER
  );
/

CREATE OR REPLACE TYPE TP_VENDER_PROMO AS
  OBJECT (
    CODIGO VARCHAR2(20),
    DATA_VENDA TIMESTAMP,
    VALOR NUMBER(9, 2),
    CLIENTE REF TP_CLIENTE,
    FUNCIONARIO REF TP_FUNCIONARIO,
    CARRO REF TP_CARRO,
    DESCONTO TP_DESCONTO
  );
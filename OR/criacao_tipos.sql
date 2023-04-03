CREATE TYPE tp_endereco AS OBJECT (
  cep VARCHAR2(8),
  numero INTEGER,
  bairro VARCHAR2(10),
  rua VARCHAR2(30),
  complemento VARCHAR2(30),
  FINAL MAP MEMBER FUNCTION get_cep RETURN VARCHAR
);

/
ALTER TYPE tp_endereco
DROP ATTRIBUTE numero INVALIDATE;
/
ALTER TYPE tp_endereco
ADD ATTRIBUTE numero NUMBER CASCADE;
/

CREATE OR REPLACE TYPE BODY tp_endereco AS
    FINAL MAP MEMBER FUNCTION get_cep RETURN VARCHAR IS
        cep VARCHAR(50) := cep;
    BEGIN
        RETURN cep;
    END;
END;
/

CREATE TYPE tp_pessoa AS OBJECT (
  cpf VARCHAR2(11),
  nome VARCHAR2(30),
  idade INTEGER,
  email VARCHAR2(40),
  fone_pessoa tp_array_telefone,
  endereco REF tp_endereco,
  MEMBER PROCEDURE imprimir_informacao
) NOT FINAL NOT INSTANTIABLE;
/
CREATE OR REPLACE TYPE BODY tp_pessoa AS
    MEMBER PROCEDURE imprimir_informacao (SELF IN OUT NOCOPY tp_pessoa) IS
        BEGIN 
            DBMS_OUTPUT.PUT_LINE('Nome: ' || Nome);
            DBMS_OUTPUT.PUT_LINE('CPF: ' || CPF);
            DBMS_OUTPUT.PUT_LINE('Telefone: ' || fone_pessoa(0).ddd || fone_pessoa(0).Numero);
        END;

END;
/
CREATE TYPE tp_telefone_pessoa AS OBJECT (
  cpf_pessoa VARCHAR2(11),
  numero VARCHAR2(9),
  ddd VARCHAR(2)
);
/
CREATE OR REPLACE TYPE tp_array_telefone_pessoa AS VARRAY(3) OF tp_telefone_pessoa;
/
CREATE TYPE tp_fabrica AS OBJECT (
  cnpj VARCHAR2(14),
  nome VARCHAR2(30),
  email VARCHAR2(30),
  fone_fabrica tp_array_telefone
  endereco REF tp_endereco
);

CREATE TYPE tp_telefone_fabrica AS OBJECT (
  cnpj_fabrica VARCHAR2(14),
  numero VARCHAR2(9),
  ddd VARCHAR(2)
);

CREATE TYPE tp_telefone_fabrica AS OBJECT (
  cnpj_fabrica VARCHAR2(11),
  numero VARCHAR2(9),
  ddd VARCHAR(2)
);
/
CREATE OR REPLACE TYPE tp_array_telefone_fabrica AS VARRAY(3) OF tp_telefone_fabrica;
/
CREATE TYPE tp_funcionario UNDER tp_pessoa (
  matricula NUMBER,
  cpf_funcionario VARCHAR2(11),
  data_emissao DATE,
  salario INTEGER,
  supervisor REF tp_funcionario,
);

CREATE TYPE tp_cliente UNDER tp_pessoa NOT FINAL NOT INSTANTIABLE (
  id_cliente NUMBER
);

CREATE TYPE tp_modelo_carro AS OBJECT (
  modelo VARCHAR2(10),
  capacidade INTEGER
);

CREATE TYPE tp_carro AS OBJECT (
  chassi VARCHAR2(5),
  cnpj_fabrica VARCHAR(14),
  modelo tp_modelo_carro,
  ano DATE,
  cor VARCHAR2(10)
);

CREATE TYPE tp_desconto AS OBJECT (
  codigo VARCHAR2(20),
  percentual_desconto INTEGER
);

CREATE TYPE tp_vender_promo AS OBJECT (
  data_venda TIMESTAMP,
  valor NUMBER(9,2),
  cliente tp_cliente,
  funcionario tp_funcionario,
  carro tp_carro,
  desconto tp_desconto
);

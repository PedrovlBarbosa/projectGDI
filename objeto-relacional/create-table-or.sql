--- criação dos tipos
CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
	cep VARCHAR2(8),
	numero INTEGER,
	bairro VARCHAR2(10),
	rua VARCHAR2(30),
	complemento VARCHAR2(30),

MAP MEMBER FUNCTION get_cep RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY tp_endereco AS
	MAP MEMBER FUNCTION get_cep RETURN VARCHAR2 IS
    	cep VARCHAR2(8) := cep;
    BEGIN
		RETURN cep;
	END
END;
/

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
	cpf VARCHAR2(11),
	nome VARCHAR2(30),
	idade INTEGER ,
	cep VARCHAR2(8),
	email VARCHAR2(40),
  telefones tp_array_telefone,
  endereco REF tp_endereco,
) NOT FINAL NOT INSTANTIABLE;
/


--- criação das tabelas

REATE TABLE tb_endereco OF tp_endereco (
    CONSTRAINT cep_pkey PRIMARY KEY(cep)
);
/

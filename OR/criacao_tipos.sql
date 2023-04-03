CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
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

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
  cpf VARCHAR2(11),
  nome VARCHAR2(30),
  idade INTEGER,
  email VARCHAR2(40),
  fone_pessoa tp_array_telefone,
  endereco REF tp_endereco,
  MEMBER PROCEDURE imprimir_informacao,
  ORDER MEMBER FUNCTION compara_idade (
      SELF IN OUT NOCOPY tp_pessoa, e tp_pessoa
  ) RETURN NUMBER
) NOT FINAL NOT INSTANTIABLE;
/
CREATE OR REPLACE TYPE BODY tp_pessoa AS
    MEMBER PROCEDURE imprimir_informacao (SELF IN OUT NOCOPY tp_pessoa) IS
        BEGIN 
            DBMS_OUTPUT.PUT_LINE('Nome: ' || Nome);
            DBMS_OUTPUT.PUT_LINE('CPF: ' || CPF);
            DBMS_OUTPUT.PUT_LINE('Telefone: ' || fone_pessoa(0).ddd || fone_pessoa(0).Numero);
        END;

    ORDER MEMBER FUNCTION compara_idade (
        SELF IN OUT NOCOPY tp_pessoa, e tp_pessoa
    ) RETURN NUMBER IS
        BEGIN
            IF SELF.idade < e.idade THEN 
                RETURN -1;
            ELSIF SELF.idade > e.idade THEN 
                RETURN 1;
            ELSE 
                RETURN 0;
            END IF;
        END; 
END;
/
CREATE OR REPLACE TYPE tp_telefone_pessoa AS OBJECT (
  cpf_pessoa VARCHAR2(11),
  numero VARCHAR2(9),
  ddd VARCHAR(2)
);
/
CREATE OR REPLACE TYPE tp_array_telefone_pessoa AS VARRAY(3) OF tp_telefone_pessoa;
/
CREATE OR REPLACE TYPE tp_telefone_fabrica AS OBJECT (
  cnpj_fabrica VARCHAR2(14),
  numero VARCHAR2(9),
  ddd VARCHAR(2)
);
/
CREATE OR REPLACE TYPE tp_nt_telefone_fabrica AS TABLE OF tp_telefone_fabrica;
/

CREATE OR REPLACE TYPE tp_fabrica AS OBJECT (
  cnpj VARCHAR2(14),
  nome VARCHAR2(30),
  email VARCHAR2(30),
  fone_fabrica tp_nt_telefone_fabrica
  endereco REF tp_endereco
);
/
CREATE OR REPLACE TYPE tp_array_telefone_fabrica AS VARRAY(3) OF tp_telefone_fabrica;
/
CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa (
  matricula NUMBER,
  data_emissao DATE,
  salario INTEGER,
  supervisor REF tp_funcionario,
  CONSTRUCTOR FUNCTION tp_funcionario (funcionario tp_funcionario) RETURN SELF AS RESULT,
  MEMBER FUNCTION get_salario RETURN NUMBER,
  OVERRIDING MEMBER PROCEDURE imprimir_informacoes
) NOT FINAL NOT INSTANTIABLE;
/
CREATE OR REPLACE TYPE BODY tp_funcionario AS
    CONSTRUCTOR FUNCTION tp_funcionario (funcionario tp_funcionario) RETURN SELF AS RESULT IS
        BEGIN
            CPF := funcionario.CPF;
            nome := funcionario.nome;
            idade := funcionario.idade;
            matricula := funcionario.matricula;
            telefone := funcionario.telefone;
            endereco := funcionario.endereco;
            data_emissao := funcionario.data_emissao;
            salario := funcionario.salario;
            supervisor := funcionario.supervisor;
            RETURN;
        END;

    MEMBER FUNCTION get_salario RETURN NUMBER IS
        BEGIN
            RETURN salario
        END;

    OVERRIDING MEMBER PROCEDURE imprimir_informacoes IS
        BEGIN
            dbms_output.put_line('CPF: ' || cpf);
            dbms_output.put_line('Nome: ' || nome);
            dbms_output.put_line('Salario: ' || salario);
            dbms_output.put_line('Idade: ' || idade);
            dbms_output.put_line('Data admissão: ' || data_emissao);
            dbms_output.put_line('Telefone primário: ' || telefone(0));
            dbms_output.put_line('CPF do supervisor ' || VALUE(supervisor).cpf);
END;
/
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa NOT FINAL NOT INSTANTIABLE (
  id_cliente NUMBER
);

CREATE OR REPLACE TYPE tp_modelo_carro AS OBJECT (
  modelo VARCHAR2(10),
  capacidade INTEGER
);

CREATE OR REPLACE TYPE tp_carro AS OBJECT (
  chassi VARCHAR2(5),
  cnpj_fabrica VARCHAR(14),
  modelo tp_modelo_carro,
  ano DATE,
  cor VARCHAR2(10)
);

CREATE OR REPLACE TYPE tp_desconto AS OBJECT (
  codigo VARCHAR2(20),
  percentual_desconto INTEGER
);

CREATE OR REPLACE TYPE tp_vender_promo AS OBJECT (
  data_venda TIMESTAMP,
  valor NUMBER(9,2),
  cliente tp_cliente,
  funcionario tp_funcionario,
  carro tp_carro,
  desconto tp_desconto
);

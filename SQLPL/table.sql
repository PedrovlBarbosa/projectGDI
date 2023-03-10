DROP TABLE Endereco;
DROP TABLE Pessoa;
DROP TABLE Telefone_pessoa;
DROP TABLE Fabrica;
DROP TABLE Telefone_fabrica;
DROP TABLE Cliente;
DROP TABLE Modelo_Carro;
DROP TABLE Carro;
DROP TABLE Desconto;
DROP TABLE Vender_promo;


CREATE TABLE Endereco(
	cep VARCHAR2(8) NOT NULL,
	numero INTEGER,
	bairro VARCHAR2(10),
	rua VARCHAR2(30),
	complemento VARCHAR2(30),
CONSTRAINT endereco_pkey PRIMARY KEY(cep)
);

CREATE TABLE Pessoa(
	cpf VARCHAR2(11) NOT NULL,
	nome VARCHAR2(30),
	idade INTEGER CHECK(idade >= 18),
	cep VARCHAR2(8),
	email VARCHAR2(40),
CONSTRAINT pessoa_pkey PRIMARY KEY(cpf),
CONSTRAINT pessoa_fkey FOREIGN KEY(cep) REFERENCES Endereco(cep) ON DELETE CASCADE
);

CREATE TABLE Telefone_pessoa(
	cpf_pessoa VARCHAR2(11) NOT NULL,
	numero VARCHAR2(9) NOT NULL,
	ddd VARCHAR(2),
CONSTRAINT telefone_pessoa_pkey PRIMARY KEY(cpf_pessoa, numero),
CONSTRAINT telefone_pessoa_fkey FOREIGN KEY(cpf_pessoa) REFERENCES Pessoa(cpf) ON DELETE CASCADE
);

CREATE TABLE Fabrica(
	cnpj VARCHAR2(14) NOT NULL,
	nome VARCHAR2(30),
	cep VARCHAR2(8),
	email VARCHAR2(30),
CONSTRAINT fabrica_pkey PRIMARY KEY(cnpj),
CONSTRAINT fabrica_fkey FOREIGN KEY(cep) REFERENCES Endereco(cep) ON DELETE CASCADE
);

CREATE TABLE Telefone_fabrica(
	cnpj_fabrica VARCHAR2(14) NOT NULL,
	numero VARCHAR2(9) NOT NULL,
	ddd VARCHAR(2),
CONSTRAINT telefone_fabrica_pkey PRIMARY KEY(cnpj_fabrica, numero),
CONSTRAINT telefone_fabrica_fkey FOREIGN KEY(cnpj_fabrica) REFERENCES Fabrica(cnpj) ON DELETE CASCADE
);


CREATE TABLE Funcionario(
	matricula NUMBER NOT NULL,
	cpf_funcionario VARCHAR2(11),
	data_emissao DATE,
	salario INTEGER,
	matricula_supervisor NUMBER,
CONSTRAINT funcionario_pkey PRIMARY KEY(matricula),
CONSTRAINT funcionario_fkey1 FOREIGN KEY(cpf_funcionario) REFERENCES Pessoa(cpf) ON DELETE CASCADE,
CONSTRAINT funcionario_fkey2 FOREIGN KEY(matricula_supervisor) REFERENCES Funcionario(matricula) ON DELETE SET NULL
);

CREATE TABLE Cliente(
	id_cliente NUMBER NOT NULL,
	cpf_cliente VARCHAR2(11),
CONSTRAINT cliente_pkey PRIMARY KEY(id_cliente),
CONSTRAINT cliente_fkey FOREIGN KEY(cpf_cliente) REFERENCES Pessoa(cpf) ON DELETE CASCADE,
CONSTRAINT cliente_uniq UNIQUE (cpf_cliente)
);

CREATE TABLE Modelo_Carro (
	modelo VARCHAR2(10) NOT NULL,
	capacidade INTEGER,
CONSTRAINT modelo_carro_pkey PRIMARY KEY(modelo)
);

CREATE TABLE Carro(
	chassi VARCHAR2(5) NOT NULL,
	cnpj_fabrica VARCHAR(14),
	modelo VARCHAR(10),
	ano DATE,
	cor VARCHAR2(10),
CONSTRAINT carro_pkey PRIMARY KEY(chassi),
CONSTRAINT carro_fkey1 FOREIGN KEY(cnpj_fabrica) REFERENCES Fabrica(cnpj) ON DELETE CASCADE,
CONSTRAINT carro_fkey2 FOREIGN KEY(modelo) REFERENCES Modelo_Carro(modelo) ON DELETE CASCADE
);

CREATE TABLE Desconto(
	codigo VARCHAR2(20),
	percentual_desconto INTEGER,
CONSTRAINT desconto_pkey PRIMARY KEY(codigo)	
);

CREATE TABLE Vender_Promo(
	cpf_cliente VARCHAR2(11),
	matricula_funcionario NUMBER,
	chassis_carro VARCHAR(17),
	data_venda TIMESTAMP,
	valor NUMBER(9,2),
	codigo_desconto VARCHAR2(20),
CONSTRAINT vender_promo_pk PRIMARY KEY(cpf_cliente, matricula_funcionario, chassis_carro, data_venda),
CONSTRAINT vender_promo_fk_cpf_cliente FOREIGN KEY(cpf_cliente) REFERENCES Cliente(cpf_cliente) ON DELETE CASCADE,
CONSTRAINT vender_promo_fk_matricula_funcionario FOREIGN KEY(matricula_funcionario) REFERENCES Funcionario(matricula) ON DELETE CASCADE,
CONSTRAINT vender_promo_fk_chassis_carro FOREIGN KEY(chassis_carro) REFERENCES Carro(chassi) ON DELETE CASCADE,
CONSTRAINT vender_promo_fk_codigo_desconto FOREIGN KEY(codigo_desconto) REFERENCES Desconto(codigo) ON DELETE CASCADE
);

CREATE SEQUENCE id_cliente_seq
    INCREMENT BY 1 START WITH 1;

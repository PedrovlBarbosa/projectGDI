CREATE TABLE tb_endereco OF tp_endereco (
  CONSTRAINT cep_pkey PRIMARY KEY(cep)
);
/

CREATE TABLE tb_cliente OF tp_cliente (
  CONSTRAINT cliente_pkey PRIMARY KEY(id_cliente)
);
/

CREATE TABLE tb_funcionario OF tp_funcionario (
  CONSTRAINT cliente_pkey PRIMARY KEY(matricula),
  supervisor WITH ROWID REFERENCES tb_funcionario
);
/

CREATE TABLE tb_modelo_carro OF tp_modelo_carro (
  CONSTRAINT modelo_carro_pkey PRIMARY KEY(modelo)
);
/

CREATE TABLE tb_carro OF tp_carro (
  CONSTRAINT carro_pkey PRIMARY KEY(chassi) 
);
/

CREATE TABLE tb_desconto of tp_desconto (
  CONSTRAINT desconto_pkey PRIMARY KEY(codigo)
);
/

CREATE TABLE tb_vender OF tp_vender_promo(
  CONSTRAINT vender_pkey PRIMARY KEY()
);
/

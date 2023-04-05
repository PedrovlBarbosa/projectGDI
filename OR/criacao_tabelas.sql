CREATE TABLE tb_endereco OF tp_endereco (
  CONSTRAINT cep_pkey PRIMARY KEY(cep)
);
/
CREATE TABLE tb_telefone_pessoa OF tp_telefone_pessoa (
  CONSTRAINT telefone_pessoa_pkey PRIMARY KEY(cpf_pessoa)
);
/
CREATE TABLE tb_telefone_fabrica OF tp_telefone_fabrica (
  CONSTRAINT tel_fab_pkey PRIMARY KEY(cnpj_fabrica)
);

CREATE TABLE tb_cliente OF tp_cliente (
  CONSTRAINT cliente_pkey PRIMARY KEY(id_cliente)
);
/
CREATE TABLE tb_fabrica OF tp_fabrica (
    CONSTRAINT fabrica_pkey PRIMARY KEY(cnpj),
    endereco SCOPE IS tb_endereco
) NESTED TABLE fone_fabrica STORE AS st_telefone_fabrica;
/

CREATE TABLE tb_funcionario OF tp_funcionario (
  CONSTRAINT funcionario_pkey PRIMARY KEY(matricula),
  supervisor WITH ROWID REFERENCES tb_funcionario
);
/

CREATE TABLE tb_modelo_carro OF tp_modelo_carro (
  CONSTRAINT modelo_carro_pkey PRIMARY KEY(modelo)
);
/

CREATE TABLE tb_carro OF tp_carro (
  CONSTRAINT carro_pkey PRIMARY KEY(chassi), 
  modelo WITH ROWID REFERENCES tb_modelo_carro,
  cnpj_fabrica WITH ROWID REFERENCES tb_fabrica
);
/

CREATE TABLE tb_vender_promo OF tp_vender_promo (
  CONSTRAINT vender_promo_pkey PRIMARY KEY(codigo),
  cliente WITH ROWID REFERENCES tb_cliente,
  funcionario WITH ROWID REFERENCES tb_funcionario,
  carro WITH ROWID REFERENCES tb_carro
);



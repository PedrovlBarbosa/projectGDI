INSERT INTO tb_endereco VALUES ('1111', '11', 'Bairro 1', 'rua 1', 'em frente ao mercado'); 
INSERT INTO tb_endereco VALUES ('2222', '22', 'Bairro 2', 'rua 2', 'em frente ao armazem'); 
INSERT INTO tb_endereco VALUES ('3333', '33', 'Bairro 3', 'rua 3', 'em frente ao zoologico'); 
INSERT INTO tb_endereco VALUES ('4444', '44', 'Bairro 4', 'rua 4', 'em frente ao presidio'); 
INSERT INTO tb_endereco VALUES ('5555', '55', 'Bairro 5', 'rua 5', 'em frente ao predio'); 
INSERT INTO tb_endereco VALUES ('6666', '53', 'Bairro capital', 'rua soldadinho', 'proximo à capela'); 
INSERT INTO tb_endereco VALUES ('7777', '32', 'Bairro matinhos', 'rua baoba', 'proxímo à praça'); 
INSERT INTO tb_endereco VALUES ('8888', '47', 'Bairro vitoria', 'rua clodoaldo', 'em frente ao mercado'); 
INSERT INTO tb_endereco VALUES ('9999', '88', 'Bairro gueiros', 'rua silva', 'na rua da orla'); 


------------------------------------------ não precisa ----------------------------
INSERT INTO tb_telefone_pessoa(cpf_pessoa, numero, ddd) VALUES ('1111', '111111111', '81');
INSERT INTO tb_telefone_pessoa(cpf_pessoa, numero, ddd) VALUES ('2222', '222222222', '81');
INSERT INTO tb_telefone_pessoa(cpf_pessoa, numero, ddd) VALUES ('3333', '333333333', '81');
INSERT INTO tb_telefone_pessoa(cpf_pessoa, numero, ddd) VALUES ('4444', '444444444', '81');
INSERT INTO tb_telefone_pessoa(cpf_pessoa, numero, ddd) VALUES ('5555', '555555555', '81');

INSERT INTO tb_telefone_fabrica(cnpj_fabrica, numero, ddd) VALUES ('1111', '211111111', '81');
INSERT INTO tb_telefone_fabrica(cnpj_fabrica, numero, ddd) VALUES ('2222', '322222222', '91');
INSERT INTO tb_telefone_fabrica(cnpj_fabrica, numero, ddd) VALUES ('3333', '433333333', '82');
INSERT INTO tb_telefone_fabrica(cnpj_fabrica, numero, ddd) VALUES ('4444', '544444444', '16');
INSERT INTO tb_telefone_fabrica(cnpj_fabrica, numero, ddd) VALUES ('5555', '655555555', '81');
--------------------------------------------------------------------------------------------


INSERT INTO tb_fabrica VALUES ('099827371748',
                               'fiat', 
                               'fiat@gmail.com',
                              tp_nt_telefone_fabrica(
                                  tp_telefone_fabrica('99827371748',
                                                      '864759869',
                                                     '81'),
                                  tp_telefone_fabrica('99827371748',
                                                      '868859869',
                                                     '81')),
                               (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '2222' ));
                               
INSERT INTO tb_fabrica VALUES ('25684581748',
                               'renault', 
                               'renault@gmail.com',
                              tp_nt_telefone_fabrica(
                                  tp_telefone_fabrica('25684581748',
                                                      '868532147',
                                                     '81'),
                                  tp_telefone_fabrica('25684581748',
                                                      '886547269',
                                                     '81')),
                               (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '1111' ));
                               
INSERT INTO tb_fabrica VALUES ('35852147698',
                               'chevrolet', 
                               'chevrolet@gmail.com',
                              tp_nt_telefone_fabrica(
                                  tp_telefone_fabrica('35852147698',
                                                      '863232147',
                                                     '81'),
                                  tp_telefone_fabrica('35852147698',
                                                      '869877269',
                                                     '81')),
                               (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '333' ));
                               
                               
                               
INSERT INTO tb_funcionario VALUES (
        						    '12568749856','ezequiel silva',25,'ezequiel@gmail.com',
    								tp_array_telefone_pessoa(
    									tp_telefone_pessoa(
    										'12568749856',
    										'869532146',
    										'81'),
    									tp_telefone_pessoa(
    										'12568749856',
    										'869532146',
    										'81'),
    									tp_telefone_pessoa(
    										'12568749856',
    										'868532146',
    										'81')),
    								(SELECT REF(E) FROM tb_endereco E WHERE E.cep = '6666' ),
    								234, TO_DATE('09/11/2014', 'dd/mm/yyyy'), 2000, null);                               
                              

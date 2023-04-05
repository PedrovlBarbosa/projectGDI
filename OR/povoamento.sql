INSERT INTO tb_endereco(cep, numero, bairro, rua, complemento) VALUES ('1111', 11, 'Bairro 1', 'rua 1', 'em frente ao mercado'); 
INSERT INTO tb_endereco(cep, numero, bairro, rua, complemento) VALUES ('2222', 22, 'Bairro 2', 'rua 2', 'em frente ao armazem'); 
INSERT INTO tb_endereco(cep, numero, bairro, rua, complemento) VALUES ('3333', 33, 'Bairro 3', 'rua 3', 'em frente ao zoologico'); 
INSERT INTO tb_endereco(cep, numero, bairro, rua, complemento) VALUES ('4444', 44, 'Bairro 4', 'rua 4', 'em frente ao presidio'); 
INSERT INTO tb_endereco(cep, numero, bairro, rua, complemento) VALUES ('5555', 55, 'Bairro 5', 'rua 5', 'em frente ao predio'); 
INSERT INTO tb_endereco(cep, numero, bairro, rua, complemento) VALUES ('6666', 53, 'Bairro c', 'rua soldadinho', 'proximo à capela'); 
INSERT INTO tb_endereco(cep, numero, bairro, rua, complemento) VALUES ('7777', 32, 'Bairro m', 'rua baoba', 'proxímo à praça'); 
INSERT INTO tb_endereco(cep, numero, bairro, rua, complemento) VALUES ('8888', 47, 'Bairro v', 'rua clodoaldo', 'em frente ao mercado'); 
INSERT INTO tb_endereco(cep, numero, bairro, rua, complemento) VALUES ('9999', 88, 'Bairro g', 'rua silva', 'na rua da orla'); 


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
                               (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '3333' ));
     
INSERT INTO tb_cliente VALUES (
		'53267498565','renan da towner',38,'renanzinhos2@gmail.com',
          tp_array_telefone_pessoa(
            tp_telefone_pessoa(
              '53267498565',
              '528559146',
              '81'),
            tp_telefone_pessoa(
              '53267498565',
              '961263146',
              '81')),
    	(SELECT REF(E) FROM tb_endereco E WHERE E.cep = '4444' ), 2565);

INSERT INTO tb_cliente VALUES (
		'85624498565','rogerinho do ingá',42,'rogerinho@gmail.com',
          tp_array_telefone_pessoa(
            tp_telefone_pessoa(
              '85624498565',
              '528832146',
              '81'),
            tp_telefone_pessoa(
              '85624498565',
              '897532146',
              '81')),
    	(SELECT REF(E) FROM tb_endereco E WHERE E.cep = '5555' ), 2885); 
	
INSERT INTO tb_cliente VALUES (
		'65247498565','julinho da van',22,'julinho@gmail.com',
          tp_array_telefone_pessoa(
            tp_telefone_pessoa(
              '65247498565',
              '565932146',
              '81'),
            tp_telefone_pessoa(
              '65247498565',
              '894579146',
              '81')),
    	(SELECT REF(E) FROM tb_endereco E WHERE E.cep = '6666' ), 28442); 


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
          (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '7777' ),
          234, TO_DATE('09/11/2014', 'dd/mm/yyyy'), 2000, null);                                  
                   
INSERT INTO tb_funcionario VALUES (
          '88587498565','joão de castro',22,'castro@gmail.com',
          tp_array_telefone_pessoa(
            tp_telefone_pessoa(
              '88587498565',
              '869532146',
              '81'),
            tp_telefone_pessoa(
              '88587498565',
              '632532146',
              '81')),
          (SELECT REF(E) FROM tb_endereco E WHERE E.cep = '8888' ),
          256, TO_DATE('09/11/2016', 'dd/mm/yyyy'), 2260, null); 

                          
INSERT INTO tb_modelo_carro VALUES ('Uno', 4);
INSERT INTO tb_modelo_carro VALUES ('Sandero', 5);  
INSERT INTO tb_modelo_carro VALUES ('Onix', 4);  


INSERT INTO tb_carro VALUES ('1010', TO_DATE('2016', 'yyyy'), 'Amarelo', 
                            (SELECT REF(F) FROM tb_fabrica F WHERE F.cnpj = '099827371748'),
                            (SELECT REF(M) FROM tb_modelo_carro M WHERE M.modelo = 'Uno'));
	
INSERT INTO tb_carro VALUES ('1033', TO_DATE('2022', 'yyyy'), 'Prata', 
                            (SELECT REF(F) FROM tb_fabrica F WHERE F.cnpj = '25684581748'),
                            (SELECT REF(M) FROM tb_modelo_carro M WHERE M.modelo = 'Sandero'));	

INSERT INTO tb_carro VALUES ('2563', TO_DATE('2021', 'yyyy'), 'Azul', 
                            (SELECT REF(F) FROM tb_fabrica F WHERE F.cnpj = '35852147698'),
                            (SELECT REF(M) FROM tb_modelo_carro M WHERE M.modelo = 'Onix'));	
                            
INSERT INTO tb_vender_promo VALUES ('56821479632584', 
        TO_DATE('09/12/2019', 'dd/mm/yyyy'),
        (25900.00),
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '85624498565'),
        (SELECT REF(F) FROM tb_funcionario F WHERE F.cpf = '12568749856'),
    	(SELECT REF(M) FROM tb_carro M WHERE M.chassi = '1033'),
         tp_desconto(
            '184855356',
            10));                          
                            
INSERT INTO tb_vender_promo VALUES ('58742379632584', 
        TO_DATE('09/12/2020', 'dd/mm/yyyy'),
        (59900.00),
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '53267498565'),
        (SELECT REF(F) FROM tb_funcionario F WHERE F.cpf = '12568749856'),
    	(SELECT REF(M) FROM tb_carro M WHERE M.chassi = '1010'),
         tp_desconto(
            '5525356',
            12));    
	    
INSERT INTO tb_vender_promo VALUES ('4785379632584', 
        TO_DATE('09/09/2018', 'dd/mm/yyyy'),
        (55998.00),
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '65247498565'),
        (SELECT REF(F) FROM tb_funcionario F WHERE F.cpf = '88587498565'),
    	(SELECT REF(M) FROM tb_carro M WHERE M.chassi = '2563'),
         tp_desconto(
            '4855356',
            11));                                
                            

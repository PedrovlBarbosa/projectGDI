INSERT INTO Endereco  VALUES ('01001000', 100, 'Centro', 'Rua Direita', 'casa de esquina');
INSERT INTO Endereco  VALUES ('05417010', 120, 'Pinheiros', 'Rua dos Pinheiros', 'apto 200');
INSERT INTO Endereco  VALUES ('03047000', 200, 'Belenzinho', 'Rua Siqueira Bueno', null);
INSERT INTO Endereco  VALUES ('04524010', 22, 'Itaim Bibi', 'Rua João Cachoeira', 'casa térreo');
INSERT INTO Endereco  VALUES ('01311915', 39, 'Bela Vista', 'Rua Treze de Maio', 'casa verde');
INSERT INTO Endereco  VALUES ('01088800', 16, 'Recife', 'Rua Quinze', null);
INSERT INTO Endereco  VALUES ('01885690', 15, 'Cabo', 'Rua Dois', null);
INSERT INTO Endereco  VALUES ('01056800', 77, 'Varzea', 'Rua Tres', null);
INSERT INTO Endereco  VALUES ('85788800', 22, 'Olinda', 'Rua Sete', 'casa de esquina');
INSERT INTO Endereco  VALUES ('05538800', 68, 'Prazeres', 'Rua Dez', 'proximo a padaria');
INSERT INTO Endereco  VALUES ('88988800', 99, 'Jaboatao', 'Rua Onze', null);
INSERT INTO Endereco  VALUES ('02488800', 444, 'Bairro X', 'Rua G', 'primeira da rua');
INSERT INTO Endereco  VALUES ('12345678', 400, 'Dois Irmao', 'Rua Doze', 'casa azul');
INSERT INTO Endereco  VALUES ('23456789', 400, 'Guabiraba', 'Rua Treze', null);
INSERT INTO Endereco  VALUES ('34567890', 400, 'Jazira', 'Rua Vinte', 'proximo a igreja');
INSERT INTO Endereco  VALUES ('45678901', 400, 'Afiloe', 'Rua Trinta', null);
INSERT INTO Endereco  VALUES ('56789012', 400, 'Planua', 'Rua Nove','casa de primeiro andar');


INSERT INTO Pessoa  VALUES ('11122233344', 'João da Silva', 25, '01001000', 'joao.silva@gmail.com');
INSERT INTO Pessoa  VALUES ('22233344455', 'Maria Souza', 35, '05417010', 'maria.souza@hotmail.com');
INSERT INTO Pessoa  VALUES ('33344455566', 'Pedro Rocha', 42, '03047000', 'pedro.rocha@yahoo.com');
INSERT INTO Pessoa  VALUES ('44455566677', 'Ana Santos', 28, '04524010', 'ana.santos@gmail.com');
INSERT INTO Pessoa  VALUES ('55566677788', 'Fernando Oliveira', 30, '01311915', 'fernando.oliveira@gmail.com');
INSERT INTO Pessoa  VALUES ('15234786985', 'Lucas Silveira', 22, '01088800', 'lucas.silveira@gmail.com');
INSERT INTO Pessoa  VALUES ('15234852345', 'Lucas Batista', 18, '01885690', 'lucas.batista@gmail.com');
INSERT INTO Pessoa  VALUES ('85652186985', 'Bruno Costa', 23, '01056800', 'bruno.costa@gmail.com');
INSERT INTO Pessoa  VALUES ('18532486985', 'Brenno Augusto', 43, '85788800', 'brenno.augusto@gmail.com');
INSERT INTO Pessoa  VALUES ('12324786985', 'Maria Silva', 22, '05538800', 'maria.silva@gmail.com');
INSERT INTO Pessoa  VALUES ('86524786985', 'Maria Ferreira', 24, '88988800', 'maria.ferreira@gmail.com');
INSERT INTO Pessoa  VALUES ('23144786985', 'Eduarda Gomes', 25, '02488800', 'eduarda.gomes@gmail.com');


INSERT INTO Telefone_pessoa  VALUES ('11122233344', '999988877', '11');
INSERT INTO Telefone_pessoa  VALUES ('11122233344', '88887777', '11');
INSERT INTO Telefone_pessoa  VALUES ('22233344455', '77776666', '21');
INSERT INTO Telefone_pessoa  VALUES ('33344455566', '66665555', '31');
INSERT INTO Telefone_pessoa  VALUES ('44455566677', '55554444', '41');
INSERT INTO Telefone_pessoa  VALUES ('55566677788', '44443333', '81');

INSERT INTO Fabrica  VALUES ('11111111111111', 'Fabrica A', '12345678', 'fabrica_a@example.com');
INSERT INTO Fabrica  VALUES ('22222222222222', 'Fabrica B', '23456789', 'fabrica_b@example.com');
INSERT INTO Fabrica  VALUES ('33333333333333', 'Fabrica C', '34567890', 'fabrica_c@example.com');
INSERT INTO Fabrica  VALUES ('44444444444444', 'Fabrica D', '45678901', 'fabrica_d@example.com');
INSERT INTO Fabrica  VALUES ('55555555555555', 'Fabrica E', '56789012', 'fabrica_e@example.com');

INSERT INTO Telefone_fabrica  VALUES ('11111111111111', '999999999', '11');
INSERT INTO Telefone_fabrica  VALUES ('22222222222222', '888888888', '21');
INSERT INTO Telefone_fabrica  VALUES ('33333333333333', '777777777', '31');
INSERT INTO Telefone_fabrica  VALUES ('44444444444444', '666666666', '41');
INSERT INTO Telefone_fabrica  VALUES ('44444444444444', '444444444', '41');
INSERT INTO Telefone_fabrica  VALUES ('55555555555555', '555555555', '81');

INSERT INTO Funcionario VALUES (4432,'18532486985', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 2500, null);
INSERT INTO Funcionario VALUES (1245,'85652186985', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 2000, 4432);
INSERT INTO Funcionario VALUES (2324,'23144786985', TO_DATE('2020-06-10', 'YYYY-MM-DD'), 2300, 4432);
INSERT INTO Funcionario VALUES (6786,'86524786985', TO_DATE('2019-05-03', 'YYYY-MM-DD'), 1700, 2324);
INSERT INTO Funcionario VALUES (3434,'12324786985', TO_DATE('2019-02-01', 'YYYY-MM-DD'), 1300, 6786);

INSERT INTO Cliente VALUES (id_cliente_seq.NEXTVAL, '11122233344');
INSERT INTO Cliente VALUES (id_cliente_seq.NEXTVAL, '22233344455');
INSERT INTO Cliente VALUES (id_cliente_seq.NEXTVAL, '33344455566');
INSERT INTO Cliente VALUES (id_cliente_seq.NEXTVAL, '44455566677');
INSERT INTO Cliente VALUES (id_cliente_seq.NEXTVAL, '55566677788');
INSERT INTO Cliente VALUES (id_cliente_seq.NEXTVAL, '15234786985');
INSERT INTO Cliente VALUES (id_cliente_seq.NEXTVAL, '15234852345');


-- Inserção dos modelos de carro
INSERT INTO Modelo_Carro (modelo, capacidade) VALUES ('Uno', 9);
INSERT INTO Modelo_Carro (modelo, capacidade) VALUES ('Gol', 5);
INSERT INTO Modelo_Carro (modelo, capacidade) VALUES ('Palio', 5);

-- Inserção dos carros
INSERT INTO Carro  VALUES ('00001', '11111111111111', 'Uno', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'Azul');
INSERT INTO Carro  VALUES ('00002', '33333333333333', 'Uno', TO_DATE('2020-05-01', 'YYYY-MM-DD'), 'Preto');
INSERT INTO Carro  VALUES ('00003', '22222222222222', 'Gol', TO_DATE('2022-11-21', 'YYYY-MM-DD'), 'Branco');
INSERT INTO Carro  VALUES ('00004', '44444444444444', 'Gol', TO_DATE('2015-01-01', 'YYYY-MM-DD'), 'Vermelho');
INSERT INTO Carro  VALUES ('00005', '55555555555555', 'Palio', TO_DATE('2009-01-01', 'YYYY-MM-DD'), 'Prata');
INSERT INTO Carro  VALUES ('00006', '11111111111111', 'Palio', TO_DATE('2012-02-10', 'YYYY-MM-DD'), 'Preto');


-- Inserção dos descontos
INSERT INTO Desconto VALUES ('DESC10', 10);
INSERT INTO Desconto VALUES ('DESC20', 20);
INSERT INTO Desconto VALUES ('DESC30', 30);
INSERT INTO Desconto VALUES ('DESC40', 40);
INSERT INTO Desconto VALUES ('DESC50', 50);

INSERT INTO Vender_Promo VALUES ('11122233344', 4432, '00001', TO_TIMESTAMP('2022-12-21 18:30:00','YYYY-MM-DD HH24:MI:SS'), 10000, 'DESC20');
INSERT INTO Vender_Promo VALUES ('22233344455', 2324, '00005', TO_TIMESTAMP('2022-10-20 13:42:00','YYYY-MM-DD HH24:MI:SS'), 5000, NULL);
INSERT INTO Vender_Promo VALUES ('33344455566', 6786, '00002', TO_TIMESTAMP('2022-12-21 19:45:00','YYYY-MM-DD HH24:MI:SS'), 7000, 'DESC10');
INSERT INTO Vender_Promo VALUES ('44455566677', 3434, '00003', TO_TIMESTAMP('2022-09-01 10:37:00','YYYY-MM-DD HH24:MI:SS'), 20000, NULL);
INSERT INTO Vender_Promo VALUES ('15234786985', 3434, '00006', TO_TIMESTAMP('2022-06-15 18:30:00','YYYY-MM-DD HH24:MI:SS'), 6500, 'DESC30');
INSERT INTO Vender_Promo VALUES ('15234852345', 1245, '00004', TO_TIMESTAMP('2022-10-06 09:32:00','YYYY-MM-DD HH24:MI:SS'), 5000, 'DESC40');

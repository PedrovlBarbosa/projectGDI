INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('01001000', 100, 'Centro', 'Rua Direita');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('05417010', 120, 'Pinheiros', 'Rua dos Pinheiros');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('03047000', 200, 'Belenzinho', 'Rua Siqueira Bueno');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('04524010', 22, 'Itaim Bibi', 'Rua João Cachoeira');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('01311915', 39, 'Bela Vista', 'Rua Treze de Maio');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('01088800', 16, 'Recife', 'Rua Quinze');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('01885690', 15, 'Cabo', 'Rua Dois');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('01056800', 77, 'Varzea', 'Rua Tres');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('85788800', 22, 'Olinda', 'Rua Sete');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('05538800', 68, 'Prazeres', 'Rua Dez');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('88988800', 99, 'Jaboatao', 'Rua Onze');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('02488800', 444, 'Bairro X', 'Rua G');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('12345678', 400, 'Dois Irmao', 'Rua Doze');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('23456789', 400, 'Guabiraba', 'Rua Treze');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('34567890', 400, 'Jazira', 'Rua Vinte');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('45678901', 400, 'Afiloe', 'Rua Trinta');
INSERT INTO Endereco (cep, numero, bairro, rua) VALUES ('56789012', 400, 'Planua', 'Rua Nove');


INSERT INTO Pessoa (cpf, nome, idade, cep, email) VALUES ('11122233344', 'João da Silva', 25, '01001000', 'joao.silva@gmail.com');
INSERT INTO Pessoa (cpf, nome, idade, cep, email) VALUES ('22233344455', 'Maria Souza', 35, '05417010', 'maria.souza@hotmail.com');
INSERT INTO Pessoa (cpf, nome, idade, cep, email) VALUES ('33344455566', 'Pedro Rocha', 42, '03047000', 'pedro.rocha@yahoo.com');
INSERT INTO Pessoa (cpf, nome, idade, cep, email) VALUES ('44455566677', 'Ana Santos', 28, '04524010', 'ana.santos@gmail.com');
INSERT INTO Pessoa (cpf, nome, idade, cep, email) VALUES ('55566677788', 'Fernando Oliveira', 30, '01311915', 'fernando.oliveira@gmail.com');
INSERT INTO Pessoa (cpf, nome, idade, cep, email) VALUES ('15234786985', 'Lucas Silveira', 22, '01088800', 'lucas.silveira@gmail.com');
INSERT INTO Pessoa (cpf, nome, idade, cep, email) VALUES ('15234852345', 'Lucas Batista', 18, '01885690', 'lucas.batista@gmail.com');
INSERT INTO Pessoa (cpf, nome, idade, cep, email) VALUES ('85652186985', 'Bruno Costa', 23, '01056800', 'bruno.costa@gmail.com');
INSERT INTO Pessoa (cpf, nome, idade, cep, email) VALUES ('18532486985', 'Brenno Augusto', 43, '85788800', 'brenno.augusto@gmail.com');
INSERT INTO Pessoa (cpf, nome, idade, cep, email) VALUES ('12324786985', 'Maria Silva', 22, '05538800', 'maria.silva@gmail.com');
INSERT INTO Pessoa (cpf, nome, idade, cep, email) VALUES ('86524786985', 'Maria Ferreira', 24, '88988800', 'maria.ferreira@gmail.com');
INSERT INTO Pessoa (cpf, nome, idade, cep, email) VALUES ('23144786985', 'Eduarda Gomes', 25, '02488800', 'eduarda.gomes@gmail.com');


INSERT INTO Telefone_pessoa (cpf_pessoa, numero, ddd) VALUES ('11122233344', '999988877', '11');
INSERT INTO Telefone_pessoa (cpf_pessoa, numero, ddd) VALUES ('11122233344', '88887777', '11');
INSERT INTO Telefone_pessoa (cpf_pessoa, numero, ddd) VALUES ('22233344455', '77776666', '21');
INSERT INTO Telefone_pessoa (cpf_pessoa, numero, ddd) VALUES ('33344455566', '66665555', '31');
INSERT INTO Telefone_pessoa (cpf_pessoa, numero, ddd) VALUES ('44455566677', '55554444', '41');
INSERT INTO Telefone_pessoa (cpf_pessoa, numero, ddd) VALUES ('55566677788', '44443333', '81');

INSERT INTO Fabrica (cnpj, nome, cep, email) VALUES ('11111111111111', 'Fabrica A', '12345678', 'fabrica_a@example.com');
INSERT INTO Fabrica (cnpj, nome, cep, email) VALUES ('22222222222222', 'Fabrica B', '23456789', 'fabrica_b@example.com');
INSERT INTO Fabrica (cnpj, nome, cep, email) VALUES ('33333333333333', 'Fabrica C', '34567890', 'fabrica_c@example.com');
INSERT INTO Fabrica (cnpj, nome, cep, email) VALUES ('44444444444444', 'Fabrica D', '45678901', 'fabrica_d@example.com');
INSERT INTO Fabrica (cnpj, nome, cep, email) VALUES ('55555555555555', 'Fabrica E', '56789012', 'fabrica_e@example.com');

INSERT INTO Telefone_fabrica (cnpj_fabrica, numero, ddd) VALUES ('11111111111111', '999999999', '11');
INSERT INTO Telefone_fabrica (cnpj_fabrica, numero, ddd) VALUES ('22222222222222', '888888888', '21');
INSERT INTO Telefone_fabrica (cnpj_fabrica, numero, ddd) VALUES ('33333333333333', '777777777', '31');
INSERT INTO Telefone_fabrica (cnpj_fabrica, numero, ddd) VALUES ('44444444444444', '666666666', '41');
INSERT INTO Telefone_fabrica (cnpj_fabrica, numero, ddd) VALUES ('44444444444444', '444444444', '41');
INSERT INTO Telefone_fabrica (cnpj_fabrica, numero, ddd) VALUES ('55555555555555', '555555555', '81');

INSERT INTO Cliente VALUES (id_cliente_seq.NEXTVAL, '11122233344');
INSERT INTO Cliente VALUES (id_cliente_seq.NEXTVAL, '22233344455');
INSERT INTO Cliente VALUES (id_cliente_seq.NEXTVAL, '33344455566');
INSERT INTO Cliente VALUES (id_cliente_seq.NEXTVAL, '44455566677');
INSERT INTO Cliente VALUES (id_cliente_seq.NEXTVAL, '55566677788');
INSERT INTO Cliente VALUES (id_cliente_seq.NEXTVAL, '15234786985');
INSERT INTO Cliente VALUES (id_cliente_seq.NEXTVAL, '15234852345');


-- Inserção dos modelos de carro
INSERT INTO Modelo_Carro (modelo, capacidade) VALUES ('Uno', 5);
INSERT INTO Modelo_Carro (modelo, capacidade) VALUES ('Gol', 5);
INSERT INTO Modelo_Carro (modelo, capacidade) VALUES ('Palio', 5);

-- Inserção dos carros
INSERT INTO Carro (chassi, cnpj_fabrica, modelo, ano, cor) VALUES ('00001', '11111111111111', 'Uno', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'Azul');
INSERT INTO Carro (chassi, cnpj_fabrica, modelo, ano, cor) VALUES ('00002', '33333333333333', 'Uno', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'Preto');
INSERT INTO Carro (chassi, cnpj_fabrica, modelo, ano, cor) VALUES ('00003', '22222222222222', 'Gol', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'Branco');
INSERT INTO Carro (chassi, cnpj_fabrica, modelo, ano, cor) VALUES ('00004', '44444444444444', 'Gol', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'Vermelho');
INSERT INTO Carro (chassi, cnpj_fabrica, modelo, ano, cor) VALUES ('00005', '55555555555555', 'Palio', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'Prata');
INSERT INTO Carro (chassi, cnpj_fabrica, modelo, ano, cor) VALUES ('00006', '11111111111111', 'Palio', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'Preto');


-- INSERT SESSAO

INSERT INTO sessao (id_sessao, data_e_hora) VALUES (sessao_seq.NEXTVAL, TIMESTAMP '2024-08-19 09:00:00');
INSERT INTO sessao (id_sessao, data_e_hora) VALUES (sessao_seq.NEXTVAL, TIMESTAMP '2024-08-20 10:30:00');
INSERT INTO sessao (id_sessao, data_e_hora) VALUES (sessao_seq.NEXTVAL, TIMESTAMP '2024-08-21 11:45:00');
INSERT INTO sessao (id_sessao, data_e_hora) VALUES (sessao_seq.NEXTVAL, TIMESTAMP '2024-08-22 13:00:00');
INSERT INTO sessao (id_sessao, data_e_hora) VALUES (sessao_seq.NEXTVAL, TIMESTAMP '2024-08-23 14:15:00');
INSERT INTO sessao (id_sessao, data_e_hora) VALUES (sessao_seq.NEXTVAL, TIMESTAMP '2024-08-24 15:30:00');
INSERT INTO sessao (id_sessao, data_e_hora) VALUES (sessao_seq.NEXTVAL, TIMESTAMP '2024-08-25 16:45:00');
INSERT INTO sessao (id_sessao, data_e_hora) VALUES (sessao_seq.NEXTVAL, TIMESTAMP '2024-08-26 18:00:00');
INSERT INTO sessao (id_sessao, data_e_hora) VALUES (sessao_seq.NEXTVAL, TIMESTAMP '2024-08-27 19:15:00');
INSERT INTO sessao (id_sessao, data_e_hora) VALUES (sessao_seq.NEXTVAL, TIMESTAMP '2024-08-28 20:30:00');


--INSERINDO ENDEREÇOS

INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('79096-149', 'Rua das Acácias', '123', 'Campo Grande');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('24435-341', 'Avenida Brasil', '456', 'São Gonçalo');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('69053-640', 'Rua das Flores', '789', 'Manaus');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('69088-086', 'Rua Belford Roxo', '670', 'Manaus');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('82373-258', 'Rua das Palmeiras', '101', 'Curitiba');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('60527-234', 'Avenida Beira Mar', '202', 'Fortaleza');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('39447-966', 'Rua do Rosário', '303', 'Montes Claros');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('13767-704', 'Rua Santos Dumont', '404', 'Mococa');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('45768-419', 'Rua Bahia', '505', 'Itapetinga');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('58027-392', 'Rua João Pessoa', '606', 'João Pessoa');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('01000-000', 'Rua dos Navegantes', '707', 'Cabo de Santo Agostinho');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('20230-012', 'Rua das Orquídeas', '808', 'Teresina');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('30140-110', 'Rua Bento Gonçalves', '909', 'São Borja');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('80010-123', 'Rua das Laranjeiras', '110', 'Rolândia');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('90050-002', 'Rua Nova Esperança', '111', 'Belo Horizonte');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('23456-789', 'Avenida Central', '112', 'Recife');
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade) VALUES ('70040-010', 'Rua do Comércio', '113', 'Porto Alegre');


-- INSERT EVENTO

INSERT INTO evento (id_evento, data_e_hora, duracao, qtd_pessoas) VALUES (evento_seq.NEXTVAL, TIMESTAMP '2024-08-19 08:00:00', INTERVAL '60' MINUTE, 15);
INSERT INTO evento (id_evento, data_e_hora, duracao, qtd_pessoas) VALUES (evento_seq.NEXTVAL, TIMESTAMP '2024-08-20 09:30:00', INTERVAL '90' MINUTE, 20);
INSERT INTO evento (id_evento, data_e_hora, duracao, qtd_pessoas) VALUES (evento_seq.NEXTVAL, TIMESTAMP '2024-08-21 10:45:00', INTERVAL '120' MINUTE, 18);
INSERT INTO evento (id_evento, data_e_hora, duracao, qtd_pessoas) VALUES (evento_seq.NEXTVAL, TIMESTAMP '2024-08-22 12:00:00', INTERVAL '45' MINUTE, 10);
INSERT INTO evento (id_evento, data_e_hora, duracao, qtd_pessoas) VALUES (evento_seq.NEXTVAL, TIMESTAMP '2024-08-23 13:15:00', INTERVAL '150' MINUTE, 12);
INSERT INTO evento (id_evento, data_e_hora, duracao, qtd_pessoas) VALUES (evento_seq.NEXTVAL, TIMESTAMP '2024-08-24 14:30:00', INTERVAL '180' MINUTE, 14);
INSERT INTO evento (id_evento, data_e_hora, duracao, qtd_pessoas) VALUES (evento_seq.NEXTVAL, TIMESTAMP '2024-08-25 15:45:00', INTERVAL '240' MINUTE, 20);
INSERT INTO evento (id_evento, data_e_hora, duracao, qtd_pessoas) VALUES (evento_seq.NEXTVAL, TIMESTAMP '2024-08-26 17:00:00', INTERVAL '30' MINUTE, 8);
INSERT INTO evento (id_evento, data_e_hora, duracao, qtd_pessoas) VALUES (evento_seq.NEXTVAL, TIMESTAMP '2024-08-27 18:15:00', INTERVAL '90' MINUTE, 16);
INSERT INTO evento (id_evento, data_e_hora, duracao, qtd_pessoas) VALUES (evento_seq.NEXTVAL, TIMESTAMP '2024-08-28 19:30:00', INTERVAL '120' MINUTE, 11);

-- INSERT ESPAÇOS DE TRABALHO

INSERT INTO espaco_de_trabalho (id_espaco, capacidade) VALUES (espaco_de_trabalho_seq.NEXTVAL, 1);
INSERT INTO espaco_de_trabalho (id_espaco, capacidade) VALUES (espaco_de_trabalho_seq.NEXTVAL, 2);
INSERT INTO espaco_de_trabalho (id_espaco, capacidade) VALUES (espaco_de_trabalho_seq.NEXTVAL, 3);
INSERT INTO espaco_de_trabalho (id_espaco, capacidade) VALUES (espaco_de_trabalho_seq.NEXTVAL, 5);
INSERT INTO espaco_de_trabalho (id_espaco, capacidade) VALUES (espaco_de_trabalho_seq.NEXTVAL, 10);
INSERT INTO espaco_de_trabalho (id_espaco, capacidade) VALUES (espaco_de_trabalho_seq.NEXTVAL, 15);
INSERT INTO espaco_de_trabalho (id_espaco, capacidade) VALUES (espaco_de_trabalho_seq.NEXTVAL, 20);

-- INSERT PAGAMENTO

INSERT INTO pagamento (id_pagamento, data_e_hora, nome_portador_cartao, cpf_portador_cartao, numero_cartao, codigo_seguranca_cartao, data_vencimento_cartao) 
VALUES (pagamento_seq.NEXTVAL, TIMESTAMP '2024-08-19 10:15:30', 'Ana Silva', '12345678901', '1234567812345678', '123', DATE '2025-01-01');
INSERT INTO pagamento (id_pagamento, data_e_hora, nome_portador_cartao, cpf_portador_cartao, numero_cartao, codigo_seguranca_cartao, data_vencimento_cartao) 
VALUES (pagamento_seq.NEXTVAL, TIMESTAMP '2024-08-20 11:22:45', 'Carlos Souza', '23456789012', '2345678923456789', '234', DATE '2025-02-01');
INSERT INTO pagamento (id_pagamento, data_e_hora, nome_portador_cartao, cpf_portador_cartao, numero_cartao, codigo_seguranca_cartao, data_vencimento_cartao) 
VALUES (pagamento_seq.NEXTVAL, TIMESTAMP '2024-08-21 12:33:50', 'Fernanda Oliveira', '34567890123', '3456789034567890', '345', DATE '2025-03-01');
INSERT INTO pagamento (id_pagamento, data_e_hora, nome_portador_cartao, cpf_portador_cartao, numero_cartao, codigo_seguranca_cartao, data_vencimento_cartao) 
VALUES (pagamento_seq.NEXTVAL, TIMESTAMP '2024-08-22 13:44:55', 'Joao Pereira', '45678901234', '4567890145678901', '456', DATE '2025-04-01');
INSERT INTO pagamento (id_pagamento, data_e_hora, nome_portador_cartao, cpf_portador_cartao, numero_cartao, codigo_seguranca_cartao, data_vencimento_cartao) 
VALUES (pagamento_seq.NEXTVAL, TIMESTAMP '2024-08-23 14:55:10', 'Mariana Costa', '56789012345', '5678901256789012', '567', DATE '2025-05-01');
INSERT INTO pagamento (id_pagamento, data_e_hora, nome_portador_cartao, cpf_portador_cartao, numero_cartao, codigo_seguranca_cartao, data_vencimento_cartao) 
VALUES (pagamento_seq.NEXTVAL, TIMESTAMP '2024-08-24 15:06:25', 'Roberto Almeida', '67890123456', '6789012367890123', '678', DATE '2025-06-01');
INSERT INTO pagamento (id_pagamento, data_e_hora, nome_portador_cartao, cpf_portador_cartao, numero_cartao, codigo_seguranca_cartao, data_vencimento_cartao) 
VALUES (pagamento_seq.NEXTVAL, TIMESTAMP '2024-08-25 16:17:35', 'Tatiane Lima', '78901234567', '7890123478901234', '789', DATE '2025-07-01');
INSERT INTO pagamento (id_pagamento, data_e_hora, nome_portador_cartao, cpf_portador_cartao, numero_cartao, codigo_seguranca_cartao, data_vencimento_cartao) 
VALUES (pagamento_seq.NEXTVAL, TIMESTAMP '2024-08-26 17:28:45', 'Vinícius Santos', '89012345678', '8901234589012345', '890', DATE '2025-08-01');
INSERT INTO pagamento (id_pagamento, data_e_hora, nome_portador_cartao, cpf_portador_cartao, numero_cartao, codigo_seguranca_cartao, data_vencimento_cartao) 
VALUES (pagamento_seq.NEXTVAL, TIMESTAMP '2024-08-27 18:39:55', 'Juliana Rodrigues', '90123456789', '9012345690123456', '901', DATE '2025-09-01');
INSERT INTO pagamento (id_pagamento, data_e_hora, nome_portador_cartao, cpf_portador_cartao, numero_cartao, codigo_seguranca_cartao, data_vencimento_cartao) 
VALUES (pagamento_seq.NEXTVAL, TIMESTAMP '2024-08-28 19:50:05', 'Eduardo Martins', '01234567890', '0123456701234567', '012', DATE '2025-10-01');

--INSERINDO USUARIOS

INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (580, '(49) 6724-2906', '79096-149', 'Carlos Silva');
INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (65, '(42) 9719-3411', '24435-341', 'Ana Oliveira');
INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (2, '(31) 8277-7838', '69053-640', 'João Souza');
INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (143, '(51) 8799-8300', '69088-086', 'Mariana Costa');
INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (38334, '(29) 8501-1908', '82373-258', 'Lucas Ferreira');
INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (462, '(29) 3986-3724', '60527-234', 'Bruna Santos');
INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (851, '(39) 9347-8408', '39447-966', 'Gustavo Almeida');
INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (31, '(24) 9071-3310', '13767-704', 'Laura Pereira');
INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (4, '(39) 9573-3672', '45768-419', 'Pedro Rocha');
INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (522, '(20) 3360-3052', '58027-392', 'Fernanda Lima');
INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (901, '(11) 98234-5678', '01000-000', 'Tech Innovators Inc.');
INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (702, '(21) 97345-6789', '20230-012', 'Global Ventures Ltda.');
INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (315, '(31) 99876-5432', '30140-110', 'Pioneering Solutions SA');
INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (819, '(41) 98765-4321', '80010-123', 'Innovative Enterprises LLC');
INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (237, '(51) 99654-3210', '90050-002', 'NextGen Technologies Ltd.');
INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) VALUES (118, '(61) 98456-7890', '70040-010', 'Visionary Holdings Corp.');


-- INSERT ALIMENTACAO

INSERT INTO alimentacao (cod_barras, nome, id_usuario) VALUES ('7891234567890', 'Batata Chips', 580);
INSERT INTO alimentacao (cod_barras, nome, id_usuario) VALUES ('7891234567891', 'Chocolate Amargo', 65);
INSERT INTO alimentacao (cod_barras, nome, id_usuario) VALUES ('7891234567892', 'Biscoito de Polvilho', 2);
INSERT INTO alimentacao (cod_barras, nome, id_usuario) VALUES ('7891234567893', 'Amendoim Torrado', 143);
INSERT INTO alimentacao (cod_barras, nome, id_usuario) VALUES ('7891234567894', 'Mix de Castanhas', 38334);
INSERT INTO alimentacao (cod_barras, nome, id_usuario) VALUES ('7891234567895', 'Granola Crocante', 462);
INSERT INTO alimentacao (cod_barras, nome, id_usuario) VALUES ('7891234567896', 'Cookies Integrais', 851);
INSERT INTO alimentacao (cod_barras, nome, id_usuario) VALUES ('7891234567897', 'Barrinha de Cereal', 31);
INSERT INTO alimentacao (cod_barras, nome, id_usuario) VALUES ('7891234567898', 'Frutas Desidratadas', 4);
INSERT INTO alimentacao (cod_barras, nome, id_usuario) VALUES ('7891234567899', 'Pipoca de Micro-ondas', 522);

--INSERT INTO DE PESSOAS

INSERT INTO pessoa (id_pessoa, cpf) VALUES (580, '356.845.987-10');
INSERT INTO pessoa (id_pessoa, cpf) VALUES (65, '789.654.123-87');
INSERT INTO pessoa (id_pessoa, cpf) VALUES (2, '123.456.789-00');
INSERT INTO pessoa (id_pessoa, cpf) VALUES (143, '987.654.321-23');
INSERT INTO pessoa (id_pessoa, cpf) VALUES (38334, '321.654.987-45');
INSERT INTO pessoa (id_pessoa, cpf) VALUES (462, '852.741.963-12');
INSERT INTO pessoa (id_pessoa, cpf) VALUES (851, '963.258.741-98');
INSERT INTO pessoa (id_pessoa, cpf) VALUES (31, '741.852.963-77');
INSERT INTO pessoa (id_pessoa, cpf) VALUES (4, '123.321.456-89');
INSERT INTO pessoa (id_pessoa, cpf) VALUES (522, '789.987.654-33');

-- INSERT INTO DE EMPRESAS

INSERT INTO empresa (id_empresa, cnpj) VALUES (901, '12.345.678/0001-90');
INSERT INTO empresa (id_empresa, cnpj) VALUES (702, '23.456.789/0001-01');
INSERT INTO empresa (id_empresa, cnpj) VALUES (315, '34.567.890/0001-12');
INSERT INTO empresa (id_empresa, cnpj) VALUES (819, '45.678.901/0001-23');
INSERT INTO empresa (id_empresa, cnpj) VALUES (237, '56.789.012/0001-34');
INSERT INTO empresa (id_empresa, cnpj) VALUES (118, '67.890.123/0001-45');


-- INSERT TIPO DE ESPAÇO DE TRABALHO

INSERT INTO tipo_espaco (espaco_trabalho, tipo) VALUES (1, 'Mesa Compartilhada');
INSERT INTO tipo_espaco (espaco_trabalho, tipo) VALUES (2, 'Escritório Privativo');
INSERT INTO tipo_espaco (espaco_trabalho, tipo) VALUES (3, 'Sala de Reunião');
INSERT INTO tipo_espaco (espaco_trabalho, tipo) VALUES (4, 'Sala de Reunião'); 
INSERT INTO tipo_espaco (espaco_trabalho, tipo) VALUES (5, 'Escritório Privativo'); 
INSERT INTO tipo_espaco (espaco_trabalho, tipo) VALUES (6, 'Mesa Compartilhada'); 
INSERT INTO tipo_espaco (espaco_trabalho, tipo) VALUES (7, 'Sala de Reunião'); 

-- INSERT PLANO DE ASSINATURA

INSERT INTO plano_de_assinatura (nivel, tempo, preco, plano_evoluido) VALUES ('Basic', 1, 9.99, NULL);
INSERT INTO plano_de_assinatura (nivel, tempo, preco, plano_evoluido) VALUES ('Basic', 3, 19.99, 'Premium');
INSERT INTO plano_de_assinatura (nivel, tempo, preco, plano_evoluido) VALUES ('Premium', 6, 29.99, 'Premium Plus');
INSERT INTO plano_de_assinatura (nivel, tempo, preco, plano_evoluido) VALUES ('Empresarial', 12, 49.99, NULL);
INSERT INTO plano_de_assinatura (nivel, tempo, preco, plano_evoluido) VALUES ('Basic', 24, 79.99, 'Premium Plus');
INSERT INTO plano_de_assinatura (nivel, tempo, preco, plano_evoluido) VALUES ('Basic', 36, 99.99, 'Premium Plus');

-- INSERT CONVIDADOS

INSERT INTO convidado (id_pessoa, no_convidado, id_sessao, nome_convidado) VALUES (580, 1, 1, 'João Silva');
INSERT INTO convidado (id_pessoa, no_convidado, id_sessao, nome_convidado) VALUES (65, 2, 2, 'Maria Santos');
INSERT INTO convidado (id_pessoa, no_convidado, id_sessao, nome_convidado) VALUES (2, 3, 3, 'Carlos Pereira');
INSERT INTO convidado (id_pessoa, no_convidado, id_sessao, nome_convidado) VALUES (143, 4, 4,'Ana Oliveira');
INSERT INTO convidado (id_pessoa, no_convidado, id_sessao, nome_convidado) VALUES (4, 5, 5, 'Pedro Costa');

-- INSERT RESERVA

INSERT INTO reserva (id_usuario, espaco_de_trabalho_id, id_sessao) VALUES (580, 1, 1);
INSERT INTO reserva (id_usuario, espaco_de_trabalho_id, id_sessao) VALUES (65, 2, 2);
INSERT INTO reserva (id_usuario, espaco_de_trabalho_id, id_sessao) VALUES (2, 3, 3);
INSERT INTO reserva (id_usuario, espaco_de_trabalho_id, id_sessao) VALUES (143, 4, 4);
INSERT INTO reserva (id_usuario, espaco_de_trabalho_id, id_sessao) VALUES (38334, 5, 5);
INSERT INTO reserva (id_usuario, espaco_de_trabalho_id, id_sessao) VALUES (462, 6, 6);

-- INSERT ORGANIZAR

INSERT INTO organizar (id_empresa, id_evento) VALUES (901, 1);
INSERT INTO organizar (id_empresa, id_evento) VALUES (702, 2);
INSERT INTO organizar (id_empresa, id_evento) VALUES (315, 3);
INSERT INTO organizar (id_empresa, id_evento) VALUES (819, 4);
INSERT INTO organizar (id_empresa, id_evento) VALUES (237, 5);
INSERT INTO organizar (id_empresa, id_evento) VALUES (118, 6);

-- INSERT COMPRAR

INSERT INTO comprar (data_e_hora_compra, usuario_id, id_pagamento, nivel) VALUES (TIMESTAMP '2024-08-19 10:15:30', 580, 1, 'Starter');
INSERT INTO comprar (data_e_hora_compra, usuario_id, id_pagamento, nivel) VALUES (TIMESTAMP '2024-08-20 11:22:45', 65, 2, 'Basic');
INSERT INTO comprar (data_e_hora_compra, usuario_id, id_pagamento, nivel) VALUES (TIMESTAMP '2024-08-21 12:33:50', 2, 3, 'Silver');
INSERT INTO comprar (data_e_hora_compra, usuario_id, id_pagamento, nivel) VALUES (TIMESTAMP '2024-08-22 13:44:55', 143, 4, 'Gold');
INSERT INTO comprar (data_e_hora_compra, usuario_id, id_pagamento, nivel) VALUES (TIMESTAMP '2024-08-23 14:55:10', 38334, 5, 'Platinum');

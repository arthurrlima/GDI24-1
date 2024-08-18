DROP TABLE pessoa;
DROP TABLE empresa;
DROP TABLE tipo_espaco;
DROP TABLE alimentacao;
DROP TABLE sessao;
DROP TABLE evento;
DROP TABLE pagamento;
DROP TABLE plano_de_assinatura;
DROP TABLE reserva;
DROP TABLE convidado;
DROP TABLE consumir;
DROP TABLE usuario;
DROP TABLE endereco;
DROP TABLE espaco_de_trabalho;

CREATE TABLE endereco (
    end_CEP VARCHAR2(10),
    end_rua VARCHAR2(100),
    end_numero VARCHAR2(10),
    end_cidade VARCHAR2(50),

    CONSTRAINT endereco_pk PRIMARY KEY (end_CEP)
);

CREATE TABLE usuario (
    id_usuario NUMBER,
    telefone VARCHAR2(15),
    end_CEP VARCHAR2(10),

    CONSTRAINT usuario_pk PRIMARY KEY (id_usuario),
    CONSTRAINT usuario_endereco_fk FOREIGN KEY (end_CEP) REFERENCES endereco (end_CEP)
);

CREATE TABLE pessoa (
    id_pessoa NUMBER,
    telefone VARCHAR2(15),
    cpf VARCHAR2(11) NOT NULL UNIQUE,
    end_CEP VARCHAR2(10),

    CONSTRAINT pessoa_pk PRIMARY KEY (id_pessoa),
    CONSTRAINT pessoa_endereco_fk FOREIGN KEY (end_CEP) REFERENCES endereco (end_CEP),
    CONSTRAINT pessoa_usuario_fk FOREIGN KEY (id_pessoa) REFERENCES usuario (id_usuario)
);

CREATE TABLE empresa (
    id_empresa NUMBER,
    telefone VARCHAR2(15),
    cnpj VARCHAR2(14) NOT NULL UNIQUE,
    end_CEP VARCHAR2(10),

    CONSTRAINT empresa_pk PRIMARY KEY (id_empresa),
    CONSTRAINT empresa_endereco_fk FOREIGN KEY (end_CEP) REFERENCES endereco (end_CEP),
    CONSTRAINT empresa_usuario_fk FOREIGN KEY (id_empresa) REFERENCES usuario (id_usuario)
);

CREATE TABLE espaco_de_trabalho (
    id_espaco NUMBER,      
    capacidade NUMBER NOT NULL,

    CONSTRAINT espaco_de_trabalho_pk PRIMARY KEY (id_espaco) 
);

CREATE TABLE tipo_espaco (
    espaco_trabalho NUMBER,            
    tipo_espaco VARCHAR2(50) NOT NULL, 
    CONSTRAINT tipo_espaco_pk PRIMARY KEY (espaco_trabalho, tipo_espaco),  
    CONSTRAINT espaco_trabalho_fk FOREIGN KEY (espaco_trabalho) REFERENCES espaco_de_trabalho (id_espaco)
);

CREATE TABLE alimentacao (
    cod_barras VARCHAR2(13),  
    nome VARCHAR2(100) NOT NULL,
    CONSTRAINT alimentacao_pk PRIMARY KEY (cod_barras) 
);

CREATE TABLE sessao (
    id_sessao NUMBER,
    CONSTRAINT sessao_pk PRIMARY KEY (id_sessao)
);

CREATE TABLE evento (
    id_evento NUMBER,                  
    data_e_hora TIMESTAMP NOT NULL,         
    duracao INTERVAL DAY TO SECOND NOT NULL, 
    qtd_pessoas NUMBER NOT NULL,    
    CONSTRAINT evento_pk PRIMARY KEY (id_evento)
);

CREATE TABLE pagamento (
    id_pagamento NUMBER,                             
    data_e_hora TIMESTAMP NOT NULL,                    
    nome_portador_cartão VARCHAR2(100) NOT NULL,       
    cpf_portador_cartão VARCHAR2(11) NOT NULL UNIQUE,         
    numero_cartão VARCHAR2(16) NOT NULL,               
    codigo_seguranca_cartão VARCHAR2(4) NOT NULL,      
    data_vencimento_cartão DATE NOT NULL,
    CONSTRAINT pagamento_pk PRIMARY KEY (id_pagamento)
);

CREATE TABLE plano_de_assinatura (
    nivel VARCHAR2(50),  
    tempo NUMBER NOT NULL,     
    preco DECIMAL(10, 2) NOT NULL,
    CONSTRAINT plano_de_assinatura_pk PRIMARY KEY (nivel)
);

CREATE TABLE convidado (
    id_convidado NUMBER,                     
    no_convidado NUMBER,                  
    nome_convidado VARCHAR2(100) NOT NULL, 
    PRIMARY KEY (id_convidado, no_convidado), 
    CONSTRAINT fk_usuario FOREIGN KEY (id_convidado) REFERENCES usuario (id_usuario)
);

CREATE TABLE reserva (
    usuario_id NUMBER,                              
    espaco_de_trabalho_id NUMBER,                   
    PRIMARY KEY (usuario_id, espaco_de_trabalho_id),  
    CONSTRAINT reserva_usuario_fk FOREIGN KEY (usuario_id) REFERENCES usuario (id_usuario),
    CONSTRAINT reserva_espaco_de_trabalho_fk FOREIGN KEY (espaco_de_trabalho_id) REFERENCES espaco_de_trabalho (id_espaco)
);


CREATE TABLE consumir (
    codigo_de_barras VARCHAR2(13),
    usuario_id NUMBER,  
    nome_do_produto VARCHAR2(100) NOT NULL,
    data_e_hora_consumo TIMESTAMP NOT NULL,

    CONSTRAINT consumir_pk PRIMARY KEY (codigo_de_barras),
    CONSTRAINT consumir_usuario_fk FOREIGN KEY (usuario_id) REFERENCES usuario (id_usuario)
);

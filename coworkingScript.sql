DROP TABLE endereco;
DROP TABLE sessao;
DROP TABLE evento;
DROP TABLE espaco_de_trabalho;
DROP TABLE pagamento;
DROP TABLE usuario;
DROP TABLE alimentacao;
DROP TABLE pessoa;
DROP TABLE empresa;
DROP TABLE tipo_espaco;
DROP TABLE plano_de_assinatura;
DROP TABLE convidado;
DROP TABLE reserva;
DROP TABLE organizar;

CREATE SEQUENCE sessao_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

CREATE TABLE sessao (
    id_sessao NUMBER,
    data_e_hora TIMESTAMP NOT NULL, 
    CONSTRAINT sessao_pk PRIMARY KEY (id_sessao)
);

CREATE TABLE endereco (
    end_CEP VARCHAR2(10),
    end_rua VARCHAR2(100),
    end_numero VARCHAR2(10),
    end_cidade VARCHAR2(50),

    CONSTRAINT endereco_pk PRIMARY KEY (end_CEP)
);

CREATE SEQUENCE evento_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

CREATE TABLE evento (
    id_evento NUMBER,                  
    data_e_hora TIMESTAMP NOT NULL,         
    duracao INTERVAL DAY TO SECOND NOT NULL, 
    qtd_pessoas NUMBER NOT NULL,    
    CONSTRAINT evento_pk PRIMARY KEY (id_evento)
);

CREATE SEQUENCE espaco_de_trabalho_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

CREATE TABLE espaco_de_trabalho (
    id_espaco NUMBER,      
    capacidade NUMBER NOT NULL,

    CONSTRAINT espaco_de_trabalho_pk PRIMARY KEY (id_espaco) 
);

CREATE SEQUENCE pagamento_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

CREATE TABLE pagamento (
    id_pagamento NUMBER,                             
    data_e_hora TIMESTAMP NOT NULL,                    
    nome_portador_cartao VARCHAR2(100) NOT NULL,       
    cpf_portador_cartao VARCHAR2(11) NOT NULL UNIQUE,         
    numero_cartao VARCHAR2(16) NOT NULL,               
    codigo_seguranca_cartao VARCHAR2(4) NOT NULL,      
    data_vencimento_cartao DATE NOT NULL,
    CONSTRAINT pagamento_pk PRIMARY KEY (id_pagamento)
);

CREATE SEQUENCE usuario_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

CREATE TABLE usuario (
    id_usuario NUMBER,
    telefone VARCHAR2(15),
    end_CEP VARCHAR2(10),
    cod_barras VARCHAR2(13),
    nome_usuario VARCHAR2(100),

    CONSTRAINT usuario_pk PRIMARY KEY (id_usuario),
    CONSTRAINT usuario_endereco_fk FOREIGN KEY (end_CEP) REFERENCES endereco (end_CEP)
);

CREATE TABLE alimentacao (
    cod_barras VARCHAR2(13),  
    nome VARCHAR2(100) NOT NULL,
    id_usuario NUMBER,

    CONSTRAINT alimentacao_pk PRIMARY KEY (cod_barras),
    CONSTRAINT alimentacao_usuario_fk FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

CREATE TABLE pessoa (
    id_pessoa NUMBER,
    telefone VARCHAR2(15),
    cpf VARCHAR2(100) NOT NULL UNIQUE,
    end_CEP VARCHAR2(10),

    CONSTRAINT pessoa_pk PRIMARY KEY (id_pessoa),
    CONSTRAINT pessoa_endereco_fk FOREIGN KEY (end_CEP) REFERENCES endereco (end_CEP),
    CONSTRAINT pessoa_usuario_fk FOREIGN KEY (id_pessoa) REFERENCES usuario (id_usuario)
);

CREATE SEQUENCE empresa_seq
    START WITH 1          
    INCREMENT BY 1        
    CACHE 20;              

CREATE TABLE empresa (
    id_empresa NUMBER,
    telefone VARCHAR2(15),
    cnpj VARCHAR2(100) NOT NULL UNIQUE,
    end_CEP VARCHAR2(10),

    CONSTRAINT empresa_pk PRIMARY KEY (id_empresa),
    CONSTRAINT empresa_endereco_fk FOREIGN KEY (end_CEP) REFERENCES endereco (end_CEP),
    CONSTRAINT empresa_usuario_fk FOREIGN KEY (id_empresa) REFERENCES usuario (id_usuario)
);

CREATE TABLE tipo_espaco (
    espaco_trabalho NUMBER,            
    tipo VARCHAR2(50) NOT NULL, 
    CONSTRAINT tipo_espaco_pk PRIMARY KEY (espaco_trabalho, tipo),  
    CONSTRAINT espaco_trabalho_fk FOREIGN KEY (espaco_trabalho) REFERENCES espaco_de_trabalho (id_espaco)
);

CREATE TABLE plano_de_assinatura (
    nivel VARCHAR2(50),  
    tempo NUMBER NOT NULL,     
    preco DECIMAL(10, 2) NOT NULL,
    plano_evoluido VARCHAR2(50),
    CONSTRAINT plano_de_assinatura_pk PRIMARY KEY (nivel),
    CONSTRAINT plano_de_assinatura_evoluir_fk FOREIGN KEY (plano_evoluido) REFERENCES plano_de_assinatura(nivel)
);

CREATE SEQUENCE convidado_seq
    START WITH 1          
    INCREMENT BY 1         
    CACHE 20;              

CREATE TABLE convidado (
    id_pessoa NUMBER,           
    no_convidado NUMBER,
    id_sessao NUMBER,             
    nome_convidado VARCHAR2(100) NOT NULL, 
    PRIMARY KEY (id_pessoa, no_convidado), 
    CONSTRAINT fk_convidado_pessoa FOREIGN KEY (id_pessoa) REFERENCES pessoa (id_pessoa),
    CONSTRAINT fk_convidado_sessao FOREIGN KEY (id_sessao) REFERENCES sessao (id_sessao)
);

CREATE TABLE reserva (
    id_usuario NUMBER,                              
    espaco_de_trabalho_id NUMBER,
    id_sessao NUMBER,

    PRIMARY KEY (id_usuario, espaco_de_trabalho_id),  
    CONSTRAINT reserva_usuario_fk FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    CONSTRAINT reserva_espaco_de_trabalho_fk FOREIGN KEY (espaco_de_trabalho_id) REFERENCES espaco_de_trabalho (id_espaco),
    CONSTRAINT reserva_sessao_fk FOREIGN KEY (id_sessao) REFERENCES sessao (id_sessao)
);

CREATE TABLE organizar (
    id_empresa NUMBER,
    id_evento NUMBER,
    PRIMARY KEY (id_empresa, id_evento),
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa),
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento)
);

CREATE TABLE comprar (
    data_e_hora_compra TIMESTAMP NOT NULL,                    
    usuario_id NUMBER,
    id_pagamento NUMBER,
    nivel VARCHAR2(50),

    PRIMARY KEY (usuario_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_pagamento) REFERENCES pagamento(id_pagamento),
    FOREIGN KEY (nivel) REFERENCES plano_de_assinatura(nivel)
)

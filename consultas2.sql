-- Bloco anônimo para inserção de um único registro na tabela usuario
BEGIN
    -- Inserção de um único registro
    INSERT INTO usuario (id_usuario, telefone, end_CEP, nome_usuario) 
    VALUES (999, '(84) 9945-5871', '57014-230', 'Rebeca Andrade da Silva');

    -- Mensagem para confirmar o sucesso da operação
    DBMS_OUTPUT.PUT_LINE('Registro inserido com sucesso.');
END;
/
-----------------------------------------

-- Procedimento para adicionar espaço de trabalho
CREATE OR REPLACE PROCEDURE adicionar_espaco_trabalho (
    p_capacidade IN NUMBER
) AS
BEGIN
    INSERT INTO espaco_de_trabalho (capacidade)
    VALUES (p_capacidade);
END adicionar_espaco_trabalho;
/
-----------------------------------------

-- Função para calcular total de convidados em uma sessão
CREATE OR REPLACE FUNCTION total_convidados (
    p_id_sessao IN NUMBER
) RETURN NUMBER AS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM convidado
    WHERE id_sessao = p_id_sessao;

    RETURN v_total;
END total_convidados;
/
-----------------------------------------

-- Uso de %TYPE para declarar uma variável
DECLARE
    v_cep endereco.end_CEP%TYPE;
BEGIN
    SELECT end_CEP INTO v_cep FROM usuario WHERE id_usuario = 1;
    DBMS_OUTPUT.PUT_LINE('CEP: ' || v_cep);
END;
/
-----------------------------------------

-- Uso de %ROWTYPE para capturar toda a linha de uma tabela
DECLARE
    v_usuario usuario%ROWTYPE;
BEGIN
    SELECT * INTO v_usuario FROM usuario WHERE id_usuario = 606; --
    DBMS_OUTPUT.PUT_LINE('Telefone: ' || v_usuario.telefone || ', CEP: ' || v_usuario.end_CEP);
END;
/
-----------------------------------------

-- IF ELSIF para verificar o nível de assinatura do usuário
DECLARE
    v_nivel VARCHAR2(50);
BEGIN
    SELECT nivel INTO v_nivel FROM comprar WHERE id_usuario = 1;

    IF v_nivel = 'Basic' THEN
        DBMS_OUTPUT.PUT_LINE('Plano Básico');
    ELSIF v_nivel = 'Premium' THEN
        DBMS_OUTPUT.PUT_LINE('Plano Premium');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Outro plano');
    END IF;
END;
/
-----------------------------------------

-- CASE WHEN para verificar a capacidade do espaço de trabalho
DECLARE
    v_capacidade NUMBER;
BEGIN
    SELECT capacidade INTO v_capacidade FROM espaco_de_trabalho WHERE id_espaco = 1;

    CASE
        WHEN v_capacidade < 10 THEN
            DBMS_OUTPUT.PUT_LINE('Espaço pequeno');
        WHEN v_capacidade BETWEEN 10 AND 50 THEN
            DBMS_OUTPUT.PUT_LINE('Espaço médio');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Espaço grande');
    END CASE;
END;
/
-----------------------------------------

-- LOOP EXIT WHEN para inserir espaços de trabalho até um limite
DECLARE
    v_count NUMBER := 1;
BEGIN
    LOOP
        INSERT INTO espaco_de_trabalho (id_espaco, capacidade)
        VALUES (v_count, v_count * 10); -- A capacidade é um múltiplo de 10 

        v_count := v_count + 1;
        EXIT WHEN v_count > 10;
    END LOOP;
END;
/
-----------------------------------------

-- WHILE LOOP para inserir endereços enquanto o contador for menor que 5
DECLARE
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 5 LOOP
        INSERT INTO espaco_de_trabalho (id_espaco, capacidade)
        VALUES (v_count, v_count * 10); -- A capacidade é um múltiplo de 10 
        v_count := v_count + 1;
    END LOOP;
END;
/
-----------------------------------------

-- FOR IN LOOP para iterar sobre espaços de trabalho e imprimir capacidades
BEGIN
    FOR espaco IN (SELECT id_espaco, capacidade FROM espaco_de_trabalho) LOOP
        DBMS_OUTPUT.PUT_LINE('Espaço ID: ' || espaco.id_espaco || ', Capacidade: ' || espaco.capacidade);
    END LOOP;
END;
/
-----------------------------------------

-- SELECT … INTO para capturar o nome de um convidado
DECLARE
    v_nome_convidado convidado.nome_convidado%TYPE;
BEGIN
    SELECT nome_convidado INTO v_nome_convidado FROM convidado WHERE id_pessoa = 10 AND no_convidado = 10;
    DBMS_OUTPUT.PUT_LINE('Nome do Convidado: ' || v_nome_convidado);
END;
/
-----------------------------------------

-- Uso de cursor com OPEN, FETCH e CLOSE para listar usuários
DECLARE
    CURSOR c_usuarios IS
        SELECT id_usuario, telefone FROM usuario;
    v_id_usuario usuario.id_usuario%TYPE;
    v_telefone usuario.telefone%TYPE;
BEGIN
    OPEN c_usuarios;
    LOOP
        FETCH c_usuarios INTO v_id_usuario, v_telefone;
        EXIT WHEN c_usuarios%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Usuário ID: ' || v_id_usuario || ', Telefone: ' || v_telefone);
    END LOOP;
    CLOSE c_usuarios;
END;
/
-----------------------------------------

-- EXCEPTION WHEN para tratamento de exceções
BEGIN
    -- Tenta inserir um novo registro na tabela `pessoa`
    INSERT INTO pessoa (id_pessoa, cpf) 
    VALUES (580, '356.845.987-10');

    DBMS_OUTPUT.PUT_LINE('Registro inserido com sucesso.');
EXCEPTION
    -- Captura a exceção se o CPF for duplicado
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Erro: CPF duplicado.');
    -- Captura qualquer outra exceção não especificada
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Outro erro ocorreu: ' || SQLERRM);
END;
/
-----------------------------------------

-- PROCEDURE com parâmetros IN, OUT
CREATE OR REPLACE PROCEDURE inserir_pagamento (
    p_data_hora IN TIMESTAMP,
    p_nome_portador IN VARCHAR2,
    p_cpf_portador IN VARCHAR2,
    p_numero_cartao IN VARCHAR2,
    p_codigo_seguranca IN VARCHAR2,
    p_data_vencimento IN DATE,
    p_id_pagamento OUT NUMBER
) AS
BEGIN
    INSERT INTO pagamento (data_e_hora, nome_portador_cartão, cpf_portador_cartão, numero_cartão, codigo_seguranca_cartão, data_vencimento_cartão)
    VALUES (p_data_hora, p_nome_portador, p_cpf_portador, p_numero_cartao, p_codigo_seguranca, p_data_vencimento)
    RETURNING id_pagamento INTO p_id_pagamento;
END inserir_pagamento;
/
-----------------------------------------

-- CREATE OR REPLACE PACKAGE para reservas
CREATE OR REPLACE PACKAGE reserva_pkg AS
    PROCEDURE criar_reserva(p_id_usuario IN NUMBER, p_espaco_id IN NUMBER, p_sessao_id IN NUMBER);
    FUNCTION verificar_disponibilidade(p_espaco_id IN NUMBER, p_sessao_id IN NUMBER) RETURN BOOLEAN;
END reserva_pkg;
/
-----------------------------------------

-- Implementação do PACKAGE BODY para reservas
CREATE OR REPLACE PACKAGE BODY reserva_pkg AS

    PROCEDURE criar_reserva(p_id_usuario IN NUMBER, p_espaco_id IN NUMBER, p_sessao_id IN NUMBER) AS
    BEGIN
        INSERT INTO reserva (id_usuario, espaco_de_trabalho_id, id_sessao)
        VALUES (p_id_usuario, p_espaco_id, p_sessao_id);
    END criar_reserva;

    FUNCTION verificar_disponibilidade(p_espaco_id IN NUMBER, p_sessao_id IN NUMBER) RETURN BOOLEAN AS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM reserva
        WHERE espaco_de_trabalho_id = p_espaco_id AND id_sessao = p_sessao_id;

        RETURN v_count = 0;
    END verificar_disponibilidade;

END reserva_pkg;
/
-----------------------------------------

-- TRIGGER que insere um log após uma reserva
CREATE OR REPLACE TRIGGER log_reserva_trigger
AFTER INSERT ON reserva
FOR EACH ROW
BEGIN
    INSERT INTO log_reserva (id_usuario, espaco_de_trabalho_id, id_sessao, data_hora)
    VALUES (:NEW.id_usuario, :NEW.espaco_de_trabalho_id, :NEW.id_sessao, SYSDATE);
END;
/
-----------------------------------------


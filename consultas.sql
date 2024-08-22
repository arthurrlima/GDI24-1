-- ALTER TABLE: Adicionar uma nova coluna na tabela usuario
ALTER TABLE usuario --ok
ADD email VARCHAR2(100);

-- CREATE INDEX: Criar um índice composto ba tabela organizar para as colunas id_empresa e id_evento
CREATE INDEX idx_organizar_empresa_evento
ON organizar (id_empresa, id_evento);

-- INSERT INTO: Inserir um novo registro na tabela endereco
INSERT INTO endereco (end_CEP, end_rua, end_numero, end_cidade)
VALUES ('02000-000', 'Avenida Paulista', '1000', 'São Paulo'); --ok

-- UPDATE: Atualizar o telefone de um usuário
UPDATE usuario
SET telefone = '(49) 6724-2906'
WHERE id_usuario = 580; --ok

-- DELETE: Excluir um usuário específico
DELETE FROM usuario
WHERE id_usuario = 702; 

-- SELECT-FROM-WHERE: Selecionar todos os usuários com Silva no sobrenome
SELECT * FROM usuario
WHERE nome_usuario LIKE '%Souza%'; --ok

-- BETWEEN: Selecionar usuários com IDs entre 10 e 20
SELECT * FROM usuario
WHERE id_usuario BETWEEN 5 AND 100; --ok

-- IN: Selecionar usuários de cidades específicas
SELECT * FROM usuario u
JOIN endereco e ON u.end_CEP = e.end_CEP
WHERE e.end_cidade IN ('Campo Grande', 'Rolândia'); --ok

-- LIKE: Selecionar usuários com telefone que começam com '49'
SELECT * FROM usuario
WHERE telefone LIKE '(29)%'; --ok

-- IS NULL: Selecionar usuários que não têm endereço registrado
SELECT * FROM usuario --ok
WHERE end_CEP IS NULL;

-- INNER JOIN: Selecionar todos os usuários e seus endereços
SELECT u.id_usuario, u.telefone, e.end_rua, e.end_cidade --ok
FROM usuario u
INNER JOIN endereco e ON u.end_CEP = e.end_CEP;

-- MAX: Selecionar o maior valor de ID de usuário
SELECT MAX(id_usuario) AS max_id FROM usuario; --ok  

-- MIN: Selecionar o menor valor de ID de usuário
SELECT MIN(id_usuario) AS min_id FROM usuario; --ok

-- AVG: Calcular a média de valores da coluna capacidade em espaco_de_trabalho
SELECT AVG(capacidade) AS capacidade_media FROM espaco_de_trabalho; --ok

-- COUNT: Contar o número de usuários registrados
SELECT COUNT(*) AS total_usuarios FROM usuario; --ok

-- LEFT JOIN: Selecionar todos os usuários e seus endereços
SELECT u.id_usuario, u.telefone, e.end_rua, e.end_cidade --ok
FROM usuario u
LEFT JOIN endereco e ON u.end_CEP = e.end_CEP;

-- SUBCONSULTA COM OPERADOR RELACIONAL: Selecionar usuários que têm a maior quantidade de reservas
SELECT * FROM usuario -- ok
WHERE id_usuario = (
    SELECT id_usuario
    FROM reserva
    GROUP BY id_usuario
    ORDER BY COUNT(*) DESC
    FETCH FIRST 1 ROWS ONLY
);

-- SUBCONSULTA COM IN: Selecionar todos os usuários que participaram de eventos
SELECT * FROM usuario  --ok
WHERE id_usuario IN (
    SELECT id_usuario FROM reserva
);

-- SUBCONSULTA COM ANY: Selecionar espaços de trabalho que têm mais reservas do que qualquer outro
SELECT * FROM espaco_de_trabalho --ok
WHERE capacidade > ANY (
    SELECT capacidade FROM espaco_de_trabalho WHERE capacidade < 50
);

-- SUBCONSULTA COM ALL: Selecionar espaços de trabalho com capacidade maior que todos os outros
SELECT * FROM espaco_de_trabalho --ok
WHERE capacidade > ALL (
    SELECT capacidade FROM espaco_de_trabalho
);

-- ORDER BY: Selecionar todos os usuários ordenados por telefone
SELECT * FROM usuario --ok
ORDER BY telefone;

-- GROUP BY: Contar o número de usuários por cidade
SELECT e.end_cidade, COUNT(u.id_usuario) AS total_usuarios --ok
FROM usuario u
JOIN endereco e ON u.end_CEP = e.end_CEP
GROUP BY e.end_cidade;

-- HAVING: Listar cidades com mais de 2 usuários
SELECT e.end_cidade, COUNT(u.id_usuario) AS total_usuarios --ok
FROM usuario u
JOIN endereco e ON u.end_CEP = e.end_CEP
GROUP BY e.end_cidade
HAVING COUNT(u.id_usuario) > 2;

-- UNION: Selecionar todas as cidades dos endereços e reservas
SELECT end_cidade FROM endereco --invalid number
UNION
SELECT end_cidade FROM reserva r JOIN endereco e ON r.espaco_de_trabalho_id = e.end_CEP;

-- CREATE VIEW: Criar uma view para usuários e seus endereços
CREATE VIEW usuario_endereco_view AS -- ok
SELECT u.id_usuario, u.telefone, e.end_rua, e.end_cidade
FROM usuario u
JOIN endereco e ON u.end_CEP = e.end_CEP;

-- GRANT: Conceder permissão de seleção a um usuário específico
GRANT SELECT ON usuario TO some_user;

-- REVOKE: Revogar permissão de seleção de um usuário específico
REVOKE SELECT ON usuario FROM some_user;

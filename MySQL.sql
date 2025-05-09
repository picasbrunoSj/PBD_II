CREATE DATABASE comercial;
USE comercial;

CREATE TABLE clientes (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    codigo_cliente VARCHAR(10),
    nome_cliente VARCHAR(100),
    razao_social VARCHAR(100),
    data_cadastro DATE,
    cnpj VARCHAR(18),
    telefone VARCHAR(20),
    PRIMARY KEY (id_cliente)
);


CREATE TABLE fornecedores (
    id_fornecedor INT NOT NULL AUTO_INCREMENT,
    codigo_fornecedor VARCHAR(10),
    nome_fornecedor VARCHAR(100),
    razao_social VARCHAR(100),
    telefone VARCHAR(20),
    PRIMARY KEY (id_fornecedor)
);

CREATE TABLE vendedores (
    id_vendedor INT NOT NULL AUTO_INCREMENT,
    codigo_vendedor VARCHAR(10),
    nome_vendedor VARCHAR(100),
    razao_social VARCHAR(100),
    telefone VARCHAR(20),
    percentual_comissao DECIMAL(10,2),
    PRIMARY KEY (id_vendedor)
);

CREATE TABLE produtos (
    id_produto INT NOT NULL AUTO_INCREMENT,
    codigo_produto VARCHAR(20),
    descricao VARCHAR(100),
    valor_unitario DECIMAL(10,2),
    situacao CHAR(1),
    id_fornecedor INT,
    PRIMARY KEY (id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);


CREATE TABLE vendas (
    id_venda INT NOT NULL AUTO_INCREMENT,
    codigo_venda VARCHAR(10),
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    valor_total DECIMAL(10,2),
    desconto DECIMAL(10,2),
    total_final DECIMAL(10,2),
    data_venda DATE,
    PRIMARY KEY (id_venda),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);

CREATE TABLE itens_venda (
    id_item_venda INT NOT NULL AUTO_INCREMENT,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    valor_unitario DECIMAL(10,2),
    quantidade INT,
    desconto DECIMAL(10,2),
    PRIMARY KEY (id_item_venda),
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Clientes
INSERT INTO clientes (codigo_cliente, nome_cliente, razao_social, data_cadastro, cnpj, telefone) VALUES
('CLI001', 'João Silva Comércio', 'JS Comércio Ltda', '2023-01-15', '12.345.678/0001-00', '(11) 98765-4321'),
('CLI002', 'Maria Souza Distribuidora', 'MS Distribuidora ME', '2023-02-20', '23.456.789/0001-11', '(11) 91234-5678'),
('CLI003', 'Empresa ABC Ltda', 'ABC Comércio e Serviços', '2023-03-10', '34.567.890/0001-22', '(11) 92345-6789'),
('CLI004', 'Tech Solutions', 'Tech Solutions SA', '2023-04-05', '45.678.901/0001-33', '(11) 93456-7890'),
('CLI005', 'Alimentos Saudáveis', 'Alimentos Naturais ME', '2023-05-12', '56.789.012/0001-44', '(11) 94567-8901'),
('CLI006', 'Construção Forte', 'Construtora Forte Ltda', '2023-06-18', '67.890.123/0001-55', '(11) 95678-9012'),
('CLI007', 'Moda Elegante', 'Confecções Elegantes SA', '2023-07-22', '78.901.234/0001-66', '(11) 96789-0123'),
('CLI008', 'Papelaria Criativa', 'Papelaria Arte e Cia', '2023-08-30', '89.012.345/0001-77', '(11) 97890-1234'),
('CLI009', 'Auto Peças Rápidas', 'Distribuidora de Peças Ltda', '2023-09-14', '90.123.456/0001-88', '(11) 98901-2345'),
('CLI010', 'Limpeza Profissional', 'Produtos de Limpeza ME', '2023-10-25', '01.234.567/0001-99', '(11) 99012-3456');

-- Fornecedores
INSERT INTO fornecedores (codigo_fornecedor, nome_fornecedor, razao_social, telefone) VALUES
('FOR001', 'Indústria Alimentícia', 'Alimentos Brasil SA', '(11) 91234-5678'),
('FOR002', 'Tecidos Nacional', 'Fábrica de Tecidos Ltda', '(11) 92345-6789'),
('FOR003', 'Eletrônicos Global', 'Eletrônicos do Brasil', '(11) 93456-7890'),
('FOR004', 'Móveis de Qualidade', 'Marcenaria Premium ME', '(11) 94567-8901'),
('FOR005', 'Material de Construção', 'ConstruMarket Distribuidora', '(11) 95678-9012'),
('FOR006', 'Papel e Cia', 'Indústria de Papel SA', '(11) 96789-0123'),
('FOR007', 'Auto Peças Master', 'Distribuidora de Peças SA', '(11) 97890-1234'),
('FOR008', 'Limpeza Profissional', 'Química Limpa Ltda', '(11) 98901-2345'),
('FOR009', 'Tecnologia Avançada', 'Tech Components Brasil', '(11) 99012-3456'),
('FOR010', 'Bebidas Finas', 'Importadora de Bebidas', '(11) 90123-4567');

-- Inserir vendedores
INSERT INTO vendedores (codigo_vendedor, nome_vendedor, razao_social, telefone, percentual_comissao) VALUES
('VEN001', 'Carlos Mendes', 'CM Representações', '(11) 91111-1111', 5.00),
('VEN002', 'Ana Paula', 'AP Vendas Corporativas', '(11) 92222-2222', 4.50),
('VEN003', 'Roberto Almeida', 'RA Consultoria', '(11) 93333-3333', 6.00),
('VEN004', 'Fernanda Lima', 'FL Soluções', '(11) 94444-4444', 5.50),
('VEN005', 'Marcos Oliveira', 'MO Negócios', '(11) 95555-5555', 7.00),
('VEN006', 'Patrícia Santos', 'PS Assessoria', '(11) 96666-6666', 4.00),
('VEN007', 'Ricardo Pereira', 'RP Comércio', '(11) 97777-7777', 5.25),
('VEN008', 'Juliana Costa', 'JC Representações', '(11) 98888-8888', 6.50),
('VEN009', 'Felipe Rocha', 'FR Vendas', '(11) 99999-9999', 4.75),
('VEN010', 'Camila Dias', 'CD Consultoria', '(11) 90000-0000', 5.00);

-- Inserir Productos
INSERT INTO produtos (codigo_produto, descricao, valor_unitario, situacao, id_fornecedor) VALUES
('PROD005', 'Mesa de Madeira', 450.00, 'A', 4),
('PROD006', 'Cimento 50kg', 35.90, 'A', 5),
('PROD007', 'Resma Papel A4', 25.00, 'A', 6),
('PROD008', 'Pastinha de Freio', 89.90, 'A', 7),
('PROD009', 'Desinfetante 5L', 18.50, 'A', 8),
('PROD010', 'Processador i7', 1499.00, 'A', 9),
('PROD011', 'Vinho Tinto Seco', 79.90, 'A', 10),
('PROD012', 'Azeite de Oliva 500ml', 32.50, 'A', 1),
('PROD013', 'Tecido Jeans', 28.90, 'A', 2),
('PROD014', 'Notebook Ultrafino', 3299.00, 'A', 3),
('PROD015', 'Cadeira de Escritório', 299.00, 'A', 4),
('PROD016', 'Tinta Branca 3,6L', 89.90, 'A', 5),
('PROD017', 'Caneta Esferográfica', 2.50, 'A', 6),
('PROD018', 'Filtro de Óleo', 24.90, 'A', 7),
('PROD019', 'Detergente Neutro', 3.90, 'A', 8),
('PROD020', 'Memória RAM 8GB', 199.00, 'A', 9);

-- Vendas
INSERT INTO vendas (codigo_venda, id_cliente, id_vendedor, valor_total, desconto, total_final, data_venda) VALUES
('VEND001', 1, 3, 1950.00, 50.00, 1900.00, '2023-03-15'),
('VEND002', 2, 5, 480.00, 0.00, 480.00, '2023-04-20'),
('VEND003', 3, 2, 3299.00, 99.00, 3200.00, '2023-05-10'),
('VEND004', 4, 7, 179.80, 0.00, 179.80, '2023-06-05'),
('VEND005', 5, 1, 104.50, 4.50, 100.00, '2023-07-12'),
('VEND006', 6, 4, 540.00, 40.00, 500.00, '2023-08-18'),
('VEND007', 7, 6, 61.50, 1.50, 60.00, '2023-09-22'),
('VEND008', 8, 8, 1499.00, 0.00, 1499.00, '2023-10-30'),
('VEND009', 9, 9, 89.90, 0.00, 89.90, '2023-11-14'),
('VEND010', 10, 10, 58.40, 3.40, 55.00, '2023-12-25'),
('VEND011', 1, 2, 750.00, 0.00, 750.00, '2024-01-05'),
('VEND012', 3, 4, 299.00, 0.00, 299.00, '2024-02-10'),
('VEND013', 5, 6, 125.80, 5.80, 120.00, '2024-03-15'),
('VEND014', 7, 8, 199.00, 0.00, 199.00, '2024-04-20'),
('VEND015', 9, 10, 35.90, 0.00, 35.90, '2024-05-25');


SELECT * FROM vendas WHERE id_venda IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
SELECT * FROM produtos WHERE id_produto IN (1, 2, 4, 5, 6, 7, 8, 9, 10, 12, 14, 15, 16, 17, 19, 20);

-- Inserir depois de confirmar
INSERT INTO itens_venda (id_venda, id_produto, valor_unitario, quantidade, desconto) 
SELECT 1, id_produto, 1899.00, 1, 50.00 FROM produtos WHERE id_produto = 4 LIMIT 1;

INSERT INTO itens_venda (id_venda, id_produto, valor_unitario, quantidade, desconto) 
SELECT 1, id_produto, 199.00, 1, 0.00 FROM produtos WHERE id_produto = 20 LIMIT 1;

SELECT id_venda FROM vendas;
SELECT id_produto FROM produtos;
SELECT * FROM fornecedores;

SELECT p.id_produto, p.codigo_produto, p.descricao, p.valor_unitario, p.situacao, f.id_fornecedor, f.nome_fornecedor, f.razao_social FROM produtos p
LEFT JOIN  fornecedores f ON p.id_fornecedor = f.id_fornecedor;

-- Total de vendas por vendedor
SELECT v.id_vendedor, ve.nome_vendedor,
    COUNT(v.id_venda) AS quantidade_vendas,
    SUM(v.total_final) AS total_vendas,
    SUM(v.total_final) * ve.percentual_comissao / 100 AS comissao_total
FROM vendas v JOIN vendedores ve ON v.id_vendedor = ve.id_vendedor
GROUP BY v.id_vendedor, ve.nome_vendedor, ve.percentual_comissao
ORDER BY total_vendas DESC;


-- Subconsultas
SELECT id_cliente, nome_cliente, cnpj FROM clientes
WHERE id_cliente IN (1, 3, 5, 7, 10);

-- Subconsulta no SELECT
SELECT c.id_cliente, c.nome_cliente, c.cnpj
FROM clientes c WHERE c.id_cliente IN (SELECT DISTINCT id_cliente FROM vendas);

SELECT v.id_venda, v.codigo_venda, v.data_venda, v.total_final, c.nome_cliente, ve.nome_vendedor
FROM vendas v JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN vendedores ve ON v.id_vendedor = ve.id_vendedor
ORDER BY v.data_venda DESC;

-- Clientes que NÃO fizeram compras
SELECT c.id_cliente, c.nome_cliente, c.cnpj
FROM clientes c WHERE c.id_cliente NOT IN (SELECT DISTINCT id_cliente FROM vendas WHERE id_cliente IS NOT NULL);

--  IDs específicos
SELECT id_cliente, nome_cliente, cnpj
FROM clientes WHERE id_cliente NOT IN (2, 4, 6, 8)
ORDER BY nome_cliente;


--  Processamento de Comissões
DELIMITER $$
DROP PROCEDURE IF EXISTS processa_comissionamento;

CREATE PROCEDURE processa_comissionamento(
    IN data_inicial DATE,
    IN data_final DATE,
    OUT total_processado INT
)
BEGIN
    -- Declaração de variáveis
    DECLARE total_venda DECIMAL(10,2) DEFAULT 0;
    DECLARE venda_id INT DEFAULT 0;
    DECLARE vendedor_id INT DEFAULT 0;
    DECLARE percentual_comissao DECIMAL(5,2) DEFAULT 0;
    DECLARE valor_comissao DECIMAL(10,2) DEFAULT 0;
    DECLARE contador INT DEFAULT 0;
    DECLARE fim_cursor INT DEFAULT FALSE;
    
    -- Cursor para buscar vendas no período
    DECLARE busca_pedido CURSOR FOR
        SELECT v.id_venda, v.total_final, v.id_vendedor
        FROM vendas v
        WHERE v.data_venda BETWEEN data_inicial AND data_final
        AND v.total_final > 0;
    
    -- Handler para quando não houver mais registros
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_cursor = TRUE;
    
    -- Abre o cursor
    OPEN busca_pedido;
    
    -- Início do loop de processamento
    processamento_vendas: LOOP
        -- Obtém os dados da venda atual
        FETCH busca_pedido INTO venda_id, total_venda, vendedor_id;
        
        -- Verifica se chegou ao final
        IF fim_cursor THEN
            LEAVE processamento_vendas;
        END IF;
        
        -- Busca o percentual de comissão do vendedor
        SELECT percentual_comissao INTO percentual_comissao
        FROM vendedores
        WHERE id_vendedor = vendedor_id;
        
        -- Lógica de cálculo da comissão
        IF (percentual_comissao > 0) THEN
            -- Cálculo normal da comissão
            SET valor_comissao = ((total_venda * percentual_comissao) / 100);
            
            -- Atualiza a tabela de vendas com o valor da comissão
            UPDATE vendas 
            SET valor_comissao = valor_comissao
            WHERE id_venda = venda_id;
            
        ELSEIF (percentual_comissao = 0) THEN
            -- Vendedor com comissão zero
            UPDATE vendas 
            SET valor_comissao = 0
            WHERE id_venda = venda_id;
            
        ELSE
            -- Vendedor sem cadastro de comissão (default 1%)
            SET valor_comissao = ((total_venda * 1) / 100);
            
            UPDATE vendas 
            SET valor_comissao = valor_comissao
            WHERE id_venda = venda_id;
        END IF;
        
        COMMIT;
        SET contador = contador + 1;
    END LOOP processamento_vendas;
    
    -- Fecha o cursor e retorna o total processado
    CLOSE busca_pedido;
    SET total_processado = contador;
END$$

DELIMITER ;



-- Evento Semanal para Processar Comissões
DELIMITER $$
DROP EVENT IF EXISTS processa_comissao_semanal;

CREATE EVENT processa_comissao_semanal
ON SCHEDULE 
    EVERY 1 WEEK
    STARTS '2023-11-01 23:38:00'  -- Data de início ajustada
ON COMPLETION PRESERVE
ENABLE
COMMENT 'Processa comissões dos últimos 7 dias'
DO
BEGIN
    DECLARE data_inicio DATE;
    DECLARE data_fim DATE;
    
    -- Calcula o período dos últimos 7 dias
    SET data_inicio = CURRENT_DATE() - INTERVAL 7 DAY;
    SET data_fim = CURRENT_DATE();
    
    -- Chama a stored procedure de processamento
    CALL processa_comissionamento(data_inicio, data_fim, @total_processado);
    
    -- Registra o processamento (opcional - requer tabela log_processamentos)
    -- Primeiro verifica se a tabela de log existe
    IF EXISTS (SELECT 1 FROM information_schema.tables 
              WHERE table_schema = 'comercial' 
              AND table_name = 'log_processamentos') THEN
        INSERT INTO log_processamentos (tipo, periodo_inicio, periodo_fim, registros, data_processamento)
        VALUES ('COMISSAO', data_inicio, data_fim, @total_processado, NOW());
    END IF;
END$$

DELIMITER ;



-- Evento Temporário para Testes (10 minutos por 30 minutos)
DELIMITER $$

DROP EVENT IF EXISTS processa_comissao_teste;
CREATE EVENT processa_comissao_teste
ON SCHEDULE 
    EVERY 10 MINUTE
    STARTS CURRENT_TIMESTAMP
    ENDS CURRENT_TIMESTAMP + INTERVAL 30 MINUTE
ON COMPLETION NOT PRESERVE
ENABLE
COMMENT 'Processamento de teste de comissões'
DO
BEGIN
    CALL processa_comissionamento(
        CURRENT_DATE() - INTERVAL 7 DAY,
        CURRENT_DATE(),
        @total_processado_teste
    );
    
    -- Log de execução (opcional)
    INSERT INTO log_eventos (evento, executado_em, registros)
    VALUES ('COMISSAO_TESTE', NOW(), @total_processado_teste);
END$$

DELIMITER ;



-- Listar todos os eventos agendados
SHOW EVENTS FROM comercial;

-- Verificar detalhes de um evento específico
SHOW CREATE EVENT processa_comissao_semanal;

-- Status do Event Scheduler
SHOW VARIABLES LIKE 'event_scheduler';
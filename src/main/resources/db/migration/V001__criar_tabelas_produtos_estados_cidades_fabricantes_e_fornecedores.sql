CREATE TABLE empresas (
  id INT PRIMARY KEY AUTO_INCREMENT,  
  nome VARCHAR(50) NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE fornecedores (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,  
  nome VARCHAR(150) NULL,
  documento VARCHAR(50) NULL,
  telefone VARCHAR(50) NULL,
  email VARCHAR(50) NULL,
  logradouro VARCHAR(50) NULL,
  numero VARCHAR(50) NULL,
  complemento VARCHAR(50) NULL,
  cep VARCHAR(50) NULL,
  tipo_entidade VARCHAR(50) NULL,
  ativo BIT NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE fabricantes (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,  
  nome VARCHAR(150) NULL,
  documento VARCHAR(50) NULL,
  telefone VARCHAR(50) NULL,
  email VARCHAR(50) NULL,
  logradouro VARCHAR(50) NULL,
  numero VARCHAR(50) NULL,
  complemento VARCHAR(50) NULL,
  cep VARCHAR(50) NULL,
  tipo_entidade VARCHAR(50) NULL,
  ativo BIT NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE estados (
  id INT PRIMARY KEY AUTO_INCREMENT,  
  uf CHAR(2) NULL,
  nome VARCHAR(50) NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE cidades (
  id INT PRIMARY KEY AUTO_INCREMENT,  
  nome VARCHAR(50) NULL,
  estado_id INT NULL,
  FOREIGN KEY (estado_id) REFERENCES estados(id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE produtos (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  empresa_id INT /* NOT */ NULL, 
  sku VARCHAR(6) NOT NULL,
  gtin VARCHAR(14) NULL,
  nome VARCHAR(50) NOT NULL,
  descricao VARCHAR(150) NOT NULL,
  custo_unitario DECIMAL(19,4) NOT NULL,
  preco_venda DECIMAL(19,4) NOT NULL,
  comissao DECIMAL(19,4) NULL,
  quantidade_estoque INT NULL,
  unidade VARCHAR(50) NOT NULL,
  origem VARCHAR(20) NOT NULL,
  fornecedor_id BIGINT NOT NULL,
  fabricante_id BIGINT NOT NULL,
  FOREIGN KEY (empresa_id) REFERENCES empresas(id),
  FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id),
  FOREIGN KEY (fabricante_id) REFERENCES fabricantes(id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

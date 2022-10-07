-----/*

---	Loja de Sucos do Jailson

---	* Vende sucos (principalmente de Laranja)

---	* Dados dos clientes:
---		Nome (texto)
---		nascimento (dados dd / mm / aaaa)
---		sexo (numero)
---		endereco
---			Rua (texto)
---			cidade (texto)
---			Estado (texto)
---		Telefones (texto)

---	* Dados das vendas
---		N�mero da venda (n�mero)
---		cliente que comprou (texto)
---		pre�o total (n�mero)

---	* Dados do produto
---		Nome (texto)
---		Pre�o (n�mero)

-----*/


---- Aula 4 - Criando Base de Dados (Parte 1) 

CREATE TABLE tb_Produtos (
	cdProduto INT PRIMARY KEY IDENTITY(1,1),
	nmProduto VARCHAR(50) NOT NULL, -- Obrigatorio
	vlProduto DECIMAL(6,2) NOT NULL, -- AQUI � 6 NUMEROS E 2 VIRGULAS
	
);

---- Aula 5 - Criando Base de Dados (Parte 2)

CREATE TABLE tb_Clientes (
	cdCliente INT PRIMARY KEY IDENTITY(1,1),
	nmCliente Varchar(50) NOT NULL, 
	dtNascimento DATE,
	inSexo VARCHAR(1) NOT NULL,
	nmEnderco VARCHAR(50),
	nmCidade VARCHAR (50),
	nmEstado VARCHAR(30),
	nmTelefone1 VARCHAR(15),
	nmTelefone2 VARCHAR (15)
);

---- Aula 6 - Criando Tabelas (Parte 3)
	 
CREATE TABLE tb_Vendas (
	cdVendas INT PRIMARY KEY IDENTITY(1, 1),
	cdProdutos INT NOT NULL,
	vlProduto DECIMAL(6,2) NOT NULL
);

---- CONSTRAINT - /* ELE S� DEIXA VOC� POR O CODIGO DO PRODUTO SE O MESMO ESTIVER NA TABELA ----
---- FOREIGN KEY - /* Chave Secundaria  N�O DEIXA POR NUMERO QUE N�O ESTEJA ALTERADO NA TABELA


ALTER TABLE tb_Vendas
ADD CONSTRAINT FK_Produto_Vendas
FOREIGN KEY (cdProdutos)
REFERENCES tb_Produtos (cdProduto);

--- Remover a tabela de Vendas */ Preciso de Permiss�o que n�o sei aonde � rsrs

DROP TABLE tb_Vendas

---- Criando a tabelas tb_vendas2 porque n�o consegui excluir a primeira ---

CREATE TABLE tb_Vendas2 (
	cdVenda INT PRIMARY KEY IDENTITY(1, 1),
	cdClientes INT NOT NULL FOREIGN KEY REFERENCES tb_Clientes (cdCliente),
	dtVendas2 DATETIME NOT NULL
);

Create Table tb_ProdutoVenda (
	cdProdutoVenda INT PRIMARY KEY IDENTITY(1,1),
	cdVenda INT FOREIGN KEY REFERENCES tb_Vendas2 (cdVenda) NOT NULL,
	cdProduto INT FOREIGN KEY REFERENCES tb_Produtos (cdProduto) NOT NULL,
	qtProduto INT NOT NULL
);

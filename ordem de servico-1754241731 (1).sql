CREATE TABLE IF NOT EXISTS "PRODUTO" (
	"idPRODUTO" serial NOT NULL UNIQUE,
	"NOME" varchar(100) NOT NULL UNIQUE,
	"DESCRICAO" varchar(255),
	"PRECO" numeric(10,2) NOT NULL,
	"idFornecedor" bigint NOT NULL,
	PRIMARY KEY ("idPRODUTO", "NOME")
);

CREATE TABLE IF NOT EXISTS "FORNECEDOR" (
	"fornecedor" serial NOT NULL UNIQUE,
	"idFornecedor" serial NOT NULL UNIQUE,
	"nome" varchar(100) NOT NULL,
	"cnpj" varchar(14) NOT NULL UNIQUE,
	"telefone" varchar(15),
	"Email" varchar(100),
	PRIMARY KEY ("fornecedor", "idFornecedor")
);

CREATE TABLE IF NOT EXISTS "CLIENTE" (
	"idCliente" serial NOT NULL UNIQUE,
	"tipoPessoa" varchar(2) NOT NULL DEFAULT 'pf ou pj',
	"Nome" varchar(100) NOT NULL,
	"telefone" varchar(255) NOT NULL,
	"email" varchar(100),
	"cpf" varchar(11),
	"CNPJ" varchar(14),
	PRIMARY KEY ("idCliente")
);

CREATE TABLE IF NOT EXISTS "PEDIDO" (
	"IDpedido" serial NOT NULL UNIQUE,
	"idcliente" bigint NOT NULL,
	"dataPedido" date NOT NULL,
	"status" varchar(30) NOT NULL,
	"Valor_total" numeric(10,2) NOT NULL,
	"formaPagamento" varchar(30) NOT NULL,
	PRIMARY KEY ("IDpedido")
);

CREATE TABLE IF NOT EXISTS "PAGAMENTO" (
	"IDpagamento" serial NOT NULL UNIQUE,
	"IDpedido" bigint NOT NULL,
	"FormaPagamento" varchar(30) NOT NULL,
	"ValorPago" numeric(10,2) NOT NULL,
	"Status_" varchar(20) NOT NULL,
	PRIMARY KEY ("IDpagamento")
);

CREATE TABLE IF NOT EXISTS "ESTOQUE" (
	"IDestoque" serial NOT NULL UNIQUE,
	"Localizacao" varchar(100) NOT NULL,
	"Capacidade_Maxima" bigint,
	PRIMARY KEY ("IDestoque")
);

CREATE TABLE IF NOT EXISTS "PRODUTO_ESTOQUE" (
	"IDproduto" serial NOT NULL UNIQUE,
	"IDestoque" bigint NOT NULL,
	"Quantidade" bigint NOT NULL,
	PRIMARY KEY ("IDproduto", "IDestoque")
);

CREATE TABLE IF NOT EXISTS "ENTREGA" (
	"idEntrega" serial NOT NULL UNIQUE,
	"idPedido" bigint NOT NULL,
	"statusEntrega" varchar(30) NOT NULL,
	"codigoRastreio" varchar(50),
	"dataEntrega" date,
	PRIMARY KEY ("idEntrega")
);



ALTER TABLE "CLIENTE" ADD CONSTRAINT "CLIENTE_fk0" FOREIGN KEY ("idCliente") REFERENCES "CLIENTE"("id");
ALTER TABLE "PEDIDO" ADD CONSTRAINT "PEDIDO_fk1" FOREIGN KEY ("idcliente") REFERENCES "CLIENTE"("id");

ALTER TABLE "PEDIDO" ADD CONSTRAINT "PEDIDO_fk5" FOREIGN KEY ("formaPagamento") REFERENCES "PAGAMENTO"("id");
ALTER TABLE "PAGAMENTO" ADD CONSTRAINT "PAGAMENTO_fk1" FOREIGN KEY ("IDpedido") REFERENCES "Pedido"("id");

ALTER TABLE "PRODUTO_ESTOQUE" ADD CONSTRAINT "PRODUTO_ESTOQUE_fk1" FOREIGN KEY ("IDestoque") REFERENCES "ESTOQUE"("id");
ALTER TABLE "ENTREGA" ADD CONSTRAINT "ENTREGA_fk1" FOREIGN KEY ("idPedido") REFERENCES "PEDIDO"("id");
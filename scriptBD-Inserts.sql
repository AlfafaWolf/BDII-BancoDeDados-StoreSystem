/* ENDERECO */
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (311, 'Parque de Barro', 'Campo', 'Campinas', 'SP', 344, '27960-126', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (96, 'Arilda', 'Alameda', 'Juiz de Fora', 'MG', 396, '87256-895', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (668, 'José', 'Avenida', 'Serra', 'ES', 74, '73119-262', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (302, 'Cibele de Macapá', 'Conjunto', 'São Gonçalo', 'RJ', 4, '76395-696', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (73, 'Cibele Jesus', 'Área', 'Serra', 'ES', 154, '43582-876', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (359, 'Elias Piranga', 'Alameda', 'Uberlândia', 'MG', 438, '58627-613', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (790, 'José Piranga', 'Condomínio', 'Vila Velha', 'ES', 268, '06697-008', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (234, 'Elias Ribas', 'Área', 'Juiz de Fora', 'MG', 227, '32632-037', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (696, 'Adriano', 'Avenida', 'São Gonçalo', 'RJ', 17, '87374-085', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (629, 'José de Macapá', 'Conjunto', 'Cariacica', 'ES', 176, '46073-365', '');

/* PRODUTO */
INSERT INTO Produto (id, Nome, QtdEstoque, Modelo, Marca, Categoria, PrecoUnitario, Descricao) VALUES (101, 'Pen Drive 16GB', 0, 'DT10GB16', 'Kingston', 'Periféricos', 17.00, '');
INSERT INTO Produto (id, Nome, QtdEstoque, Modelo, Marca, Categoria, PrecoUnitario, Descricao) VALUES (102, 'Pen Drive 32GB', 0, 'DT10GB32', 'Kingston', 'Periféricos', 34.00, '');
INSERT INTO Produto (id, Nome, QtdEstoque, Modelo, Marca, Categoria, PrecoUnitario, Descricao) VALUES (103, 'Pen Drive 64GB', 0, 'DT10GB64', 'Kingston', 'Periféricos', 64.60, '');
INSERT INTO Produto (id, Nome, QtdEstoque, Modelo, Marca, Categoria, PrecoUnitario, Descricao) VALUES (104, 'Pen Drive 8GB', 0, 'PD567', 'Multilaser', 'Periféricos', 12.50, '');
INSERT INTO Produto (id, Nome, QtdEstoque, Modelo, Marca, Categoria, PrecoUnitario, Descricao) VALUES (201, 'Xbox One S 1TB Branco', 0, '234-00877', 'Microsoft', 'Console', 1499.99, '');
INSERT INTO Produto (id, Nome, QtdEstoque, Modelo, Marca, Categoria, PrecoUnitario, Descricao) VALUES (202, 'Controle Wireless Branco Xbox One S', 0, 'TF5-00002', 'Acessórios', 'Console', 259.99, '');
INSERT INTO Produto (id, Nome, QtdEstoque, Modelo, Marca, Categoria, PrecoUnitario, Descricao) VALUES (203, 'PlayStation 4 Pro 1TB', 0, 'CUH-7214B', 'Sony', 'Console', 2849.99, '');
INSERT INTO Produto (id, Nome, QtdEstoque, Modelo, Marca, Categoria, PrecoUnitario, Descricao) VALUES (204, 'Controle Sony Dualshock 4 Sem fio PS4 Preto', 0, 'CUH-ZCT2U', 'Sony', 'Acessórios', 1499.99, '');
INSERT INTO Produto (id, Nome, QtdEstoque, Modelo, Marca, Categoria, PrecoUnitario, Descricao) VALUES (301, 'Monitor LG LED 19.5 Widescreen', 0, '20M37AA', 'LG', 'Monitor', 549.89, '');

/* EMPRESA */
/* Clientepj */
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (101, 'Sophia e Gustavo Bebidas', 'Sophia e Gustavo Comercio de Bebidas ME', '69.628.034/0001-21', '(11) 3833-2118', 'presidencia@sophiaegustavobebidas.com.br', 96, 'clientepj');
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (102, 'Nicole e Luana Advocacia', 'Nicole e Luana Advocacia ME', '04.842.560/0001-44', '(11) 3687-4819', 'presidencia@nicoleeluanaadvocaciame.com.br', 668, 'clientepj');
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (103, 'D&E Entulhos', 'Danilo e Emily Entulhos Ltda', '74.663.462/0001-25', '(11) 2731-1457', 'contabil@daniloeemilyentulhosltda.com.br', 302, 'clientepj');
/* fornecedor */
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (201, 'Eletrônica 60Hertz','Hugo e Renata Eletrônica Ltda', '21.613.287/0001-03', '(12) 3661-7260', 'administracao@hugoerenataeletronicaltda.com.br', 73, 'fornecedor');
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (202, 'Informática Web', 'Eliane e Eduardo Informática ME', '37.295.549/0001-60', '(16) 3503-6544', 'web@elianeeeduardoinformaticame.com.br', 359, 'fornecedor');
/* filial */
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (301, 'KAPOW Atacado SP', 'Atacado KAPOW S&A', '58.259.427/0001-99', '(14) 2990-3484', 'contato@atacadokapowsa.com.br', 311, 'filial');
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (302, 'KAPOW Atacado ES', 'Atacado KAPOW S&A', '58.259.427/0002-69', '(27) 3940-6784', 'contato@atacadokapowsa.com.br', 629, 'filial');
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (303, 'KAPOW Atacado MG', 'Atacado KAPOW S&A', '58.259.427/0003-34', '(34) 2782-9129', 'contato@atacadokapowsa.com.br', 234, 'filial');

/* COMPRA */
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (808, 31, 5162.97, TO_DATE('2019/01/17', 'yyyy/mm/dd'), 'cartao debito', 202, 202);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (764, 75, 1721.36, TO_DATE('2019/03/17', 'yyyy/mm/dd'), 'boleto', 102, 201);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (745, 17, 19471.34, TO_DATE('2019/11/16', 'yyyy/mm/dd'), 'boleto', 204, 202);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (820, 12, 2494.13, TO_DATE('2019/01/02', 'yyyy/mm/dd'), 'boleto', 202, 202);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (873, 72, 2497.43, TO_DATE('2019/12/25', 'yyyy/mm/dd'), 'boleto', 103, 201);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (178, 16, 2768.49, TO_DATE('2019/09/21', 'yyyy/mm/dd'), 'cartao debito', 202, 202);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (160, 16, 28470.68, TO_DATE('2019/01/09', 'yyyy/mm/dd'), 'boleto', 203, 201);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (282, 38, 7315.44, TO_DATE('2019/05/14', 'yyyy/mm/dd'), 'boleto', 202, 201);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (925, 96, 1265.91, TO_DATE('2019/05/20', 'yyyy/mm/dd'), 'cartao debito', 101, 201);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (905, 16, 17080.65, TO_DATE('2019/12/17', 'yyyy/mm/dd'), 'boleto', 201, 201);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (731, 42, 1410.49, TO_DATE('2019/09/12', 'yyyy/mm/dd'), 'boleto', 103, 201);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (506, 20, 22832.24, TO_DATE('2019/07/25', 'yyyy/mm/dd'), 'boleto', 201, 201);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (37, 67, 604.66, TO_DATE('2019/04/16', 'yyyy/mm/dd'), 'boleto', 104, 202);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (452, 81, 3072.22, TO_DATE('2019/07/28', 'yyyy/mm/dd'), 'cartao debito', 103, 201);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (326, 88, 1586.03, TO_DATE('2019/10/12', 'yyyy/mm/dd'), 'cartao debito', 102, 202);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (256, 23, 9077.07, TO_DATE('2019/08/11', 'yyyy/mm/dd'), 'boleto', 301, 202);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (77, 68, 2208.66, TO_DATE('2019/02/08', 'yyyy/mm/dd'), 'cartao debito', 103, 202);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (528, 55, 2415.79, TO_DATE('2019/03/12', 'yyyy/mm/dd'), 'cartao debito', 103, 202);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (730, 57, 605.47, TO_DATE('2019/08/17', 'yyyy/mm/dd'), 'boleto', 101, 201);
INSERT INTO Compra (id, QtdComprada, ValorCompra, DataCompra, FormaPagamento, id_Produto, id_Empresa) VALUES (683, 18, 15378.76, TO_DATE('2019/09/12', 'yyyy/mm/dd'), 'boleto', 201, 201);
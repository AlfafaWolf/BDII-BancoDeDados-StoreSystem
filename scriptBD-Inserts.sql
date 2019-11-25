/* ENDERECO */
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (101, 'Parque de Barro', 'Campo', 'Campinas', 'SP', 344, '27960-126', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (102, 'Arilda', 'Alameda', 'Juiz de Fora', 'MG', 396, '87256-895', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (103, 'José', 'Avenida', 'Serra', 'ES', 74, '73119-262', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (104, 'Cibele de Macapá', 'Conjunto', 'São Gonçalo', 'RJ', 4, '76395-696', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (105, 'Cibele Jesus', 'Área', 'Serra', 'ES', 154, '43582-876', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (106, 'Elias Piranga', 'Alameda', 'Uberlândia', 'MG', 438, '58627-613', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (107, 'José Piranga', 'Condomínio', 'Vila Velha', 'ES', 268, '06697-008', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (108, 'Elias Ribas', 'Área', 'Juiz de Fora', 'MG', 227, '32632-037', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (109, 'Adriano', 'Avenida', 'São Gonçalo', 'RJ', 17, '87374-085', '');
INSERT INTO Endereco (id, Bairro, Logadouro, Cidade, Estado, Numero, CEP, Complemento) VALUES (110, 'José de Macapá', 'Conjunto', 'Cariacica', 'ES', 176, '46073-365', '');

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
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (101, 'Sophia e Gustavo Bebidas', 'Sophia e Gustavo Comercio de Bebidas ME', '69.628.034/0001-21', '(11) 3833-2118', 'presidencia@sophiaegustavobebidas.com.br', 102, 'clientepj');
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (102, 'Nicole e Luana Advocacia', 'Nicole e Luana Advocacia ME', '04.842.560/0001-44', '(11) 3687-4819', 'presidencia@nicoleeluanaadvocaciame.com.br', 103, 'clientepj');
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (103, 'D&E Entulhos', 'Danilo e Emily Entulhos Ltda', '74.663.462/0001-25', '(11) 2731-1457', 'contabil@daniloeemilyentulhosltda.com.br', 104, 'clientepj');
/* fornecedor */
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (201, 'Eletrônica 60Hertz','Hugo e Renata Eletrônica Ltda', '21.613.287/0001-03', '(12) 3661-7260', 'administracao@hugoerenataeletronicaltda.com.br', 105, 'fornecedor');
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (202, 'Informática Web', 'Eliane e Eduardo Informática ME', '37.295.549/0001-60', '(16) 3503-6544', 'web@elianeeeduardoinformaticame.com.br', 106, 'fornecedor');
/* filial */
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (301, 'KAPOW Atacado SP', 'Atacado KAPOW S&A', '58.259.427/0001-99', '(14) 2990-3484', 'contato@atacadokapowsa.com.br', 101, 'filial');
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (302, 'KAPOW Atacado ES', 'Atacado KAPOW S&A', '58.259.427/0002-69', '(27) 3940-6784', 'contato@atacadokapowsa.com.br', 110, 'filial');
INSERT INTO Empresa (id, Nome, Razao_Social, CNPJ, Telefone, Email, id_endereco, tipo_Empresa) VALUES (303, 'KAPOW Atacado MG', 'Atacado KAPOW S&A', '58.259.427/0003-34', '(34) 2782-9129', 'contato@atacadokapowsa.com.br', 108, 'filial');

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

/* FUNCIONARIOS */
/* vendedor */
EXEC ADD_FUNC('Mariana de Caminha', '505.634.201-45', '21.252.295-7', 'f', '(54) 90661-5556', TO_DATE('1986/04/09', 'yyyy/mm/dd'), 'mariana.caminha@hotmail.com', 101, TO_DATE('2018/06/19', 'yyyy/mm/dd'), 1907.25, null, 302, 'v');
EXEC ADD_FUNC('Santiago da Veiga', '586.456.713-29', '97.987.546-2', 'f', '(92) 99884-2873', TO_DATE('1979/12/13', 'yyyy/mm/dd'), 'santiago.veiga@gmail.com', 101, TO_DATE('2013/11/15', 'yyyy/mm/dd'), 1616.56, null, 302, 'v');
EXEC ADD_FUNC('Sofia Oliveira', '070.183.769-95', '66.635.967-5', 'm', '(10) 97466-5732', TO_DATE('1989/01/17', 'yyyy/mm/dd'), 'sofia.oliveira@gmail.com', 105, TO_DATE('2018/07/07', 'yyyy/mm/dd'), 1566.4, null, 301, 'v');
EXEC ADD_FUNC('Joao Castro', '360.601.889-59', '37.384.809-8', 'f', '(88) 93651-6273', TO_DATE('1966/09/21', 'yyyy/mm/dd'), 'joao.castro@hotmail.com', 108, TO_DATE('2016/01/21', 'yyyy/mm/dd'), 1582.34, null, 301, 'v');
EXEC ADD_FUNC('Joao Oliveira', '961.969.036-10', '45.439.030-0', 'm', '(57) 92837-6725', TO_DATE('1994/01/11', 'yyyy/mm/dd'), 'joao.oliveira@hotmail.com', 101, TO_DATE('2015/02/17', 'yyyy/mm/dd'), 1847.72, null, 302, 'v');
EXEC ADD_FUNC('Joao Gonçalves', '678.372.328-96', '63.359.782-4', 'm', '(82) 91752-1982', TO_DATE('1982/02/01', 'yyyy/mm/dd'), 'joao.gonçalves@hotmail.com', 109, TO_DATE('2014/12/07', 'yyyy/mm/dd'), 1499.45, null, 303, 'v');
EXEC ADD_FUNC('Beatriz Correia', '607.687.670-37', '47.374.321-5', 'f', '(45) 92727-2851', TO_DATE('1970/02/11', 'yyyy/mm/dd'), 'beatriz.correia@hotmail.com', 108, TO_DATE('2015/05/11', 'yyyy/mm/dd'), 1604.0, null, 301, 'v');
EXEC ADD_FUNC('Carolina Lopes', '470.698.564-75', '09.682.927-1', 'm', '(39) 98859-3213', TO_DATE('1998/07/28', 'yyyy/mm/dd'), 'carolina.lopes@gmail.com', 110, TO_DATE('2015/12/01', 'yyyy/mm/dd'), 1571.44, null, 301, 'v');
EXEC ADD_FUNC('Leonor Alvares', '300.169.385-69', '16.314.734-8', 'f', '(51) 91383-3032', TO_DATE('1960/05/27', 'yyyy/mm/dd'), 'leonor.alvares@gmail.com', 103, TO_DATE('2014/03/11', 'yyyy/mm/dd'), 1690.5, null, 303, 'v');
EXEC ADD_FUNC('Ana Pereira', '171.401.599-78', '82.347.039-9', 'm', '(21) 93192-4720', TO_DATE('1973/01/19', 'yyyy/mm/dd'), 'ana.pereira@gmail.com', 110, TO_DATE('2018/01/18', 'yyyy/mm/dd'), 1462.78, null, 303, 'v');
EXEC ADD_FUNC('Gabriel Guimaraes', '358.000.130-08', '42.647.580-2', 'f', '(29) 94168-3493', TO_DATE('1971/03/17', 'yyyy/mm/dd'), 'gabriel.guimaraes@gmail.com', 108, TO_DATE('2014/02/11', 'yyyy/mm/dd'), 1268.57, null, 303, 'v');
EXEC ADD_FUNC('Duarte Silva', '294.042.896-39', '01.609.877-3', 'f', '(62) 96906-5519', TO_DATE('1999/01/11', 'yyyy/mm/dd'), 'duarte.silva@hotmail.com', 107, TO_DATE('2015/10/21', 'yyyy/mm/dd'), 1940.02, null, 302, 'v');
EXEC ADD_FUNC('Maria Castro', '326.719.485-23', '57.100.185-8', 'm', '(95) 90140-9781', TO_DATE('1969/05/04', 'yyyy/mm/dd'), 'maria.castro@hotmail.com', 110, TO_DATE('2016/01/22', 'yyyy/mm/dd'), 1998.34, null, 302, 'v');
EXEC ADD_FUNC('Tomas Albuquerque', '678.206.995-69', '78.683.159-0', 'f', '(44) 98888-5175', TO_DATE('1960/12/09', 'yyyy/mm/dd'), 'tomas.albuquerque@gmail.com', 109, TO_DATE('2016/03/24', 'yyyy/mm/dd'), 1896.9, null, 302, 'v');
EXEC ADD_FUNC('Mariana Sousa', '767.856.944-73', '35.367.847-9', 'f', '(17) 90181-0765', TO_DATE('1973/07/10', 'yyyy/mm/dd'), 'mariana.sousa@gmail.com', 102, TO_DATE('2018/04/19', 'yyyy/mm/dd'), 1857.52, null, 301, 'v');
EXEC ADD_FUNC('Gabriel Jesus', '011.844.469-95', '33.331.274-4', 'm', '(51) 91030-3080', TO_DATE('1972/11/21', 'yyyy/mm/dd'), 'gabriel.jesus@gmail.com', 102, TO_DATE('2017/11/01', 'yyyy/mm/dd'), 1493.76, null, 302, 'v');
EXEC ADD_FUNC('Ana Alvares', '361.981.663-24', '63.830.048-2', 'f', '(06) 94825-2339', TO_DATE('1997/03/28', 'yyyy/mm/dd'), 'ana.alvares@hotmail.com', 106, TO_DATE('2013/05/08', 'yyyy/mm/dd'), 1839.76, null, 303, 'v');
EXEC ADD_FUNC('Rodrigo Almeida', '381.208.285-36', '94.523.960-9', 'f', '(42) 98150-2372', TO_DATE('1978/01/16', 'yyyy/mm/dd'), 'rodrigo.almeida@hotmail.com', 104, TO_DATE('2018/12/02', 'yyyy/mm/dd'), 1624.8, null, 301, 'v');
EXEC ADD_FUNC('Matilde Jesus', '336.917.279-86', '25.554.875-4', 'm', '(74) 97927-2674', TO_DATE('1990/11/01', 'yyyy/mm/dd'), 'matilde.jesus@hotmail.com', 103, TO_DATE('2018/06/02', 'yyyy/mm/dd'), 1160.6, null, 302, 'v');
EXEC ADD_FUNC('Carolina Marques', '923.790.013-61', '44.654.810-3', 'm', '(02) 97333-8221', TO_DATE('1964/04/06', 'yyyy/mm/dd'), 'carolina.marques@hotmail.com', 105, TO_DATE('2016/10/26', 'yyyy/mm/dd'), 1198.6, null, 302, 'v');
/* atendente */
EXEC ADD_FUNC('Rodrigo Jesus', '861.137.340-09', '92.149.787-8', 'f', '(34) 97755-1194', TO_DATE('1964/11/11', 'yyyy/mm/dd'), 'rodrigo.jesus@gmail.com', 109, TO_DATE('2014/08/10', 'yyyy/mm/dd'), 1296.37, '(82) 90666-7768', null, 'a');
EXEC ADD_FUNC('Maria Lopes', '093.376.225-99', '52.873.018-9', 'm', '(58) 94771-9194', TO_DATE('1980/12/27', 'yyyy/mm/dd'), 'maria.lopes@gmail.com', 109, TO_DATE('2014/08/28', 'yyyy/mm/dd'), 1126.48, '(77) 94653-5943', null, 'a');
EXEC ADD_FUNC('Santiago Sousa', '542.425.593-03', '12.227.500-5', 'm', '(66) 96889-0252', TO_DATE('1970/06/12', 'yyyy/mm/dd'), 'santiago.sousa@gmail.com', 101, TO_DATE('2015/06/24', 'yyyy/mm/dd'), 1438.52, '(16) 93571-0492', null, 'a');
EXEC ADD_FUNC('Francisca Marques', '906.204.007-30', '58.184.716-2', 'm', '(04) 90335-7462', TO_DATE('1972/11/21', 'yyyy/mm/dd'), 'francisca.marques@gmail.com', 105, TO_DATE('2017/02/14', 'yyyy/mm/dd'), 1472.0, '(06) 93825-2205', null, 'a');
EXEC ADD_FUNC('Gabriel da Gama', '704.381.880-77', '63.838.167-1', 'f', '(18) 97395-4025', TO_DATE('1990/05/10', 'yyyy/mm/dd'), 'gabriel.gama@gmail.com', 101, TO_DATE('2014/06/14', 'yyyy/mm/dd'), 1924.97, '(40) 96308-0095', null, 'a');
EXEC ADD_FUNC('Ana Santos', '596.621.208-79', '23.118.431-4', 'm', '(15) 92555-9845', TO_DATE('1967/10/10', 'yyyy/mm/dd'), 'ana.santos@gmail.com', 103, TO_DATE('2015/04/16', 'yyyy/mm/dd'), 1625.22, '(59) 92616-7473', null, 'a');
EXEC ADD_FUNC('Maria Marques', '514.534.847-63', '60.859.546-6', 'f', '(43) 91486-9202', TO_DATE('1981/10/19', 'yyyy/mm/dd'), 'maria.marques@hotmail.com', 109, TO_DATE('2018/08/10', 'yyyy/mm/dd'), 1355.66, '(52) 93829-4359', null, 'a');
EXEC ADD_FUNC('Ines Coimbra', '288.624.467-70', '36.082.799-7', 'm', '(94) 98346-7583', TO_DATE('1971/07/15', 'yyyy/mm/dd'), 'ines.coimbra@gmail.com', 106, TO_DATE('2017/04/20', 'yyyy/mm/dd'), 1274.2, '(25) 96392-2756', null, 'a');
EXEC ADD_FUNC('Duarte Ferreira', '463.482.950-31', '42.489.890-6', 'm', '(00) 91336-9928', TO_DATE('1989/04/02', 'yyyy/mm/dd'), 'duarte.ferreira@hotmail.com', 109, TO_DATE('2013/12/28', 'yyyy/mm/dd'), 1129.38, '(16) 94758-6308', null, 'a');
EXEC ADD_FUNC('Matilde Guimaraes', '172.071.449-89', '09.857.988-9', 'm', '(58) 96637-2021', TO_DATE('1962/05/10', 'yyyy/mm/dd'), 'matilde.guimaraes@gmail.com', 103, TO_DATE('2016/08/21', 'yyyy/mm/dd'), 1938.6, '(70) 98634-1815', null, 'a');

/* CLIENTE_PF */
EXEC ADD_CLIENTE_PF('Maria Ferreira', '025.408.948-09', '14.423.674-9', 'f', '(57) 95613-1332', TO_DATE('1989/12/19', 'yyyy/mm/dd'), 'maria.ferreira@gmail.com', 103, '7m7Afaby');
EXEC ADD_CLIENTE_PF('Maria Braganca', '270.128.665-70', '18.526.208-8', 'f', '(12) 90816-9277', TO_DATE('1960/05/22', 'yyyy/mm/dd'), 'maria.braganca@gmail.com', 107, '3TouYSUg');
EXEC ADD_CLIENTE_PF('Ines Pereira', '788.398.016-07', '35.090.614-8', 'f', '(02) 95916-9064', TO_DATE('1961/05/28', 'yyyy/mm/dd'), 'ines.pereira@hotmail.com', 107, 'vDZaoEUQ');
EXEC ADD_CLIENTE_PF('Gabriel Silva', '093.609.546-50', '66.390.405-1', 'm', '(30) 93745-3619', TO_DATE('1983/11/16', 'yyyy/mm/dd'), 'gabriel.silva@hotmail.com', 109, '0tzusocW');
EXEC ADD_CLIENTE_PF('Duarte Castro', '317.284.861-85', '70.906.379-8', 'f', '(43) 91750-0962', TO_DATE('1999/02/19', 'yyyy/mm/dd'), 'duarte.castro@gmail.com', 104, 'uECCemHU');
EXEC ADD_CLIENTE_PF('Miguel Martins', '280.956.700-54', '29.531.221-5', 'm', '(03) 96940-6215', TO_DATE('1964/10/13', 'yyyy/mm/dd'), 'miguel.martins@hotmail.com', 108, 'zYa5jrov');
EXEC ADD_CLIENTE_PF('Francisca Alves', '953.639.896-86', '74.103.755-6', 'm', '(70) 91246-1271', TO_DATE('1978/05/14', 'yyyy/mm/dd'), 'francisca.alves@gmail.com', 103, 'z7XHiIEz');
EXEC ADD_CLIENTE_PF('Leonor Alvares', '397.664.199-75', '85.413.107-0', 'f', '(34) 97828-2134', TO_DATE('1974/04/21', 'yyyy/mm/dd'), 'leonor.alvares@gmail.com', 102, 'FlMxgxoh');
EXEC ADD_CLIENTE_PF('Martim Braganca', '284.582.682-53', '01.764.956-6', 'm', '(22) 94148-6374', TO_DATE('1963/08/12', 'yyyy/mm/dd'), 'martim.braganca@hotmail.com', 110, 'lqD4E8nY');
EXEC ADD_CLIENTE_PF('Joao Lopes', '381.801.608-23', '72.421.265-0', 'f', '(64) 98863-7548', TO_DATE('1969/11/19', 'yyyy/mm/dd'), 'joao.lopes@hotmail.com', 105, '6C74G1N9');

/* VENDA */
EXEC ADD_VENDA(TO_DATE('2020/10/27', 'yyyy/mm/dd'), 'cartao debito', 102, 135, 'v');
EXEC ADD_VENDA(TO_DATE('2020/08/24', 'yyyy/mm/dd'), 'boleto', 112, 130, 'v');
EXEC ADD_VENDA(TO_DATE('2019/02/06', 'yyyy/mm/dd'), 'cartao debito', 101, 131, 'v');
EXEC ADD_VENDA(TO_DATE('2019/01/22', 'yyyy/mm/dd'), 'boleto', 101, 133, 'v');
EXEC ADD_VENDA(TO_DATE('2020/11/03', 'yyyy/mm/dd'), 'cartao debito', 113, 139, 'v');
EXEC ADD_VENDA(TO_DATE('2019/11/27', 'yyyy/mm/dd'), 'cartao debito', 109, 138, 'v');
EXEC ADD_VENDA(TO_DATE('2019/09/01', 'yyyy/mm/dd'), 'boleto', 107, 138, 'v');
EXEC ADD_VENDA(TO_DATE('2020/10/07', 'yyyy/mm/dd'), 'boleto', 116, 134, 'v');
EXEC ADD_VENDA(TO_DATE('2019/07/19', 'yyyy/mm/dd'), 'boleto', 104, 132, 'v');
EXEC ADD_VENDA(TO_DATE('2020/03/10', 'yyyy/mm/dd'), 'boleto', 109, 132, 'v');
EXEC ADD_VENDA(TO_DATE('2019/03/09', 'yyyy/mm/dd'), 'boleto', 115, 102, 'a');
EXEC ADD_VENDA(TO_DATE('2019/05/19', 'yyyy/mm/dd'), 'boleto', 101, 103, 'a');
EXEC ADD_VENDA(TO_DATE('2019/10/17', 'yyyy/mm/dd'), 'boleto', 119, 103, 'a');
EXEC ADD_VENDA(TO_DATE('2019/12/09', 'yyyy/mm/dd'), 'boleto', 102, 101, 'a');
EXEC ADD_VENDA(TO_DATE('2020/07/24', 'yyyy/mm/dd'), 'cartao debito', 103, 101, 'a');

/* ITEM */
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 1, 104, 108);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 1, 201, 102);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 1, 203, 110);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 1, 203, 113);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 1, 203, 114);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 1, 204, 111);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 1, 204, 113);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 1, 204, 114);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 1, 301, 112);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 10, 102, 110);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 10, 103, 101);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 10, 104, 100);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 2, 103, 110);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 2, 201, 103);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 2, 201, 113);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 2, 202, 101);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 2, 203, 105);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 2, 203, 106);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 2, 203, 107);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 2, 204, 104);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 2, 301, 114);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 3, 202, 110);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 3, 203, 101);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 4, 104, 106);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 6, 101, 106);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 6, 104, 113);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 7, 101, 103);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 8, 101, 109);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 9, 102, 103);
INSERT INTO ITEM (ID, QTD, ID_PRODUTO, ID_VENDA) VALUES (null, 9, 103, 107);

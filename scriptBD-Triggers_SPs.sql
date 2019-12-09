/*************** SEQUENCE ***************/
CREATE SEQUENCE func_matriculaid_seq START WITH 1000;
CREATE SEQUENCE pessoa_id_seq START WITH 100;
CREATE SEQUENCE aloc_id_seq START WITH 100;
CREATE SEQUENCE venda_id_seq START WITH 100;

/*************** TRIGGERS ***************/
/* */
create or replace trigger "COMPRA_PRODUTO"

BEFORE insert on "COMPRA"

FOR EACH ROW
begin

    update produto
    set QtdEstoque = QtdEstoque + :new.QtdComprada
    where produto.id = :new.id_Produto;

end;

/* */
create or replace trigger "DECREMENTAR_ESTOQUE"

BEFORE insert on "ITEM"

FOR EACH ROW
begin

    update produto
    set QtdEstoque = QtdEstoque - :new.Qtd
    where produto.id = :new.id_Produto;

end;

create or replace trigger "AUTO_INCREMENTO_ITEM" BEFORE insert on ITEM

FOR EACH ROW
DECLARE
    vId number;
begin

  SELECT NVL(MAX(id), 0)
  INTO   vId
  FROM   item;
  
  :new.id := vId + 1;

end;

/*************** STORED PROCEDURES ***************/
/* */
CREATE OR REPLACE PROCEDURE "ADD_FUNCIONARIO" (
    id number,
    Nome varchar,
    CPF varchar,
    RG varchar,
    Sexo varchar,
    Telefone varchar,
    Data_Nasc date,
    Email varchar,
    id_endereco number,
    Matricula varchar,
	Data_Admissao date,
	Salario number,
	tipo_Funcionario varchar2 
)
IS
  vEXCEPTION EXCEPTION;
BEGIN   
    INSERT INTO PESSOA(id, Nome, CPF, RG, Sexo, Telefone, Data_Nasc, Email, id_endereco, tipo_Pessoa) VALUES (id, Nome, CPF, RG, Sexo, Telefone, Data_Nasc, Email, id_endereco, 'funcionario');
    
    INSERT INTO FUNCIONARIO(id_funcionario, Matricula, Data_Admissao, Salario, tipo_Funcionario) VALUES (id, Matricula, Data_Admissao, Salario, tipo_Funcionario);
END ADD_FUNCIONARIO;

/* */
CREATE OR REPLACE PROCEDURE "ADD_VENDEDOR" (
    id number,
    Nome varchar,
    CPF varchar,
    RG varchar,
    Sexo varchar,
    Telefone varchar,
    Data_Nasc date,
    Email varchar,
    id_endereco number,
    Matricula varchar,
	Data_Admissao date,
	Salario number
)
IS
  vEXCEPTION EXCEPTION;
BEGIN   
    ADD_FUNCIONARIO(id, Nome, CPF, RG, Sexo, Telefone, Data_Nasc, Email, id_endereco, Matricula, Data_Admissao, Salario, 'vendedor');
    
    INSERT INTO VENDEDOR(id_vendedor, Reputacao, QtdVendas) VALUES (id, 10, 0);
END ADD_VENDEDOR;

/* */
CREATE OR REPLACE PROCEDURE "ADD_FUNC"(
    Nome varchar,
    CPF varchar,
    RG varchar,
    Sexo varchar,
    Telefone varchar,
    Data_Nasc date,
    Email varchar,
    id_endereco number,
	Data_Admissao date,
	Salario number,
	Ramal varchar,
    Empresa number,
	Tipo varchar
)
IS
    vEXCEPTION EXCEPTION;
    vMatricula varchar(20);
    vPeriodo varchar(10);
    vId number;
BEGIN
    vPeriodo := TO_CHAR(Data_Admissao, 'YYYY');
    vMatricula := concat(vPeriodo, 'F');
    vId := pessoa_id_seq.NEXTVAL; 
    
    IF Tipo = 'v' THEN
        vMatricula := concat(vMatricula, 'V');
        vMatricula := concat(vMatricula, func_matriculaid_seq.NEXTVAL);
        INSERT INTO PESSOA(id, Nome, CPF, RG, Sexo, Telefone, Data_Nasc, Email, id_endereco, tipo_Pessoa) VALUES (vId, Nome, CPF, RG, Sexo, Telefone, Data_Nasc, Email, id_endereco, 'funcionario');
        INSERT INTO FUNCIONARIO(id_funcionario, Matricula, Data_Admissao, Salario, tipo_Funcionario) VALUES (vId, vMatricula, Data_Admissao, Salario, 'vendedor');
        INSERT INTO VENDEDOR(id_vendedor, Reputacao, QtdVendas) VALUES (vId, 10, 0);
        INSERT INTO ALOCACAO(id, id_Empresa, id_Vendedor, data) VALUES (aloc_id_seq.NEXTVAL, Empresa, vId, Data_Admissao);
    ELSIF Tipo = 'a' THEN
        vMatricula := concat(vMatricula, 'A');
        vMatricula := concat(vMatricula, func_matriculaid_seq.NEXTVAL);
        INSERT INTO PESSOA(id, Nome, CPF, RG, Sexo, Telefone, Data_Nasc, Email, id_endereco, tipo_Pessoa) VALUES (vId, Nome, CPF, RG, Sexo, Telefone, Data_Nasc, Email, id_endereco, 'funcionario');
        INSERT INTO FUNCIONARIO(id_funcionario, Matricula, Data_Admissao, Salario, tipo_Funcionario) VALUES (vId, vMatricula, Data_Admissao, Salario, 'atendente');
        INSERT INTO ATENDENTE(id_atendente, ramal) VALUES (vId, Ramal);
    ELSE
        dbms_output.put_line('TIPO INVALIDO');
        dbms_output.put_line('USE ''a'' para atendente ou ''v'' para vendedor');
    
    END IF;
	
	EXCEPTION
        WHEN OTHERS THEN      -- se qualquer erro ocorrer
        
        DBMS_OUTPUT.PUT_LINE('----------------------------------');
        DBMS_OUTPUT.PUT_LINE('Erro na execução da função.');
        DBMS_OUTPUT.PUT_LINE('Entre em contato com o administrador.');
        DBMS_OUTPUT.PUT_LINE('Código Oracle: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('Mensagem Oracle: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('----------------------------------');

END ADD_FUNC;

/* */
CREATE OR REPLACE PROCEDURE "ADD_VENDA"(
    DataVenda date,
    FormaPagamento varchar,
    id_vendedor number,
    id_Cliente number,
    tipo varchar
)
IS
  vEXCEPTION EXCEPTION;
  vId number;
BEGIN
    vId := venda_id_seq.NEXTVAL;
    IF tipo = 'a' THEN
        INSERT INTO Venda(id, DataVenda, FormaPagamento, id_vendedor, tipo_venda) VALUES (vId, DataVenda, FormaPagamento, id_vendedor, 'atacado');
        INSERT INTO Venda_Atacado(id_venda, id_Empresa) VALUES (vId, id_Cliente);
    ELSIF tipo = 'v' THEN
        INSERT INTO Venda(id, DataVenda, FormaPagamento, id_vendedor, tipo_venda) VALUES (vId, DataVenda, FormaPagamento, id_vendedor, 'varejo');
        INSERT INTO Venda_Varejo(id_venda, id_Cliente_PF) VALUES (vId, id_Cliente);
    ELSE
        dbms_output.put_line('TIPO INVALIDO');
        dbms_output.put_line('USE ''a'' para atacado ou ''v'' para varejo');
    END IF;

    EXCEPTION
        WHEN OTHERS THEN      -- se qualquer erro ocorrer
        
        DBMS_OUTPUT.PUT_LINE('----------------------------------');
        DBMS_OUTPUT.PUT_LINE('Erro na execução da função.');
        DBMS_OUTPUT.PUT_LINE('Entre em contato com o administrador.');
        DBMS_OUTPUT.PUT_LINE('Código Oracle: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('Mensagem Oracle: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('----------------------------------');

END ADD_VENDA;

/* */
CREATE OR REPLACE PROCEDURE "ADD_CLIENTE_PF"(
    Nome varchar,
    CPF varchar,
    RG varchar,
    Sexo varchar,
    Telefone varchar,
    Data_Nasc date,
    Email varchar,
    id_endereco number,
    Senha varchar
)
IS
    vEXCEPTION EXCEPTION;
    vId number;
BEGIN
    vId := pessoa_id_seq.NEXTVAL;
    INSERT INTO PESSOA(id, Nome, CPF, RG, Sexo, Telefone, Data_Nasc, Email, id_endereco, tipo_Pessoa) VALUES (vId, Nome, CPF, RG, Sexo, Telefone, Data_Nasc, Email, id_endereco, 'clientepf');
    INSERT INTO CLIENTE_PF(id_clientePF, Usuario, Senha) VALUES (vId, Email, Senha);
END ADD_CLIENTE_PF;

/* */
CREATE OR REPLACE PROCEDURE "ADD_ATEND_AUTOMATICO" (
    id number,
    Categoria varchar,
    SatisfacaoCliente varchar,
    Id_Cliente number,
    Topico varchar,
    Perguntas varchar,
    Respostas varchar
)
IS
  vEXCEPTION EXCEPTION;
BEGIN   
    INSERT INTO ATENDIMENTO(id, Categoria, SatisfacaoCliente, tipo_Atendimento) VALUES (id, Categoria, SatisfacaoCliente, 'automatico');
    
    INSERT INTO ATENDIMENTO_AUTOMATICO(id_Atendimento, Topico, Perguntas, Respostas, id_Cliente_PF) VALUES (id, Topico, Perguntas, Respostas, Id_Cliente);
END ADD_ATEND_AUTOMATICO;

/* */
CREATE OR REPLACE PROCEDURE "ADD_ATEND_PERSONALIZADO" (
    id number,
    Categoria varchar,
    SatisfacaoCliente varchar,
    Id_Cliente number,
    Protocolo number,
    dataAtend date,
    ResumoOcorrencia varchar,
    Descricao varchar,
    Duracao number
)
IS
  vEXCEPTION EXCEPTION;
BEGIN   
    INSERT INTO ATENDIMENTO(id, Categoria, SatisfacaoCliente, tipo_Atendimento) VALUES (id, Categoria, SatisfacaoCliente, 'personalizado');
    
    INSERT INTO ATENDIMENTO_PERSONALIZADO(id_Atendimento, Protocolo, dataAtend, ResumoOcorrencia, Descricao, Duracao, id_Cliente_PJ) VALUES (id, Protocolo, dataAtend, ResumoOcorrencia, Descricao, Duracao, Id_Cliente);
END ADD_ATEND_PERSONALIZADO;

/* RELATÓRIOS */

/* Itens vendidos por venda */
CREATE OR REPLACE PROCEDURE "ITENS_VENDA"   
IS    
    ID_VENDA number;  
    NOME varchar(100);  
    MARCA varchar(100);  
    MODELO varchar(100);  
cursor resultado is    
    select VENDA.id as ID_VENDA, PRODUTO.nome as NOME_PRODUTO, PRODUTO.marca, PRODUTO.modelo from VENDA   
    join ITEM on VENDA.id = ITEM.id_venda  
    join PRODUTO on PRODUTO.id = ITEM.id_produto  
    order by VENDA.id;  
begin    
    open resultado;    
    LOOP  
        fetch resultado into ID_VENDA, NOME, MARCA, MODELO;  
        exit when resultado%notfound; 
        dbms_output.put_line('A venda ' || ID_VENDA  || ' tem o produto ' || NOME || ' da marca' || MARCA || 'e do modelo ' || MODELO);    
    END LOOP;  
        close resultado;    
END ITENS_VENDA;

/* Lista de todas as compras do cliente ( de 1 ou N clientes) */
CREATE OR REPLACE PROCEDURE "COMPRAS_CLIENTE" (TIPO varchar, ID_PARAMETRO number) 
IS  
    NOME_CLIENTE varchar(100);  
    ID_VENDA number;  
cursor n_clientes_pf is  
    select PESSOA.nome as NOME_CLIENTE, VENDA_VAREJO.id_venda  from PESSOA 
    join CLIENTE_PF on PESSOA.id = CLIENTE_PF.id_clientePF 
    join VENDA_VAREJO on PESSOA.id = VENDA_VAREJO.id_Cliente_PF
    group by PESSOA.nome, VENDA_VAREJO.id_venda
    order by PESSOA.nome;
cursor cliente_pf is
    select PESSOA.nome as NOME_CLIENTE, VENDA_VAREJO.id_venda  from PESSOA 
    join CLIENTE_PF on PESSOA.id = CLIENTE_PF.id_clientePF 
    join VENDA_VAREJO on PESSOA.id = VENDA_VAREJO.id_Cliente_PF
    where ID_PARAMETRO = PESSOA.id
    group by PESSOA.nome, VENDA_VAREJO.id_venda
    order by PESSOA.nome;
cursor n_clientes_pj is
    select EMPRESA.nome as NOME_EMPRESA, VENDA_ATACADO.id_venda from EMPRESA 
    join VENDA_ATACADO on EMPRESA.id = VENDA_ATACADO.id_empresa
    group by EMPRESA.nome, VENDA_ATACADO.id_venda
    order by EMPRESA.nome;
cursor cliente_pj is 
    select EMPRESA.nome as NOME_EMPRESA, VENDA_ATACADO.id_venda from EMPRESA 
    join VENDA_ATACADO on EMPRESA.id = VENDA_ATACADO.id_empresa
    where ID_PARAMETRO = EMPRESA.id
    group by EMPRESA.nome, VENDA_ATACADO.id_venda
    order by EMPRESA.nome;
begin
    IF TIPO = 'P' THEN
        IF ID_PARAMETRO IS NULL THEN 
            open n_clientes_pf;
            LOOP
                fetch n_clientes_pf into NOME_CLIENTE, ID_VENDA; 
                exit when n_clientes_pf%notfound;
                dbms_output.put_line('A venda ' || ID_VENDA  || ' foi feita para o/a ' || NOME_CLIENTE);  
            END LOOP;
            close n_clientes_pf;  
        ELSE
            open cliente_pf;
            LOOP
                fetch cliente_pf into NOME_CLIENTE, ID_VENDA; 
                exit when cliente_pf%notfound;
                dbms_output.put_line('A venda ' || ID_VENDA  || ' foi feita para o/a ' || NOME_CLIENTE);  
            END LOOP;
            close cliente_pf;
        END IF;
    ELSIF TIPO = 'E' THEN
        IF ID_PARAMETRO IS NULL THEN 
            open n_clientes_pj;
            LOOP
                fetch n_clientes_pj into NOME_CLIENTE, ID_VENDA; 
                exit when n_clientes_pj%notfound;
                dbms_output.put_line('A venda ' || ID_VENDA  || ' foi feita para a empresa ' || NOME_CLIENTE);  
            END LOOP;
            close n_clientes_pj;  
        ELSE
            open cliente_pj;
            LOOP
                fetch cliente_pj into NOME_CLIENTE, ID_VENDA; 
                exit when cliente_pj%notfound;
                dbms_output.put_line('A venda ' || ID_VENDA  || ' foi feita para a empresa ' || NOME_CLIENTE);  
            END LOOP;
            close cliente_pj;
        END IF;
    END IF;
END COMPRAS_CLIENTE;

/*Lista de todas as vendas do vendedor  */
CREATE OR REPLACE PROCEDURE "VENDAS_VENDEDOR" (ID_PARAMETRO number) 
IS  
    NOME_VENDEDOR varchar(100);  
    ID_VENDA number;
    
cursor n_vendedores is  

    select PESSOA.nome as NOME_VENDEDOR, VENDA.id  from PESSOA 
    join VENDEDOR on PESSOA.id = VENDEDOR.id_vendedor 
    join VENDA on PESSOA.id = VENDA.id_vendedor
    group by PESSOA.nome, VENDA.id
    order by PESSOA.nome;
    
cursor vendedor is

    select PESSOA.nome as NOME_VENDEDOR, VENDA.id  from PESSOA 
    join VENDEDOR on PESSOA.id = VENDEDOR.id_vendedor 
    join VENDA on PESSOA.id = VENDA.id_vendedor
    where VENDEDOR.id_vendedor = ID_PARAMETRO;

begin
        IF ID_PARAMETRO IS NULL THEN 
            open n_vendedores;
            LOOP
                fetch n_vendedores into NOME_VENDEDOR, ID_VENDA; 
                exit when n_vendedores%notfound;
                dbms_output.put_line('A venda ' || ID_VENDA  || ' foi feita pelo vendedor ' || NOME_VENDEDOR);  
            END LOOP;
            close n_vendedores;  
        ELSE
            open vendedor;
            LOOP
                fetch vendedor into NOME_VENDEDOR, ID_VENDA; 
                exit when vendedor%notfound;
                dbms_output.put_line('A venda ' || ID_VENDA  || ' foi feita pelo vendedor ' || NOME_VENDEDOR);  
            END LOOP;
            close vendedor;
        END IF;
END VENDAS_VENDEDOR;

/* Relatório de gasto e ganho */
CREATE OR REPLACE PROCEDURE "GASTO_GANHO" 
IS  
    GANHO number;  
    GASTO number;  
cursor resultado is  
    select A.GASTO, sum(B.GANHO) as GANHO
    from
    (select sum(VALORCOMPRA) as GASTO from COMPRA
    join EMPRESA on EMPRESA.id = COMPRA.id_empresa) A,
    
    (select EMPRESA.nome as NOME_EMPRESA, sum(A.TOTAL) as GANHO
    from
    (select PESSOA.id as ID_VENDEDOR, VENDA.id as ID_VENDA, sum(PRODUTO.PrecoUnitario) as TOTAL
    from PESSOA 
    join VENDEDOR on PESSOA.id = VENDEDOR.id_vendedor
    join VENDA on PESSOA.id = VENDA.id_vendedor
    join ITEM on ITEM.id_venda = VENDA.id
    join PRODUTO on PRODUTO.id = ITEM.id_produto
    group by PESSOA.id, VENDA.id) A
    join ALOCACAO on A.ID_VENDEDOR = ALOCACAO.id_vendedor
    join EMPRESA on EMPRESA.id = ALOCACAO.id_empresa
    group by EMPRESA.nome) B
    group by A.GASTO;
begin  
    open resultado;  
        fetch resultado into GASTO, GANHO;  
        dbms_output.put_line('GASTO: ' || GASTO  || ' GANHO: ' || GANHO);  
        close resultado;  
END GASTO_GANHO;

/*Relatório de reabastecimento de produto pelo fornecedor */
CREATE OR REPLACE PROCEDURE "REABASTECIMENTO"   
IS    
    ID_COMPRA number;
    QTD number;
    RAZAO_SOCIAL varchar(100);
    NOME_PRODUTO varchar(100);
    MARCA varchar(100);
    MODELO varchar(100);
cursor resultado is    
    select compra.id, compra.QtdComprada, empresa.RAZAO_SOCIAL, produto.nome, produto.marca, produto.modelo
    from compra 
    join produto on produto.id = compra.id_produto 
    join empresa on empresa.id = compra.id_empresa;
begin    
    open resultado;    
    LOOP  
        fetch resultado into ID_COMPRA, QTD, RAZAO_SOCIAL, NOME_PRODUTO, MARCA, MODELO;  
        exit when resultado%notfound; 
        dbms_output.put_line('No reabastecimento ' || ID_COMPRA  || ' fornecido pela empresa ' || RAZAO_SOCIAL || ' foram compradas ' 
        || QTD || ' unidades de ' || NOME_PRODUTO || ' da marca ' || MARCA || ' e modelo ' || MODELO);    
    END LOOP;  
        close resultado;    
END REABASTECIMENTO;

/* Relatório geral de venda tendo relação com as tabelas cliente, vendedor, venda, item, produto */
CREATE OR REPLACE PROCEDURE "VENDA_GERAL" (ID_PARAMETRO number)  
IS  
    ID_CLIENTE number;  
    ID_VENDA number;  
    MARCA varchar(100);  
    MODELO varchar(100);  
    VENDEDOR_ID number;  
cursor resultado_venda is  
    select CLIENTE_PF.id_ClientePF as ID_CLIENTE, VENDA.id as ID_VENDA, PRODUTO.MARCA, PRODUTO.MODELO, VENDEDOR.id_vendedor as ID_VENDEDOR  
    from VENDA  
    join ITEM on VENDA.id = ITEM.id_venda  
    join PRODUTO on PRODUTO.id = ITEM.id_produto  
    join VENDA_VAREJO on VENDA.id = VENDA_VAREJO.id_venda  
    join CLIENTE_PF on CLIENTE_PF.id_ClientePF = VENDA_VAREJO.id_Cliente_PF  
    join VENDEDOR on VENDEDOR.id_vendedor = VENDA.id_vendedor  
    where VENDA.id = ID_PARAMETRO;  
begin  
    open resultado_venda;  
    LOOP  
        fetch resultado_venda into ID_CLIENTE, ID_VENDA, MARCA, MODELO, VENDEDOR_ID;  
        exit when resultado_venda%notfound;  
        dbms_output.put_line('ID_CLIENTE: ' || ID_CLIENTE  || ' ID_VENDA: ' || ID_VENDA  || ' MARCA: ' || MARCA  || ' MODELO: ' || MODELO  || ' VENDEDOR_ID: ' || VENDEDOR_ID);  
    END LOOP;  
        close resultado_venda;  
END VENDA_GERAL;

/* Total de valor de cada compra do cliente(de 1 ou intervalo de data) */
CREATE OR REPLACE PROCEDURE "TOTAL_COMPRA" (TIPO varchar, INICIO varchar, FIM varchar)
IS  
    NOME_CLIENTE varchar(100);  
    ID_VENDA number; 
    TOTAL number;

cursor com_intervalo is

    select PESSOA.nome as NOME_CLIENTE, VENDA_VAREJO.id_venda, sum(PRODUTO.PrecoUnitario) as TOTAL 
    from PESSOA 
    join CLIENTE_PF on PESSOA.id = CLIENTE_PF.id_clientePF 
    join VENDA_VAREJO on PESSOA.id = VENDA_VAREJO.id_Cliente_PF
    join ITEM on ITEM.id_venda = VENDA_VAREJO.id_venda
    join PRODUTO on PRODUTO.id = ITEM.id_produto
    join VENDA on VENDA.id = VENDA_VAREJO.id_Venda
    where VENDA.DataVenda BETWEEN TO_DATE(INICIO, 'DD/MM/YYYY') AND TO_DATE(FIM, 'DD/MM/YYYY')
    group by PESSOA.nome, VENDA_VAREJO.id_venda;
    
cursor sem_intervalo is

    select PESSOA.nome as NOME_CLIENTE, VENDA_VAREJO.id_venda, sum(PRODUTO.PrecoUnitario) as TOTAL 
    from PESSOA 
    join CLIENTE_PF on PESSOA.id = CLIENTE_PF.id_clientePF 
    join VENDA_VAREJO on PESSOA.id = VENDA_VAREJO.id_Cliente_PF
    join ITEM on ITEM.id_venda = VENDA_VAREJO.id_venda
    join PRODUTO on PRODUTO.id = ITEM.id_produto
    join VENDA on VENDA.id = VENDA_VAREJO.id_Venda
    where VENDA.DataVenda = TO_DATE(INICIO, 'DD/MM/YYYY')
    group by PESSOA.nome, VENDA_VAREJO.id_venda;
    
cursor com_intervalo_e is

    select EMPRESA.nome as NOME_EMPRESA, VENDA_ATACADO.id_venda, sum(PRODUTO.PrecoUnitario) as TOTAL
    from EMPRESA 
    join VENDA_ATACADO on EMPRESA.id = VENDA_ATACADO.id_empresa
    join ITEM on ITEM.id_venda = VENDA_ATACADO.id_venda
    join PRODUTO on PRODUTO.id = ITEM.id_produto
    join VENDA on VENDA.id = VENDA_ATACADO.id_venda
    where VENDA.DataVenda BETWEEN TO_DATE(INICIO, 'DD/MM/YYYY') AND TO_DATE(FIM, 'DD/MM/YYYY')
    group by EMPRESA.nome, VENDA_ATACADO.id_venda
    order by EMPRESA.nome;
    
cursor sem_intervalo_e is

    select EMPRESA.nome as NOME_EMPRESA, VENDA_ATACADO.id_venda, sum(PRODUTO.PrecoUnitario) as TOTAL
    from EMPRESA 
    join VENDA_ATACADO on EMPRESA.id = VENDA_ATACADO.id_empresa
    join ITEM on ITEM.id_venda = VENDA_ATACADO.id_venda
    join PRODUTO on PRODUTO.id = ITEM.id_produto
    join VENDA on VENDA.id = VENDA_ATACADO.id_venda
    where VENDA.DataVenda = TO_DATE(INICIO, 'DD/MM/YYYY')
    group by EMPRESA.nome, VENDA_ATACADO.id_venda
    order by EMPRESA.nome;
    
begin

    IF TIPO = 'P' THEN
        IF FIM is null THEN
            open sem_intervalo;
            LOOP
                fetch sem_intervalo into NOME_CLIENTE, ID_VENDA, TOTAL;
                exit when sem_intervalo%notfound;
                dbms_output.put_line('O total da venda ' || ID_VENDA  || ' feita para o/a cliente ' || NOME_CLIENTE || ' foi de ' || TOTAL || ' REAIS');
            END LOOP;
            close sem_intervalo;
        ELSE
            open com_intervalo;
            LOOP
                fetch com_intervalo into NOME_CLIENTE, ID_VENDA, TOTAL;
                exit when com_intervalo%notfound;
                dbms_output.put_line('O total da venda ' || ID_VENDA  || ' feita para o/a cliente ' || NOME_CLIENTE || ' foi de ' || TOTAL || ' REAIS');
            END LOOP;
            close com_intervalo;
        END IF;
    ELSIF TIPO = 'E' THEN
        IF FIM is null THEN
            open sem_intervalo_e;
            LOOP
                fetch sem_intervalo_e into NOME_CLIENTE, ID_VENDA, TOTAL;
                exit when sem_intervalo_e%notfound;
                dbms_output.put_line('O total da venda ' || ID_VENDA  || ' feita para a empresa ' || NOME_CLIENTE || ' foi de ' || TOTAL || ' REAIS');
            END LOOP;
            close sem_intervalo_e;
        ELSE
            open com_intervalo_e;
            LOOP
                fetch com_intervalo_e into NOME_CLIENTE, ID_VENDA, TOTAL;
                exit when com_intervalo_e%notfound;
                dbms_output.put_line('O total da venda ' || ID_VENDA  || ' feita para a empresa ' || NOME_CLIENTE || ' foi de ' || TOTAL || ' REAIS');
            END LOOP;
            close com_intervalo_e;
        END IF;
    END IF;
END TOTAL_COMPRA;

/* Total de valor de cada venda do vendedor(de 1 ou intervalo de data) */
CREATE OR REPLACE PROCEDURE "TOTAL_VENDEDOR" (INICIO varchar, FIM varchar)
IS  
    NOME_VENDEDOR varchar(100);  
    ID_VENDA number; 
    TOTAL number;

cursor com_intervalo is

    select PESSOA.nome as NOME_VENDEDOR, VENDA.id as ID_VENDA, sum(PRODUTO.PrecoUnitario) as TOTAL 
    from PESSOA 
    join VENDEDOR on PESSOA.id = VENDEDOR.id_vendedor
    join VENDA on PESSOA.id = VENDA.id_vendedor
    join ITEM on ITEM.id_venda = VENDA.id
    join PRODUTO on PRODUTO.id = ITEM.id_produto
    where VENDA.DataVenda BETWEEN TO_DATE(INICIO, 'DD/MM/YYYY') AND TO_DATE(FIM, 'DD/MM/YYYY')
    group by PESSOA.nome, VENDA.id;
    
cursor sem_intervalo is

    select PESSOA.nome as NOME_VENDEDOR, VENDA.id as ID_VENDA, sum(PRODUTO.PrecoUnitario) as TOTAL 
    from PESSOA 
    join VENDEDOR on PESSOA.id = VENDEDOR.id_vendedor
    join VENDA on PESSOA.id = VENDA.id_vendedor
    join ITEM on ITEM.id_venda = VENDA.id
    join PRODUTO on PRODUTO.id = ITEM.id_produto
    where VENDA.DataVenda = TO_DATE(INICIO, 'DD/MM/YYYY')
    group by PESSOA.nome, VENDA.id;
    
begin
    IF FIM is null THEN
        open sem_intervalo;
        LOOP
            fetch sem_intervalo into NOME_VENDEDOR, ID_VENDA, TOTAL;
            exit when sem_intervalo%notfound;
            dbms_output.put_line('O total da venda ' || ID_VENDA  || ' feita pelo vendedor ' || NOME_VENDEDOR || ' foi de ' || TOTAL || ' REAIS');
        END LOOP;
        close sem_intervalo;
    ELSE
        open com_intervalo;
        LOOP
            fetch com_intervalo into NOME_VENDEDOR, ID_VENDA, TOTAL;
            exit when com_intervalo%notfound;
            dbms_output.put_line('O total da venda ' || ID_VENDA  || ' feita pelo vendedor ' || NOME_VENDEDOR || ' foi de ' || TOTAL || ' REAIS');
        END LOOP;
        close com_intervalo;
    END IF;
END TOTAL_VENDEDOR;

/*Valor de vendas em cada filial em determinado período*/
CREATE OR REPLACE PROCEDURE "VENDAS_FILIAL" (INICIO varchar, FIM varchar)
IS  
    NOME_EMPRESA varchar(100);  
    TOTAL number;

cursor resultado is

    select EMPRESA.nome as NOME_EMPRESA, sum(A.TOTAL) as VALOR_VENDAS_FILIAL
    from
    (select PESSOA.id as ID_VENDEDOR, VENDA.id as ID_VENDA, sum(PRODUTO.PrecoUnitario) as TOTAL
    from PESSOA 
    join VENDEDOR on PESSOA.id = VENDEDOR.id_vendedor
    join VENDA on PESSOA.id = VENDA.id_vendedor
    join ITEM on ITEM.id_venda = VENDA.id
    join PRODUTO on PRODUTO.id = ITEM.id_produto
    where VENDA.DataVenda BETWEEN TO_DATE(INICIO, 'DD/MM/YYYY') AND TO_DATE(FIM, 'DD/MM/YYYY')
    group by PESSOA.id, VENDA.id) A
    join ALOCACAO on A.ID_VENDEDOR = ALOCACAO.id_vendedor
    join EMPRESA on EMPRESA.id = ALOCACAO.id_empresa
    group by EMPRESA.nome;
    
begin
    open resultado;
    LOOP
        fetch resultado into NOME_EMPRESA, TOTAL;
        exit when resultado%notfound;
        dbms_output.put_line('O valor das vendas da filial ' || NOME_EMPRESA  || ' no período passado foi de ' || TOTAL);
    END LOOP;
    close resultado;

END VENDAS_FILIAL;


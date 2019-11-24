/*************** SEQUENCE ***************/
CREATE SEQUENCE func_matriculaid_seq START WITH 1000;
CREATE SEQUENCE func_id_seq START WITH 100;
CREATE SEQUENCE aloc_id_seq START WITH 100;

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
    vId := func_id_seq.NEXTVAL; 
    
    IF Tipo = 'v' THEN
        vMatricula := concat(vMatricula, 'V');
        vMatricula := concat(vMatricula, func_matriculaid_seq.NEXTVAL);
        INSERT INTO PESSOA(id, Nome, CPF, RG, Sexo, Telefone, Data_Nasc, Email, id_endereco, tipo_Pessoa) VALUES (vId, Nome, CPF, RG, Sexo, Telefone, Data_Nasc, Email, id_endereco, 'funcionario');
        INSERT INTO FUNCIONARIO(id_funcionario, Matricula, Data_Admissao, Salario, tipo_Funcionario) VALUES (vId, vMatricula, Data_Admissao, Salario, 'vendedor');
        INSERT INTO VENDEDOR(id_vendedor, Reputacao, QtdVendas) VALUES (vId, 10, 0);
        INSERT INTO ALOCACAO(id, id_Empresa, id_Vendedor) VALUES (aloc_id_seq.NEXTVAL, Empresa, vId);
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

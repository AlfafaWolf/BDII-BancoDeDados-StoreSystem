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
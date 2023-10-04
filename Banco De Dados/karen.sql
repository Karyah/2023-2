/*comandos ddl*/
drop table tb_funcionario cascade constraints;

create table tb_funcionario(
    id_func number(8),
    salario_func number(7,2)
);

insert into tb_funcionario values(0,2500);
insert into tb_funcionario values(1,5200);

select * from tb_funcionario;

drop table departamento cascade constraints;

create table departamento(
    nome varchar(80),
    qtd_funcionarios number(3)
);

insert into departamento values('Financeiro', 12);
insert into departamento values('Administrativo', 20);
insert into departamento values('Comercial', 6);
insert into departamento values('Jur�dico', 10);
insert into departamento values('Marketing', 8);

alter table tb_funcionario add nome_gerente varchar2(80) null;
insert into tb_funcionario (id_func, salario_func, nome_gerente) values(5,1750,'Carlos Teves');

create table log_funcionario(
    usuario varchar (80),
    data_insercao date,
    tipo varchar(80)  
);

create table log_dep(
data_modificacao date
);
/*-------------------------------------------------------------------------------------*/

set serveroutput on;

/*
EXERCICIOS 1 E 2 PACKAGE

1. Crie um pacote PL/SQL chamado "pkg_funcionario" que contenha uma fun��o 
para retornar o sal�rio de um funcion�rio com base no ID.

2. Adicione um procedimento ao pacote "pkg_funcionario" para atualizar o 
sal�rio de um funcion�rio
*/

create or replace package pkg_funcionario is 
    function retorna_salario(p_id in number) return number;
    procedure atualiza_salario(p_salario in number, p_id in number);
end; 

create or replace package body pkg_funcionario is
    function retorna_salario(p_id in number) return number as
    
    cursor c_cursor is  select * from tb_funcionario where id_func = nvl(p_id, id_func);
    v_cursor tb_funcionario%rowtype;
    begin 
        open c_cursor;
        loop    
        fetch c_cursor into v_cursor;
        exit when c_cursor%notfound;
        end loop;
       
        return v_cursor.salario_func;
    end;
    
    procedure atualiza_salario(p_salario in number, p_id in number) as
    
    begin
        update tb_funcionario set salario_func = p_salario where id_func = nvl(p_id, id_func);
        commit;
    end;
end;

declare
    v_salario number(7,2);
begin 
    v_salario := pkg_funcionario.retorna_salario(0);
    dbms_output.put_line('salario do funcionario id 0: '||v_salario);
     v_salario := pkg_funcionario.retorna_salario(1);
    dbms_output.put_line('salario do funcionario id 1: '||v_salario);
end;

execute pkg_funcionario.atualiza_salario(3000,0);

select * from tb_funcionario;

/*
EXERCICIO 3 PACKAGE
3. Crie um pacote chamado "pkg_matematica" que inclua uma fun��o para 
calcular o fatorial de um n�mero.
*/

create or replace package pkg_matematica is
    function calcula_fatorial(p_numero in number) return number;
end;

create or replace package body is
    function calcula_fatorial(p_numero in number) return number is
    begin 
        if (p_numero <0) then 
        dbms_output.put_line('N�o � possivel calcular o numero fatorial de valores negativos.');
        return null;
        
        elsif (p_numero==0 or p_numero==1) then
        dbms_output.put_line('1');
        return 1;
    end;
end;

/*
EXERCICIO 4 PACKAGE
4. Desenvolva um pacote "pkg_string" que ofere�a uma fun��o para inverter 
uma string passado por par�metro
*/

/*
EXERCICIO 5 - PROCEDURE
5. Escreva uma procedure que aceite o nome de um departamento e retorne o 
n�mero total de funcion�rios nesse departamento
*/

create or replace procedure retorna_funcionarios(p_departamento in varchar, p_total_func out number) as
    cursor c_cursor is select qtd_funcionarios from departamento where nome = p_departamento;
    v_cursor c_cursor%rowtype;
    begin
        open c_cursor;
        loop    
        fetch c_cursor into v_cursor;
        
        exit when c_cursor%notfound;
        end loop;
        p_total_func := v_cursor.qtd_funcionarios;
     
    end;

declare
    v_total_func number(3);
begin 
    retorna_funcionarios('Financeiro',v_total_func);
    dbms_output.put_line('Valor total de funcionarios:'||v_total_func);
end;

/*
EXERCICIO 6 - PROCEDURE
6. Crie uma procedure que insira um novo registro na tabela de funcion�rios.
*/

create or replace procedure insere_func(p_id number, p_salario number) is
    begin 
    insert into tb_funcionario (id_func, salario_func) values(p_id, p_salario);
    commit;
    end;

begin 
    insere_func(2,1350);
    insere_func(3,4200);
end;

select * from tb_funcionario;

/*
EXERCICIO 7 - PROCEDURE
7. Desenvolva uma procedure que aceite o ID de um funcion�rio e retorne em um par�metro de sa�da o nome do gerente desse funcion�rio.
*/

create or replace procedure retorna_nome_gerente(p_id number, p_nome_gerente out varchar) is
    cursor c_cursor is select nome_gerente from tb_funcionario where id_func = nvl(p_id, id_func);
    v_cursor c_cursor%rowtype;
    
    begin 
        open c_cursor;
        loop
        fetch c_cursor into v_cursor;
        exit when c_cursor%notfound;
        end loop;
        p_nome_gerente := v_cursor.nome_gerente;
    end;

declare 
    v_nome_gerente varchar(80);
begin
    retorna_nome_gerente(5, v_nome_gerente);
    dbms_output.put_line('Nome do gerente: '||v_nome_gerente);
end;

/*
EXERCICIO  8 - PROCEDURE
Implemente uma procedure que exclua um funcion�rio com base no seu ID.
*/

create or replace procedure deleta_func(p_id number) is
    begin
        delete from tb_funcionario where id_func = p_id;
        commit;
    end;
    
begin 
    deleta_func(2);
end;

select * from tb_funcionario;

/*
EXERCICIO 9 - TRIGGERS
9. Crie um trigger que registre todas as altera��es na tabela de funcion�rios em 
uma tabela de log.
*/

create or replace trigger log_func before insert or update or delete on tb_funcionario
    begin 
        if inserting then 
            insert into log_funcionario values (user, sysdate, 'Insert');
        elsif updating then 
            insert into log_funcionario values (user, sysdate, 'Update');
        else 
            insert into log_funcionario values (user, sysdate, 'Delete');
        end if;
    end; 
    
/*Verificando se est� mostrando no log*/
insert into tb_funcionario values(2,3200, 'Ana Carla');

select * from log_funcionario;
select * from tb_funcionario;
/*
EXERCICIO 10 - TRIGGERS
10. Escreva um trigger que impe�a a inser��o de um novo funcion�rio com
sal�rio menor que o sal�rio m�nimo atual da nossa legisla��o.
*/

create or replace procedure validar_salario(p_salario in number) as
    begin 
    if p_salario < 1320 then
        raise_application_error(-20001, 'O sal�rio n�o pode ser menor que o sal�rio m�nimo.');  
    end if;
    end;
    
create or replace trigger verifica_sal
    before insert on tb_funcionario
    for each row
        begin 
            validar_salario(:new.salario_func);
        end;

insert into tb_funcionario values(6,1100, 'Beatriz');
/*  
EXERCICIO 11 - TRIGGERS
11. Desenvolva um trigger que atualize automaticamente a data de modifica��o
da tabela departamento, sempre que um registro na tabela de departamentos
for atualizado.
*/

create or replace trigger log_departamento before update on departamento
begin 
    if updating then
        insert into log_dep values(sysdate);
    end if;
end;

insert into departamento values('T.I', 20);

update departamento set nome = 'Programa��o ' where nome='T.I';

select * from log_dep;

/*
12. Implemente um trigger que notifique em uma tabela de recursos humanos
sempre que um novo funcion�rio for contratado.
*/





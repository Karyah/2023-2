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

alter table tb_funcionario add nome_gerente varchar2(80) null;
insert into tb_funcionario (id_func, salario_func, nome_gerente) values(5,1750,'Carlos Teves');
/*-------------------------------------------------------------------------------------*/

set serveroutput on;

/*
EXERCICIOS 1 E 2 PACKAGE

1. Crie um pacote PL/SQL chamado "pkg_funcionario" que contenha uma funï¿½ï¿½o 
para retornar o salï¿½rio de um funcionï¿½rio com base no ID.

2. Adicione um procedimento ao pacote "pkg_funcionario" para atualizar o 
salï¿½rio de um funcionï¿½rio
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
3. Crie um pacote chamado "pkg_matematica" que inclua uma funï¿½ï¿½o para 
calcular o fatorial de um nï¿½mero.
*/

create or replace package pkg_matematica is
    function calcula_fatorial(p_numero in number) return number;
end;

create or replace package body is
    function calcula_fatorial(p_numero in number) return number is
    begin 
        if (p_numero <0) then 
        dbms_output.put_line('Nï¿½o ï¿½ possivel calcular o numero fatorial de valores negativos.');
        return null;
        
        elsif (p_numero==0 or p_numero==1) then
        dbms_output.put_line('1');
        return 1;
    end;
end;

/*
EXERCICIO 4 PACKAGE
4. Desenvolva um pacote "pkg_string" que ofereï¿½a uma funï¿½ï¿½o para inverter 
uma string passado por parï¿½metro
*/

/*
EXERCICIO 5 - PROCEDURE
5. Escreva uma procedure que aceite o nome de um departamento e retorne o 
nï¿½mero total de funcionï¿½rios nesse departamento
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
6. Crie uma procedure que insira um novo registro na tabela de funcionï¿½rios.
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
7. Desenvolva uma procedure que aceite o ID de um funcionï¿½rio e retorne em um parï¿½metro de saï¿½da o nome do gerente desse funcionï¿½rio.
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
Implemente uma procedure que exclua um funcionário com base no seu ID.
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
9. Crie um trigger que registre todas as alterações na tabela de funcionï¿½rios em 
uma tabela de log.
*/
select * from user_sys_privs;

set serveroutput on;

create or replace procedure prc_test(numero in number) is
begin
    if numero >= 10 then 
        dbms_output.put_line(numero);
    else 
        dbms_output.put_line('corno');
    end if;
end;

create or replace function fnc_test (numero in number) return number as
begin 
    if numero >= 10 then
        dbms_output.put_line('É Maoir que 10');
        return numero;
    else 
        dbms_output.put_line('É Menor que 10');
    end if; 
end;


declare 
    numero number(10);
begin
    numero := fnc_test(90);
    dbms_output.put_line(numero);
end;
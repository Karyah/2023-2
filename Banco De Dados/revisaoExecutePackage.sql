set serveroutput on;

begin
pkg_calculadora.calcula_reajuste(1000);
end;

execute pkg_calculadora.calcula_reajuste(1000);

drop package pkg_calculadora;

execute dbms_output.put_line(pkg_global.v_milha);
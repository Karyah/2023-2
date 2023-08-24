select * from aluno1;

create table tab_audit_dml(
    nome_tabela varchar2(30),
    nome_usuario varchar2(30),
    dat_evento date,
    tipo_evento varchar2(70)
);

create or replace trigger trg_audit_aluno
before insert or update or delete on aluno1
declare 
begin
    if inserting then     
        insert  into tab_audit_dml values ('aluno', user, sysdate, 'insert');
    elsif updating then
        insert  into tab_audit_dml values ('aluno', user, sysdate, 'update');
    elsif deleting then
        insert  into tab_audit_dml values ('aluno', user, sysdate, 'delete');
    end if;
end;

insert into aluno1 (rm, nome, cpf) values (9, 'joaao camargos', '12345678912');

select * from tab_audit_dml;

alter table tab_audit_dml add nome_aluno varchar2(30);


create or replace trigger tgr_after_aluno 
after insert or update or delete on aluno1
for each row
declare
begin 
    if inserting then 
        insert  into tab_audit_dml (nome_aluno) values (:new.nome);
    end if;
end;

insert into aluno1 (rm, nome, cpf) values (10, 'joana mendes', '78945636578');


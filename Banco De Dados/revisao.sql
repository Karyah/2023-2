create table aluno1 (
rm number (10),
nome varchar2(20),
cpf varchar2(11)
);

insert into aluno1 values(1, 'Jao', '11111111111');
insert into aluno1 values(2, 'Maria', '22222222222');
insert into aluno1 values(3, 'Jose', '33333333333');
insert into aluno1 values(4, 'Bruno', '44444444444');

create or replace procedure prc_insere_aluno( p_rm_aluno in aluno1.rm%type, p_nome_aluno aluno1.nome%type, p_cpf_aluno in aluno1.cpf%type) is
begin 
insert into aluno1 (rm, nome, cpf) values (p_rm_aluno, p_nome_aluno, p_cpf_aluno);
commit;
exception
    when others then 
        raise_application_error(-20023, 'Erro crítico ! insere aluno'||SQLErrM);
end;
        
select * from aluno1;

desc prc_insere_aluno;

execute prc_insere_aluno(5,'Daniel', '55555555555');
-- isto ser um parametro posicional

execute prc_insere_aluno(p_nome_aluno => 'Roberto Carlos', p_rm_aluno => 6, p_cpf_aluno => '66666666666')
-- isto ser um parametro nomeado

create sequence seq_aluno start with 7 increment by 1;

create or replace procedure prc_insere_aluno( p_rm_aluno out aluno1.rm%type, p_nome_aluno aluno1.nome%type, p_cpf_aluno in aluno1.cpf%type) is
begin 
insert into aluno1 (rm, nome, cpf) values (seq_aluno.nextval, p_nome_aluno, p_cpf_aluno)
returning rm into p_rm_aluno;
commit;
exception
    when others then 
        raise_application_error(-20023, 'Erro crítico ! insere aluno'||SQLErrM);
end;

set serveroutput on;

declare
v_rm aluno1.rm%type;
begin
    prc_insere_aluno(v_rm, 'Karen', 'rmrmrm');
    dbms_output.put_line('O RM QUE FOI CRIADO PARA A MAYU FOI '|| v_rm);
end;


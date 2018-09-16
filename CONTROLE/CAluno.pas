unit CAluno;

interface

Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB,
  jpeg, UAluno, DAluno, Vcl.DBGrids;

type

  TCAluno = class

  private

  PUBLIC

    function CadastraAluno(nome: string; idade: integer;
      sexo, cpf, matricula, cidade, bairro, endereco, cep, uf, numero, telefone,
      email: string; user_tualizacao: integer; lista: TListView): boolean;

    function UpdateAluno(id: integer; nome: string; idade: integer;
      sexo, cpf, matricula, cidade, bairro, endereco, cep, uf, numero, telefone,
      email: string; user_tualizacao: integer; lista: TListView): boolean;

    procedure ListarAlunos(lista: TListView);
    function Ativar_inativarProfessor(id, user: integer;
      lista: TListView): boolean;

    function VinculaDisciplinas(aluno, disciplina, user: integer;
      lista: TListView): boolean;
    function DesvincularDisciplina(aluno, user, disciplina: integer;
      lista: TListView): boolean;

    procedure ListarDisciplinas(aluno: integer; lista: TListView);

  end;

implementation

{ TCAluno }

uses UFuncoes;

function TCAluno.Ativar_inativarProfessor(id, user: integer;
  lista: TListView): boolean;
var
  a: TAluno;
  d: TDAluno;
  data_atualizacao: TDateTime;
begin
  Result := false;
  a := TAluno.Create;
  a.id := id;
  a.useratualizacao := user;
  a.dataatualizacao := now;
  d := TDAluno.Create;
  if d.Ativar_inativarAluno(a) then
  begin
    Result := true;
    ListarAlunos(lista);
  end;
  FreeAndNil(a);
  FreeAndNil(d);

end;

function TCAluno.CadastraAluno(nome: string; idade: integer;
  sexo, cpf, matricula, cidade, bairro, endereco, cep, uf, numero, telefone,
  email: string; user_tualizacao: integer; lista: TListView): boolean;
var
  a: TAluno;
  d: TDAluno;
  f: TFuncoes;
  dt_cadastro, dt_atualizacao: TDateTime;
begin

  Result := false;
  a := TAluno.Create;
  f := TFuncoes.Create;

  // ShowMessage(DateTimeToStr(now));
  a.nome := nome;
  a.idade := idade;
  a.sexo := sexo;
  a.cpf := cpf;
  a.matricula := matricula;
  a.cidade := cidade;
  a.bairro := bairro;
  a.endereco := endereco;
  a.cep := cep;
  a.uf := uf;
  a.numero := numero;

  a.telefone := telefone;
  a.email := email;
  a.useratualizacao := user_tualizacao;
  a.datacadastro := now;
  a.dataatualizacao := now;


  // chama funcao de cadastrar no DAO

  d := TDAluno.Create;
  if d.CadastraAluno(a) then
  begin
    Result := true;
    ListarAlunos(lista);
  end;
  FreeAndNil(a);
  FreeAndNil(d);
  FreeAndNil(f);

end;

function TCAluno.DesvincularDisciplina(aluno, user, disciplina: integer;
  lista: TListView): boolean;
var
  a: TAluno;
  f: TFuncoes;
  dao: TDAluno;
begin
  Result := false;
  a := TAluno.Create;
  f := TFuncoes.Create;
  a.id := aluno;
  a.status := 0;
  a.useratualizacao := user;
  a.datacadastro := now;
  a.dataatualizacao := now;

  dao := TDAluno.Create;
  if dao.DesvincularDisciplina(a, disciplina) then
  begin
    Result := true;

  end;

  FreeAndNil(a);
  FreeAndNil(dao);
  FreeAndNil(f);
end;

procedure TCAluno.ListarAlunos(lista: TListView);
var
  d: TDAluno;
begin
  d := TDAluno.Create;
  d.ListarAluno(lista);
end;

procedure TCAluno.ListarDisciplinas(aluno: integer; lista: TListView);
var
  a: TDAluno;
begin
  a := TDAluno.Create;
  a.ListarDisciplinas(aluno, lista);
  FreeAndNil(a);
end;

function TCAluno.UpdateAluno(id: integer; nome: string; idade: integer;
  sexo, cpf, matricula, cidade, bairro, endereco, cep, uf, numero, telefone,
  email: string; user_tualizacao: integer; lista: TListView): boolean;
var
  a: TAluno;
  f: TFuncoes;
  d: TDAluno;
  dt_cadastro, dt_atualizacao: tdate;
begin
  Result := false;
  a := TAluno.Create;
  f := TFuncoes.Create;
  a.id := id;
  a.nome := nome;
  a.idade := idade;
  a.sexo := sexo;
  a.cpf := cpf;
  a.matricula := matricula;
  a.cidade := cidade;
  a.bairro := bairro;
  a.endereco := endereco;
  a.cep := cep;
  a.uf := uf;
  a.numero := numero;
  a.telefone := telefone;
  a.email := email;

  a.useratualizacao := user_tualizacao;
  a.datacadastro := now;
  a.dataatualizacao := now;

  d := TDAluno.Create;
  if d.AlteraAluno(a) then
  begin
    Result := true;
    ListarAlunos(lista);
  end;
  // chama funcao de cadastrar no DAO

  FreeAndNil(a);
  FreeAndNil(d);
  FreeAndNil(f);
end;

function TCAluno.VinculaDisciplinas(aluno, disciplina, user: integer;
  lista: TListView): boolean;
var
  a: TAluno;
  f: TFuncoes;
  dao: TDAluno;
begin
  Result := false;
  a := TAluno.Create;
  f := TFuncoes.Create;
  a.id := aluno;
  a.useratualizacao := user;
  a.datacadastro := now;
  a.dataatualizacao := now;

  dao := TDAluno.Create;
  if dao.VinculaDisciplinas(a, disciplina) then
  begin
    Result := true;

  end;

  FreeAndNil(a);
  FreeAndNil(dao);
  FreeAndNil(f);
end;

end.

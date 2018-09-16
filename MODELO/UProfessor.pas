unit UProfessor;

interface

Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB,
  jpeg, Upessoa;

type

  TProfessor = class(TPessoa)
  private
    Fuseratualizacao: integer;
    Fdataatualizacao: tdate;
    Femail: string;
    Fid: integer;
    Fstatus: integer;
    Fdatacadastro: tdate;
    Ftelefone: string;
    FBAIRRO: STRING;
    FUF: STRING;
    FCPF: STRING;
    FCEP: STRING;
    FNUMERO: string;
    FCIDADE: STRING;
    FENDERECO: STRING;
    procedure Setdataatualizacao(const Value: tdate);
    procedure Setdatacadastro(const Value: tdate);
    procedure Setemail(const Value: string);
    procedure Setid(const Value: integer);
    procedure Setstatus(const Value: integer);
    procedure Settelefone(const Value: string);
    procedure Setuseratualizacao(const Value: integer);
    procedure SetBAIRRO(const Value: STRING);
    procedure SetCEP(const Value: STRING);
    procedure SetCIDADE(const Value: STRING);
    procedure SetCPF(const Value: STRING);
    procedure SetENDERECO(const Value: STRING);
    procedure SetNUMERO(const Value: string);
    procedure SetUF(const Value: STRING);

  PUBLIC
    property id: integer read Fid write Setid;
    property telefone: string read Ftelefone write Settelefone;
    property email: string read Femail write Setemail;
    property datacadastro: tdate read Fdatacadastro write Setdatacadastro;
    property dataatualizacao: tdate read Fdataatualizacao
      write Setdataatualizacao;
    property status: integer read Fstatus write Setstatus;
    property useratualizacao: integer read Fuseratualizacao
      write Setuseratualizacao;
    PROPERTY CPF: STRING read FCPF write SetCPF;
    PROPERTY CIDADE: STRING read FCIDADE write SetCIDADE;
    PROPERTY BAIRRO: STRING read FBAIRRO write SetBAIRRO;
    PROPERTY NUMERO: string read FNUMERO write SetNUMERO;
    PROPERTY UF: STRING read FUF write SetUF;
    PROPERTY ENDERECO: STRING read FENDERECO write SetENDERECO;
    PROPERTY CEP: STRING read FCEP write SetCEP;

  end;

implementation

{ TProfessor }

procedure TProfessor.SetBAIRRO(const Value: STRING);
begin
  FBAIRRO := Value;
end;

procedure TProfessor.SetCEP(const Value: STRING);
begin
  FCEP := Value;
end;

procedure TProfessor.SetCIDADE(const Value: STRING);
begin
  FCIDADE := Value;
end;

procedure TProfessor.SetCPF(const Value: STRING);
begin
  FCPF := Value;
end;

procedure TProfessor.Setdataatualizacao(const Value: tdate);
begin
  Fdataatualizacao := Value;
end;

procedure TProfessor.Setdatacadastro(const Value: tdate);
begin
  Fdatacadastro := Value;
end;

procedure TProfessor.Setemail(const Value: string);
begin
  Femail := Value;
end;

procedure TProfessor.SetENDERECO(const Value: STRING);
begin
  FENDERECO := Value;
end;

procedure TProfessor.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TProfessor.SetNUMERO(const Value: string);
begin
  FNUMERO := Value;
end;

procedure TProfessor.Setstatus(const Value: integer);
begin
  Fstatus := Value;
end;

procedure TProfessor.Settelefone(const Value: string);
begin
  Ftelefone := Value;
end;

procedure TProfessor.SetUF(const Value: STRING);
begin
  FUF := Value;
end;

procedure TProfessor.Setuseratualizacao(const Value: integer);
begin
  Fuseratualizacao := Value;
end;

end.

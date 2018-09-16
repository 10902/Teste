unit UDisciplina;

interface

Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB,
  jpeg, Upessoa;

type

  TDisciplina = class
  private
    Fuseratualizacao: integer;
    Fdataatualizacao: tdate;
    Fdescricao: string;
    Fid: integer;
    Fstatus: integer;
    Fdatacadastro: tdate;
    procedure Setdataatualizacao(const Value: tdate);
    procedure Setdatacadastro(const Value: tdate);
    procedure Setdescricao(const Value: string);
    procedure Setid(const Value: integer);
    procedure Setstatus(const Value: integer);
    procedure Setuseratualizacao(const Value: integer);

  PUBLIC
    property id: integer read Fid write Setid;
    property descricao: string read Fdescricao write Setdescricao;
    property datacadastro: tdate read Fdatacadastro write Setdatacadastro;
    property dataatualizacao: tdate read Fdataatualizacao
      write Setdataatualizacao;
    property status: integer read Fstatus write Setstatus;
    property useratualizacao: integer read Fuseratualizacao
      write Setuseratualizacao;
  end;

implementation

{ TDisciplina }

procedure TDisciplina.Setdataatualizacao(const Value: tdate);
begin
  Fdataatualizacao := Value;
end;

procedure TDisciplina.Setdatacadastro(const Value: tdate);
begin
  Fdatacadastro := Value;
end;

procedure TDisciplina.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TDisciplina.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TDisciplina.Setstatus(const Value: integer);
begin
  Fstatus := Value;
end;

procedure TDisciplina.Setuseratualizacao(const Value: integer);
begin
  Fuseratualizacao := Value;
end;

end.

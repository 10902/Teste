unit Upessoa;

interface

Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB,
  jpeg;

type

  TPessoa = class

  private
    Fnome: string;
    Fidade: integer;
    Fdata_nascimento: tdate;
    Fsexo: string;
    procedure Setnome(const Value: string);
    procedure Setdata_nascimento(const Value: tdate);
    procedure Setidade(const Value: integer);
    procedure Setsexo(const Value: string);



  PUBLIC

  property nome:string read Fnome write Setnome;
  property idade:integer read Fidade write Setidade;
  property sexo:string read Fsexo write Setsexo;
  property data_nascimento:tdate read Fdata_nascimento write Setdata_nascimento;



  end;
  implementation

{ TFuncoes }

{ TPessoa }

procedure TPessoa.Setdata_nascimento(const Value: tdate);
begin
  Fdata_nascimento := Value;
end;

procedure TPessoa.Setidade(const Value: integer);
begin
  Fidade := Value;
end;

procedure TPessoa.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TPessoa.Setsexo(const Value: string);
begin
  Fsexo := Value;
end;

end.

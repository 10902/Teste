unit frm_cadastro_disciplina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.StdCtrls;

type
  Ttela_cadastra_disciplina = class(TForm)
    lb_codigoCliente: TLabel;
    lb_NomeCliente: TLabel;
    edit_id: TEdit;
    edit_descricao: TEdit;
    GroupBox15: TGroupBox;
    Label67: TLabel;
    lb_status: TLabel;
    GroupBox14: TGroupBox;
    lb_usuario_alteracao: TLabel;
    Label66: TLabel;
    GroupBox13: TGroupBox;
    lb_dat_alteracao: TLabel;
    Label61: TLabel;
    GroupBox12: TGroupBox;
    lb_dat_cadastro: TLabel;
    Label55: TLabel;
    btn_confirma: TButton;
    btn_cancela: TButton;
    OpenPictureDialog2: TOpenPictureDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_confirmaClick(Sender: TObject);
    procedure btn_cancelaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tela_cadastra_disciplina: Ttela_cadastra_disciplina;

implementation

{$R *.dfm}

uses CDisciplina, frm_principal;

procedure Ttela_cadastra_disciplina.btn_cancelaClick(Sender: TObject);
begin
  If Application.MessageBox('Cancelar cadastro ?', 'Aten��o !!!',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
  begin
    tela_cadastra_disciplina.Close;
  end;
end;

procedure Ttela_cadastra_disciplina.btn_confirmaClick(Sender: TObject);
var
  c: TCDisciplina;
begin

  c := TCDisciplina.Create;
  if btn_confirma.Caption = 'Cadastrar' then
  begin
    If Application.MessageBox('Confirmar cadastro ?', 'Aten��o !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      if Length(Trim(edit_descricao.Text)) > 0 then
      begin
        if c.CadastraDisciplina(edit_descricao.Text, 1) then
        begin
          ShowMessage('Disciplina cadastrada com sucesso !');
          tela_cadastra_disciplina.Close;
        end
        else
        begin
          ShowMessage('Erro ao salvar registro !');
        end;
      end
      else
      begin
        ShowMessage('Nome da disciplina � obrigat�rio !');
      end;
    end;
  end;

  if btn_confirma.Caption = 'Alterar' then
  begin
    If Application.MessageBox('Confirmar altera��o ?', 'Aten��o !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      if Length(Trim(edit_descricao.Text)) > 0 then
      begin
        if c.UpdateDisciplina(StrToInt(edit_id.Text), edit_descricao.Text, 1,
          tela_principal.lista_disciplinas) then
        begin

          ShowMessage('Cadastro atualizado com sucesso !');
          tela_cadastra_disciplina.Close;
        end
        else
        begin
          ShowMessage('Erro ao salvar registro !');
        end;
      end
      else
      begin
        ShowMessage('Nome da disciplina � obrigat�rio !');
      end;
    end;
  end;
  FreeAndNil(c);
end;

procedure Ttela_cadastra_disciplina.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  tela_cadastra_disciplina := nil;
end;

end.

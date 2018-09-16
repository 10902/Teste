unit frm_cadastro_aluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  Ttela_cadastra_Aluno = class(TForm)
    lb_codigoCliente: TLabel;
    lb_NomeCliente: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label5: TLabel;
    lb_campoObrigatorioNome: TLabel;
    lb_cod_estado: TLabel;
    Label12: TLabel;
    edit_id: TEdit;
    edit_nome: TEdit;
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
    edit_cpf: TMaskEdit;
    edit_cidade: TEdit;
    edit_endereco: TEdit;
    edit_bairro: TEdit;
    edit_numero: TEdit;
    edit_cep: TMaskEdit;
    cb_estados: TComboBox;
    edit_fone: TMaskEdit;
    edit_email: TEdit;
    btn_confirma: TButton;
    btn_cancela: TButton;
    edit_idade: TEdit;
    cb_sexo: TComboBox;
    Label17: TLabel;
    edit_matricula: TEdit;
    procedure btn_confirmaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tela_cadastra_Aluno: Ttela_cadastra_Aluno;

implementation

{$R *.dfm}

uses CAluno, frm_principal;

procedure Ttela_cadastra_Aluno.btn_confirmaClick(Sender: TObject);
var
  c: TCAluno;
begin

  c := TCAluno.Create;
  if btn_confirma.Caption = 'Cadastrar' then
  begin
    If Application.MessageBox('Confirmar cadastro ?', 'Aten��o !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      if Length(Trim(edit_nome.Text)) > 0 then
      begin
        if c.CadastraAluno(edit_nome.Text, StrToInt(edit_idade.Text),
          cb_sexo.Items.Strings[cb_sexo.ItemIndex], edit_cpf.Text,
          edit_matricula.Text, edit_cidade.Text, edit_bairro.Text,
          edit_endereco.Text, edit_cep.Text,
          cb_estados.Items.Strings[cb_estados.ItemIndex], edit_numero.Text,
          edit_fone.Text, edit_email.Text, 1, tela_principal.lista_alunos) then
        begin
          ShowMessage('Aluno cadastrado com sucesso !');
          tela_cadastra_Aluno.Close;
        end
        else
        begin
          ShowMessage('Erro ao salvar registro !');
        end;
      end
      else
      begin
        ShowMessage('Nome do aluno � obrigat�rio !');
      end;
    end;
  end;

  if btn_confirma.Caption = 'Alterar' then
  begin
    If Application.MessageBox('Confirmar altera��o ?', 'Aten��o !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      if Length(Trim(edit_nome.Text)) > 0 then
      begin
        if c.UpdateAluno(StrToInt(edit_id.Text), edit_nome.Text,
          StrToInt(edit_idade.Text), cb_sexo.Items.Strings[cb_sexo.ItemIndex],
          edit_cpf.Text, edit_matricula.Text, edit_cidade.Text,
          edit_bairro.Text, edit_endereco.Text, edit_cep.Text,
          cb_estados.Items.Strings[cb_estados.ItemIndex], edit_numero.Text,
          edit_fone.Text, edit_email.Text, 1, tela_principal.lista_alunos) then
        begin
          ShowMessage('Cadastro atualizado com sucesso !');
          tela_cadastra_Aluno.Close;
        end
        else
        begin
          ShowMessage('Erro ao salvar registro !');
        end;
      end
      else
      begin
        ShowMessage('Nome do aluno � obrigat�rio !');
      end;
    end;
  end;
  FreeAndNil(c);
end;

procedure Ttela_cadastra_Aluno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  tela_cadastra_Aluno := nil;
end;

end.

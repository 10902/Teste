unit frm_cadastro_professor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  Ttela_cadastra_professor = class(TForm)
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
    GroupBox15: TGroupBox;
    Label67: TLabel;
    GroupBox14: TGroupBox;
    Label66: TLabel;
    GroupBox13: TGroupBox;
    Label61: TLabel;
    GroupBox12: TGroupBox;
    Label55: TLabel;
    cb_estados: TComboBox;
    btn_cancela: TButton;
    edit_numero: TEdit;
    edit_fone: TMaskEdit;
    edit_cidade: TEdit;
    edit_nome: TEdit;
    edit_idade: TEdit;
    edit_cep: TMaskEdit;
    edit_bairro: TEdit;
    edit_endereco: TEdit;
    edit_email: TEdit;
    edit_cpf: TMaskEdit;
    Label12: TLabel;
    cb_sexo: TComboBox;
    btn_confirma: TButton;
    edit_id: TEdit;
    lb_dat_cadastro: TLabel;
    lb_dat_alteracao: TLabel;
    lb_usuario_alteracao: TLabel;
    lb_status: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_confirmaClick(Sender: TObject);
    procedure btn_cancelaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tela_cadastra_professor: Ttela_cadastra_professor;

implementation

{$R *.dfm}

uses CProfessor, frm_principal;

procedure Ttela_cadastra_professor.btn_cancelaClick(Sender: TObject);
begin
  If Application.MessageBox('Cancelar cadastro ?', 'Aten��o !!!',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
  begin
    tela_cadastra_professor.Close;
  end;
end;

procedure Ttela_cadastra_professor.btn_confirmaClick(Sender: TObject);
var
  c: TCProfessor;
begin

  c := TCProfessor.Create;
  if btn_confirma.Caption = 'Cadastrar' then
  begin

    If Application.MessageBox('Confirmar cadastro ?', 'Aten��o !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      if Length(Trim(edit_nome.Text)) > 0 then
      begin
        if c.CadastraProfessor(edit_nome.Text, StrToInt(edit_idade.Text),
          cb_sexo.Items.Strings[cb_sexo.ItemIndex], edit_cpf.Text,
          edit_cidade.Text, edit_bairro.Text, edit_endereco.Text, edit_cep.Text,
          cb_estados.Items.Strings[cb_estados.ItemIndex], edit_numero.Text,
          edit_fone.Text, edit_email.Text, 1, tela_principal.lista_professores)
        then
        begin
          ShowMessage('Professor cadastrado com sucesso !');
          tela_cadastra_professor.Close;
        end
        else
        begin
          ShowMessage('Erro ao salvar registro !');
        end;
      end
      else
      begin
        ShowMessage('Nome do professor � obrigat�rio !');
      end;
    end

  end;

  if btn_confirma.Caption = 'Alterar' then
  begin
    If Application.MessageBox('Confirmar altera��o ?', 'Aten��o !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      if Length(Trim(edit_nome.Text)) > 0 then
      begin
        if c.UpdateProfessor(StrToInt(edit_id.Text), edit_nome.Text,
          StrToInt(edit_idade.Text), cb_sexo.Items.Strings[cb_sexo.ItemIndex],
          edit_cpf.Text, edit_cidade.Text, edit_bairro.Text, edit_endereco.Text,
          edit_cep.Text, cb_estados.Items.Strings[cb_estados.ItemIndex],
          edit_numero.Text, edit_fone.Text, edit_email.Text, 1,
          tela_principal.lista_professores) then
        begin
          ShowMessage('Cadastro atualizado com sucesso !');
          tela_cadastra_professor.Close;
        end
        else
        begin
          ShowMessage('Erro ao salvar registro !');
        end;
      end
      else
      begin
        ShowMessage('Nome do professor � obrigat�rio !');
      end;
    end
  end;
  FreeAndNil(c);

end;

procedure Ttela_cadastra_professor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  tela_cadastra_professor := nil;
end;

end.

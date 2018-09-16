unit frm_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Imaging.pngimage, IniFiles;

type
  Ttela_principal = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    tab_professores: TTabSheet;
    tab_disciplinas: TTabSheet;
    tab_alunos: TTabSheet;
    Panel2: TPanel;
    Image1: TImage;
    Image2: TImage;
    lista_professores: TListView;
    lista_alunos: TListView;
    Panel3: TPanel;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Image5: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image6: TImage;
    Image7: TImage;
    Panel4: TPanel;
    Image8: TImage;
    Image9: TImage;
    Label7: TLabel;
    Label8: TLabel;
    Image10: TImage;
    Label9: TLabel;
    lista_disciplinas: TListView;
    Label10: TLabel;
    Image11: TImage;
    Label11: TLabel;
    Image12: TImage;
    Label12: TLabel;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Panel5: TPanel;
    Label16: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Panel8: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Panel12: TPanel;
    Panel13: TPanel;
    time_horas: TTimer;
    Label25: TLabel;
    Image17: TImage;
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure lista_professoresCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Image5Click(Sender: TObject);
    procedure lista_alunosCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure PageControl1Change(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure lista_disciplinasCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Image9Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure time_horasTimer(Sender: TObject);
    procedure Image17Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tela_principal: Ttela_principal;
  Data: TInifile;

implementation

{$R *.dfm}

uses frm_cadastro_professor, CProfessor, CAluno, frm_cadastro_aluno,
  CDisciplina, frm_cadastro_disciplina, frm_vincula_professor_disciplina,
  frm_vincula_disciplina_aluno, frm_notas, UFuncoes, frm_relatorio_notas,
  data_module, frm_tipo_aprovacao;

procedure Ttela_principal.Button1Click(Sender: TObject);
var
  p: TCProfessor;
begin
  p := TCProfessor.Create;
  p.ListarProfessores(lista_professores);

end;

procedure Ttela_principal.Button2Click(Sender: TObject);
var
  a: TCAluno;
begin
  a := TCAluno.Create;
  a.ListarAlunos(lista_alunos);

end;

procedure Ttela_principal.FormShow(Sender: TObject);
var
  funcao: TFuncoes;

  caminho, caminho_arq: string;
begin
 {
  If not fileexists(ExtractFilePath(ParamStr(0)) + 'config.ini') then
  begin
    funcao := TFuncoes.Create;
    caminho := ExtractFilePath(ParamStr(0));
    Data := TInifile.Create(caminho + 'config.ini');
    Data.WriteString('Geral', 'Servidor', funcao.Crypt('C', caminho + 'bd_universidade.db'));
    // O conte�do do Edit1.servidor ser� gravado dentro da chave Geral e na subchave Servidor
    Data.WriteString('Geral', 'Usuario', funcao.Crypt('C', ''));
    Data.WriteString('Geral', 'Senha', funcao.Crypt('C', ''));
    Data.WriteString('Geral', 'Porta', funcao.Crypt('C', ''));
    Data.WriteString('Geral', 'Banco', funcao.Crypt('C', 'bd_universidade'));
    Data.WriteString('Geral', 'Drive', funcao.Crypt('C', 'SQlite'));

    Data.Free; // Libera a mem�ria
    Application.Terminate;
   }
    StatusBar1.Panels[0].Text :=
      formatdatetime('dddd","dd" de "mmmm" de "yyyy', now); //

    // ShowMessage(DateTimeToStr(f.RetornaDataHoraBanco));


end;

procedure Ttela_principal.Image10Click(Sender: TObject);

var
  id, user: integer;

  d: TCDisciplina;
begin
  if lista_disciplinas.ItemIndex > -1 then
  begin
    id := StrToInt(lista_disciplinas.Items.Item
      [lista_disciplinas.ItemIndex].Caption);
    user := 1;
    d := TCDisciplina.Create;
    d.Ativar_inativarDisciplina(id, user, lista_disciplinas);
    FreeAndNil(d);
  end;
end;

procedure Ttela_principal.Image11Click(Sender: TObject);
begin
  if lista_professores.ItemIndex > -1 then
  begin
    if tela_vincula_professor_disciplina = nil then
    begin
      tela_vincula_professor_disciplina :=
        Ttela_vincula_professor_disciplina.Create(Application);

      tela_vincula_professor_disciplina.lb_professor.Caption :=
        lista_professores.Items.Item[lista_professores.ItemIndex].SubItems[0];
      tela_vincula_professor_disciplina.lb_id.Caption :=
        lista_professores.Items.Item[lista_professores.ItemIndex].Caption;
      tela_vincula_professor_disciplina.Show;
    end
    else
    begin
      tela_vincula_professor_disciplina := nil;
      tela_vincula_professor_disciplina :=
        Ttela_vincula_professor_disciplina.Create(Application);

      tela_vincula_professor_disciplina.lb_professor.Caption :=
        lista_professores.Items.Item[lista_professores.ItemIndex].SubItems[0];
      tela_vincula_professor_disciplina.lb_id.Caption :=
        lista_professores.Items.Item[lista_professores.ItemIndex].Caption;
      tela_vincula_professor_disciplina.Show;
    end;
  end;
end;

procedure Ttela_principal.Image12Click(Sender: TObject);
begin
  if lista_alunos.ItemIndex > -1 then
  begin
    if tela_vincula_disciplina_aluno = nil then
    begin
      tela_vincula_disciplina_aluno := Ttela_vincula_disciplina_aluno.Create
        (Application);

      tela_vincula_disciplina_aluno.lb_aluno.Caption := lista_alunos.Items.Item
        [lista_alunos.ItemIndex].SubItems[0];
      tela_vincula_disciplina_aluno.lb_id.Caption := lista_alunos.Items.Item
        [lista_alunos.ItemIndex].Caption;
      tela_vincula_disciplina_aluno.Show;
    end
    else
    begin
      tela_vincula_disciplina_aluno := nil;
      tela_vincula_disciplina_aluno := Ttela_vincula_disciplina_aluno.Create
        (Application);

      tela_vincula_disciplina_aluno.lb_aluno.Caption := lista_alunos.Items.Item
        [lista_alunos.ItemIndex].SubItems[0];
      tela_vincula_disciplina_aluno.lb_id.Caption := lista_alunos.Items.Item
        [lista_alunos.ItemIndex].Caption;
      tela_vincula_disciplina_aluno.Show;
    end;
  end;
end;

procedure Ttela_principal.Image13Click(Sender: TObject);
begin
  if lista_alunos.ItemIndex > -1 then
  begin
    if tela_notas = nil then
    begin
      tela_notas := Ttela_notas.Create(Application);

      tela_notas.lb_aluno.Caption := lista_alunos.Items.Item
        [lista_alunos.ItemIndex].SubItems[0];
      tela_notas.lb_id.Caption := lista_alunos.Items.Item
        [lista_alunos.ItemIndex].Caption;
      tela_notas.Show;
    end
    else
    begin
      tela_notas := nil;
      tela_notas := Ttela_notas.Create(Application);

      tela_notas.lb_aluno.Caption := lista_alunos.Items.Item
        [lista_alunos.ItemIndex].SubItems[0];
      tela_notas.lb_id.Caption := lista_alunos.Items.Item
        [lista_alunos.ItemIndex].Caption;
      tela_notas.Show;
    end;
  end;
end;

procedure Ttela_principal.Image14Click(Sender: TObject);
var
  p: TCProfessor;
begin
  p := TCProfessor.Create;
  p.ListarProfessores(lista_professores);
end;

procedure Ttela_principal.Image15Click(Sender: TObject);
var
  a: TCAluno;
begin
  a := TCAluno.Create;
  a.ListarAlunos(lista_alunos);

end;

procedure Ttela_principal.Image16Click(Sender: TObject);
var
  a: TCAluno;
begin
  a := TCAluno.Create;
  a.ListarAlunos(lista_alunos);
end;

procedure Ttela_principal.Image17Click(Sender: TObject);

begin
  if tela_tipo_aprovacao = nil then
  begin
    tela_tipo_aprovacao := Ttela_tipo_aprovacao.Create(Application);
    tela_tipo_aprovacao.ShowModal;
  end;
end;

procedure Ttela_principal.Image1Click(Sender: TObject);
begin
  if tela_cadastra_professor = nil then
  begin
    tela_cadastra_professor := Ttela_cadastra_professor.Create(Application);
    tela_cadastra_professor.btn_confirma.Caption := 'Cadastrar';
    tela_cadastra_professor.Show;
  end
  else
  begin
    tela_cadastra_professor := nil;
    tela_cadastra_professor := Ttela_cadastra_professor.Create(Application);
    tela_cadastra_professor.btn_confirma.Caption := 'Cadastrar';
    tela_cadastra_professor.Show;
  end;
end;

procedure Ttela_principal.Image2Click(Sender: TObject);
begin

  if lista_professores.ItemIndex > -1 then
  begin
    begin
      if tela_cadastra_professor = nil then
      begin

        tela_cadastra_professor := Ttela_cadastra_professor.Create(Application);
        tela_cadastra_professor.btn_confirma.Caption := 'Alterar';
        tela_cadastra_professor.edit_fone.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[2];
        tela_cadastra_professor.edit_id.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].Caption;
        tela_cadastra_professor.edit_cidade.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[3];
        tela_cadastra_professor.edit_nome.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[0];
        tela_cadastra_professor.edit_idade.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[8];
        tela_cadastra_professor.edit_cep.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[11];
        tela_cadastra_professor.edit_numero.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[12];
        tela_cadastra_professor.edit_bairro.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[4];
        tela_cadastra_professor.edit_endereco.Text :=
          lista_professores.Items.Item[lista_professores.ItemIndex]
          .SubItems[10];
        tela_cadastra_professor.edit_email.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[7];
        tela_cadastra_professor.edit_cpf.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[1];
        tela_cadastra_professor.cb_sexo.ItemIndex :=
          tela_cadastra_professor.cb_sexo.Items.IndexOf
          (lista_professores.Items.Item[lista_professores.ItemIndex]
          .SubItems[9]);
        tela_cadastra_professor.cb_estados.ItemIndex :=
          tela_cadastra_professor.cb_estados.Items.IndexOf
          (lista_professores.Items.Item[lista_professores.ItemIndex]
          .SubItems[5]);

        tela_cadastra_professor.lb_dat_cadastro.Caption :=
          lista_professores.Items.Item[lista_professores.ItemIndex]
          .SubItems[14];

        tela_cadastra_professor.lb_dat_alteracao.Caption :=
          lista_professores.Items.Item[lista_professores.ItemIndex]
          .SubItems[15];

        tela_cadastra_professor.lb_usuario_alteracao.Caption :=
          lista_professores.Items.Item[lista_professores.ItemIndex].SubItems[16]
          + '-' + lista_professores.Items.Item[lista_professores.ItemIndex]
          .SubItems[17];

        tela_cadastra_professor.lb_status.Caption :=
          lista_professores.Items.Item[lista_professores.ItemIndex].SubItems[6];

        tela_cadastra_professor.Show;
      end
      else
      begin
        tela_cadastra_professor := nil;
        tela_cadastra_professor := Ttela_cadastra_professor.Create(Application);
        tela_cadastra_professor.btn_confirma.Caption := 'Alterar';
        tela_cadastra_professor.edit_fone.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[2];
        tela_cadastra_professor.edit_id.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].Caption;
        tela_cadastra_professor.edit_cidade.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[3];
        tela_cadastra_professor.edit_nome.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[0];
        tela_cadastra_professor.edit_idade.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[8];
        tela_cadastra_professor.edit_cep.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[11];
        tela_cadastra_professor.edit_numero.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[12];
        tela_cadastra_professor.edit_bairro.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[4];
        tela_cadastra_professor.edit_endereco.Text :=
          lista_professores.Items.Item[lista_professores.ItemIndex]
          .SubItems[10];
        tela_cadastra_professor.edit_email.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[7];
        tela_cadastra_professor.edit_cpf.Text := lista_professores.Items.Item
          [lista_professores.ItemIndex].SubItems[1];
        tela_cadastra_professor.cb_sexo.ItemIndex :=
          tela_cadastra_professor.cb_sexo.Items.IndexOf
          (lista_professores.Items.Item[lista_professores.ItemIndex]
          .SubItems[9]);
        tela_cadastra_professor.cb_estados.ItemIndex :=
          tela_cadastra_professor.cb_estados.Items.IndexOf
          (lista_professores.Items.Item[lista_professores.ItemIndex]
          .SubItems[5]);

        tela_cadastra_professor.lb_dat_cadastro.Caption :=
          lista_professores.Items.Item[lista_professores.ItemIndex]
          .SubItems[14];

        tela_cadastra_professor.lb_dat_alteracao.Caption :=
          lista_professores.Items.Item[lista_professores.ItemIndex]
          .SubItems[15];

        tela_cadastra_professor.lb_usuario_alteracao.Caption :=
          lista_professores.Items.Item[lista_professores.ItemIndex].SubItems[16]
          + '-' + lista_professores.Items.Item[lista_professores.ItemIndex]
          .SubItems[17];

        tela_cadastra_professor.lb_status.Caption :=
          lista_professores.Items.Item[lista_professores.ItemIndex].SubItems[6];

        tela_cadastra_professor.Show;
      end;

    end;
  end;
end;

procedure Ttela_principal.Image3Click(Sender: TObject);
begin
  if tela_cadastra_Aluno = nil then
  begin
    tela_cadastra_Aluno := Ttela_cadastra_Aluno.Create(Application);
    tela_cadastra_Aluno.btn_confirma.Caption := 'Cadastrar';
    tela_cadastra_Aluno.Show;
  end
  else
  begin
    tela_cadastra_Aluno := nil;
    tela_cadastra_Aluno := Ttela_cadastra_Aluno.Create(Application);
    tela_cadastra_Aluno.btn_confirma.Caption := 'Cadastrar';
    tela_cadastra_Aluno.Show;
  end;
end;

procedure Ttela_principal.Image4Click(Sender: TObject);
begin
  if lista_alunos.ItemIndex > -1 then
  begin
    begin
      if tela_cadastra_Aluno = nil then
      begin

        tela_cadastra_Aluno := Ttela_cadastra_Aluno.Create(Application);
        tela_cadastra_Aluno.btn_confirma.Caption := 'Alterar';

        tela_cadastra_Aluno.edit_matricula.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[2];
        tela_cadastra_Aluno.edit_fone.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[3];
        tela_cadastra_Aluno.edit_id.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].Caption;
        tela_cadastra_Aluno.edit_cidade.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[4];
        tela_cadastra_Aluno.edit_nome.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[0];
        tela_cadastra_Aluno.edit_idade.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[9];
        tela_cadastra_Aluno.edit_cep.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[12];
        tela_cadastra_Aluno.edit_numero.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[13];
        tela_cadastra_Aluno.edit_bairro.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[5];
        tela_cadastra_Aluno.edit_endereco.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[11];
        tela_cadastra_Aluno.edit_email.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[9];
        tela_cadastra_Aluno.edit_cpf.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[1];
        tela_cadastra_Aluno.cb_sexo.ItemIndex :=
          tela_cadastra_Aluno.cb_sexo.Items.IndexOf
          (lista_alunos.Items.Item[lista_alunos.ItemIndex].SubItems[10]);
        tela_cadastra_Aluno.cb_estados.ItemIndex :=
          tela_cadastra_Aluno.cb_estados.Items.IndexOf
          (lista_alunos.Items.Item[lista_alunos.ItemIndex].SubItems[6]);
        tela_cadastra_Aluno.lb_dat_cadastro.Caption := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[15];

        tela_cadastra_Aluno.lb_dat_alteracao.Caption := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[16];

        tela_cadastra_Aluno.lb_usuario_alteracao.Caption :=
          lista_alunos.Items.Item[lista_alunos.ItemIndex].SubItems[17] + '-' +
          lista_alunos.Items.Item[lista_alunos.ItemIndex].SubItems[18];

        tela_cadastra_Aluno.lb_status.Caption := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[7];

        tela_cadastra_Aluno.Show;
      end
      else
      begin
        tela_cadastra_Aluno := nil;
        tela_cadastra_Aluno := Ttela_cadastra_Aluno.Create(Application);
        tela_cadastra_Aluno.btn_confirma.Caption := 'Alterar';

        tela_cadastra_Aluno.edit_matricula.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[2];
        tela_cadastra_Aluno.edit_fone.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[3];
        tela_cadastra_Aluno.edit_id.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].Caption;
        tela_cadastra_Aluno.edit_cidade.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[4];
        tela_cadastra_Aluno.edit_nome.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[0];
        tela_cadastra_Aluno.edit_idade.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[9];
        tela_cadastra_Aluno.edit_cep.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[12];
        tela_cadastra_Aluno.edit_numero.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[13];
        tela_cadastra_Aluno.edit_bairro.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[5];
        tela_cadastra_Aluno.edit_endereco.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[11];
        tela_cadastra_Aluno.edit_email.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[9];
        tela_cadastra_Aluno.edit_cpf.Text := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[1];
        tela_cadastra_Aluno.cb_sexo.ItemIndex :=
          tela_cadastra_Aluno.cb_sexo.Items.IndexOf
          (lista_alunos.Items.Item[lista_alunos.ItemIndex].SubItems[10]);
        tela_cadastra_Aluno.cb_estados.ItemIndex :=
          tela_cadastra_Aluno.cb_estados.Items.IndexOf
          (lista_alunos.Items.Item[lista_alunos.ItemIndex].SubItems[6]);
        tela_cadastra_Aluno.lb_dat_cadastro.Caption := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[15];

        tela_cadastra_Aluno.lb_dat_alteracao.Caption := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[16];

        tela_cadastra_Aluno.lb_usuario_alteracao.Caption :=
          lista_alunos.Items.Item[lista_alunos.ItemIndex].SubItems[17] + '-' +
          lista_alunos.Items.Item[lista_alunos.ItemIndex].SubItems[18];

        tela_cadastra_Aluno.lb_status.Caption := lista_alunos.Items.Item
          [lista_alunos.ItemIndex].SubItems[7];

        tela_cadastra_Aluno.Show;
      end;

    end;
  end;
end;

procedure Ttela_principal.Image5Click(Sender: TObject);
var
  id, user: integer;

  a: TCAluno;
begin
  if lista_alunos.ItemIndex > -1 then
  begin
    id := StrToInt(lista_alunos.Items.Item[lista_alunos.ItemIndex].Caption);
    user := 1;
    a := TCAluno.Create;
    a.Ativar_inativarProfessor(id, user, lista_alunos);
    FreeAndNil(a);
  end;
end;

procedure Ttela_principal.Image6Click(Sender: TObject);
var
  id, user: integer;

  p: TCProfessor;
begin
  if lista_professores.ItemIndex > -1 then
  begin
    id := StrToInt(lista_professores.Items.Item
      [lista_professores.ItemIndex].Caption);
    user := 1;
    p := TCProfessor.Create;
    p.Ativar_inativarProfessor(id, user, lista_professores);
    FreeAndNil(p);
  end;
end;

procedure Ttela_principal.Image8Click(Sender: TObject);
BEGIN
  if tela_cadastra_disciplina = nil then
  begin
    tela_cadastra_disciplina := Ttela_cadastra_disciplina.Create(Application);
    tela_cadastra_disciplina.btn_confirma.Caption := 'Cadastrar';
    tela_cadastra_disciplina.Show;
  end
  else
  begin
    tela_cadastra_disciplina := nil;
    tela_cadastra_disciplina := Ttela_cadastra_disciplina.Create(Application);
    tela_cadastra_disciplina.btn_confirma.Caption := 'Cadastrar';
    tela_cadastra_disciplina.Show;
  end;
end;

procedure Ttela_principal.Image9Click(Sender: TObject);
begin
  if lista_disciplinas.ItemIndex > -1 then
  begin
    begin
      if tela_cadastra_disciplina = nil then
      begin

        tela_cadastra_disciplina := Ttela_cadastra_disciplina.Create
          (Application);
        tela_cadastra_disciplina.btn_confirma.Caption := 'Alterar';

        tela_cadastra_disciplina.edit_id.Text := lista_disciplinas.Items.Item
          [lista_disciplinas.ItemIndex].Caption;
        tela_cadastra_disciplina.edit_descricao.Text :=
          lista_disciplinas.Items.Item[lista_disciplinas.ItemIndex].SubItems[0];

        tela_cadastra_disciplina.lb_dat_cadastro.Caption :=
          lista_disciplinas.Items.Item[lista_disciplinas.ItemIndex].SubItems[2];

        tela_cadastra_disciplina.lb_dat_alteracao.Caption :=
          lista_disciplinas.Items.Item[lista_disciplinas.ItemIndex].SubItems[3];

        tela_cadastra_disciplina.lb_usuario_alteracao.Caption :=
          lista_disciplinas.Items.Item[lista_disciplinas.ItemIndex].SubItems[4]
          + '-' + lista_disciplinas.Items.Item[lista_disciplinas.ItemIndex]
          .SubItems[5];

        tela_cadastra_disciplina.lb_status.Caption :=
          lista_disciplinas.Items.Item[lista_disciplinas.ItemIndex].SubItems[1];

        tela_cadastra_disciplina.Show;
      end
      else
      begin
        tela_cadastra_disciplina := nil;
        tela_cadastra_disciplina := Ttela_cadastra_disciplina.Create
          (Application);
        tela_cadastra_disciplina.btn_confirma.Caption := 'Alterar';

        tela_cadastra_disciplina.edit_id.Text := lista_disciplinas.Items.Item
          [lista_disciplinas.ItemIndex].Caption;
        tela_cadastra_disciplina.edit_descricao.Text :=
          lista_disciplinas.Items.Item[lista_disciplinas.ItemIndex].SubItems[0];

        tela_cadastra_disciplina.lb_dat_cadastro.Caption :=
          lista_disciplinas.Items.Item[lista_disciplinas.ItemIndex].SubItems[2];

        tela_cadastra_disciplina.lb_dat_alteracao.Caption :=
          lista_disciplinas.Items.Item[lista_disciplinas.ItemIndex].SubItems[3];

        tela_cadastra_disciplina.lb_usuario_alteracao.Caption :=
          lista_disciplinas.Items.Item[lista_disciplinas.ItemIndex].SubItems[4]
          + '-' + lista_disciplinas.Items.Item[lista_disciplinas.ItemIndex]
          .SubItems[5];

        tela_cadastra_disciplina.lb_status.Caption :=
          lista_disciplinas.Items.Item[lista_disciplinas.ItemIndex].SubItems[1];

        tela_cadastra_disciplina.Show;
      end;

    end;
  end;
end;

procedure Ttela_principal.lista_alunosCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.SubItems.Strings[7] = 'Ativo' then
  begin
    lista_alunos.Canvas.Brush.Color := clMoneyGreen;
    lista_alunos.Canvas.Font.Color := clBlack;
  end
  else
  begin
    lista_alunos.Canvas.Brush.Color := clMaroon;
    lista_alunos.Canvas.Font.Color := clWhite;
  end;

end;

procedure Ttela_principal.lista_disciplinasCustomDrawItem
  (Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Item.SubItems.Strings[1] = 'Ativo' then
  begin
    lista_disciplinas.Canvas.Brush.Color := clMoneyGreen;
    lista_disciplinas.Canvas.Font.Color := clBlack;
  end
  else
  begin
    lista_disciplinas.Canvas.Brush.Color := clMaroon;
    lista_disciplinas.Canvas.Font.Color := clWhite;
  end;
end;

procedure Ttela_principal.lista_professoresCustomDrawItem
  (Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Item.SubItems.Strings[6] = 'Ativo' then
  begin
    lista_professores.Canvas.Brush.Color := clMoneyGreen;
    lista_professores.Canvas.Font.Color := clBlack;
  end
  else
  begin
    lista_professores.Canvas.Brush.Color := clMaroon;
    lista_professores.Canvas.Font.Color := clWhite;
  end;
end;

procedure Ttela_principal.PageControl1Change(Sender: TObject);
var
  p: TCProfessor;
  a: TCAluno;
  d: TCDisciplina;
begin

  if tab_professores.Showing then
  begin
    p := TCProfessor.Create;
    p.ListarProfessores(lista_professores);
    FreeAndNil(p);
  end;

  if tab_disciplinas.Showing then
  begin
    d := TCDisciplina.Create;
    d.ListarDisciplina(lista_disciplinas);
    FreeAndNil(d);
  end;

  if tab_alunos.Showing then
  begin
    a := TCAluno.Create;
    a.ListarAlunos(lista_alunos);
    FreeAndNil(a);
  end;
end;

procedure Ttela_principal.time_horasTimer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := ' ' + formatdatetime('hh:mm:ss', now);
  // para hora
end;

end.

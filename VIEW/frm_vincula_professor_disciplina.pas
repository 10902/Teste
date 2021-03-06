unit frm_vincula_professor_disciplina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Menus;

type
  Ttela_vincula_professor_disciplina = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lb_professor: TLabel;
    lb_id: TLabel;
    lista_disciplinas: TListView;
    cb_disciplinas: TComboBox;
    Label3: TLabel;
    lb_id_disciplina: TLabel;
    Label7: TLabel;
    PopupMenu1: TPopupMenu;
    Desvincular1: TMenuItem;
    Panel2: TPanel;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cb_disciplinasSelect(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Desvincular1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tela_vincula_professor_disciplina: Ttela_vincula_professor_disciplina;

implementation

{$R *.dfm}

uses CDisciplina, CProfessor;

procedure Ttela_vincula_professor_disciplina.cb_disciplinasSelect
  (Sender: TObject);
var
  sPos: integer;
  L: TListItem;
  descricao: string;
  i: integer;

  p: TCProfessor;
  professor, disciplina, user: integer;
begin
  // pegar o id da disciplina
  sPos := Pos('#', cb_disciplinas.Items.Strings[cb_disciplinas.ItemIndex]);
  if sPos > 0 then
  begin
    lb_id_disciplina.Caption :=
      copy(cb_disciplinas.Items.Strings[cb_disciplinas.ItemIndex],
      sPos + 1, 10);
  end
  else
  begin
    lb_id_disciplina.Caption := '';
  end;

  // vincular disciplina
  if lb_id_disciplina.Caption <> '' then
  begin

    professor := StrToInt(lb_id.Caption);
    disciplina := StrToInt(lb_id_disciplina.Caption);
    user := 1;
    p := TCProfessor.Create;
    if p.VinculaDisciplinas(professor, disciplina, user, lista_disciplinas) then
    begin
      ShowMessage('Disciplina vinculada com sucesso !');
      p.ListarDisciplinas(professor, lista_disciplinas);
    end;
    FreeAndNil(p);
  end;
end;

procedure Ttela_vincula_professor_disciplina.Desvincular1Click(Sender: TObject);
var
  p: TCProfessor;
  professor, disciplina, user: integer;
begin

  If Application.MessageBox('Confirmar desvincula��o ?', 'Aten��o !!!',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
  begin
    professor := StrToInt(lb_id.Caption);
    disciplina := StrToInt(lista_disciplinas.Items.Item
      [lista_disciplinas.ItemIndex].Caption);
    user := 1;
    p := TCProfessor.Create;
    if p.DesvincularDisciplina(professor, user, disciplina, lista_disciplinas)
    then
    begin

      ShowMessage('Disciplina desvinculada com sucesso !');
      p.ListarDisciplinas(professor, lista_disciplinas);
    end;

    FreeAndNil(p);

  end;
end;

procedure Ttela_vincula_professor_disciplina.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  tela_vincula_professor_disciplina := nil;
end;

procedure Ttela_vincula_professor_disciplina.FormShow(Sender: TObject);
var
  d: TCDisciplina;
  p: TCProfessor;
begin
  d := TCDisciplina.Create;
  p := TCProfessor.Create;
  d.PreencheCombo(cb_disciplinas);
  p.ListarDisciplinas(StrToInt(lb_id.Caption), lista_disciplinas);

  FreeAndNil(d);
  FreeAndNil(p);
end;

procedure Ttela_vincula_professor_disciplina.PopupMenu1Popup(Sender: TObject);
begin
  if lista_disciplinas.ItemIndex > -1 then
  begin
    PopupMenu1.Items.Items[0].Enabled := true;
  end
  else
  begin
    PopupMenu1.Items.Items[0].Enabled := false;
  end;
end;

end.

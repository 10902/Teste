unit frm_notas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, FireDAC.Comp.UI, FireDAC.Phys.SQLite, data_module,
  Vcl.Imaging.pngimage;

type
  Ttela_notas = class(TForm)
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    lb_aluno: TLabel;
    lb_id: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    img_relatorio: TImage;
    Label3: TLabel;
    img_atualiza: TImage;
    Label4: TLabel;
    Image1: TImage;
    Label5: TLabel;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TNavigateBtn);

    procedure img_relatorioClick(Sender: TObject);
    procedure img_atualizaClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaLista;
  end;

var
  tela_notas: Ttela_notas;
  dt: TDM;

  ds: TDataSource;

implementation

{$R *.dfm}

uses frm_relatorio_notas, frm_principal, frm_relatorio_alunos_professor;

procedure Ttela_notas.AtualizaLista;
var
  aluno: integer;
  SQL: TFDQuery;
begin
  try

    dt := TDM.Create(nil);

    ds := TDataSource.Create(nil);
    SQL := TFDQuery.Create(NIL);
    dt.TFConexao.Connected := true;
    SQL.Connection := dt.TFConexao;
    SQL.SQL.Add
      ('SELECT T.REGISTRO,T.disciplina,D.descricao,t.nota_1,t.nota_2,t.nota_trabalho,round(sum((t.nota_1+t.nota_2+t.nota_trabalho)/3),2) as media FROM tb_alunos_notas T JOIN tb_aluno A ON A.id=T.aluno JOIN tb_disciplina D ON D.id=T.disciplina ');
    SQL.SQL.Add('where t.aluno=:aluno group by t.aluno,t.disciplina');
    SQL.ParamByName('aluno').AsInteger := StrToInt(lb_id.Caption);
    SQL.Open();
    ds.DataSet := SQL;
    DBGrid1.DataSource := ds;
    DBNavigator1.DataSource := ds;

  finally

  end;
end;

procedure Ttela_notas.Button1Click(Sender: TObject);
var
  aluno: integer;
  SQL: TFDQuery;
begin
  try

    dt := TDM.Create(nil);

    ds := TDataSource.Create(nil);
    SQL := TFDQuery.Create(NIL);
    dt.TFConexao.Connected := true;
    SQL.Connection := dt.TFConexao;
    SQL.SQL.Add
      ('SELECT T.REGISTRO,T.disciplina,D.descricao,t.nota_1,t.nota_2,t.nota_trabalho,round(sum((t.nota_1+t.nota_2+t.nota_trabalho)/3),2) as media FROM tb_alunos_notas T JOIN tb_aluno A ON A.id=T.aluno JOIN tb_disciplina D ON D.id=T.disciplina ');
    SQL.SQL.Add('where t.aluno=:aluno group by t.aluno,t.disciplina');
    SQL.ParamByName('aluno').AsInteger := StrToInt(lb_id.Caption);
    SQL.Open();
    ds.DataSet := SQL;
    DBGrid1.DataSource := ds;
    DBNavigator1.DataSource := ds;

  finally

  end;
end;

procedure Ttela_notas.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin

  case Button of
    nbFirst:
      begin

      end;
    nbPrior:
      begin

      end;
    nbNext:
      begin

      end;
    nbLast:
      begin

      end;

    nbInsert:
      begin

      end;
    nbDelete:
      begin

      end;
    nbEdit:
      begin

      end;
    nbPost:
      begin

      end;
    nbCancel:
      begin

      end;

    nbRefresh:
      begin

      end;
  end;
end;

procedure Ttela_notas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(dt);
  FreeAndNil(ds);
  Action := caFree;
  tela_notas := nil;
end;

procedure Ttela_notas.FormShow(Sender: TObject);
begin
  AtualizaLista;
end;

procedure Ttela_notas.Image1Click(Sender: TObject);
var
  dm: TDM;

  aluno: integer;
begin
  aluno := StrToInt(lb_id.Caption);
  // relatorio detalhado
  if tela_relatorio_alunos_professor = nil then
  begin
    tela_relatorio_alunos_professor := Ttela_relatorio_alunos_professor.Create
      (Application);

    // consulta para agrupar por profissionais
    dm := TDM.Create(nil);

    dm.TFConexao.Connected := true;
    dm.SQL_ALUNOS_PROFESSOR.Close;
    dm.SQL_ALUNOS_PROFESSOR.SQL.Clear;
    dm.SQL_ALUNOS_PROFESSOR.SQL.Add
      ('select t.aluno,a.nome as nome_aluno, d.descricao as disciplina, p.professor,p2.nome as nome_professor from tb_aluno_disciplina t join tb_aluno a on a.id=t.aluno ');
    dm.SQL_ALUNOS_PROFESSOR.SQL.Add
      ('join tb_disciplina d on d.id=t.disciplina join tb_professor_disciplina p on p.disciplina=t.disciplina join tb_professores p2 on p2.id=p.professor ');
    dm.SQL_ALUNOS_PROFESSOR.SQL.Add
      ('where t.aluno=:aluno and p.status=1 group by t.aluno, d.descricao');
    dm.SQL_ALUNOS_PROFESSOR.ParamByName('aluno').AsInteger := aluno;

    dm.SQL_ALUNOS_PROFESSOR.Open;
    // Dados do cabe�alho
    tela_relatorio_alunos_professor.rl_tipo.Caption := 'ANAL�TICO';

    ;
    tela_relatorio_alunos_professor.RLReport1.DataSource := dm.ds_alunos_professor;
    tela_relatorio_alunos_professor.RLSubDetail1.DataSource := dm.ds_alunos_professor;
    tela_relatorio_alunos_professor.RLGroup1.DataFields := 'aluno';

    tela_relatorio_alunos_professor.campo_codigo_aluno.DataSource :=
      dm.ds_alunos_professor;
    tela_relatorio_alunos_professor.campo_aluno.DataSource := dm.ds_alunos_professor;
    tela_relatorio_alunos_professor.campo_disciplina.DataSource := dm.ds_alunos_professor;
    tela_relatorio_alunos_professor.campo_cod_professor.DataSource :=
      dm.ds_alunos_professor;
    tela_relatorio_alunos_professor.campo_professor.DataSource := dm.ds_alunos_professor;
    tela_relatorio_alunos_professor.campo_total_professores.DataSource :=
      dm.ds_alunos_professor;

    tela_relatorio_alunos_professor.campo_codigo_aluno.DataField := 'aluno';
    tela_relatorio_alunos_professor.campo_aluno.DataField := 'nome_aluno';
    tela_relatorio_alunos_professor.campo_disciplina.DataField := 'disciplina';
    tela_relatorio_alunos_professor.campo_cod_professor.DataField :=
      'professor';
    tela_relatorio_alunos_professor.campo_professor.DataField :=
      'nome_professor';
    tela_relatorio_alunos_professor.campo_total_professores.DataField :=
      'disciplina';

    tela_relatorio_alunos_professor.RLReport1.Prepare;

    tela_relatorio_alunos_professor.RLReport1.PreviewModal;

    FreeAndNil(dm);
    FreeAndNil(tela_relatorio_alunos_professor);

  end;
end;

procedure Ttela_notas.img_atualizaClick(Sender: TObject);
begin
  AtualizaLista;
end;

procedure Ttela_notas.img_relatorioClick(Sender: TObject);
var
  dm: TDM;

  aluno: integer;
begin
  aluno := StrToInt(lb_id.Caption);
  // relatorio detalhado
  if tela_relatorio_notas = nil then
  begin
    tela_relatorio_notas := Ttela_relatorio_notas.Create(Application);

    // consulta para agrupar por profissionais
    dm := TDM.Create(nil);

    dm.TFConexao.Connected := true;
    dm.SQL_NOTAS.Close;
    dm.SQL_NOTAS.SQL.Clear;
    dm.SQL_NOTAS.SQL.Add
      ('select *,case when media >=7 then "aprovado" when media<7  then "reprovado" end as status from v_notas_aluno where aluno=:aluno');

    dm.SQL_NOTAS.ParamByName('aluno').AsInteger := aluno;

    dm.SQL_NOTAS.Open;
    // Dados do cabe�alho
    tela_relatorio_notas.rl_tipo.Caption := 'ANAL�TICO';

    ;
    tela_relatorio_notas.RLReport1.DataSource := dm.ds_notas;
    tela_relatorio_notas.RLSubDetail1.DataSource := dm.ds_notas;
    tela_relatorio_notas.RLGroup1.DataFields := 'aluno';

    tela_relatorio_notas.campo_codigo_aluno.DataSource := dm.ds_notas;
    tela_relatorio_notas.campo_aluno.DataSource := dm.ds_notas;
    tela_relatorio_notas.campo_disciplina.DataSource := dm.ds_notas;
    tela_relatorio_notas.campo_cod_disciplina.DataSource := dm.ds_notas;
    tela_relatorio_notas.campo_nota1.DataSource := dm.ds_notas;
    tela_relatorio_notas.campo_nota2.DataSource := dm.ds_notas;
    tela_relatorio_notas.campo_media.DataSource := dm.ds_notas;
    tela_relatorio_notas.campo_status.DataSource := dm.ds_notas;
    tela_relatorio_notas.campo_nota_trabalho.DataSource := dm.ds_notas;
    tela_relatorio_notas.campo_total_disciplinas.DataSource := dm.ds_notas;

    tela_relatorio_notas.campo_codigo_aluno.DataField := 'aluno';
    tela_relatorio_notas.campo_aluno.DataField := 'nome_aluno';
    tela_relatorio_notas.campo_disciplina.DataField := 'descricao';
    tela_relatorio_notas.campo_cod_disciplina.DataField := 'disciplina';
    tela_relatorio_notas.campo_nota1.DataField := 'nota_1';
    tela_relatorio_notas.campo_nota2.DataField := 'nota_2';
    tela_relatorio_notas.campo_nota_trabalho.DataField := 'nota_trabalho';
    tela_relatorio_notas.campo_media.DataField := 'media';
    tela_relatorio_notas.campo_status.DataField := 'status';
    tela_relatorio_notas.campo_total_disciplinas.DataField := 'disciplina';



    // ------segunda consulta

    dm.SQL_NOTAS2.Close;
    dm.SQL_NOTAS2.SQL.Clear;
    dm.SQL_NOTAS2.SQL.Add
      ('select count(DISCIPLINA) AS TOTAL_REPROVADOS,(SELECT count(DISCIPLINA)from v_notas_aluno WHERE MEDIA >=7 and aluno=:aluno) AS TOTAL_APROVADOS from v_notas_aluno WHERE MEDIA <7 and aluno=:aluno');

    dm.SQL_NOTAS2.ParamByName('aluno').AsInteger := aluno;

    dm.SQL_NOTAS2.Open;
    tela_relatorio_notas.RLSubDetail2.DataSource := dm.ds_notas2;

    tela_relatorio_notas.campo_total_reprovados.DataSource := dm.ds_notas2;
    tela_relatorio_notas.campo_total_reprovados.DataField := 'total_reprovados';
    tela_relatorio_notas.campo_total_aprovados.DataSource := dm.ds_notas2;
    tela_relatorio_notas.campo_total_aprovados.DataField := 'total_aprovados';

    tela_relatorio_notas.RLReport1.Prepare;

    tela_relatorio_notas.RLReport1.PreviewModal;

    FreeAndNil(dm);
    FreeAndNil(tela_relatorio_notas);

  end;
end;

end.

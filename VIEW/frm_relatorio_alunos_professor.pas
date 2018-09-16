unit frm_relatorio_alunos_professor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.Imaging.jpeg;

type
  Ttela_relatorio_alunos_professor = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLImage1: TRLImage;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    rl_tipo: TRLLabel;
    RLLabel47: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLBand2: TRLBand;
    RLSubDetail1: TRLSubDetail;
    RLBand13: TRLBand;
    RLBand16: TRLBand;
    RLLabel31: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLLabel5: TRLLabel;
    campo_codigo_aluno: TRLDBText;
    RLLabel6: TRLLabel;
    campo_aluno: TRLDBText;
    RLDraw1: TRLDraw;
    RLBand4: TRLBand;
    campo_professor: TRLDBText;
    campo_cod_professor: TRLDBText;
    RLDraw2: TRLDraw;
    RLDraw13: TRLDraw;
    campo_disciplina: TRLDBText;
    RLBand5: TRLBand;
    RLDraw9: TRLDraw;
    RLLabel18: TRLLabel;
    campo_total_professores: TRLDBResult;
    RLBand6: TRLBand;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel4: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tela_relatorio_alunos_professor: Ttela_relatorio_alunos_professor;

implementation

{$R *.dfm}

end.

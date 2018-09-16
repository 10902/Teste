program ProjetoUniversidade;

uses
  Vcl.Forms,
  Upessoa in 'MODELO\Upessoa.pas',
  UProfessor in 'MODELO\UProfessor.pas',
  UAluno in 'MODELO\UAluno.pas',
  CProfessor in 'CONTROLE\CProfessor.pas',
  UFuncoes in 'MODELO\UFuncoes.pas',
  CAluno in 'CONTROLE\CAluno.pas',
  UDisciplina in 'MODELO\UDisciplina.pas',
  CDisciplina in 'CONTROLE\CDisciplina.pas',
  DProfessor in 'DAO\DProfessor.pas',
  DAluno in 'DAO\DAluno.pas',
  frm_principal in 'VIEW\frm_principal.pas' {tela_principal},
  data_module in 'VIEW\data_module.pas' {DM: TDataModule},
  frm_cadastro_professor in 'VIEW\frm_cadastro_professor.pas' {tela_cadastra_professor},
  frm_cadastro_aluno in 'VIEW\frm_cadastro_aluno.pas' {tela_cadastra_Aluno},
  DDisciplina in 'DAO\DDisciplina.pas',
  frm_cadastro_disciplina in 'VIEW\frm_cadastro_disciplina.pas' {tela_cadastra_disciplina},
  frm_vincula_professor_disciplina in 'VIEW\frm_vincula_professor_disciplina.pas' {tela_vincula_professor_disciplina},
  frm_vincula_disciplina_aluno in 'VIEW\frm_vincula_disciplina_aluno.pas' {tela_vincula_disciplina_aluno},
  frm_notas in 'VIEW\frm_notas.pas' {tela_notas},
  frm_relatorio_notas in 'VIEW\frm_relatorio_notas.pas' {tela_relatorio_notas},
  frm_relatorio_alunos_professor in 'VIEW\frm_relatorio_alunos_professor.pas' {tela_relatorio_alunos_professor},
  frm_tipo_aprovacao in 'VIEW\frm_tipo_aprovacao.pas' {tela_tipo_aprovacao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(Ttela_principal, tela_principal);
  Application.Run;
end.

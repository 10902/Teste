unit data_module;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, FireDAC.Comp.UI, FireDAC.Phys.SQLite, dialogs,
  Vcl.Controls, Vcl.Forms, Winapi.Windows, Vcl.ComCtrls, Vcl.ExtCtrls,
  Winapi.Messages, IniFiles;

type
  TDM = class(TDataModule)
    TFConexao: TFDConnection;
    SQL_DATA: TFDQuery;
    SQL_ALUNO: TFDQuery;
    SQL_PROFESSOR: TFDQuery;
    SQL_DISCIPLINA: TFDQuery;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    SQL_NOTAS: TFDQuery;
    ds_notas: TDataSource;
    SQL_NOTAS2: TFDQuery;
    ds_notas2: TDataSource;
    SQL_ALUNOS_PROFESSOR: TFDQuery;
    ds_alunos_professor: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;
  Data: TInifile;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UFuncoes;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  caminho: string;
  Data: TInifile;
  servidor, usuario, senha, porta, banco, drive: string;
  funcao: TFuncoes;
begin
{  try
    begin
      // antes de conectar vamos ler os dados de conexao do arquivo jfsoftec.ini
      If fileexists(ExtractFilePath(ParamStr(0)) + 'config.ini') then
      begin
        funcao := TFuncoes.Create;
        caminho := ExtractFilePath(ParamStr(0));
        Data := TInifile.Create(caminho + 'config.ini');
        // Nome do meu arquivo INI que quero ler
        servidor := funcao.Crypt('D', Data.ReadString('Geral', 'Servidor', ''));
        // a varial vai receber o que est� gravado dentro da chave Geral e da subchave Servidor
        usuario := funcao.Crypt('D', Data.ReadString('Geral', 'Usuario', ''));
        senha := funcao.Crypt('D', Data.ReadString('Geral', 'Senha', ''));
        porta := funcao.Crypt('D', Data.ReadString('Geral', 'Porta', ''));
        banco := funcao.Crypt('D', Data.ReadString('Geral', 'Banco', ''));
        drive := funcao.Crypt('D', Data.ReadString('Geral', 'Drive', ''));


        // INSTANCIANDO O OBJETO DE CONEX�O E PASSANDO OS PARAMETROS LIDOS DO ARQUIVO

        TFConexao.Connected := false;
        TFConexao.LoginPrompt := false;
        TFConexao.Params.Clear;
        TFConexao.Params.Add('server=' + servidor);
        TFConexao.Params.Add('user_name=' + usuario);
        TFConexao.Params.Add('password=' + senha);
        TFConexao.Params.Add('port=' + porta);
        TFConexao.Params.Add('Database=' + banco);
        TFConexao.Params.Add('DriverID=' + drive);
        TFConexao.Connected := TRUE;

        Data.Free; // Libera a mem�ria
        FreeAndNil(funcao);

      END
      else

      begin
        ShowMessage('Arquivo de configura��o n�o encontrado !');

        Application.Terminate;

        // end;
      end;
    end;

  except
    on E: Exception do
    begin

      ShowMessage('Erro na conex�o com a base de dados: ');
      Application.Terminate;

    end;

  end;

end;   }

end;
end.

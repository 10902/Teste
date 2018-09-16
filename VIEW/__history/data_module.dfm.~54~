object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 414
  Width = 484
  object TFConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\jfsof\OneDrive\Desktop\FORTES\Projeto Fortes T' +
        'ecnologia\BD\bd_universidade.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 32
    Top = 32
  end
  object SQL_DATA: TFDQuery
    Connection = TFConexao
    Left = 112
    Top = 32
  end
  object SQL_ALUNO: TFDQuery
    Connection = TFConexao
    Left = 136
    Top = 216
  end
  object SQL_PROFESSOR: TFDQuery
    Connection = TFConexao
    Left = 40
    Top = 128
  end
  object SQL_DISCIPLINA: TFDQuery
    Connection = TFConexao
    Left = 40
    Top = 216
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 352
    Top = 40
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrHourGlass
    Left = 232
    Top = 32
  end
  object SQL_NOTAS: TFDQuery
    Connection = TFConexao
    Left = 144
    Top = 120
  end
  object ds_notas: TDataSource
    DataSet = SQL_NOTAS
    Left = 224
    Top = 120
  end
  object SQL_NOTAS2: TFDQuery
    Connection = TFConexao
    Left = 328
    Top = 112
  end
  object ds_notas2: TDataSource
    DataSet = SQL_NOTAS2
    Left = 336
    Top = 168
  end
  object SQL_ALUNOS_PROFESSOR: TFDQuery
    Connection = TFConexao
    Left = 64
    Top = 320
  end
  object ds_alunos_professor: TDataSource
    DataSet = SQL_ALUNOS_PROFESSOR
    Left = 192
    Top = 312
  end
end

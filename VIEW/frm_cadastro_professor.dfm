object tela_cadastra_professor: Ttela_cadastra_professor
  Left = 0
  Top = 0
  Caption = 'Cadastro professor'
  ClientHeight = 421
  ClientWidth = 759
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  DesignSize = (
    759
    421)
  PixelsPerInch = 96
  TextHeight = 13
  object lb_codigoCliente: TLabel
    Left = 43
    Top = 88
    Width = 51
    Height = 16
    Caption = 'C'#211'DIGO:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    StyleElements = [seBorder]
  end
  object lb_NomeCliente: TLabel
    Left = 184
    Top = 88
    Width = 39
    Height = 16
    Caption = 'NOME:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    StyleElements = [seBorder]
  end
  object Label3: TLabel
    Left = 236
    Top = 143
    Width = 27
    Height = 16
    Caption = 'CPF:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    StyleElements = [seBorder]
  end
  object Label4: TLabel
    Left = 42
    Top = 141
    Width = 40
    Height = 16
    Caption = 'IDADE:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    StyleElements = [seBorder]
  end
  object Label6: TLabel
    Left = 394
    Top = 279
    Width = 27
    Height = 16
    Caption = 'CEP:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    StyleElements = [seBorder]
  end
  object Label7: TLabel
    Left = 43
    Top = 216
    Width = 48
    Height = 16
    Caption = 'CIDADE:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    StyleElements = [seBorder]
  end
  object Label8: TLabel
    Left = 277
    Top = 279
    Width = 55
    Height = 16
    Caption = 'N'#218'MERO:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    StyleElements = [seBorder]
  end
  object Label9: TLabel
    Left = 392
    Top = 141
    Width = 53
    Height = 16
    Caption = 'ESTADO:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 43
    Top = 279
    Width = 49
    Height = 16
    Caption = 'BAIRRO:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    StyleElements = [seBorder]
  end
  object Label11: TLabel
    Left = 43
    Top = 346
    Width = 40
    Height = 16
    Caption = 'FONE :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    StyleElements = [seBorder]
  end
  object Label13: TLabel
    Left = 162
    Top = 346
    Width = 40
    Height = 16
    Caption = 'EMAIL:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    StyleElements = [seBorder]
  end
  object Label5: TLabel
    Left = 254
    Top = 216
    Width = 67
    Height = 16
    Caption = 'ENDERE'#199'O:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    StyleElements = [seBorder]
  end
  object lb_campoObrigatorioNome: TLabel
    Left = 340
    Top = 88
    Width = 94
    Height = 14
    Caption = '(campo obrigat'#243'rio)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    StyleElements = [seBorder]
  end
  object lb_cod_estado: TLabel
    Left = 602
    Top = 331
    Width = 24
    Height = 13
    AutoSize = False
  end
  object Label12: TLabel
    Left = 146
    Top = 141
    Width = 37
    Height = 16
    Caption = 'SEXO:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    StyleElements = [seBorder]
  end
  object edit_id: TEdit
    Left = 42
    Top = 108
    Width = 91
    Height = 24
    CharCase = ecUpperCase
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 0
    StyleElements = [seBorder]
  end
  object edit_nome: TEdit
    Left = 184
    Top = 108
    Width = 250
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    StyleElements = [seBorder]
  end
  object GroupBox15: TGroupBox
    Left = 611
    Top = 44
    Width = 130
    Height = 30
    TabOrder = 2
    object Label67: TLabel
      Left = 8
      Top = 6
      Width = 35
      Height = 13
      Caption = 'Status:'
    end
    object lb_status: TLabel
      Left = 48
      Top = 7
      Width = 73
      Height = 16
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Font.Quality = fqProof
      ParentFont = False
      StyleElements = []
    end
  end
  object GroupBox14: TGroupBox
    Left = 502
    Top = 8
    Width = 235
    Height = 30
    TabOrder = 3
    object lb_usuario_alteracao: TLabel
      Left = 55
      Top = 5
      Width = 172
      Height = 17
      AutoSize = False
      Caption = 'xxxxxxxxxxx'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Font.Quality = fqProof
      ParentFont = False
      StyleElements = []
    end
    object Label66: TLabel
      Left = 8
      Top = 6
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
  end
  object GroupBox13: TGroupBox
    Left = 254
    Top = 8
    Width = 236
    Height = 30
    TabOrder = 4
    object lb_dat_alteracao: TLabel
      Left = 108
      Top = 5
      Width = 125
      Height = 17
      AutoSize = False
      Caption = '__/__/__ 00:00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Font.Quality = fqProof
      ParentFont = False
      StyleElements = []
    end
    object Label61: TLabel
      Left = 8
      Top = 6
      Width = 90
      Height = 13
      Caption = #218'ltima atualiza'#231#227'o:'
    end
  end
  object GroupBox12: TGroupBox
    Left = 8
    Top = 8
    Width = 234
    Height = 30
    TabOrder = 5
    object lb_dat_cadastro: TLabel
      Left = 102
      Top = 5
      Width = 130
      Height = 17
      AutoSize = False
      Caption = '__/__/__ 00:00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Font.Quality = fqProof
      ParentFont = False
      StyleElements = []
    end
    object Label55: TLabel
      Left = 8
      Top = 6
      Width = 78
      Height = 13
      Caption = 'Data. Cadastro:'
    end
  end
  object edit_cpf: TMaskEdit
    Left = 236
    Top = 165
    Width = 115
    Height = 21
    EditMask = '!999.999.999-00;1;_'
    MaxLength = 14
    TabOrder = 6
    Text = '   .   .   -  '
  end
  object edit_cidade: TEdit
    Left = 42
    Top = 238
    Width = 164
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    StyleElements = [seClient, seBorder]
  end
  object edit_endereco: TEdit
    Left = 254
    Top = 238
    Width = 245
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    StyleElements = [seClient, seBorder]
  end
  object edit_bairro: TEdit
    Left = 43
    Top = 301
    Width = 192
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    StyleElements = [seClient, seBorder]
  end
  object edit_numero: TEdit
    Left = 277
    Top = 301
    Width = 74
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 10
    StyleElements = [seClient, seBorder]
  end
  object edit_cep: TMaskEdit
    Left = 394
    Top = 301
    Width = 83
    Height = 24
    EditMask = '00000\-999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 9
    ParentFont = False
    TabOrder = 11
    Text = '     -   '
    StyleElements = [seClient, seBorder]
  end
  object cb_estados: TComboBox
    Left = 392
    Top = 163
    Width = 107
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    StyleElements = [seClient, seBorder]
    Items.Strings = (
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MT'
      'MS'
      'MG'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SP'
      'SE'
      'TO')
  end
  object edit_fone: TMaskEdit
    Left = 42
    Top = 368
    Width = 96
    Height = 24
    EditMask = '!\(99\)0000-0000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 13
    ParentFont = False
    TabOrder = 13
    Text = '(  )    -    '
    StyleElements = [seClient, seBorder]
  end
  object edit_email: TEdit
    Left = 162
    Top = 368
    Width = 189
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    StyleElements = [seClient, seBorder]
  end
  object btn_confirma: TButton
    Left = 666
    Top = 371
    Width = 85
    Height = 42
    Cursor = crHandPoint
    Anchors = [akTop, akRight]
    Caption = 'Cadastrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    StyleElements = [seClient, seBorder]
    OnClick = btn_confirmaClick
  end
  object btn_cancela: TButton
    Left = 566
    Top = 372
    Width = 85
    Height = 42
    Cursor = crHandPoint
    Anchors = [akTop, akRight]
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    OnClick = btn_cancelaClick
  end
  object edit_idade: TEdit
    Left = 42
    Top = 163
    Width = 74
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 17
    StyleElements = [seClient, seBorder]
  end
  object cb_sexo: TComboBox
    Left = 146
    Top = 163
    Width = 62
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    StyleElements = [seClient, seBorder]
    Items.Strings = (
      'F'
      'M')
  end
end

object tela_cadastra_disciplina: Ttela_cadastra_disciplina
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de disciplinas'
  ClientHeight = 306
  ClientWidth = 741
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
    741
    306)
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
    Top = 86
    Width = 73
    Height = 16
    Caption = 'DESCRI'#199#195'O:'
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
    Width = 83
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
  object edit_descricao: TEdit
    Left = 184
    Top = 108
    Width = 307
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
    Width = 122
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
      Top = 6
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
    Width = 227
    Height = 30
    TabOrder = 3
    object lb_usuario_alteracao: TLabel
      Left = 62
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
    Left = 256
    Top = 8
    Width = 228
    Height = 30
    TabOrder = 4
    object lb_dat_alteracao: TLabel
      Left = 110
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
    Width = 226
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
  object btn_confirma: TButton
    Left = 648
    Top = 256
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
    TabOrder = 6
    StyleElements = [seClient, seBorder]
    OnClick = btn_confirmaClick
  end
  object btn_cancela: TButton
    Left = 557
    Top = 256
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
    TabOrder = 7
    OnClick = btn_cancelaClick
  end
  object OpenPictureDialog2: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.jpg;*.jpeg;*.gif;*.png;*.t' +
      'if;*.tiff;*.ico;*.emf;*.wmf)|*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.jp' +
      'g;*.jpeg;*.gif;*.png;*.tif;*.tiff;*.ico;*.emf;*.wmf|GIF Image (*' +
      '.gif)|*.gif|Portable Network Graphics (*.png)|*.png|JPEG Image F' +
      'ile (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp' +
      ')|*.bmp|JPEG Images (*.jpg)|*.jpg|JPEG Images (*.jpeg)|*.jpeg|PN' +
      'G Images (*.png)| *.png'
    Left = 459
    Top = 48
  end
end

object tela_vincula_disciplina_aluno: Ttela_vincula_disciplina_aluno
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Vincula'#231#227'o de disciplinas para alunos'
  ClientHeight = 329
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 571
    Height = 73
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clBlue
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 74
      Height = 18
      Caption = 'Professor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      StyleElements = [seBorder]
    end
    object Label2: TLabel
      Left = 16
      Top = 40
      Width = 19
      Height = 18
      Caption = 'ID:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      StyleElements = [seBorder]
    end
    object lb_aluno: TLabel
      Left = 96
      Top = 17
      Width = 172
      Height = 17
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      StyleElements = [seBorder]
    end
    object lb_id: TLabel
      Left = 41
      Top = 40
      Width = 227
      Height = 17
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      StyleElements = [seBorder]
    end
    object Label3: TLabel
      Left = 320
      Top = 18
      Width = 72
      Height = 16
      Caption = 'Disciplinas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      StyleElements = [seBorder]
    end
    object lb_id_disciplina: TLabel
      Left = 531
      Top = 16
      Width = 32
      Height = 16
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      StyleElements = [seClient, seBorder]
    end
    object Label7: TLabel
      Left = 508
      Top = 17
      Width = 17
      Height = 16
      Caption = 'ID:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      StyleElements = [seBorder]
    end
    object cb_disciplinas: TComboBox
      Left = 320
      Top = 39
      Width = 243
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnSelect = cb_disciplinasSelect
    end
  end
  object lista_disciplinas: TListView
    Left = 0
    Top = 73
    Width = 571
    Height = 215
    Align = alClient
    BorderStyle = bsNone
    Columns = <
      item
        Caption = 'ID'
        Width = 100
      end
      item
        Caption = 'DISCIPLINA'
        Width = 470
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu1
    TabOrder = 1
    ViewStyle = vsReport
    ExplicitHeight = 192
  end
  object Panel2: TPanel
    Left = 0
    Top = 288
    Width = 571
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 294
    object Label4: TLabel
      Left = 0
      Top = 15
      Width = 564
      Height = 15
      Caption = 
        'OBS: Para desvincular clicar com bot'#227'o direito ou usar o atalho ' +
        'Ctrl+D ao selionar a discipla no grid.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      StyleElements = [seBorder]
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 336
    Top = 136
    object Desvincular1: TMenuItem
      Caption = 'Desvincular'
      ShortCut = 16452
      OnClick = Desvincular1Click
    end
  end
end

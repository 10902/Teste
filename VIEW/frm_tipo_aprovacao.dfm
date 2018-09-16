object tela_tipo_aprovacao: Ttela_tipo_aprovacao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tipo'
  ClientHeight = 142
  ClientWidth = 356
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
    356
    142)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 273
    Top = 104
    Width = 75
    Height = 30
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'GERAR'
    TabOrder = 0
    OnClick = Button1Click
  end
  object RD_TODOS: TRadioButton
    Left = 9
    Top = 36
    Width = 113
    Height = 17
    Caption = 'Todos os alunos'
    Checked = True
    TabOrder = 1
    TabStop = True
  end
  object RD_APROVADOS: TRadioButton
    Left = 8
    Top = 66
    Width = 145
    Height = 17
    Caption = 'Somente aprovados'
    TabOrder = 2
  end
  object RD_REPROVADOS: TRadioButton
    Left = 7
    Top = 94
    Width = 146
    Height = 17
    Caption = 'Somente reprovados'
    TabOrder = 3
  end
end

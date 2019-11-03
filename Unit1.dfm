object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'M'#225'quina de Dinheiro'
  ClientHeight = 199
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 295
    Height = 183
    TabOrder = 0
    object Label1: TLabel
      Left = 96
      Top = 45
      Width = 61
      Height = 13
      Caption = 'Valor Saque:'
    end
    object Edit1: TEdit
      Left = 96
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 120
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Calcular'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end

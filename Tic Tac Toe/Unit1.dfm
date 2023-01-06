object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 152
    Top = 64
    Width = 185
    Height = 217
    OnMouseDown = PaintBox1MouseDown
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 8
    object Play1: TMenuItem
      Caption = 'Play'
      OnClick = Play1Click
      object N1: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
      end
      object N2: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      end
    end
  end
end

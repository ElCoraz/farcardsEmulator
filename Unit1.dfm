object Form1: TForm1
  Left = 713
  Top = 207
  Width = 410
  Height = 288
  Caption = 'Farcards (Emulator)'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 377
    Height = 49
    Caption = 'GetCardInfoEx'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 86
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1086#1095#1082#1080':'
    end
  end
  object Edit1: TEdit
    Left = 104
    Top = 26
    Width = 185
    Height = 21
    Hint = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1086#1095#1082#1080
    HelpType = htKeyword
    HelpKeyword = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1086#1095#1082#1080
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 296
    Top = 24
    Width = 81
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 64
    Width = 377
    Height = 177
    Caption = 'TransactionsEx'
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 32
      Width = 86
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1086#1095#1082#1080':'
    end
    object Button2: TButton
      Left = 288
      Top = 20
      Width = 81
      Height = 25
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      TabOrder = 0
      OnClick = Button2Click
    end
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 56
      Width = 361
      Height = 105
      Caption = #1058#1080#1087' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080
      ItemIndex = 0
      Items.Strings = (
        #1055#1083#1072#1090#1077#1078' ('#1057#1085#1103#1090#1080#1077' '#1076#1077#1085#1077#1075' '#1089#1086' '#1089#1095#1077#1090#1072')'
        #1057#1082#1080#1076#1082#1072
        #1041#1086#1085#1091#1089' ('#1053#1072#1095#1080#1089#1083#1077#1085#1080#1077' '#1076#1077#1085#1077#1075' '#1085#1072' '#1089#1095#1077#1090')'
        #1055#1086#1090#1088#1072#1090#1099' '#1075#1086#1089#1090#1103' ('#1057#1082#1086#1083#1100#1082#1086' '#1079#1072#1087#1083#1072#1090#1080#1083' '#1089#1074#1086#1080#1093' '#1076#1077#1085#1077#1075')')
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 96
      Top = 24
      Width = 185
      Height = 21
      TabOrder = 2
      OnKeyPress = Edit2KeyPress
    end
  end
end

object OptionsForm: TOptionsForm
  Left = 192
  Top = 106
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1088#1077#1076#1072#1082#1090#1086#1088#1072
  ClientHeight = 289
  ClientWidth = 225
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 209
    Height = 249
    TabOrder = 0
    object Shape1: TShape
      Left = 128
      Top = 96
      Width = 57
      Height = 25
    end
    object Label1: TLabel
      Left = 8
      Top = 72
      Width = 54
      Height = 13
      Caption = #1064#1072#1075' '#1090#1086#1095#1077#1082':'
    end
    object Label2: TLabel
      Left = 8
      Top = 104
      Width = 59
      Height = 13
      Caption = #1062#1074#1077#1090' '#1090#1086#1095#1077#1082':'
    end
    object Label3: TLabel
      Left = 8
      Top = 144
      Width = 89
      Height = 13
      Caption = #1062#1074#1077#1090' '#1073#1101#1082#1075#1088#1072#1091#1085#1076#1072':'
    end
    object Shape2: TShape
      Left = 128
      Top = 136
      Width = 57
      Height = 25
      Brush.Color = clBlack
    end
    object Label4: TLabel
      Left = 8
      Top = 174
      Width = 108
      Height = 26
      Caption = #1094#1074#1077#1090' '#1092#1086#1085#1072' '#1087#1088#1077#1076'. '#1087#1088#1086#1089#1084#1086#1090#1088#1072' '#1090#1077#1082#1089#1090#1091#1088#1099':'
      WordWrap = True
    end
    object Shape3: TShape
      Left = 128
      Top = 176
      Width = 57
      Height = 25
      Brush.Color = clBlack
    end
    object Label5: TLabel
      Left = 8
      Top = 224
      Width = 112
      Height = 13
      Caption = #1052#1072#1089#1096#1090#1072#1073' '#1084#1080#1085#1080'-'#1082#1072#1088#1090#1099':'
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 16
      Width = 121
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1095#1082#1080
      TabOrder = 0
    end
    object UpDown1: TUpDown
      Left = 185
      Top = 72
      Width = 12
      Height = 21
      Associate = Edit1
      Min = 8
      Max = 256
      Increment = 8
      Position = 16
      TabOrder = 6
    end
    object Edit1: TEdit
      Left = 128
      Top = 72
      Width = 57
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = '16'
    end
    object Button1: TButton
      Left = 186
      Top = 96
      Width = 11
      Height = 25
      Caption = '..'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 186
      Top = 136
      Width = 11
      Height = 25
      Caption = '..'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 186
      Top = 176
      Width = 11
      Height = 25
      Caption = '..'
      TabOrder = 4
      OnClick = Button3Click
    end
    object ComboBox1: TComboBox
      Left = 128
      Top = 216
      Width = 70
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = '1x'
      Items.Strings = (
        '1x'
        '2x')
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 32
      Width = 169
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1077#1082#1089#1090#1091#1088#1091' '#1087#1072#1085#1077#1083#1080
      TabOrder = 7
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 48
      Width = 169
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1088#1072#1079#1084#1077#1088#1099' '#1087#1072#1085#1077#1083#1080
      TabOrder = 8
    end
  end
  object bOK: TButton
    Left = 56
    Top = 256
    Width = 75
    Height = 25
    Caption = #1054#1050
    Default = True
    TabOrder = 1
    OnClick = bOKClick
  end
  object bCancel: TButton
    Left = 144
    Top = 256
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = bCancelClick
  end
  object ColorDialog: TColorDialog
    Options = [cdFullOpen]
    Left = 152
    Top = 8
  end
end

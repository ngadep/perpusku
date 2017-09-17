object FrmUtama: TFrmUtama
  Left = 0
  Top = 0
  Caption = 'FrmUtama'
  ClientHeight = 467
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BtnPengguna: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'pengguna'
    TabOrder = 0
    OnClick = BtnPenggunaClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 120
    Width = 730
    Height = 347
    Align = alBottom
    DataSource = DsPengguna
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 288
    Top = 16
    Width = 240
    Height = 25
    DataSource = DsPengguna
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object SetPengguna: TAureliusDataset
    FieldDefs = <>
    CreateSelfField = False
    IncludeUnmappedObjects = True
    Left = 24
    Top = 40
  end
  object DsPengguna: TDataSource
    DataSet = SetPengguna
    Left = 96
    Top = 40
  end
end

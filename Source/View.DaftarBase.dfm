object FrmDaftarBase: TFrmDaftarBase
  Left = 0
  Top = 0
  Caption = 'Daftar'
  ClientHeight = 460
  ClientWidth = 641
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
  object PnlSide: TPanel
    Left = 503
    Top = 0
    Width = 138
    Height = 460
    Align = alRight
    TabOrder = 0
    DesignSize = (
      138
      460)
    object BtnKeluar: TButton
      Left = 6
      Top = 8
      Width = 123
      Height = 25
      Caption = 'Keluar'
      TabOrder = 0
      OnClick = BtnKeluarClick
    end
    object BtnRefresh: TButton
      Left = 6
      Top = 39
      Width = 123
      Height = 25
      Caption = 'Refresh'
      TabOrder = 1
      OnClick = BtnRefreshClick
    end
    object BtnTambah: TButton
      Left = 6
      Top = 365
      Width = 123
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Tambah'
      TabOrder = 2
      OnClick = BtnTambahClick
    end
    object BtnEdit: TButton
      Left = 6
      Top = 396
      Width = 123
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Edit'
      TabOrder = 3
      OnClick = BtnEditClick
    end
    object BtnHapus: TButton
      Left = 6
      Top = 427
      Width = 123
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Hapus'
      TabOrder = 4
      OnClick = BtnHapusClick
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 0
    Width = 503
    Height = 460
    Align = alClient
    TabOrder = 1
    object View: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DsDaftar
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
    end
    object Level: TcxGridLevel
      GridView = View
    end
  end
  object DsDaftar: TDataSource
    DataSet = DSetDaftar
    Left = 144
    Top = 48
  end
  object DSetDaftar: TAureliusDataset
    FieldDefs = <>
    CreateSelfField = False
    IncludeUnmappedObjects = False
    Left = 40
    Top = 48
  end
end

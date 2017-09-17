object FrmBuku: TFrmBuku
  Left = 0
  Top = 0
  Caption = 'Daftar Buku'
  ClientHeight = 329
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TcxGrid
    Left = 0
    Top = 0
    Width = 570
    Height = 329
    Align = alClient
    TabOrder = 0
    object View: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DsDaftarBuku
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object Level: TcxGridLevel
      GridView = View
    end
  end
  object DSetDaftarBuku: TAureliusDataset
    FieldDefs = <>
    IncludeUnmappedObjects = False
    Left = 40
    Top = 48
  end
  object DsDaftarBuku: TDataSource
    DataSet = DSetDaftarBuku
    Left = 144
    Top = 48
  end
end

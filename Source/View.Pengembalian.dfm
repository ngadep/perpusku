object FrmPengembalian: TFrmPengembalian
  Left = 0
  Top = 0
  Caption = 'Pengembalian'
  ClientHeight = 429
  ClientWidth = 498
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PnlAtas: TPanel
    Left = 0
    Top = 0
    Width = 498
    Height = 105
    Align = alTop
    TabOrder = 0
  end
  object PnlBawah: TPanel
    Left = 0
    Top = 394
    Width = 498
    Height = 35
    Align = alBottom
    TabOrder = 1
  end
  object Grid: TcxGrid
    Left = 0
    Top = 105
    Width = 498
    Height = 289
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 136
    ExplicitTop = 136
    ExplicitWidth = 250
    ExplicitHeight = 200
    object Table: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
    end
    object Level: TcxGridLevel
      GridView = Table
    end
  end
end

object FrmPeminjaman: TFrmPeminjaman
  Left = 0
  Top = 0
  Caption = 'Peminjaman'
  ClientHeight = 393
  ClientWidth = 543
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
    Width = 543
    Height = 89
    Align = alTop
    TabOrder = 0
  end
  object PnlBawah: TPanel
    Left = 0
    Top = 352
    Width = 543
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  object Grid: TcxGrid
    Left = 0
    Top = 89
    Width = 543
    Height = 263
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 152
    ExplicitTop = 112
    ExplicitWidth = 250
    ExplicitHeight = 200
    object Table: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object TcNo: TcxGridColumn
        Caption = 'No'
        Width = 37
      end
      object TcKode: TcxGridColumn
        Caption = 'Kode'
        Width = 63
      end
      object TcJudul: TcxGridColumn
        Caption = 'Judul'
        Width = 334
      end
      object TcDurasi: TcxGridColumn
        Caption = 'Durasi'
        Width = 53
      end
      object TcTanggalPinjam: TcxGridColumn
        Caption = 'Tanggal Pinjam'
        Width = 90
      end
      object TcTanggalKembali: TcxGridColumn
        Caption = 'Tanggal Kembali'
        Width = 93
      end
    end
    object Level: TcxGridLevel
      GridView = Table
    end
  end
end

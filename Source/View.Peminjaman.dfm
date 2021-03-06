object FrmPeminjaman: TFrmPeminjaman
  Left = 0
  Top = 0
  Caption = 'Peminjaman'
  ClientHeight = 525
  ClientWidth = 666
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlAtas: TPanel
    Left = 0
    Top = 0
    Width = 666
    Height = 177
    Align = alTop
    TabOrder = 0
    DesignSize = (
      666
      177)
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 51
      Height = 13
      Caption = 'Kode / NIS'
    end
    object Label2: TLabel
      Left = 216
      Top = 11
      Width = 24
      Height = 13
      Caption = 'Kode'
    end
    object Label3: TLabel
      Left = 216
      Top = 52
      Width = 27
      Height = 13
      Caption = 'Nama'
    end
    object Label4: TLabel
      Left = 216
      Top = 91
      Width = 25
      Height = 13
      Caption = 'Kelas'
    end
    object Label5: TLabel
      Left = 480
      Top = 11
      Width = 54
      Height = 13
      Caption = 'Max Pinjam'
    end
    object LbKode: TLabel
      Left = 216
      Top = 27
      Width = 141
      Height = 19
      Caption = 'Kode Siswa / NIS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbNama: TLabel
      Left = 216
      Top = 67
      Width = 99
      Height = 19
      Caption = 'Nama Siswa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbKelas: TLabel
      Left = 216
      Top = 107
      Width = 96
      Height = 19
      Caption = 'Kelas Siswa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbMaxPinjam: TLabel
      Left = 480
      Top = 26
      Width = 79
      Height = 19
      Caption = 'Maximum'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 51
      Width = 92
      Height = 13
      Caption = 'Tempo Peminjaman'
    end
    object LbTempo: TLabel
      Left = 8
      Top = 67
      Width = 56
      Height = 19
      Caption = 'Tempo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 91
      Width = 123
      Height = 13
      Caption = 'Denda Terlambat per Hari'
    end
    object LbDenda: TLabel
      Left = 8
      Top = 110
      Width = 52
      Height = 19
      Caption = 'Denda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 480
      Top = 51
      Width = 60
      Height = 13
      Caption = 'Tanggungan'
    end
    object LbTanggungan: TLabel
      Left = 480
      Top = 66
      Width = 101
      Height = 19
      Caption = 'Tanggungan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdKode: TEdit
      Left = 8
      Top = 24
      Width = 193
      Height = 21
      TabOrder = 0
      OnKeyDown = EdKodeKeyDown
    end
    object EdBuku: TEdit
      Left = 8
      Top = 150
      Width = 649
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnKeyDown = EdBukuKeyDown
    end
  end
  object PnlBawah: TPanel
    Left = 0
    Top = 484
    Width = 666
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      666
      41)
    object BtnSimpan: TButton
      Left = 487
      Top = 6
      Width = 81
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Simpan'
      TabOrder = 0
      OnClick = BtnSimpanClick
    end
    object BtnKeluar: TButton
      Left = 574
      Top = 6
      Width = 81
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Keluar'
      TabOrder = 1
      OnClick = BtnKeluarClick
    end
    object BtnBaru: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Baru'
      TabOrder = 2
      OnClick = BtnBaruClick
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 177
    Width = 666
    Height = 307
    Align = alClient
    TabOrder = 2
    object Table: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DataController.OnDataChanged = TableDataControllerDataChanged
      OptionsData.CancelOnExit = False
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
      object TcTempo: TcxGridColumn
        Caption = 'Tempo'
        Width = 53
      end
      object TcTanggalPinjam: TcxGridColumn
        Caption = 'Tanggal Pinjam'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.DisplayFormat = 'dd/MM/yyyy'
        Width = 90
      end
      object TcTanggalKembali: TcxGridColumn
        Caption = 'Tanggal Kembali'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.DisplayFormat = 'dd/MM/yyyy'
        Width = 93
      end
    end
    object Level: TcxGridLevel
      GridView = Table
    end
  end
end

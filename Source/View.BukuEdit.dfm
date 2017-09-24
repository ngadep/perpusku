object FrmBukuEdit: TFrmBukuEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Buku Baru'
  ClientHeight = 340
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 50
    Height = 13
    Caption = 'Kode Buku'
  end
  object Label2: TLabel
    Left = 146
    Top = 8
    Width = 52
    Height = 13
    Caption = 'Pengarang'
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 51
    Height = 13
    Caption = 'Judul Buku'
  end
  object Label4: TLabel
    Left = 8
    Top = 88
    Width = 40
    Height = 13
    Caption = 'Penerbit'
  end
  object Label5: TLabel
    Left = 311
    Top = 89
    Width = 67
    Height = 13
    Caption = 'Tempat Terbit'
  end
  object Label6: TLabel
    Left = 8
    Top = 129
    Width = 61
    Height = 13
    Caption = 'Tahun Terbit'
  end
  object Label7: TLabel
    Left = 87
    Top = 129
    Width = 36
    Height = 13
    Caption = 'Dimensi'
  end
  object Label8: TLabel
    Left = 191
    Top = 129
    Width = 77
    Height = 13
    Caption = 'Jumlah Halaman'
  end
  object Label9: TLabel
    Left = 318
    Top = 129
    Width = 40
    Height = 13
    Caption = 'Kategori'
  end
  object Label10: TLabel
    Left = 8
    Top = 169
    Width = 21
    Height = 13
    Caption = 'DDC'
  end
  object Label11: TLabel
    Left = 266
    Top = 169
    Width = 23
    Height = 13
    Caption = 'ISBN'
  end
  object Label12: TLabel
    Left = 8
    Top = 209
    Width = 87
    Height = 13
    Caption = 'Tempat/ Rak Buku'
  end
  object Label13: TLabel
    Left = 315
    Top = 209
    Width = 59
    Height = 13
    Caption = 'Jumlah Buku'
  end
  object Label14: TLabel
    Left = 421
    Top = 209
    Width = 47
    Height = 13
    Caption = 'Stok Buku'
  end
  object Label15: TLabel
    Left = 8
    Top = 249
    Width = 109
    Height = 13
    Caption = 'Keterangan Tambahan'
  end
  object PnlBawah: TPanel
    Left = 0
    Top = 303
    Width = 527
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 301
    ExplicitWidth = 457
    DesignSize = (
      527
      37)
    object BtnOk: TButton
      Left = 359
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      ExplicitLeft = 289
    end
    object BtnCancel: TButton
      Left = 446
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 376
    end
  end
  object EdKode: TEdit
    Left = 8
    Top = 22
    Width = 132
    Height = 21
    TabOrder = 1
  end
  object EdPengarang: TEdit
    Left = 144
    Top = 22
    Width = 375
    Height = 21
    TabOrder = 2
  end
  object EdJudul: TEdit
    Left = 8
    Top = 62
    Width = 513
    Height = 21
    TabOrder = 3
  end
  object EdPenerbit: TEdit
    Left = 8
    Top = 102
    Width = 297
    Height = 21
    TabOrder = 4
  end
  object EdTempatTerbit: TEdit
    Left = 311
    Top = 102
    Width = 210
    Height = 21
    TabOrder = 5
  end
  object EdTahunTerbit: TEdit
    Left = 8
    Top = 142
    Width = 73
    Height = 21
    TabOrder = 6
  end
  object EdDimensi: TEdit
    Left = 87
    Top = 142
    Width = 98
    Height = 21
    TabOrder = 7
  end
  object EdJumlahHalaman: TEdit
    Left = 191
    Top = 142
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object EdKategori: TEdit
    Left = 318
    Top = 142
    Width = 203
    Height = 21
    TabOrder = 9
  end
  object EdDDC: TEdit
    Left = 8
    Top = 182
    Width = 252
    Height = 21
    TabOrder = 10
  end
  object EdISBN: TEdit
    Left = 266
    Top = 182
    Width = 255
    Height = 21
    TabOrder = 11
  end
  object EdTempatBuku: TEdit
    Left = 8
    Top = 222
    Width = 301
    Height = 21
    TabOrder = 12
  end
  object EdJumlah: TEdit
    Left = 315
    Top = 222
    Width = 100
    Height = 21
    TabOrder = 13
  end
  object EdStok: TEdit
    Left = 421
    Top = 222
    Width = 100
    Height = 21
    TabOrder = 14
  end
  object EdKeterangan: TEdit
    Left = 8
    Top = 262
    Width = 513
    Height = 21
    TabOrder = 15
  end
end

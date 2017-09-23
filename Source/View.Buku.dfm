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
  OnClose = FormClose
  OnCreate = FormCreate
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
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object ViewKode: TcxGridDBColumn
        DataBinding.FieldName = 'Kode'
        Width = 49
      end
      object ViewJudul: TcxGridDBColumn
        DataBinding.FieldName = 'Judul'
        Width = 143
      end
      object ViewPengarang: TcxGridDBColumn
        DataBinding.FieldName = 'Pengarang'
        Width = 143
      end
      object ViewPenerbit: TcxGridDBColumn
        DataBinding.FieldName = 'Penerbit'
        Width = 203
      end
      object ViewTahunTerbit: TcxGridDBColumn
        DataBinding.FieldName = 'TahunTerbit'
        SortIndex = 0
        SortOrder = soAscending
        Width = 132
      end
      object ViewTempatTerbit: TcxGridDBColumn
        DataBinding.FieldName = 'TempatTerbit'
        Visible = False
      end
      object ViewJumlahHalaman: TcxGridDBColumn
        DataBinding.FieldName = 'JumlahHalaman'
        Visible = False
      end
      object ViewDimensi: TcxGridDBColumn
        DataBinding.FieldName = 'Dimensi'
        Visible = False
      end
      object ViewDDC: TcxGridDBColumn
        DataBinding.FieldName = 'DDC'
        Visible = False
      end
      object ViewISBN: TcxGridDBColumn
        DataBinding.FieldName = 'ISBN'
        Visible = False
      end
      object ViewJumlah: TcxGridDBColumn
        DataBinding.FieldName = 'Jumlah'
        Visible = False
      end
      object ViewKategori: TcxGridDBColumn
        DataBinding.FieldName = 'Kategori'
        Visible = False
      end
      object ViewTempat: TcxGridDBColumn
        DataBinding.FieldName = 'Tempat'
        Visible = False
      end
      object ViewKeterangan: TcxGridDBColumn
        DataBinding.FieldName = 'Keterangan'
        Visible = False
      end
      object ViewStok: TcxGridDBColumn
        DataBinding.FieldName = 'Stok'
        Visible = False
      end
    end
    object Level: TcxGridLevel
      GridView = View
    end
  end
  object DSetDaftarBuku: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faReadonly, faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Kode'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Judul'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Pengarang'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Penerbit'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TahunTerbit'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TempatTerbit'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'JumlahHalaman'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Dimensi'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DDC'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ISBN'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Jumlah'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Kategori'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Tempat'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Keterangan'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Stok'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    CreateSelfField = False
    IncludeUnmappedObjects = False
    Left = 40
    Top = 48
    DesignClass = 'uEntities.TBuku'
    object DSetDaftarBukuId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object DSetDaftarBukuKode: TStringField
      FieldName = 'Kode'
      Required = True
      Size = 255
    end
    object DSetDaftarBukuJudul: TStringField
      FieldName = 'Judul'
      Required = True
      Size = 255
    end
    object DSetDaftarBukuPengarang: TStringField
      FieldName = 'Pengarang'
      Required = True
      Size = 255
    end
    object DSetDaftarBukuPenerbit: TStringField
      FieldName = 'Penerbit'
      Required = True
      Size = 255
    end
    object DSetDaftarBukuTahunTerbit: TIntegerField
      FieldName = 'TahunTerbit'
      Required = True
    end
    object DSetDaftarBukuTempatTerbit: TStringField
      FieldName = 'TempatTerbit'
      Required = True
      Size = 255
    end
    object DSetDaftarBukuJumlahHalaman: TIntegerField
      FieldName = 'JumlahHalaman'
      Required = True
    end
    object DSetDaftarBukuDimensi: TStringField
      FieldName = 'Dimensi'
      Size = 255
    end
    object DSetDaftarBukuDDC: TStringField
      FieldName = 'DDC'
      Size = 255
    end
    object DSetDaftarBukuISBN: TStringField
      FieldName = 'ISBN'
      Size = 255
    end
    object DSetDaftarBukuJumlah: TIntegerField
      FieldName = 'Jumlah'
      Required = True
    end
    object DSetDaftarBukuKategori: TStringField
      FieldName = 'Kategori'
      Required = True
      Size = 255
    end
    object DSetDaftarBukuTempat: TStringField
      FieldName = 'Tempat'
      Size = 255
    end
    object DSetDaftarBukuKeterangan: TStringField
      FieldName = 'Keterangan'
      Size = 255
    end
    object DSetDaftarBukuStok: TIntegerField
      FieldName = 'Stok'
      Required = True
    end
  end
  object DsDaftarBuku: TDataSource
    DataSet = DSetDaftarBuku
    Left = 144
    Top = 48
  end
end

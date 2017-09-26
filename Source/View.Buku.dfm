inherited FrmBuku: TFrmBuku
  Caption = 'Daftar Buku'
  ExplicitWidth = 657
  ExplicitHeight = 498
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TcxGrid
    inherited View: TcxGridDBTableView
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
  end
  inherited DSetDaftar: TAureliusDataset
    FieldDefs = <
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
    DesignClass = 'uEntities.TBuku'
    object DSetDaftarId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object DSetDaftarKode: TStringField
      FieldName = 'Kode'
      Required = True
      Size = 255
    end
    object DSetDaftarJudul: TStringField
      FieldName = 'Judul'
      Required = True
      Size = 255
    end
    object DSetDaftarPengarang: TStringField
      FieldName = 'Pengarang'
      Required = True
      Size = 255
    end
    object DSetDaftarPenerbit: TStringField
      FieldName = 'Penerbit'
      Required = True
      Size = 255
    end
    object DSetDaftarTahunTerbit: TIntegerField
      FieldName = 'TahunTerbit'
      Required = True
    end
    object DSetDaftarTempatTerbit: TStringField
      FieldName = 'TempatTerbit'
      Required = True
      Size = 255
    end
    object DSetDaftarJumlahHalaman: TIntegerField
      FieldName = 'JumlahHalaman'
      Required = True
    end
    object DSetDaftarDimensi: TStringField
      FieldName = 'Dimensi'
      Size = 255
    end
    object DSetDaftarDDC: TStringField
      FieldName = 'DDC'
      Size = 255
    end
    object DSetDaftarISBN: TStringField
      FieldName = 'ISBN'
      Size = 255
    end
    object DSetDaftarJumlah: TIntegerField
      FieldName = 'Jumlah'
      Required = True
    end
    object DSetDaftarKategori: TStringField
      FieldName = 'Kategori'
      Required = True
      Size = 255
    end
    object DSetDaftarTempat: TStringField
      FieldName = 'Tempat'
      Size = 255
    end
    object DSetDaftarKeterangan: TStringField
      FieldName = 'Keterangan'
      Size = 255
    end
    object DSetDaftarStok: TIntegerField
      FieldName = 'Stok'
      Required = True
    end
  end
end

inherited FrmAnggota: TFrmAnggota
  Caption = 'Daftar Anggota'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TcxGrid
    inherited View: TcxGridDBTableView
      object ViewKode: TcxGridDBColumn
        DataBinding.FieldName = 'Kode'
        Width = 69
      end
      object ViewNama: TcxGridDBColumn
        DataBinding.FieldName = 'Nama'
        Width = 190
      end
      object ViewJenisKelamin: TcxGridDBColumn
        Caption = 'L/P'
        DataBinding.FieldName = 'JenisKelamin'
        Width = 52
      end
      object ViewKelas: TcxGridDBColumn
        DataBinding.FieldName = 'Kelas'
        Width = 145
      end
      object ViewJurusan: TcxGridDBColumn
        DataBinding.FieldName = 'Jurusan'
        Visible = False
      end
      object ViewAngkatan: TcxGridDBColumn
        DataBinding.FieldName = 'Angkatan'
        Visible = False
        Width = 162
      end
      object ViewAlamat: TcxGridDBColumn
        DataBinding.FieldName = 'Alamat'
        Width = 202
      end
      object ViewTelepon: TcxGridDBColumn
        DataBinding.FieldName = 'Telepon'
        Visible = False
      end
      object ViewKeterangan: TcxGridDBColumn
        DataBinding.FieldName = 'Keterangan'
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
        Name = 'Nama'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'JenisKelamin'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Kelas'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Jurusan'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Angkatan'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Alamat'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Telepon'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Keterangan'
        DataType = ftString
        Size = 255
      end>
    DesignClass = 'uEntities.TAnggota'
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
    object DSetDaftarNama: TStringField
      FieldName = 'Nama'
      Required = True
      Size = 255
    end
    object DSetDaftarJenisKelamin: TIntegerField
      FieldName = 'JenisKelamin'
      Required = True
    end
    object DSetDaftarKelas: TStringField
      FieldName = 'Kelas'
      Size = 255
    end
    object DSetDaftarJurusan: TStringField
      FieldName = 'Jurusan'
      Size = 255
    end
    object DSetDaftarAngkatan: TIntegerField
      FieldName = 'Angkatan'
      Required = True
    end
    object DSetDaftarAlamat: TStringField
      FieldName = 'Alamat'
      Size = 255
    end
    object DSetDaftarTelepon: TStringField
      FieldName = 'Telepon'
      Size = 255
    end
    object DSetDaftarKeterangan: TStringField
      FieldName = 'Keterangan'
      Size = 255
    end
  end
end

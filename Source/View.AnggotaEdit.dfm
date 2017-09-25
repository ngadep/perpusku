object FrmAnggotaEdit: TFrmAnggotaEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Anggota Baru'
  ClientHeight = 254
  ClientWidth = 457
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
    Width = 48
    Height = 13
    Caption = 'Kode/ NIS'
  end
  object Label2: TLabel
    Left = 111
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Nama'
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 63
    Height = 13
    Caption = 'Jenis Kelamin'
  end
  object Label4: TLabel
    Left = 111
    Top = 49
    Width = 25
    Height = 13
    Caption = 'Kelas'
  end
  object Label5: TLabel
    Left = 262
    Top = 49
    Width = 46
    Height = 13
    Caption = 'Angkatan'
  end
  object Label6: TLabel
    Left = 8
    Top = 89
    Width = 38
    Height = 13
    Caption = 'Jurusan'
  end
  object Label7: TLabel
    Left = 262
    Top = 89
    Width = 38
    Height = 13
    Caption = 'Telepon'
  end
  object Label8: TLabel
    Left = 8
    Top = 129
    Width = 33
    Height = 13
    Caption = 'Alamat'
  end
  object Label9: TLabel
    Left = 8
    Top = 169
    Width = 109
    Height = 13
    Caption = 'Keterangan Tambahan'
  end
  object PnlBawah: TPanel
    Left = 0
    Top = 217
    Width = 457
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 9
    ExplicitTop = 171
    DesignSize = (
      457
      37)
    object BtnOk: TButton
      Left = 289
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnCancel: TButton
      Left = 376
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object EdKode: TEdit
    Left = 8
    Top = 22
    Width = 97
    Height = 21
    TabOrder = 0
  end
  object EdNama: TEdit
    Left = 111
    Top = 22
    Width = 338
    Height = 21
    TabOrder = 1
  end
  object EdKelas: TEdit
    Left = 111
    Top = 62
    Width = 145
    Height = 21
    TabOrder = 3
  end
  object EdAngkatan: TEdit
    Left = 262
    Top = 62
    Width = 187
    Height = 21
    TabOrder = 4
  end
  object EdJurusan: TEdit
    Left = 8
    Top = 102
    Width = 248
    Height = 21
    TabOrder = 5
  end
  object EdTelepon: TEdit
    Left = 262
    Top = 102
    Width = 187
    Height = 21
    TabOrder = 6
  end
  object EdAlamat: TEdit
    Left = 8
    Top = 142
    Width = 441
    Height = 21
    TabOrder = 7
  end
  object EdKeterangan: TEdit
    Left = 8
    Top = 182
    Width = 441
    Height = 21
    TabOrder = 8
  end
  object CbJenisKelamin: TComboBox
    Left = 8
    Top = 62
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 2
    Text = 'Laki-laki'
    Items.Strings = (
      'Laki-laki'
      'Perempuan')
  end
end

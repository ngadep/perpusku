object FrmUtama: TFrmUtama
  Left = 0
  Top = 0
  Caption = 'Aplikasi Perpusku'
  ClientHeight = 467
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MmUtama
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object PcUtama: TPageControl
    Left = 0
    Top = 0
    Width = 730
    Height = 467
    Align = alClient
    TabOrder = 0
  end
  object MmUtama: TMainMenu
    Left = 80
    Top = 8
    object T1: TMenuItem
      Caption = 'Transaksi'
      object Peminjaman1: TMenuItem
        Action = ActPeminjaman
      end
      object Pengembalian1: TMenuItem
        Action = ActPengembalian
      end
    end
    object M1: TMenuItem
      Caption = 'Master'
      object DaftarBuku1: TMenuItem
        Action = ActDaftarBuku
      end
      object DaftarAnggota1: TMenuItem
        Action = ActDaftarAnggota
      end
    end
  end
  object AlUtama: TActionList
    Left = 16
    Top = 8
    object ActDaftarBuku: TAction
      Caption = 'Daftar Buku'
      OnExecute = ActDaftarBukuExecute
    end
    object ActDaftarAnggota: TAction
      Caption = 'Daftar Anggota'
      OnExecute = ActDaftarAnggotaExecute
    end
    object ActPeminjaman: TAction
      Caption = 'Peminjaman'
      OnExecute = ActPeminjamanExecute
    end
    object ActPengembalian: TAction
      Caption = 'Pengembalian'
      OnExecute = ActPengembalianExecute
    end
  end
end

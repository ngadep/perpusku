program Perpusku;

uses
  Vcl.Forms,
  View.Utama in 'View.Utama.pas' {FrmUtama},
  uDm in 'uDm.pas' {Dm: TDataModule},
  uEntities in 'uEntities.pas',
  View.Buku in 'View.Buku.pas' {FrmBuku},
  View.BukuEdit in 'View.BukuEdit.pas' {FrmBukuEdit},
  View.Anggota in 'View.Anggota.pas' {FrmAnggota},
  View.AnggotaEdit in 'View.AnggotaEdit.pas' {FrmAnggotaEdit},
  View.Peminjaman in 'View.Peminjaman.pas' {FrmPeminjaman},
  View.Pengembalian in 'View.Pengembalian.pas' {FrmPengembalian},
  View.Pengaturan in 'View.Pengaturan.pas' {FrmPengaturan};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TFrmUtama, FrmUtama);
  Application.Run;
end.

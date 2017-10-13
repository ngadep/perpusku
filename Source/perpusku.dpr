program Perpusku;

uses
  Vcl.Forms,
  {$IFDEF DEBUG}
  SqlMonitor in 'SqlMonitor.pas' {SqlMonitorForm},
  {$ENDIF}
  View.Utama in 'View.Utama.pas' {FrmUtama},
  uDm in 'uDm.pas' {Dm: TDataModule},
  uEntities in 'uEntities.pas',
  View.Buku in 'View.Buku.pas' {FrmBuku},
  View.BukuEdit in 'View.BukuEdit.pas' {FrmBukuEdit},
  View.Anggota in 'View.Anggota.pas' {FrmAnggota},
  View.AnggotaEdit in 'View.AnggotaEdit.pas' {FrmAnggotaEdit},
  View.Peminjaman in 'View.Peminjaman.pas' {FrmPeminjaman},
  View.Pengembalian in 'View.Pengembalian.pas' {FrmPengembalian},
  View.Pengaturan in 'View.Pengaturan.pas' {FrmPengaturan},
  View.DaftarBase in 'View.DaftarBase.pas' {FrmDaftarBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TFrmUtama, FrmUtama);
  Application.Run;
end.

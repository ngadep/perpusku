unit View.Utama;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls;

type
  TFrmUtama = class(TForm)
    MmUtama: TMainMenu;
    AlUtama: TActionList;
    ActDaftarBuku: TAction;
    M1: TMenuItem;
    DaftarBuku1: TMenuItem;
    PcUtama: TPageControl;
    ActDaftarAnggota: TAction;
    DaftarAnggota1: TMenuItem;
    ActPeminjaman: TAction;
    T1: TMenuItem;
    Peminjaman1: TMenuItem;
    ActPengembalian: TAction;
    Pengembalian1: TMenuItem;
    procedure ActDaftarBukuExecute(Sender: TObject);
    procedure ActDaftarAnggotaExecute(Sender: TObject);
    procedure ActPeminjamanExecute(Sender: TObject);
    procedure ActPengembalianExecute(Sender: TObject);
  private
    procedure AddFormToPage(AForm: TForm);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUtama: TFrmUtama;

implementation

{$R *.dfm}

uses View.Buku, View.Anggota, View.Peminjaman, View.Pengembalian;

procedure TFrmUtama.ActDaftarAnggotaExecute(Sender: TObject);
var
  LForm: TFrmAnggota;
begin
  LForm := TFrmAnggota.Create(Application);
  AddFormToPage(LForm);
end;

procedure TFrmUtama.ActDaftarBukuExecute(Sender: TObject);
var
  LForm: TFrmBuku;
begin
  LForm := TFrmBuku.Create(Application);
  AddFormToPage(LForm);
end;

procedure TFrmUtama.ActPeminjamanExecute(Sender: TObject);
var
  LForm: TFrmPeminjaman;
begin
  LForm := TFrmPeminjaman.Create(Application);
  AddFormToPage(LForm);
end;

procedure TFrmUtama.ActPengembalianExecute(Sender: TObject);
var
  LForm: TFrmPengembalian;
begin
  LForm := TFrmPengembalian.Create(Application);
  AddFormToPage(LForm);
end;

procedure TFrmUtama.AddFormToPage(AForm: TForm);
var
  LTab : TTabSheet;
begin
  LTab := TTabSheet.Create(PcUtama);
  LTab.Caption := AForm.Caption;
  LTab.PageControl := PcUtama;
  PcUtama.ActivePage := LTab;

  AForm.Parent := LTab;
  AForm.Align := alClient;
  AForm.BorderStyle := bsNone;
  AForm.Show;
end;

end.

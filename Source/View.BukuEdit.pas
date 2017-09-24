unit View.BukuEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  uEntities;

type
  TFrmBukuEdit = class(TForm)
    BtnOk: TButton;
    BtnCancel: TButton;
    PnlBawah: TPanel;
    Label1: TLabel;
    EdKode: TEdit;
    EdPengarang: TEdit;
    Label2: TLabel;
    EdJudul: TEdit;
    Label3: TLabel;
    EdPenerbit: TEdit;
    Label4: TLabel;
    EdTempatTerbit: TEdit;
    Label5: TLabel;
    EdTahunTerbit: TEdit;
    Label6: TLabel;
    EdDimensi: TEdit;
    Label7: TLabel;
    EdJumlahHalaman: TEdit;
    Label8: TLabel;
    EdKategori: TEdit;
    Label9: TLabel;
    EdDDC: TEdit;
    Label10: TLabel;
    EdISBN: TEdit;
    Label11: TLabel;
    EdTempatBuku: TEdit;
    Label12: TLabel;
    EdJumlah: TEdit;
    Label13: TLabel;
    EdStok: TEdit;
    Label14: TLabel;
    EdKeterangan: TEdit;
    Label15: TLabel;
    procedure BtnOkClick(Sender: TObject);
  private
    FBuku: TBuku;
    { Private declarations }
  public
    procedure BukuBaru;
    procedure EditBuku(ABuku: TBuku);
    property Buku: TBuku read FBuku;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrmBukuEdit }

procedure TFrmBukuEdit.BtnOkClick(Sender: TObject);
begin
  FBuku.Kode := EdKode.Text;
  FBuku.Pengarang := EdPengarang.Text;
  FBuku.Judul := EdJudul.Text;
  FBuku.Penerbit := EdPenerbit.Text;
  FBUku.TempatTerbit := EdTempatTerbit.Text;
  FBuku.TahunTerbit := StrToInt(EdTahunTerbit.Text);
  FBuku.Dimensi := EdDimensi.Text;
  FBuku.JumlahHalaman := StrToInt(EdJumlahHalaman.Text);
  FBuku.Kategori := EdKategori.Text;
  FBuku.DDC := EdDDC.Text;
  FBuku.ISBN := EdISBN.Text;
  FBuku.Tempat := EdTempatBuku.Text;
  FBuku.Jumlah := StrToInt(EdJumlah.Text);
  FBuku.Stok := StrToInt(EdStok.Text);
  FBuku.Keterangan := EdKeterangan.Text;
end;

procedure TFrmBukuEdit.BukuBaru;
begin
  Caption := 'Buku Baru';
  FBuku:= TBuku.Create;
end;

procedure TFrmBukuEdit.EditBuku(ABuku: TBuku);
begin
  Caption := 'Edit Buku';
  FBuku := ABuku;

  EdKode.Text := FBuku.Kode;
  EdPengarang.Text := FBuku.Pengarang;
  EdJudul.Text := FBuku.Judul;
  EdPenerbit.Text := FBuku.Penerbit;
  EdTempatTerbit.Text := FBUku.TempatTerbit;
  EdTahunTerbit.Text := IntToStr(FBuku.TahunTerbit);
  EdDimensi.Text := FBuku.Dimensi;
  EdJumlahHalaman.Text := IntToStr(FBuku.JumlahHalaman);
  EdKategori.Text := FBuku.Kategori;
  EdDDC.Text := FBuku.DDC;
  EdISBN.Text := FBuku.ISBN;
  EdTempatBuku.Text := FBuku.Tempat;
  EdJumlah.Text := IntToStr(FBuku.Jumlah);
  EdStok.Text := IntToStr(FBuku.Stok);
  EdKeterangan.Text := FBuku.Keterangan;
end;

end.

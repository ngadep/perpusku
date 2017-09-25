unit View.AnggotaEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uEntities;

type
  TFrmAnggotaEdit = class(TForm)
    BtnOk: TButton;
    BtnCancel: TButton;
    PnlBawah: TPanel;
    Label1: TLabel;
    EdKode: TEdit;
    Label2: TLabel;
    EdNama: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdKelas: TEdit;
    Label5: TLabel;
    EdAngkatan: TEdit;
    Label6: TLabel;
    EdJurusan: TEdit;
    Label7: TLabel;
    EdTelepon: TEdit;
    Label8: TLabel;
    EdAlamat: TEdit;
    Label9: TLabel;
    EdKeterangan: TEdit;
    CbJenisKelamin: TComboBox;
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
    FAnggota: TAnggota;
  public
    { Public declarations }
    procedure AnggotaBaru;
    procedure EditAnggota(AAnggota: TAnggota);
    property Anggota: TAnggota read FAnggota;
  end;

var
  FrmAnggotaEdit: TFrmAnggotaEdit;

implementation

{$R *.dfm}

{ TFrmAnggotaEdit }

procedure TFrmAnggotaEdit.AnggotaBaru;
begin
  Caption := 'Anggota Baru';
  FAnggota:= TAnggota.Create;
end;

procedure TFrmAnggotaEdit.BtnOkClick(Sender: TObject);
begin
  FAnggota.Kode := EdKode.Text;
  FAnggota.Nama := EdNama.Text;
  FAnggota.JenisKelamin := Tsex(CbJenisKelamin.ItemIndex);
  FAnggota.Kelas := EdKelas.Text;
  FAnggota.Angkatan := StrToInt(EdAngkatan.Text);
  FAnggota.Jurusan := EdJurusan.Text;
  FAnggota.Telepon := EdTelepon.Text;
  FAnggota.Alamat := EdAlamat.Text;
  FAnggota.Keterangan := EdKeterangan.Text;
end;

procedure TFrmAnggotaEdit.EditAnggota(AAnggota: TAnggota);
begin
  Caption := 'Edit Anggota';
  FAnggota := AAnggota;

  EdKode.Text := FAnggota.Kode;
  EdNama.Text := FAnggota.Nama;
  CbJenisKelamin.ItemIndex := Ord(FAnggota.JenisKelamin);
  EdKelas.Text := FAnggota.Kelas;
  EdAngkatan.Text := IntToStr(FAnggota.Angkatan);
  EdJurusan.Text := FAnggota.Jurusan;
  EdTelepon.Text := FAnggota.Telepon;
  EdAlamat.Text := FAnggota.Alamat;
  EdKeterangan.Text := FAnggota.Keterangan;
end;

end.

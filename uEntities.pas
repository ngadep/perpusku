unit uEntities;

interface

uses
  Aurelius.Mapping.Attributes,
  Aurelius.Types.Nullable,
  System.DateUtils;

type
  [Enumeration(TEnumMappingType.emChar, 'L,P')]
  TSex = (tsMale, tsFemale);

  [Entity, AutoMapping]
  [UniqueKey('Kode')]
  TPengguna = class
  strict private
    FId: Integer;
    FKode: string;
    FNama: string;
    FSandi: string;
  public
    property Id: Integer read FId write FId;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
    property Sandi: string read FSandi write FSandi;
  end;

  [Entity, AutoMapping]
  [UniqueKey('Kode')]
  TBuku = class
  strict private
    FId: Integer;
    FKode: string;
    FJudul: string;
    FPengarang: string;
    FPenerbit: string;
    FTahunTerbit: Integer;
    FTempatTerbit: string;
    FJumlahHalaman: Integer;
    FDimensi: Nullable<string>;
    FDDC: Nullable<string>;
    FISBN: Nullable<string>;
    FJumlah: Integer;
    FKategori: string;
    FTempat: Nullable<string>;
    FKeterangan: Nullable<string>;
    FStok: Integer;
  public
    property Id: Integer read FId write FId;
    property Kode: string read FKode write FKode;
    property Judul: string read FJudul write FJudul;
    property Pengarang: string read FPengarang write FPengarang;
    property Penerbit: string read FPenerbit write FPenerbit;
    property TahunTerbit: Integer read FTahunTerbit write FTahunTerbit;
    property TempatTerbit: string read FTempatTerbit write FTempatTerbit;
    property JumlahHalaman: Integer read FJumlahHalaman write FJumlahHalaman;
    property Dimensi: Nullable<string> read FDimensi write FDimensi;
    property DDC: Nullable<string> read FDDC write FDDC;
    property ISBN: Nullable<string> read FISBN write FISBN;
    property Jumlah: Integer read FJumlah write FJumlah;
    property Kategori: string read FKategori write FKategori;
    property Tempat: Nullable<string> read FTempat write FTempat;
    property Keterangan: Nullable<string> read FKeterangan write FKeterangan;
    property Stok: Integer read FStok write FStok;
  end;

  [Entity, AutoMapping]
  [UniqueKey('Kode')]
  TAnggota = class
  strict private
    FId: Integer;
    FKode: string;
    FNama: string;
    FJenisKelamin: TSex;
    FKelas: Nullable<string>;
    FJurusan: Nullable<string>;
    FAngkatan: Integer;
    FAlamat: Nullable<string>;
    FTelepon: Nullable<string>;
    FKeterangan: Nullable<string>;
  public
    property Id: Integer read FId write FId;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
    property JenisKelamin: TSex read FJenisKelamin write FJenisKelamin;
    property Kelas: Nullable<string> read FKelas write FKelas;
    property Jurusan: Nullable<string> read FJurusan write FJurusan;
    property Angkatan: Integer read FAngkatan write FAngkatan;
    property Alamat: Nullable<string> read FAlamat write FAlamat;
    property Telepon: Nullable<string> read FTelepon write FTelepon;
    property Keterangan: Nullable<string> read FKeterangan write FKeterangan;
  end;

  [Entity, AutoMapping]
  TPinjam = class
  strict private
    FId: Integer;
    FAnggota: TAnggota;
    FBuku: TBuku;
    FTanggalPinjam: TDateTime;
    FTempo: Integer;
    FTanggalKembali: Nullable<TDateTime>;
    FDendaPerHari: Currency;
  private
    function GetJatuhTempo: TDate;
    function GetDenda: Currency;
  public
    constructor Create(AAnggota: TAnggota; ABuku: TBuku; ATanggalPinjam: TDateTime;
      ATempo: Integer; ADendaPerHari: Currency);
    property Id: Integer read FId write FId;
    property Anggota: TAnggota read FAnggota write FAnggota;
    property Buku: TBuku read FBuku write FBuku;
    property TanggalPinjam: TDateTime read FTanggalPinjam write FTanggalPinjam;
    property Tempo: Integer read FTempo write FTempo;
    property JatuhTempo: TDate read GetJatuhTempo;
    property TanggalKembali: Nullable<TDateTime> read FTanggalKembali write FTanggalKembali;
    property DendaPerHari: Currency read FDendaPerHari write FDendaPerHari;
    property Denda: Currency read GetDenda;
  end;

implementation

{ TPinjam }

constructor TPinjam.Create(AAnggota: TAnggota; ABuku: TBuku;
  ATanggalPinjam: TDateTime; ATempo: Integer; ADendaPerHari: Currency);
begin
  FAnggota := AAnggota;
  FBuku := ABuku;
  FTanggalPinjam:= ATanggalPinjam;
  FTempo := ATempo;
  FDendaPerHari := ADendaPerHari;
end;

function TPinjam.GetDenda: Currency;
var
  LTerlambat: Integer;
begin
  Result := 0;

  LTerlambat := DaysBetween(JatuhTempo, TDate(TanggalKembali));

  if LTerlambat > 0 then
    Result := LTerlambat * DendaPerHari;
end;

function TPinjam.GetJatuhTempo: TDate;
begin
  result:= IncDay(TanggalPinjam, Tempo);
end;

initialization
  RegisterEntity(TPengguna);
  RegisterEntity(TBuku);
  RegisterEntity(TAnggota);
  RegisterEntity(TPinjam);

end.

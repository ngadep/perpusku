unit uEntities;

interface

uses
  Aurelius.Mapping.Attributes,
  Aurelius.Types.Nullable,
  Aurelius.Types.Proxy,
  System.SysUtils,
  System.DateUtils;

type
  [Enumeration(TEnumMappingType.emChar, 'L,P')]
  TSex = (tsMale, tsFemale);

  [Enumeration(TEnumMappingType.emInteger)]
  TInOut = (tsIn, tsOut);

  [Entity, AutoMapping]
  [Id('FId', TIdGenerator.None)]
  TSetting = class
  strict private
    FId: Integer;
    FKeterangan: String;
    FNilai: String;
  public
    property Id: Integer read FId write FId;
    property Keterangan: String read FKeterangan write FKeterangan;
    property Nilai: String read FNilai write FNilai;
  end;

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
    FMaxPinjam: Integer;
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
    property MaxPinjam: Integer read FMaxPinjam write FMaxPinjam;
    property Keterangan: Nullable<string> read FKeterangan write FKeterangan;
  end;

  [Entity, AutoMapping]
  TTransaksi = class
  strict private
    FId: Integer;
    FAnggota: TAnggota;
    FTanggal: TDateTime;
    FJenis: TInOut;
  public
    constructor Create(AAnggota: TAnggota; ATanggal: TDateTime; AJenis: TInOut);
    property Id: Integer read FId write FId;
    property Anggota: TAnggota read FAnggota write FAnggota;
    property Tanggal: TDateTime read FTanggal write FTanggal;
    property Jenis: TInOut read FJenis write FJenis;
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
    FDendaPerHari: Integer;
    [Association([TAssociationProp.Lazy], [])]
    FtransaksiIn: Proxy<TTransaksi>;
    [Association([TAssociationProp.Lazy], [])]
    FTransaksiOut: Proxy<TTransaksi>;
  private
    function DateTimeToDate(ADateTime: TDateTime): TDate;
    function GetJatuhTempo: TDate;
    function GetDenda: Integer;
    function GetTransaksiIn: TTransaksi;
    function GetTransaksiOut: TTransaksi;
    procedure SetTransaksiIn(const Value: TTransaksi);
    procedure SetTransaksiOut(const Value: TTransaksi);
  public
    constructor Create(AId: Integer; ATanggalPinjam: TDateTime;
      ATempo: Integer; ATanggalKembali: Nullable<TDateTime>; ADendaPerHari: Integer); overload;
    constructor Create(AAnggota: TAnggota; ABuku: TBuku; ATanggalPinjam: TDateTime;
      ATempo: Integer; ADendaPerHari: Integer); overload;
    procedure StockOut(AQty: Integer = 1);
    property Id: Integer read FId write FId;
    property Anggota: TAnggota read FAnggota;
    property Buku: TBuku read FBuku;
    property TanggalPinjam: TDateTime read FTanggalPinjam write FTanggalPinjam;
    property Tempo: Integer read FTempo write FTempo;
    property JatuhTempo: TDate read GetJatuhTempo;
    property TanggalKembali: Nullable<TDateTime> read FTanggalKembali write FTanggalKembali;
    property DendaPerHari: Integer read FDendaPerHari write FDendaPerHari;
    property Denda: Integer read GetDenda;
    property TransaksiIn: TTransaksi read GetTransaksiIn write SetTransaksiIn;
    property TransaksiOut: TTransaksi read GetTransaksiOut write SetTransaksiOut;
  end;

implementation

{ TPinjam }

constructor TPinjam.Create(AAnggota: TAnggota; ABuku: TBuku;
  ATanggalPinjam: TDateTime; ATempo: Integer; ADendaPerHari: Integer);
begin
  FAnggota := AAnggota;
  FBuku := ABuku;
  FTanggalPinjam:= ATanggalPinjam;
  FTempo := ATempo;
  FDendaPerHari := ADendaPerHari;
end;

constructor TPinjam.Create(AId: Integer; ATanggalPinjam: TDateTime;
  ATempo: Integer; ATanggalKembali: Nullable<TDateTime>;
  ADendaPerHari: Integer);
begin
  FId := AId;
  FTanggalPinjam:= ATanggalPinjam;
  FTempo := ATempo;
  FTanggalKembali := ATanggalKembali;
  FDendaPerHari := ADendaPerHari;
end;

function TPinjam.DateTimeToDate(ADateTime: TDateTime): TDate;
var
  LYear, LMonth, LDay: Word;
begin
  DecodeDate(ADateTime, LYear, LMonth, LDay);
  Result := EncodeDate(LYear, LMonth, LDay);
end;

function TPinjam.GetDenda: Integer;
var
  LTerlambat: Integer;
begin
  Result := 0;

  if TanggalKembali.IsNull then
    Exit;

  LTerlambat := DaysBetween(JatuhTempo, DateTimeToDate(TanggalKembali));

  if LTerlambat > 0 then
    Result := LTerlambat * DendaPerHari;
end;

function TPinjam.GetJatuhTempo: TDate;
begin
  result:= IncDay(DateTimeToDate(TanggalPinjam), Tempo);
end;

function TPinjam.GetTransaksiIn: TTransaksi;
begin
  Result := FTransaksiIn.Value;
end;

function TPinjam.GetTransaksiOut: TTransaksi;
begin
  Result := FTransaksiOut.Value;
end;

procedure TPinjam.SetTransaksiIn(const Value: TTransaksi);
begin
  FTransaksiIn.Value := Value;
end;

procedure TPinjam.SetTransaksiOut(const Value: TTransaksi);
begin
  FTransaksiOut.Value := Value;
end;

procedure TPinjam.StockOut(AQty: Integer);
begin
  Buku.Stok := Buku.Stok - AQty;
end;

{ TTransaksi }

constructor TTransaksi.Create(AAnggota: TAnggota; ATanggal: TDateTime;
  AJenis: TInOut);
begin
  FAnggota := AAnggota;
  FTanggal := ATanggal;
  FJenis := AJenis;
end;

initialization
  RegisterEntity(TSetting);
  RegisterEntity(TPengguna);
  RegisterEntity(TBuku);
  RegisterEntity(TAnggota);
  RegisterEntity(TPinjam);

end.

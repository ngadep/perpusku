unit View.Peminjaman;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridLevel, cxGrid,
  Vcl.StdCtrls,
  Generics.Collections,
  uEntities,
  Aurelius.Engine.ObjectManager,
  Aurelius.Criteria.Linq,
  Aurelius.Drivers.Interfaces,
  cxCalendar;

const
  IndexOfNo = 0;
  IndexOfKode = 1;
  IndexOfJudul = 2;
  IndexOfDurasi = 3;
  IndexOfPinjam = 4;
  IndexOfKembali = 5;

type
  TPinjamDataSource = class(TcxCustomDataSource)
  private
    FPinjams: TList<TPinjam>;
  protected
    procedure DeleteRecord(ARecordHandle: TcxDataRecordHandle); override;
    function GetRecordCount: Integer; override;
    function GetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle): Variant; override;
  public
    constructor Create(APinjams: TList<TPinjam>);
  end;

  TFrmPeminjaman = class(TForm)
    PnlAtas: TPanel;
    PnlBawah: TPanel;
    Level: TcxGridLevel;
    Grid: TcxGrid;
    Table: TcxGridTableView;
    TcNo: TcxGridColumn;
    TcKode: TcxGridColumn;
    TcJudul: TcxGridColumn;
    TcTempo: TcxGridColumn;
    TcTanggalPinjam: TcxGridColumn;
    TcTanggalKembali: TcxGridColumn;
    EdKode: TEdit;
    Label1: TLabel;
    BtnSimpan: TButton;
    BtnKeluar: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LbKode: TLabel;
    LbNama: TLabel;
    LbKelas: TLabel;
    LbMaxPinjam: TLabel;
    EdBuku: TEdit;
    BtnBaru: TButton;
    Label6: TLabel;
    LbTempo: TLabel;
    Label10: TLabel;
    LbDenda: TLabel;
    procedure EdKodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BtnKeluarClick(Sender: TObject);
    procedure EdBukuKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSimpanClick(Sender: TObject);
    procedure BtnBaruClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TableDataControllerDataChanged(Sender: TObject);
  private
    FManager : TObjectManager;
    FAnggota: TAnggota;
    FPinjams: TList<TPinjam>;
    FTempo: Integer;
    FDenda: Integer;
    FPinjamDataSource: TPinjamDataSource;
    procedure LoadTempoDanDenda;
    procedure TransaksiBaru;
    procedure ClearAnggota;
    procedure ClearBuku;
    procedure LoadAnggota(AAnggota: TAnggota);
    procedure TambahBuku(ABuku: TBuku);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPeminjaman: TFrmPeminjaman;

implementation

{$R *.dfm}

uses uDm;

{ TPinjamDataSource }

constructor TPinjamDataSource.Create(APinjams: TList<TPinjam>);
begin
  inherited Create;
  FPinjams := APinjams;
end;

procedure TPinjamDataSource.DeleteRecord(ARecordHandle: TcxDataRecordHandle);
begin
  FPinjams.Delete(Integer(ARecordHandle));
  DataChanged;
end;

function TPinjamDataSource.GetRecordCount: Integer;
begin
  Result := FPinjams.Count;
end;

function TPinjamDataSource.GetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle): Variant;
var
  LColumnId: Integer;
  LPinjam: TPinjam;
begin
  LPinjam := FPinjams.items[Integer(ARecordHandle)];
  LColumnId := GetDefaultItemID(Integer(AItemHandle));
  case LColumnId of
    IndexOfNo:
      Result := Integer(ARecordHandle) + 1;
    IndexOfKode:
      Result := LPinjam.Buku.Kode;
    IndexOfJudul:
      Result := LPinjam.Buku.Judul;
    IndexOfDurasi:
      Result := IntToStr(LPinjam.Tempo) + ' Hari';
    IndexOfPinjam:
      Result := LPinjam.TanggalPinjam;
    IndexOfKembali:
      Result := LPinjam.JatuhTempo;
  end;
end;

{ TFrmPeminjaman }

procedure TFrmPeminjaman.BtnBaruClick(Sender: TObject);
begin
  TransaksiBaru;
end;

procedure TFrmPeminjaman.BtnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPeminjaman.BtnSimpanClick(Sender: TObject);
var
  LTransaksi: TTransaksi;
  LPinjam: TPinjam;
  Transaction: IDBTransaction;
begin
  LTransaksi := TTransaksi.Create(FAnggota, Now, TInOut.tsIn);

  Transaction := FManager.Connection.BeginTransaction;
  try
    FManager.Save(LTransaksi);

    for LPinjam in FPinjams do
    begin
      LPinjam.StockOut;
      FManager.Update(LPinjam.Buku);

      LPinjam.TransaksiIn := LTransaksi;
      FManager.Save(LPinjam);
    end;
    FManager.Flush;
    Transaction.Commit;
    ShowMessage('Transaksi Peminjaman Berhasil Disimpan...');
    TransaksiBaru;
  except
    Transaction.Rollback;
    raise;
  end;
end;

procedure TFrmPeminjaman.ClearAnggota;
begin
  ClearBuku;
  EdKode.Enabled := True;
  EdKode.Clear;
  EdKode.SetFocus;
  LbKode.Caption := '';
  LbNama.Caption := '';
  LbKelas.Caption := '';
  LbMaxPinjam.Caption := '';
end;

procedure TFrmPeminjaman.ClearBuku;
begin
  EdBuku.Clear;
  EdBuku.Enabled := False;
  FPinjams.Clear;
  FPinjamDataSource.DataChanged;
end;

procedure TFrmPeminjaman.EdBukuKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  LBuku: TBuku;
begin
  if Key = VK_RETURN then
  begin
    LBuku := FManager.Find<TBuku>
      .Where(Linq['KODE'] = EdBuku.Text)
      .UniqueResult;

    EdBuku.Clear;
    if Assigned(LBuku) then
    begin
      TambahBuku(LBuku);
    end else
    begin
      raise Exception.Create('Buku Tidak Ditemukan');
    end;
  end;
end;

procedure TFrmPeminjaman.EdKodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    FAnggota := FManager.Find<TAnggota>
      .Where(Linq['KODE'] = EdKode.Text)
      .UniqueResult;

    if Assigned(FAnggota) then
    begin
      LoadAnggota(FAnggota);
    end else
    begin
      ClearAnggota;
      raise Exception.Create('Data Siswa Tidak Ditemukan');
    end;
  end;
end;

procedure TFrmPeminjaman.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FPinjamDataSource.Free;
  FPinjams.Free;
  FManager.Free;
  Parent.Free;
end;

procedure TFrmPeminjaman.FormCreate(Sender: TObject);
begin
  FManager := TObjectManager.Create(Dm.Connection);
  FPinjams := TList<TPinjam>.Create;
  FPinjamDataSource := TPinjamDataSource.Create(FPinjams);
  Table.DataController.CustomDataSource := FPinjamDataSource;
end;

procedure TFrmPeminjaman.FormShow(Sender: TObject);
begin
  TransaksiBaru;
end;

procedure TFrmPeminjaman.LoadAnggota(AAnggota: TAnggota);
begin
  LbKode.Caption := AAnggota.Kode;
  LbNama.Caption := AAnggota.Nama;
  LbKelas.Caption := AAnggota.Kelas.ValueOrDefault;
  LbMaxPinjam.Caption := IntToStr(AAnggota.MaxPinjam);

  EdBuku.Enabled := True;
  EdBuku.SetFocus;
  EdKode.Enabled := False;
  EdKode.Clear;
end;

procedure TFrmPeminjaman.LoadTempoDanDenda;
begin
  // sementara FTEmpo dan FDenda manual nanti load dari database.
  FTempo := 7;
  FDenda := 1000;

  LbTempo.Caption := IntToStr(FTempo) + ' Hari';
  LbDenda.Caption := 'Rp. ' + IntToStr(FDenda);
end;

procedure TFrmPeminjaman.TableDataControllerDataChanged(Sender: TObject);
begin
  if Table.DataController.RecordCount > 0 then
    BtnSimpan.Enabled := True
  else
    BtnSimpan.Enabled := False;
end;

procedure TFrmPeminjaman.TambahBuku(ABuku: TBuku);
var
  LPinjam: TPinjam;
begin
  LPinjam := TPinjam.Create(FAnggota, ABuku, Now, FTempo, FDenda);
  FPinjams.Add(LPinjam);
  FPinjamDataSource.DataChanged;
end;

procedure TFrmPeminjaman.TransaksiBaru;
begin
  LoadTempoDanDenda;
  ClearAnggota;
  BtnSimpan.Enabled := False;
end;

end.

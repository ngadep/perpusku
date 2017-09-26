unit View.Buku;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.DaftarBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Aurelius.Bind.Dataset, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.StdCtrls, Vcl.ExtCtrls, uEntities;

type
  TFrmBuku = class(TFrmDaftarBase)
    DSetDaftarId: TIntegerField;
    DSetDaftarKode: TStringField;
    DSetDaftarJudul: TStringField;
    DSetDaftarPengarang: TStringField;
    DSetDaftarPenerbit: TStringField;
    DSetDaftarTahunTerbit: TIntegerField;
    DSetDaftarTempatTerbit: TStringField;
    DSetDaftarJumlahHalaman: TIntegerField;
    DSetDaftarDimensi: TStringField;
    DSetDaftarDDC: TStringField;
    DSetDaftarISBN: TStringField;
    DSetDaftarJumlah: TIntegerField;
    DSetDaftarKategori: TStringField;
    DSetDaftarTempat: TStringField;
    DSetDaftarKeterangan: TStringField;
    DSetDaftarStok: TIntegerField;
    ViewKode: TcxGridDBColumn;
    ViewJudul: TcxGridDBColumn;
    ViewPengarang: TcxGridDBColumn;
    ViewPenerbit: TcxGridDBColumn;
    ViewTahunTerbit: TcxGridDBColumn;
    ViewTempatTerbit: TcxGridDBColumn;
    ViewJumlahHalaman: TcxGridDBColumn;
    ViewDimensi: TcxGridDBColumn;
    ViewDDC: TcxGridDBColumn;
    ViewISBN: TcxGridDBColumn;
    ViewJumlah: TcxGridDBColumn;
    ViewKategori: TcxGridDBColumn;
    ViewTempat: TcxGridDBColumn;
    ViewKeterangan: TcxGridDBColumn;
    ViewStok: TcxGridDBColumn;
  private
    { Private declarations }
  protected
    procedure Segarkan; override;
    procedure TambahData; override;
    procedure EditDataTerpilih; override;
    procedure HapusDataTerpilih; override;
  public
    { Public declarations }
  end;

var
  FrmBuku: TFrmBuku;

implementation

{$R *.dfm}

uses View.BukuEdit;

procedure TFrmBuku.EditDataTerpilih;
var
  Form : TFrmBukuEdit;
begin
  Form := TFrmBukuEdit.Create(Application);
  Form.EditBuku(DSetDaftar.Current<TBuku>);

  if Form.ShowModal = mrOk then
  begin
    FManager.Update(Form.Buku);
    FManager.Flush;
    DSetDaftar.Refresh;
  end;
end;

procedure TFrmBuku.HapusDataTerpilih;
begin
    FManager.Remove(DSetDaftar.Current<TBuku>);
end;

procedure TFrmBuku.Segarkan;
begin
  DSetDaftar.Close;
  DSetDaftar.Manager := FManager;
  DSetDaftar.SetSourceCriteria(FManager.Find<TBuku>);
  DSetDaftar.Open;
end;

procedure TFrmBuku.TambahData;
var
  Form : TFrmBukuEdit;
begin
  Form := TFrmBukuEdit.Create(Application);
  Form.BukuBaru;
  if Form.ShowModal = mrOk then
  begin
    FManager.Save(Form.Buku);
    DSetDaftar.Refresh;
  end;
end;

end.


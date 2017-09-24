unit View.Buku;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Aurelius.Bind.Dataset,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid,
  Aurelius.Engine.ObjectManager,
  uEntities, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmBuku = class(TForm)
    View: TcxGridDBTableView;
    Level: TcxGridLevel;
    Grid: TcxGrid;
    DSetDaftarBuku: TAureliusDataset;
    DsDaftarBuku: TDataSource;
    DSetDaftarBukuId: TIntegerField;
    DSetDaftarBukuKode: TStringField;
    DSetDaftarBukuJudul: TStringField;
    DSetDaftarBukuPengarang: TStringField;
    DSetDaftarBukuPenerbit: TStringField;
    DSetDaftarBukuTahunTerbit: TIntegerField;
    DSetDaftarBukuTempatTerbit: TStringField;
    DSetDaftarBukuJumlahHalaman: TIntegerField;
    DSetDaftarBukuDimensi: TStringField;
    DSetDaftarBukuDDC: TStringField;
    DSetDaftarBukuISBN: TStringField;
    DSetDaftarBukuJumlah: TIntegerField;
    DSetDaftarBukuKategori: TStringField;
    DSetDaftarBukuTempat: TStringField;
    DSetDaftarBukuKeterangan: TStringField;
    DSetDaftarBukuStok: TIntegerField;
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
    PnlSide: TPanel;
    BtnKeluar: TButton;
    BtnRefresh: TButton;
    BtnTambah: TButton;
    BtnEdit: TButton;
    BtnHapus: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnKeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnTambahClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
  private
    FManager : TObjectManager;
    procedure Segarkan;
    procedure TambahBuku;
    procedure EditBuku(ABuku: TBuku);
    procedure HapusBuku(ABuku: TBuku);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuku: TFrmBuku;

implementation

{$R *.dfm}

uses uDm, View.BukuEdit;

procedure TFrmBuku.BtnEditClick(Sender: TObject);
begin
  EditBuku(DSetDaftarBuku.Current<TBuku>);
end;

procedure TFrmBuku.BtnHapusClick(Sender: TObject);
begin
  HapusBuku(DSetDaftarBuku.Current<TBuku>)
end;

procedure TFrmBuku.BtnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuku.BtnRefreshClick(Sender: TObject);
begin
  Segarkan;
end;

procedure TFrmBuku.BtnTambahClick(Sender: TObject);
begin
  TambahBuku;
end;

procedure TFrmBuku.EditBuku(ABuku: TBuku);
var
  Form : TFrmBukuEdit;
begin
  Form := TFrmBukuEdit.Create(Application);
  Form.EditBuku(ABuku);

  if Form.ShowModal = mrOk then
  begin
    FManager.Update(Form.Buku);
    FManager.Flush;
    Segarkan;
  end;
end;

procedure TFrmBuku.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FManager.Free;
  Parent.Free;
end;

procedure TFrmBuku.FormCreate(Sender: TObject);
begin
  FManager := TObjectManager.Create(Dm.Connection);
  Segarkan;
end;

procedure TFrmBuku.HapusBuku(ABuku: TBuku);
begin
//  FManager.Remove(ABuku);
end;

procedure TFrmBuku.Segarkan;
begin
  DSetDaftarBuku.Close;
  DSetDaftarBuku.Manager := FManager;
  DSetDaftarBuku.SetSourceCriteria(FManager.Find<TBuku>);
  DSetDaftarBuku.Open;
end;

procedure TFrmBuku.TambahBuku;
var
  Form : TFrmBukuEdit;
begin
  Form := TFrmBukuEdit.Create(Application);
  Form.BukuBaru;
  if Form.ShowModal = mrOk then
  begin
    FManager.Save(Form.Buku);
    Segarkan;
  end;
end;

end.


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
  uEntities;

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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FManager : TObjectManager;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuku: TFrmBuku;

implementation

{$R *.dfm}

uses uDm;

procedure TFrmBuku.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FManager.Free;
end;

procedure TFrmBuku.FormCreate(Sender: TObject);
begin
  FManager := TObjectManager.Create(Dm.Connection);
  DSetDaftarBuku.Close;
  DSetDaftarBuku.Manager := FManager;
  DSetDaftarBuku.SetSourceCriteria(FManager.Find<TBuku>);
  DSetDaftarBuku.Open;
end;

end.


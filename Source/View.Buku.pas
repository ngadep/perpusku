unit View.Buku;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Aurelius.Bind.Dataset,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TFrmBuku = class(TForm)
    View: TcxGridDBTableView;
    Level: TcxGridLevel;
    Grid: TcxGrid;
    DSetDaftarBuku: TAureliusDataset;
    DsDaftarBuku: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuku: TFrmBuku;

implementation

{$R *.dfm}

end.

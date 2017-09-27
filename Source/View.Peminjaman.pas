unit View.Peminjaman;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridLevel, cxGrid;

type
  TFrmPeminjaman = class(TForm)
    PnlAtas: TPanel;
    PnlBawah: TPanel;
    Level: TcxGridLevel;
    Grid: TcxGrid;
    Table: TcxGridTableView;
    TcNo: TcxGridColumn;
    TcKode: TcxGridColumn;
    TcJudul: TcxGridColumn;
    TcDurasi: TcxGridColumn;
    TcTanggalPinjam: TcxGridColumn;
    TcTanggalKembali: TcxGridColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPeminjaman: TFrmPeminjaman;

implementation

{$R *.dfm}

end.

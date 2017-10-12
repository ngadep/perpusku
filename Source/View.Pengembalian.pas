unit View.Pengembalian;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridLevel, cxGrid, Vcl.ExtCtrls;

type
  TFrmPengembalian = class(TForm)
    PnlAtas: TPanel;
    PnlBawah: TPanel;
    Level: TcxGridLevel;
    Grid: TcxGrid;
    Table: TcxGridTableView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPengembalian: TFrmPengembalian;

implementation

{$R *.dfm}

end.

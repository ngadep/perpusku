unit View.DaftarBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Aurelius.Bind.Dataset,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls,
  Aurelius.Engine.ObjectManager;

type
  TFrmDaftarBase = class(TForm)
    PnlSide: TPanel;
    BtnKeluar: TButton;
    BtnRefresh: TButton;
    BtnTambah: TButton;
    BtnEdit: TButton;
    BtnHapus: TButton;
    Grid: TcxGrid;
    View: TcxGridDBTableView;
    Level: TcxGridLevel;
    DsDaftar: TDataSource;
    DSetDaftar: TAureliusDataset;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnKeluarClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnTambahClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
  private
    { Private declarations }
  protected
    FManager : TObjectManager;
    procedure Segarkan; virtual; abstract;
    procedure TambahData; virtual; abstract;
    procedure EditDataTerpilih; virtual; abstract;
    procedure HapusDataTerpilih; virtual; abstract;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDm;

procedure TFrmDaftarBase.BtnEditClick(Sender: TObject);
begin
  EditDataTerpilih;
end;

procedure TFrmDaftarBase.BtnHapusClick(Sender: TObject);
begin
  if MessageDlg('Yakinkah, akan menghapus data ini?...', mtConfirmation, [mbYes,
    mbNo], 0) = mrYes then
  begin
    HapusDataTerpilih;
    Segarkan;
  end;
end;

procedure TFrmDaftarBase.BtnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDaftarBase.BtnRefreshClick(Sender: TObject);
begin
  Segarkan;
end;

procedure TFrmDaftarBase.BtnTambahClick(Sender: TObject);
begin
  TambahData;
end;

procedure TFrmDaftarBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FManager.Free;
  Parent.Free;
end;

procedure TFrmDaftarBase.FormCreate(Sender: TObject);
begin
  FManager := TObjectManager.Create(Dm.Connection);
  Segarkan;
end;

end.

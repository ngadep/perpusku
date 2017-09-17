unit View.Utama;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uEntities,
  Aurelius.Engine.ObjectManager, Vcl.StdCtrls, uDm, Aurelius.Bind.Dataset,
  Generics.Collections, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.DBCtrls;

type
  TFrmUtama = class(TForm)
    BtnPengguna: TButton;
    SetPengguna: TAureliusDataset;
    DsPengguna: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnPenggunaClick(Sender: TObject);
  private
    Manager: TObjectManager;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUtama: TFrmUtama;

implementation

{$R *.dfm}

procedure TFrmUtama.BtnPenggunaClick(Sender: TObject);
var
  Pengguna: TPengguna;
begin
  Pengguna:= TPengguna.Create;
  Pengguna.Kode := 'ADMIN';
  Pengguna.Nama := 'Administrator';
  Pengguna.Sandi := '12345';
  Manager.Save(Pengguna);
end;

procedure TFrmUtama.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Manager.Free;
end;

procedure TFrmUtama.FormCreate(Sender: TObject);
begin
  Manager := TObjectManager.Create(TDm.CreateConnection);
  SetPengguna.Close;
  SetPengguna.Manager := Manager;
  SetPengguna.SetSourceCriteria(Manager.Find<TPengguna>);
  SetPengguna.Open;
end;

end.

unit View.BukuEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmBukuEdit = class(TForm)
    BtnOk: TButton;
    BtnCancel: TButton;
    PnlBawah: TPanel;
    Label1: TLabel;
    EdKode: TEdit;
    EdPengarang: TEdit;
    Label2: TLabel;
    EdJudul: TEdit;
    Label3: TLabel;
    EdPenerbit: TEdit;
    Label4: TLabel;
    EdTempatTerbit: TEdit;
    Label5: TLabel;
    EdTahunTerbit: TEdit;
    Label6: TLabel;
    EdDimensi: TEdit;
    Label7: TLabel;
    EdJumlahHalaman: TEdit;
    Label8: TLabel;
    EdKategori: TEdit;
    Label9: TLabel;
    EdDDC: TEdit;
    Label10: TLabel;
    EdISBN: TEdit;
    Label11: TLabel;
    EdTempatBuku: TEdit;
    Label12: TLabel;
    EdJumlah: TEdit;
    Label13: TLabel;
    EdStok: TEdit;
    Label14: TLabel;
    EdKeterangan: TEdit;
    Label15: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBukuEdit: TFrmBukuEdit;

implementation

{$R *.dfm}

end.

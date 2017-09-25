unit View.Anggota;

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
  TFrmAnggota = class(TFrmDaftarBase)
    DSetDaftarId: TIntegerField;
    DSetDaftarKode: TStringField;
    DSetDaftarNama: TStringField;
    DSetDaftarJenisKelamin: TIntegerField;
    DSetDaftarKelas: TStringField;
    DSetDaftarJurusan: TStringField;
    DSetDaftarAngkatan: TIntegerField;
    DSetDaftarAlamat: TStringField;
    DSetDaftarTelepon: TStringField;
    DSetDaftarKeterangan: TStringField;
    ViewKode: TcxGridDBColumn;
    ViewNama: TcxGridDBColumn;
    ViewJenisKelamin: TcxGridDBColumn;
    ViewKelas: TcxGridDBColumn;
    ViewJurusan: TcxGridDBColumn;
    ViewAngkatan: TcxGridDBColumn;
    ViewAlamat: TcxGridDBColumn;
    ViewTelepon: TcxGridDBColumn;
    ViewKeterangan: TcxGridDBColumn;
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
  FrmAnggota: TFrmAnggota;

implementation

{$R *.dfm}

uses View.AnggotaEdit;

{ TFrmAnggota }

procedure TFrmAnggota.EditDataTerpilih;
var
  Form : TFrmAnggotaEdit;
begin
  Form := TFrmAnggotaEdit.Create(Application);
  Form.EditAnggota(DSetDaftar.Current<TAnggota>);

  if Form.ShowModal = mrOk then
  begin
    FManager.Update(Form.Anggota);
    FManager.Flush;
    Segarkan;
  end;
end;

procedure TFrmAnggota.HapusDataTerpilih;
begin
    FManager.Remove(DSetDaftar.Current<TAnggota>);
end;

procedure TFrmAnggota.Segarkan;
begin
  DSetDaftar.Close;
  DSetDaftar.Manager := FManager;
  DSetDaftar.SetSourceCriteria(FManager.Find<TAnggota>);
  DSetDaftar.Open;
end;

procedure TFrmAnggota.TambahData;
var
  Form : TFrmAnggotaEdit;
begin
  Form := TFrmAnggotaEdit.Create(Application);
  Form.AnggotaBaru;
  if Form.ShowModal = mrOk then
  begin
    FManager.Save(Form.Anggota);
    Segarkan;
  end;
end;

end.

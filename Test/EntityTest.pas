unit EntityTest;

interface
uses
  DUnitX.TestFramework,
  System.DateUtils,
  uEntities;

type

  [TestFixture]
  TTestentity = class(TObject)
  public
    [Test]
    procedure Test1;
  end;

  [TestFixture]
  TPinjamTest = class(TObject)
  private
    FPinjam : TPinjam;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestJatuhTempo;
  end;

implementation

procedure TTestentity.Test1;
begin
  Assert.IsTrue(True, 'Seharusnya Benar Tapi Salah');
end;

{ TPinjamTest }

procedure TPinjamTest.Setup;
var
  LTanggalPinjam : TDateTime;
  LTanggalKembali: TDateTime;
begin
  LTanggalPinjam := EncodeDateTime(2017,1,1,0,0,0,0);
  LTanggalKembali := EncodeDateTime(2017,1,9,0,0,0,0);
  FPinjam := TPinjam.Create(1, LTanggalPinjam, 7, LTanggalKembali, 1000);
end;

procedure TPinjamTest.TearDown;
begin
  FPinjam.Free;
end;

procedure TPinjamTest.TestJatuhTempo;
begin
  Assert.AreEqual(1000, FPinjam.Denda, 'Seharusnya denda 1000');
  Assert.AreEqual(TDate(EncodeDateTime(2017,1,8,0,0,0,0)), FPinjam.JatuhTempo, 'Jatuh Tempo Salah');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestentity);
  TDUnitX.RegisterTestFixture(TPinjamTest);
end.

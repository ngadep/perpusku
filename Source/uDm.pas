unit uDm;

interface

uses
  Aurelius.Engine.DatabaseManager,
  Aurelius.Drivers.Interfaces,
{$IFDEF MYSQLDB}
  Aurelius.SQL.MySQL,
  Aurelius.Schema.MySQL,
  Aurelius.Drivers.MyDac,
{$ELSE}
  Aurelius.SQL.SQLite,
  Aurelius.Schema.SQLite,
  Aurelius.Drivers.SQLite,
{$ENDIF}
  Aurelius.Schema.Messages,
  System.SysUtils,
  System.Classes;

type
  TDm = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    FConnection: IDBConnection;
    class function CreateConnection: IDBConnection;
  public
    property Connection: IDBConnection read FConnection;
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
{$IFDEF MYSQLDB}
  MyAccess,
{$ENDIF}
  Aurelius.Drivers.Base;

{$R *.dfm}

{ TMyConnectionModule }

class function TDm.CreateConnection: IDBConnection;
{$IFDEF MYSQLDB}
var
  LConnection : TMyConnection;
{$ENDIF}
begin
{$IFDEF MYSQLDB}
  LConnection := TMyConnection.Create(nil);
  LCOnnection.ConnectString := 'User ID=root;Password=server;Data Source=localhost;Database=aurelius;Login Prompt=False';
  Result := TMyDacConnectionAdapter.Create(LConnection);
{$ENDIF}

  Result := TSQLiteNativeConnectionAdapter.Create('perpus.db');
end;

procedure TDm.DataModuleCreate(Sender: TObject);
var
  DBManager: TDatabaseManager;
  SchemaMessage: TSchemaMessage;
  X: TextFile;
begin
  FConnection := CreateConnection;

  DBManager := TDatabaseManager.Create(FConnection);
  try
    AssignFile(X, 'perpus.log');
    Rewrite(X);

    if DBManager.ValidateDatabase then
      WriteLn(X, 'Database strucuture is valid.')
    else
    begin
      WriteLn(X, Format('Invalid database structure. %d Errors, %d Warnings, %d Actions',
        [DBManager.ErrorCount, DBManager.WarningCount, DBManager.ActionCount]));
      for SchemaMessage in DBManager.Warnings do
        WriteLn(X, 'Warning: ' + SchemaMessage.Text);
      for SchemaMessage in DBManager.Errors do
        WriteLn(X, 'Error: ' + SchemaMessage.Text);
      for SchemaMessage in DBManager.Actions do
        WriteLn(X, 'Action: ' + SchemaMessage.Text);
      DBManager.UpdateDatabase;
    end;
  finally
    CloseFile(X);
    DBManager.Free;
  end;
end;

end.

unit uDm;

interface

uses
  Aurelius.Engine.DatabaseManager,
  Aurelius.Drivers.Interfaces,
  Aurelius.SQL.SQLite,
  Aurelius.Schema.SQLite,
  Aurelius.Drivers.SQLite,
  Aurelius.Schema.Messages,
  System.SysUtils,
  System.Classes;

type
  TDm = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
  public
    class function CreateConnection: IDBConnection;
    class function CreateFactory: IDBConnectionFactory;
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  Aurelius.Drivers.Base;

{$R *.dfm}

{ TMyConnectionModule }

class function TDm.CreateConnection: IDBConnection;
begin
//  Result := TSQLiteNativeConnectionAdapter.Create(ParamStr(0) + '.db');
  Result := TSQLiteNativeConnectionAdapter.Create('perpus.db');
end;

class function TDm.CreateFactory: IDBConnectionFactory;
begin
  Result := TDBConnectionFactory.Create(
    function: IDBConnection
    begin
      Result := CreateConnection;
    end
  );
end;

procedure TDm.DataModuleCreate(Sender: TObject);
var
  DBManager: TDatabaseManager;
  SchemaMessage: TSchemaMessage;
  X: TextFile;
begin
  DBManager := TDatabaseManager.Create(CreateConnection);
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

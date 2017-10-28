unit Aurelius.Drivers.MyDac;

interface

uses
  Classes,
  DB,
  Variants,
  Generics.Collections,
  Aurelius.Drivers.Base,
  Aurelius.Drivers.Interfaces,
  MyAccess;

type
  TMyDacResultSetAdapter = class(TDriverResultSetAdapter<TMyQuery>)
  public
    function GetFieldValue(FieldIndex: Integer): Variant; overload; override;
  end;

  TMyDacStatementAdapter = class(TInterfacedObject, IDBStatement, IDBDatasetStatement)
  private
    FMyQuery: TMyQuery;
    function GetDataset: TDataset;
  public
    constructor Create(AMyQuery: TMyQuery);
    destructor Destroy; override;
    procedure SetSQLCommand(SQLCommand: string);
    procedure SetParams(Params: TEnumerable<TDBParam>);
    function Execute: Integer;
    function ExecuteQuery: IDBResultSet;
  end;

  TMyDacConnectionAdapter = class(TDriverConnectionAdapter<TMyConnection>, IDBConnection)
  public
    constructor Create(AConnection: TMyConnection); overload;
    procedure Connect;
    procedure Disconnect;
    function IsConnected: Boolean;
    function CreateStatement: IDBStatement;
    function BeginTransaction: IDBTransaction;
    function RetrieveSqlDialect: string; override;
  end;

  TMyDacTransactionAdapter = class(TInterfacedObject, IDBTransaction)
  private
    FMyDatabase: TMyConnection;
  public
    constructor Create(MyDatabase: TMyConnection);
    procedure Commit;
    procedure Rollback;
  end;

implementation

{ TSQLDirectStatementAdapter }

uses
  SysUtils,
  Aurelius.Drivers.Exceptions,
  Aurelius.Global.Utils;

{ TMyDacStatementAdapter }

constructor TMyDacStatementAdapter.Create(AMyQuery: TMyQuery);
begin
  FMyQuery := AMyQuery;
end;

destructor TMyDacStatementAdapter.Destroy;
begin
  FMyQuery.Free;
  inherited;
end;

function TMyDacStatementAdapter.Execute: Integer;
begin
  FMyQuery.ExecSQL;
  Result := FMyQuery.RowsAffected;
end;

function TMyDacStatementAdapter.ExecuteQuery: IDBResultSet;
var
  ResultSet: TMyQuery;
  I: Integer;
begin
  ResultSet := TMyQuery.Create(nil);
  try
    ResultSet.Connection := FMyQuery.Connection;
    ResultSet.SQL := FMyQuery.SQL;

    for I := 0 to FMyQuery.Params.Count - 1 do
    begin
      ResultSet.Params[I].DataType := FMyQuery.Params[I].DataType;
      ResultSet.Params[I].Value := FMyQuery.Params[I].Value;
    end;

    ResultSet.Open;
  except
    ResultSet.Free;
    raise;
  end;
  Result := TMyDacResultSetAdapter.Create(ResultSet);
end;

function TMyDacStatementAdapter.GetDataset: TDataset;
begin
  Result := FMyQuery;
end;

procedure TMyDacStatementAdapter.SetParams(Params: TEnumerable<TDBParam>);
var
  P: TDBParam;
  Parameter: TParam;
  Bytes: TBytes;
  I: Integer;
begin
  I := 0;
  for P in Params do
  begin
    if (P.ParamName = '') and (I < FMyQuery.Params.Count) then
      Parameter := FMyQuery.Params[I]
    else
      Parameter := FMyQuery.ParamByName(P.ParamName);
    Inc(I);

    if P.ParamType in [ftBlob, ftOraBlob, ftOraClob] then
    begin
      // Specific SQL-Direct workaround for blob fields. If param type is ftBlob, then we must set the
      // blob content as string, because it's the only way it works fine for all databases
      Parameter.DataType := P.ParamType;
      Bytes := TUtils.VariantToBytes(P.ParamValue);
      if VarIsNull(P.ParamValue) or (Length(Bytes) = 0) then
        Parameter.Clear
      else
        Parameter.AsBlob := Bytes;
    end else
    if (P.ParamType in [ftGuid]) and VarIsArray(P.ParamValue) then
    begin
      Parameter.DataType := P.ParamType;
      Parameter.Value := GuidToString(TUtils.VariantToGuid(P.ParamValue));
    end
    else
    begin
      Parameter.DataType := P.ParamType;
      Parameter.Value := P.ParamValue;
    end;
  end;
end;

procedure TMyDacStatementAdapter.SetSQLCommand(SQLCommand: string);
begin
  FMyQuery.SQL.Text := SQLCommand;
end;

{ TMyDacTransactionAdapter }

procedure TMyDacTransactionAdapter.Commit;
begin
  if (FMyDatabase = nil) then
    Exit;

  FMyDatabase.Commit;
end;

constructor TMyDacTransactionAdapter.Create(MyDatabase: TMyConnection);
begin
  FMyDatabase := MyDatabase;
end;

procedure TMyDacTransactionAdapter.Rollback;
begin
  if (FMyDatabase = nil) then
    Exit;

  FMyDatabase.Rollback;
end;

{ TMyDacResultSetAdapter }

function TMyDacResultSetAdapter.GetFieldValue(FieldIndex: Integer): Variant;
var
  S: string;
begin
  Result := inherited GetFieldValue(FieldIndex);
  case VarType(Result) of
    varUString, varOleStr:
      begin
        S := VarToStr(Result);
        Result := VarAsType(S, varString);
      end;
  end;
end;

{ TMyDacConnectionAdapter }

function TMyDacConnectionAdapter.BeginTransaction: IDBTransaction;
begin
  if Connection = nil then
  Exit(nil);

  Connection.Connected := true;

  if not Connection.InTransaction then
  begin
    Connection.StartTransaction;
    Result := TMyDacTransactionAdapter.Create(Connection);
  end else
    Result := TMyDacTransactionAdapter.Create(nil);
end;

procedure TMyDacConnectionAdapter.Connect;
begin
  if Connection <> nil then
    Connection.Connected := True;
end;

constructor TMyDacConnectionAdapter.Create(AConnection: TMyConnection);
begin
  inherited Create(AConnection, True);
end;

function TMyDacConnectionAdapter.CreateStatement: IDBStatement;
var
  Statement: TMyQuery;
begin
  if Connection = nil then
    Exit(nil);

  Statement := TMyQuery.Create(nil);
  try
    Statement.Connection := Connection;
  except
    Statement.Free;
    raise;
  end;
  Result := TMyDacStatementAdapter.Create(Statement);
end;

procedure TMyDacConnectionAdapter.Disconnect;
begin
  if Connection <> nil then
    Connection.Connected := False;
end;

function TMyDacConnectionAdapter.IsConnected: Boolean;
begin
  if Connection <> nil then
    Result := Connection.Connected
  else
    Result := false;
end;

function TMyDacConnectionAdapter.RetrieveSqlDialect: string;
begin
  if Connection = nil then
    Exit('');

  result := 'MySQL';
end;

end.

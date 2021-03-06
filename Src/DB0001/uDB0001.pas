﻿unit uDB0001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.IBBase,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TForm1 = class(TForm)
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }

  public
      procedure SelectSQL;
    { Public declarations }
  end;
  procedure DBConnect;
  procedure DBDisconnect;

var
  Form1: TForm1;
 // FDBConnection : TFDConnection;
  FDFBDriver : TFDPhysFBDriverLink;

implementation

{$R *.dfm}
uses
 FireDAC.VCLUI.Wait;
{ TForm1 }

procedure DBConnect;
var
  currentDBPath : String;
  conn : TFDConnection;
  qry : TFDQuery;
begin
(*  try
    FDFBDriver := TFDPhysFBDriverLink.Create(nil);
    FDFBDriver.VendorLib := ExtractFileDir(ExtractFileDir(Application.ExeName)) + '\Lib\fbclient.dll';

    FDBConnection := TFDConnection.Create(nil);
    currentDBPath := ExtractFileDir(ExtractFileDir(Application.ExeName)) + '\DB\JEWELRYMNGMT.FDB';
    with FDBConnection.Params do
    begin
      Clear;
      Add('DriverID=FB');
      Add('Server=localhost');
      Add('Database=' + currentDBPath);
      Add('User_Name=sysdba');
      Add('Password=masterkey');
    end;

    try
      if NOT FDBConnection.Connected  then
        FDBConnection.Connected := True;

      ShowMessage('Databse Connected');

    except
      on E:Exception do
      begin
        ShowMessage('There is error while trying to open connection: ' + E.Message);
      end;

    end;
  finally
//    if Assigned(FDFBDriver) then FreeAndNil(FDFBDriver);
//
//    if FDBConnection.Connected then FDBConnection.Connected := False;
//    if Assigned(FDBConnection) then FreeAndNil(FDBConnection);

  end;
*)

  conn := TFDConnection.Create(nil);
  FDFBDriver := TFDPhysFBDriverLink.Create(nil);
  FDFBDriver.VendorLib := ExtractFileDir(ExtractFileDir(Application.ExeName)) + '\Lib\fbclient.dll';
  currentDBPath := ExtractFileDir(ExtractFileDir(Application.ExeName)) + '\DB\JEWELRYMNGMT.FDB';


  try
    with conn.Params do
    begin
      Clear;
      Add('DriverID=FB');
      Add('Server=localhost');
      Add('Database=' + currentDBPath);
      Add('User_Name=sysdba');
      Add('Password=masterkey');
    end;

    try
      conn.Connected := True;
      if conn.Connected then
      begin
        qry := TFDQuery.Create(conn);
        try
          qry.Connection := conn;
          qry.SQL.Text := 'select * from customer;';
          qry.Active := True;

          if qry.Active then
          begin
            if qry.RecordCount > 0 then
            begin
              Showmessage(
              'Customer ID    : ' + qry.FieldByName('CUSTID')   .AsString +#13#10+
              'Customer Name  : ' + UTF8ToUnicodeString(qry.FieldByName('CUSTNAME').AsAnsiString) +#13#10+
              'Customer Name  : សាកល្បង'                                              +#13#10+
              'Customer IDNO  : ' + qry.FieldByName('IDNO')     .AsString +#13#10+
              'Customer DOB   : ' + qry.FieldByName('DOB')      .AsString +#13#10+
              'Customer EMAIL : ' + qry.FieldByName('EMAIL')    .AsString
              );
            end;
          end;
        finally
          qry.Free;
        end;
      end
      else ShowMessage('Connection Failed');

    except
      on E:Exception do
      begin
        ShowMessage(e.Message);
      end;
    end;

  finally
    FDFBDriver.Free;
    conn.Free;
  end;
end;

procedure DBDisconnect;
begin


end;

procedure TForm1.FormShow(Sender: TObject);
begin
  DBConnect;
end;

procedure TForm1.SelectSQL;
begin

end;


end.

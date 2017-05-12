unit uDB0001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.IBBase;

type
  TForm1 = class(TForm)
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }

  public

    { Public declarations }
  end;
  procedure DBConnect;
  procedure DBDisconnect;
var
  Form1: TForm1;
  FDBConnection : TFDConnection;
  FDFBDriver : TFDPhysFBDriverLink;

implementation

{$R *.dfm}

{ TForm1 }

procedure DBConnect;
var
  currentDBPath : String;
begin
  try
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
    //if Assigned(FDFBDriver) then FreeAndNil(FDFBDriver);

    //if FDBConnection.Connected then FDBConnection.Connected := False;
    //if Assigned(FDBConnection) then FreeAndNil(FDBConnection);

  end;
end;

procedure DBDisconnect;
begin


end;

procedure TForm1.FormShow(Sender: TObject);
begin
  DBConnect;
end;

end.

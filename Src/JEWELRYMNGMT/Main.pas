unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  myProcedure = procedure;

var
  Form1: TForm1;
implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  PackageModule : HModule;
  myTesting : myProcedure;
begin
  try
    PackageModule := LoadPackage('DB0002.bpl');
    if PackageModule <> 0 then
    begin
ShowMessage('package loaded');
      @myTesting := GetProcAddress(PackageModule, 'testing');
      if  @myTesting <> nil then
      begin
        myTesting;
      end
      else begin
        ShowMessage('Error loading package');
      end;
    end;
  finally
    UnloadPackage(PackageModule);
  end;
end;

end.

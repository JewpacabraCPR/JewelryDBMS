unit uCM0002;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfCM0002 = class(TForm)
    RadioButton1: TRadioButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCM0002: TfCM0002;

implementation

{$R *.dfm}

initialization
  RegisterClass(TfCM0002);
finalization
  UnRegisterClass(TfCM0002);
end.

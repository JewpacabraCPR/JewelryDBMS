unit uCM0001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfCM0001 = class(TForm)
    Panel1: TPanel;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCM0001: TfCM0001;

implementation

{$R *.dfm}

procedure TfCM0001.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

initialization
  RegisterClass(TfCM0001);
finalization
  UnRegisterClass(TfCM0001);
end.


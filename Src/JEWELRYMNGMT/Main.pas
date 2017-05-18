unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    p: TMainMenu;
    File1: TMenuItem;
    Customer1: TMenuItem;
    Item1: TMenuItem;
    btn2: TButton;
    Panel1: TPanel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    procedure btn1Click(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure displayMenu(aBplName : String);
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
      @myTesting := GetProcAddress(PackageModule, 'testSQL');
      if  @myTesting <> nil then
      begin
        myTesting;
      end
      else
      begin
        ShowMessage('Error loading package');
      end;
    end;
  finally
    UnloadPackage(PackageModule);
  end;
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  FormScroll: TForm;
  FormClass: TFormClass;
  HandlePack: HModule;
begin

  // try to load the package
  HandlePack := LoadPackage ('CM0001.bpl');
  if HandlePack > 0 then
  begin
    FormClass := TFormClass(GetClass('TfCM0001'));
    if Assigned (FormClass) then
    begin
      with FormClass.Create (Application) as TForm do
      try
        // initialize the data
//        SetPropValue (FormScroll, 'SelectedColor', Color);
        // show the form
        Parent := ts1;
        Visible := True;
//      FormScroll.FormStyle := fsMDIForm;                          
        if ShowModal = mrOK then Free;
          
       finally
        //        
      end;
    end
    else
      ShowMessage ('Form class not found');
    UnloadPackage (HandlePack);
  end
  else
    ShowMessage ('Package not found');
end;

procedure TForm1.displayMenu(aBplName: String);
var
  PackageModule : HModule;
  aClass : TPersistentClass;
  myForm    : string;
begin
  try
    PackageModule := LoadPackage(aBplName + '.bpl');
    myForm := 'Tf' + aBplName;

    if PackageModule <> 0 then
    begin

      aClass := GetClass(myForm);
      if  Assigned(aClass) then
      begin
        with TComponentClass(aClass).Create(Application)
          as TCustomForm do
        begin
          Parent := Self;
//          FormStyle := fsMDIForm;
          Show;
//          ShowModal;

          Free;
        end;

      end
      else
      begin
        ShowMessage('Error loading package');
      end;
    end;
  finally
    UnloadPackage(PackageModule);
  end;

end;

procedure TForm1.MenuClick(Sender: TObject);
begin
  case (Sender as TMenuItem).Tag of
  10001 : begin
            displayMenu('CM0001');
          end;

  10002:  begin
            displayMenu('CM0002');
          end;


  end;

end;

end.

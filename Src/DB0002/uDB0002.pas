unit uDB0002;

interface
uses
  uDB0001, Vcl.Dialogs;
  procedure testing;
implementation
procedure testing;
begin

  uDB0001.DBConnect;
end;

exports
  testing;
end.

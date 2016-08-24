program testapp;

uses
  Forms,
  mainwnd in 'mainwnd.pas' {frmMain},
  kjpeg in 'kjpeg.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Test';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

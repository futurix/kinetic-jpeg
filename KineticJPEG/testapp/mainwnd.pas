unit mainwnd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls,
  kjpeg, Dialogs;

type
  TfrmMain = class(TForm)
    pnlMain: TPanel;
    sbxMain: TScrollBox;
    imgMain: TImage;
    btnThFile: TButton;
    edtWidth: TEdit;
    edtHeight: TEdit;
    lblDimensions: TLabel;
    dlgOpen: TOpenDialog;
    cbxCenter: TCheckBox;
    btnImgFile: TButton;
    btnThStr: TButton;
    btnImgStr: TButton;
    procedure btnThFileClick(Sender: TObject);
    procedure btnImgFileClick(Sender: TObject);
    procedure btnThStrClick(Sender: TObject);
    procedure btnImgStrClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnThFileClick(Sender: TObject);
var
  lib: THandle;
  func: TkOpenTh;
begin
if ((dlgOpen.Execute) and (dlgOpen.FileName<>'')) then
  begin
  lib:=LoadLibrary('kjpeg.dll');
  if lib<>0 then
    begin
    @func:=GetProcAddress(lib,'kOpenTh');
    if @func<>nil then
      begin
      imgMain.Picture.Bitmap.Handle:=func(PChar(dlgOpen.FileName),StrToInt(edtWidth.Text),StrToInt(edtHeight.Text),clWhite,cbxCenter.Checked);
      end;
    end;
  end;
end;

procedure TfrmMain.btnImgFileClick(Sender: TObject);
var
  lib: THandle;
  func: TkOpen;
begin
if ((dlgOpen.Execute) and (dlgOpen.FileName<>'')) then
  begin
  lib:=LoadLibrary('kjpeg.dll');
  if lib<>0 then
    begin
    @func:=GetProcAddress(lib,'kOpen');
    if @func<>nil then
      begin
      imgMain.Picture.Bitmap.Handle:=func(PChar(dlgOpen.FileName));
      end;
    end;
  end;
end;

procedure TfrmMain.btnThStrClick(Sender: TObject);
var
  lib: THandle;
  func: TkOpenStrTh;
  str: TFileStream;
begin
if ((dlgOpen.Execute) and (dlgOpen.FileName<>'')) then
  begin
  lib:=LoadLibrary('kjpeg.dll');
  if lib<>0 then
    begin
    @func:=GetProcAddress(lib,'kOpenStrTh');
    if @func<>nil then
      begin
      str:=TFileStream.Create(dlgOpen.FileName,fmOpenRead);
      imgMain.Picture.Bitmap.Handle:=func(str,StrToInt(edtWidth.Text),StrToInt(edtHeight.Text),clWhite,cbxCenter.Checked);
      FreeAndNil(str);
      end;
    end;
  end;
end;

procedure TfrmMain.btnImgStrClick(Sender: TObject);
var
  lib: THandle;
  func: TkOpenStr;
  str: TFileStream;
begin
if ((dlgOpen.Execute) and (dlgOpen.FileName<>'')) then
  begin
  lib:=LoadLibrary('kjpeg.dll');
  if lib<>0 then
    begin
    @func:=GetProcAddress(lib,'kOpenStr');
    if @func<>nil then
      begin
      str:=TFileStream.Create(dlgOpen.FileName,fmOpenRead);
      imgMain.Picture.Bitmap.Handle:=func(str);
      FreeAndNil(str);
      end;
    end;
  end;
end;

end.

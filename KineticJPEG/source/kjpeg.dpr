library kjpeg;

{$R *.res}

uses Windows, Classes, SysUtils, Graphics, EnJpgGr;

function kOpen(filename: PChar):HBITMAP; stdcall;
var
  bmp: TBitmap;
  jpeg: TJpegGraphic;
begin
try
  bmp:=TBitmap.Create();
  jpeg:=TJpegGraphic.Create();
  jpeg.LoadFromFile(String(filename));
  bmp.Assign(jpeg);
  Result:=bmp.ReleaseHandle();
  FreeAndNil(bmp);
  FreeAndNil(jpeg);
  except
    Result:=0;
  end;
end;

function kOpenStr(str: TStream):HBITMAP; stdcall;
var
  bmp: TBitmap;
  jpeg: TJpegGraphic;
begin
try
  bmp:=TBitmap.Create();
  jpeg:=TJpegGraphic.Create();
  jpeg.LoadFromStream(str);
  bmp.Assign(jpeg);
  Result:=bmp.ReleaseHandle();
  FreeAndNil(bmp);
  FreeAndNil(jpeg);
  except
    Result:=0;
  end;
end;

function kOpenTh(filename: PChar; width, height: integer; fill_color: TColor; center: boolean):HBITMAP; stdcall;
var
  bmp, tmp: TBitmap;
  x_coeff, y_coeff: double;
  correction: integer; 
begin
try
  bmp:=TBitmap.Create();
  bmp.Handle:=kOpen(filename);

  tmp:=TBitmap.Create();
  tmp.Canvas.Brush.Color:=fill_color;
  tmp.Width:=width;
  tmp.Height:=height;
  SetStretchBltMode(tmp.Canvas.Handle,COLORONCOLOR);

  // counting coeff values
  x_coeff:=width/bmp.Width;
  y_coeff:=height/bmp.Height;

  // comparing
  if ((bmp.Height*x_coeff)<height) then
    begin
    // fitting to width
    if center then
      correction:=Round((height-Round(bmp.Height*x_coeff))/2)
    else
      correction:=0;

    StretchBlt(tmp.Canvas.Handle,0,correction,width,Round(bmp.Height*x_coeff),bmp.Canvas.Handle,
               0,0,bmp.Width,bmp.Height,SRCCOPY);
    end
  else
    begin
    // fitting to height
    if center then
      correction:=Round((width-Round(bmp.Width*y_coeff))/2)
    else
      correction:=0;

    StretchBlt(tmp.Canvas.Handle,correction,0,Round(bmp.Width*y_coeff),height,bmp.Canvas.Handle,
               0,0,bmp.Width,bmp.Height,SRCCOPY);
    end;

  Result:=tmp.ReleaseHandle();

  FreeAndNil(bmp);
  FreeAndNil(tmp);
  except
    Result:=0;
  end;
end;

function kOpenStrTh(str: TStream; width, height: integer; fill_color: TColor; center: boolean):HBITMAP; stdcall;
var
  bmp, tmp: TBitmap;
  x_coeff, y_coeff: double;
  correction: integer; 
begin
try
  bmp:=TBitmap.Create();
  bmp.Handle:=kOpenStr(str);

  tmp:=TBitmap.Create();
  tmp.Canvas.Brush.Color:=fill_color;
  tmp.Width:=width;
  tmp.Height:=height;
  SetStretchBltMode(tmp.Canvas.Handle,COLORONCOLOR);

  // counting coeff values
  x_coeff:=width/bmp.Width;
  y_coeff:=height/bmp.Height;

  // comparing
  if ((bmp.Height*x_coeff)<height) then
    begin
    // fitting to width
    if center then
      correction:=Round((height-Round(bmp.Height*x_coeff))/2)
    else
      correction:=0;

    StretchBlt(tmp.Canvas.Handle,0,correction,width,Round(bmp.Height*x_coeff),bmp.Canvas.Handle,
               0,0,bmp.Width,bmp.Height,SRCCOPY);
    end
  else
    begin
    // fitting to height
    if center then
      correction:=Round((width-Round(bmp.Width*y_coeff))/2)
    else
      correction:=0;

    StretchBlt(tmp.Canvas.Handle,correction,0,Round(bmp.Width*y_coeff),height,bmp.Canvas.Handle,
               0,0,bmp.Width,bmp.Height,SRCCOPY);
    end;

  Result:=tmp.ReleaseHandle();

  FreeAndNil(bmp);
  FreeAndNil(tmp);
  except
    Result:=0;
  end;
end;

exports
  kOpen, kOpenStr, kOpenTh, kOpenStrTh;

begin
end.
 
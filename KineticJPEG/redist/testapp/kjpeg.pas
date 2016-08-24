// kJPEG header
unit kjpeg;

interface

uses
  Windows, Classes, Messages, Graphics;

type
  TkOpen = function(filename: PChar):HBITMAP; stdcall;
  TkOpenStr = function(str: TStream):HBITMAP; stdcall;
  TkOpenTh = function(filename: PChar; width, height: integer; fill_color: TColor; center: boolean):HBITMAP; stdcall;
  TkOpenStrTh = function(str: TStream; width, height: integer; fill_color: TColor; center: boolean):HBITMAP; stdcall;

implementation

end.

program ScreenPaintApp;

uses
  Forms,
  Windows,
  SysUtils,
  TlHelp32,
  ScreenPaintUnit in 'ScreenPaintUnit.pas' {FormScreenPaint},
  CommonFunctions51 in 'CommonFunctions51.pas',
  CursorResource21 in 'CursorResource21.pas',
  GraphicFunctions51 in 'GraphicFunctions51.pas',
  LovelyPaint21 in 'LovelyPaint21.pas',
  ShapeUtils21 in 'ShapeUtils21.pas',
  CRCUtils21 in 'CRCUtils21.pas',
  StringFunctions51 in 'StringFunctions51.pas',
  DibGraphic21 in 'DibGraphic21.pas',
  LovelyPanels21 in 'LovelyPanels21.pas',
  VectorSelectBoxUnit in 'VectorSelectBoxUnit.pas' {FormVectorSelectBox},
  VertexButton21 in 'VertexButton21.pas',
  pngimage in '..\lib\PNGImage\pngimage.pas',
  pnglang in '..\lib\PNGImage\pnglang.pas',
  pngzlib in '..\lib\PNGImage\pngzlib.pas';

{$R *.res}

type
  TProcessWindowInfo = record // 进程窗体信息
    rProcessID: THandle; // [in] 进程ID
    rWindowClass: string; // [in] 窗体类名
    rWindowHandle: THandle; // [out] 窗体ID
  end;
  PProcessWindowInfo = ^TProcessWindowInfo;

function EnumWindowsProc(
  hwnd: HWND; // handle to parent window
  lParam: LPARAM // application-defined value
): BOOL; stdcall;
var
  vProcessID: THandle;
  vBuffer: array[0..255] of Char;
begin
  Result := True;
  GetWindowThreadProcessId(hwnd, vProcessID);
  with PProcessWindowInfo(lParam)^ do
    if vProcessID = rProcessID then
    begin
      GetClassName(hwnd, vBuffer, SizeOf(vBuffer));
      if SameText(vBuffer, rWindowClass) then
      begin
        rWindowHandle := hwnd;
        Result := False;
      end;
    end;
end;

var
  vSnapshot: THandle;
  vProcessEntry32: TProcessEntry32;
  vExeName: string;
  vProcessWindowInfo: TProcessWindowInfo;
  vAtom: TAtom;
  vResult: THandle;
begin
  ///////Begin 检查是否已经开启了程序                                           //2011-04-01 ZswangY37 No.2
  vExeName := ExtractFileName(ParamStr(0));
  vSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  try
    vProcessEntry32.dwSize := SizeOf(TProcessEntry32);
    if Process32First(vSnapshot, vProcessEntry32) then
      repeat
        if (vProcessEntry32.th32ProcessID <> GetCurrentProcessId) and
          SameText(ExtractFileName(vProcessEntry32.szExeFile), vExeName) then
        begin
          vProcessWindowInfo.rProcessID := vProcessEntry32.th32ProcessID;
          vProcessWindowInfo.rWindowClass := 'TFormScreenPaint';
          vProcessWindowInfo.rWindowHandle := 0;
          EnumWindows(@EnumWindowsProc, Integer(@vProcessWindowInfo));
          if vProcessWindowInfo.rWindowHandle <> 0 then
          begin
            if ParamStr(1) <> '' then // 传递程序参数
            begin
              { TODO -c2006.10.18 -oZswangY32 : 检查程序参数的正确性 }
              vAtom := GlobalAddAtom(PChar(ParamStr(1)));
              SendMessageTimeOut(vProcessWindowInfo.rWindowHandle, MY_PLAY,
                vAtom, GetCurrentProcessId, SMTO_NORMAL, 1000, vResult);
              GlobalDeleteAtom(vAtom);
            end;
            Exit;
          end;
        end;
      until not Process32Next(vSnapshot, vProcessEntry32);
  finally
    CloseHandle(vSnapshot);
  end;
  ///////End 检查是否已经开启了程序

  Application.Initialize;
  Application.CreateForm(TFormScreenPaint, FormScreenPaint);
  Application.Run;
end.

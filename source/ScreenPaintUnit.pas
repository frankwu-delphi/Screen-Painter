(*//
标题：屏幕画板
说明：切屏绘制
设计：ZswangY37
日期：2011-03-30
支持：wjhu111#21cn.com
//*)

//*******Begin 修改日志*******//
//----------------------------------------------------------------------1.00.002
//2011-03-30 ZswangY37 No.1 建立 右键菜单，选择颜色、图形、粗细、编辑模式
//----------------------------------------------------------------------1.00.003
//2011-03-31 ZswangY37 No.1 完善 显示时控件获得焦点
//2011-03-31 ZswangY37 No.2 完善 修改模式不做状态保存
//----------------------------------------------------------------------1.00.004
//2011-04-01 ZswangY37 No.1 完善 快捷键加上alt避免文字输入时冲突
//2011-04-01 ZswangY37 No.2 完善 只能启动一个实例
//----------------------------------------------------------------------1.00.005
//2011-04-02 ZswangY37 No.1 完善 可以选择是否抓取鼠标指针图案
//2011-04-02 ZswangY37 No.2 完善 添加截屏功能
//2011-04-02 ZswangY37 No.3 完善 监听任务栏崩溃重建的消息
//2011-04-03 ZswangY37 No.1 完善 开启文件保存和加载的功能
//2011-04-03 ZswangY37 No.2 完善 加快鼠标停留在边缘的滚动
//*******End 修改日志*******//

unit ScreenPaintUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, LovelyPaint21, ActnList, StdActns, AppEvnts,
  StdCtrls, ExtDlgs, System.Actions;

const
  WM_ICONEVENT = WM_USER + 10; //托盘图标消息
  MY_PLAY = WM_USER + $5001; //启动

var
  WM_TASKBARCREATED: DWORD; //任务拦重建消息
  
const cIconIdent = 4587;
const cHotKeyWinP = 1007;
const cHotKeyWinZ = 1008;

const
  cFileExt = '.paint';

type
  TFormScreenPaint = class(TForm)
    PopupMenuJug: TPopupMenu;
    MenuItemCloseA: TMenuItem;
    PopupMenuPaint: TPopupMenu;
    ActionListOne: TActionList;
    MenuItemShape: TMenuItem;
    MenuItemColor: TMenuItem;
    MenuItemPenWidth: TMenuItem;
    MenuItemPen: TMenuItem;
    MenuItemLine: TMenuItem;
    MenuItemArrow: TMenuItem;
    MenuItemRectangle: TMenuItem;
    MenuItemElipse: TMenuItem;
    MenuItemMoreShape: TMenuItem;
    MenuItemBlack: TMenuItem;
    MenuItemRed: TMenuItem;
    MenuItemWhite: TMenuItem;
    MenuItemGreen: TMenuItem;
    MenuItemMoreColor: TMenuItem;
    MenuItem3Pixel: TMenuItem;
    MenuItem4Pixel: TMenuItem;
    MenuItem5Pixel: TMenuItem;
    MenuItemText: TMenuItem;
    MenuItemRestore: TMenuItem;
    MenuItemPlayA: TMenuItem;
    ActionPlay: TAction;
    ActionClose: TAction;
    MenuItem6Pixel: TMenuItem;
    MenuItemLineG: TMenuItem;
    ActionStop: TAction;
    TimerPlay: TTimer;
    ActionPen: TAction;
    ActionLine: TAction;
    ActionRectangle: TAction;
    ActionArrow: TAction;
    ActionText: TAction;
    ActionMoreShape: TAction;
    MenuItemLineK: TMenuItem;
    MenuItemCloseB: TMenuItem;
    ActionEllipse: TAction;
    ActionBlack: TAction;
    ActionRed: TAction;
    ActionGreen: TAction;
    ActionWhite: TAction;
    ActionMoreColor: TAction;
    Action3Pixel: TAction;
    Action4Pixel: TAction;
    Action6Pixel: TAction;
    Action5Pixel: TAction;
    ActionSky: TAction;
    MenuItemSky: TMenuItem;
    MenuItemModify: TMenuItem;
    ActionModify: TAction;
    ColorDialogOne: TColorDialog;
    ActionBlog: TAction;
    ActionSaveToFile: TAction;
    OpenDialogOne: TOpenDialog;
    SaveDialogOne: TSaveDialog;
    ActionFileShell: TAction;
    MenuItemEdit: TMenuItem;
    ActionCopy: TAction;
    ActionPaste: TAction;
    ActionUndo: TAction;
    ActionRedo: TAction;
    ActionCut: TAction;
    ActionDelete: TAction;
    ActionSelectAll: TAction;
    MenuItemCopyB: TMenuItem;
    MenuItemPaste: TMenuItem;
    MenuItemCut: TMenuItem;
    MenuItemDelete: TMenuItem;
    MenuItemSelectAll: TMenuItem;
    MenuItemUndoB: TMenuItem;
    MenuItemRedo: TMenuItem;
    MenuItemLineI: TMenuItem;
    MenuItemLineJ: TMenuItem;
    ActionPhoto: TAction;
    MenuItemPhotoB: TMenuItem;
    ActiveCursor: TAction;
    ActionLoadFromFile: TAction;
    MenuItemFile: TMenuItem;
    MenuItemSaveToFile: TMenuItem;
    MenuItemLoadFromFIle: TMenuItem;
    MenuItemLineD: TMenuItem;
    MenuItemLineE: TMenuItem;
    MenuItemFileShellB: TMenuItem;
    MenuItemLineF: TMenuItem;
    Action10Pixel: TAction;
    MenuItem10Pixel: TMenuItem;
    ActionLiveUpdate: TAction;
    ActionSaveToPng: TAction;
    SavePictureDialogOne: TSavePictureDialog;
    png1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionPlayExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionStopExecute(Sender: TObject);
    procedure TimerPlayTimer(Sender: TObject);
    procedure ActionPenExecute(Sender: TObject);
    procedure ActionLineExecute(Sender: TObject);
    procedure ActionRectangleExecute(Sender: TObject);
    procedure ActionArrowExecute(Sender: TObject);
    procedure ActionTextExecute(Sender: TObject);
    procedure ActionMoreShapeExecute(Sender: TObject);
    procedure ActionEllipseExecute(Sender: TObject);
    procedure ActionBlackExecute(Sender: TObject);
    procedure ActionRedExecute(Sender: TObject);
    procedure ActionGreenExecute(Sender: TObject);
    procedure ActionSkyExecute(Sender: TObject);
    procedure ActionWhiteExecute(Sender: TObject);
    procedure ActionMoreColorExecute(Sender: TObject);
    procedure Action3PixelExecute(Sender: TObject);
    procedure Action4PixelExecute(Sender: TObject);
    procedure Action5PixelExecute(Sender: TObject);
    procedure Action6PixelExecute(Sender: TObject);
    procedure ActionModifyExecute(Sender: TObject);
    procedure ActionFileShellExecute(Sender: TObject);
    procedure ActionListOneUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure ActionCopyExecute(Sender: TObject);
    procedure ActionCutExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionSelectAllExecute(Sender: TObject);
    procedure ActionPasteExecute(Sender: TObject);
    procedure ActionUndoExecute(Sender: TObject);
    procedure ActionRedoExecute(Sender: TObject);
    procedure ActionPhotoExecute(Sender: TObject);
    procedure ActionSaveToFileExecute(Sender: TObject);
    procedure ActionLoadFromFileExecute(Sender: TObject);
    procedure Action10PixelExecute(Sender: TObject);
    procedure ActionSaveToPngExecute(Sender: TObject);
  protected
    procedure WndProc(var Message: TMessage); override;
  private
    { Private declarations }
    FLovelyPaint: TLovelyPaint21;
    FPenWidth: Integer;
    FPenColor: TColor;
    FShapeTool: TShapeTools;
    FShapeType: Byte;
    FShapeTranslucency: Boolean; // 是否透明
    FSelectModel: string;
    FRegistryShell: Boolean;
    FFileName: string;
    procedure AddNotifyIcon; //添加托盘图标
    procedure WMICONEVENT(var Msg: TMessage); message WM_ICONEVENT;
    procedure WMSYSCOMMAND(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure WMHOTKEY(var Msg: TWMHOTKEY); message WM_HOTKEY;
    procedure MYPLAY(var Msg: TMessage); message MY_PLAY; // 让右键菜单消逝

    function IsRegistryShell: Boolean;
    procedure RegistryShell;
    procedure UnregistryShell;
    procedure OpenFile(AFileName: string);
  public
    { Public declarations }
    procedure ReloadScreen;
    procedure Play;
    procedure Stop;
  end;

var
  FormScreenPaint: TFormScreenPaint;

implementation

{$R *.dfm}

uses StringFunctions51, CommonFunctions51, GraphicFunctions51, ShapeUtils21, ShellAPI,
  Registry, ShlObj, IniFiles, PngImage, Clipbrd;

procedure TFormScreenPaint.AddNotifyIcon;
var
  vNotifyIconData: TNotifyIconData;
begin
  vNotifyIconData.cbSize := SizeOf(vNotifyIconData);
  vNotifyIconData.Wnd := Handle;
  vNotifyIconData.uID := cIconIdent;
  vNotifyIconData.uFlags:= NIF_ICON or NIF_MESSAGE or NIF_TIP;
  vNotifyIconData.uCallbackMessage := WM_ICONEVENT;
  vNotifyIconData.hIcon := Application.Icon.Handle;
  StrLCopy(vNotifyIconData.szTip, PChar(Application.Title), 64);
  Shell_NotifyIcon(NIM_ADD, @vNotifyIconData);
end;

procedure TFormScreenPaint.FormCreate(Sender: TObject);
begin
  Font.Assign(Screen.MenuFont);
  Application.Title := vModuleVersionInfomation.rProductName + '-' +
    vModuleVersionInfomation.rProductVersion;
  Application.HelpFile := ChangeFileExt(ParamStr(0), '.hlp');
  Caption := Application.Title;

  with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do try
    Font.Name := ReadString(Self.ClassName, 'Font.Name', Font.Name);
    Font.Size := ReadInteger(Self.ClassName, 'Font.Size', Font.Size);
    try
      Font.Color := StringToColor(ReadString(Self.ClassName, 'Font.Color',
        ColorToString(Font.Color)));
    except
    end;

    FPenWidth := ReadInteger(Self.ClassName, 'PenWidth', 3);
    FPenColor := ReadInteger(Self.ClassName, 'PenColor', clBlack);
    FShapeType := ReadInteger(Self.ClassName, 'ShapeType', stPen);
    FSelectModel := ReadString(Self.ClassName, 'SelectModel', '');
    FShapeTranslucency := ReadBool(Self.ClassName, 'ShapeTranslucency', False);
  finally
    Free;
  end;
  FShapeTool := pstPaint;
  Stop;
  AddNotifyIcon;
  RegisterHotKey(Handle, cHotKeyWinP, MOD_WIN, VK_P);
  RegisterHotKey(Handle, cHotKeyWinZ, MOD_WIN, VK_Z);
  FRegistryShell := IsRegistryShell;
  if FileExists(ParamStr(1)) then OpenFile(ParamStr(1));
end;

procedure TFormScreenPaint.ReloadScreen;
var
  vBitmap: TBitmap;
begin
  vBitmap := TBitmap.Create;
  TakeDesktop(vBitmap, Screen.DesktopRect, ActiveCursor.Checked);

  Top := 0;
  Left := 0;
  Width := Screen.Width;
  Height := Screen.Height;
  if Assigned(FLovelyPaint) then FLovelyPaint.Free;
  FLovelyPaint := TLovelyPaint21.Create(nil);
  FLovelyPaint.Parent := Self;
  FLovelyPaint.Align := alClient;
  FLovelyPaint.Width := Width;
  FLovelyPaint.Height := Height;
  FLovelyPaint.Clear;
  FLovelyPaint.VectorShapePath := ExePath + 'vector';
  FLovelyPaint.SetBackGraphic(vBitmap);
  FLovelyPaint.SelectShape := FShapeType;
  FLovelyPaint.SelectPenColor := FPenColor;
  FLovelyPaint.SelectTextColor := FLovelyPaint.SelectPenColor;
  FLovelyPaint.SelectTools := FShapeTool;
  FLovelyPaint.SelectPenWidth := FPenWidth;
  FLovelyPaint.SelectModel := FSelectModel;
  FLovelyPaint.SelectTranslucency := FShapeTranslucency;
  FLovelyPaint.BorderWidth := 0;
  FLovelyPaint.IsScreenPaint := True;
  FLovelyPaint.PopupMenu := PopupMenuPaint;
  FLovelyPaint.SelectTextSize := 12;
  ActiveControl := FLovelyPaint;
  vBitmap.Free;
end;

procedure TFormScreenPaint.WMICONEVENT(var Msg: TMessage);
begin                                                                        
  case Msg.LParam of
    WM_LBUTTONDBLCLK:
      begin
        ActionPlay.Execute;
      end;
    WM_RBUTTONDOWN:
      begin
        SetForegroundWindow(Handle);
        Application.ProcessMessages;
        PopupMenuJug.PopupComponent := Self;
        PopupMenuJug.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
        PostMessage(Handle, WM_NULL, 0, 0);
      end;
  end;
end;

procedure TFormScreenPaint.WMSYSCOMMAND(var Msg: TWMSysCommand);
begin
  inherited;
  case Msg.CmdType of
    SC_MINIMIZE: Stop;
  end;
end;

procedure TFormScreenPaint.FormDestroy(Sender: TObject);
var
  vNotifyIconData: TNotifyIconData;
begin
  with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do try
    WriteInteger(Self.ClassName, 'PenWidth', FPenWidth);
    WriteInteger(Self.ClassName, 'PenColor', FPenColor);
    WriteInteger(Self.ClassName, 'ShapeType', FShapeType);
    WriteString(Self.ClassName, 'SelectModel', FSelectModel);
  finally
    Free;
  end;

  vNotifyIconData.cbSize := SizeOf(vNotifyIconData);
  vNotifyIconData.Wnd := Handle;
  vNotifyIconData.uID := cIconIdent;
  Shell_NotifyIcon(NIM_DELETE, @vNotifyIconData);
  UnregisterHotKey(Handle, cHotKeyWinP);
  UnregisterHotKey(Handle, cHotKeyWinZ);
end;

procedure TFormScreenPaint.WMHOTKEY(var Msg: TWMHOTKEY);
begin
  case Msg.HotKey of
    cHotKeyWinP, cHotKeyWinZ: if Assigned(FLovelyPaint) then Stop else Play;
  end;
end;

procedure TFormScreenPaint.Play;
begin
  if Assigned(FLovelyPaint) then Exit;
  ReloadScreen;
  Application.ShowMainForm := True;
  Show;
  ForceForegroundWindow(Handle);
end;

procedure TFormScreenPaint.Stop;
begin
  Application.ShowMainForm := False;
  Hide;
  if Assigned(FLovelyPaint) then FLovelyPaint.Free;
  FLovelyPaint := nil;
end;

procedure TFormScreenPaint.ActionPlayExecute(Sender: TObject);
begin
  TimerPlay.Enabled := True;
//  PostMessage(Handle, MY_PLAY, 0, 0);
end;

procedure TFormScreenPaint.ActionCloseExecute(Sender: TObject);
begin
  Stop;
  Close;
end;

procedure TFormScreenPaint.MYPLAY(var Msg: TMessage);
var vBuffer: array[0..MAX_PATH]of Char;
begin
  GlobalGetAtomName(Msg.WParam, vBuffer, SizeOf(vBuffer));
  OpenFile(vBuffer);
end;

procedure TFormScreenPaint.ActionStopExecute(Sender: TObject);
begin
  Stop;
end;

procedure TFormScreenPaint.TimerPlayTimer(Sender: TObject);
begin
  TimerPlay.Enabled := False;
  Play;
end;

procedure TFormScreenPaint.ActionPenExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectTools := pstPaint;
  FLovelyPaint.SelectShape := stPen;
  FShapeTool := FLovelyPaint.SelectTools;
  FShapeType := FLovelyPaint.SelectShape;
end;

procedure TFormScreenPaint.ActionLineExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectTools := pstPaint;
  FLovelyPaint.SelectShape := stLine;
  FShapeTool := FLovelyPaint.SelectTools;
  FShapeType := FLovelyPaint.SelectShape;
end;

procedure TFormScreenPaint.ActionRectangleExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectTools := pstPaint;
  FLovelyPaint.SelectShape := stHollowRectangle;
  FShapeTool := FLovelyPaint.SelectTools;
  FShapeType := FLovelyPaint.SelectShape;
end;

procedure TFormScreenPaint.ActionArrowExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectTools := pstPaint;
  FLovelyPaint.SelectShape := stSingleArrow;
  FShapeTool := FLovelyPaint.SelectTools;
  FShapeType := FLovelyPaint.SelectShape;
end;

procedure TFormScreenPaint.ActionTextExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectTools := pstPaint;
  FLovelyPaint.SelectShape := stMemo;
  FShapeTool := FLovelyPaint.SelectTools;
  FShapeType := FLovelyPaint.SelectShape;
end;

procedure TFormScreenPaint.ActionMoreShapeExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectTools := pstPaint;
  if not FLovelyPaint.SelectVectorShape then Exit;
  FShapeTool := FLovelyPaint.SelectTools;
  FShapeType := FLovelyPaint.SelectShape;
  FSelectModel := FLovelyPaint.SelectModel;
end;

procedure TFormScreenPaint.ActionEllipseExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectTools := pstPaint;
  FLovelyPaint.SelectShape := stHollowEllipse;
end;

procedure TFormScreenPaint.ActionBlackExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectPenColor := clBlack;
  FLovelyPaint.SelectTextColor := FLovelyPaint.SelectPenColor;
  FPenColor := FLovelyPaint.SelectPenColor;
end;

procedure TFormScreenPaint.ActionRedExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectPenColor := clRed;
  FLovelyPaint.SelectTextColor := FLovelyPaint.SelectPenColor;
  FPenColor := FLovelyPaint.SelectPenColor;
end;

procedure TFormScreenPaint.ActionGreenExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectPenColor := clGreen;
  FLovelyPaint.SelectTextColor := FLovelyPaint.SelectPenColor;
  FPenColor := FLovelyPaint.SelectPenColor;
end;

procedure TFormScreenPaint.ActionSkyExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectPenColor := clSkyBlue;
  FLovelyPaint.SelectTextColor := FLovelyPaint.SelectPenColor;
  FPenColor := FLovelyPaint.SelectPenColor;
end;

procedure TFormScreenPaint.ActionWhiteExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectPenColor := clWhite;
  FLovelyPaint.SelectTextColor := FLovelyPaint.SelectPenColor;
  FPenColor := FLovelyPaint.SelectPenColor;
end;

procedure TFormScreenPaint.ActionMoreColorExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  ColorDialogOne.Color := FLovelyPaint.SelectPenColor;
  if not ColorDialogOne.Execute then Exit;
  FLovelyPaint.SelectPenColor := ColorDialogOne.Color;
  FLovelyPaint.SelectTextColor := FLovelyPaint.SelectPenColor;
  FPenColor := FLovelyPaint.SelectPenColor;
end;

procedure TFormScreenPaint.Action3PixelExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  OutputDebugString(PChar(Format('Action3PixelExecute ．～%d', [GetTickCount])));
  FLovelyPaint.SelectPenWidth := 3;
  FPenWidth := FLovelyPaint.SelectPenWidth;
end;

procedure TFormScreenPaint.Action4PixelExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectPenWidth := 4;
  FPenWidth := FLovelyPaint.SelectPenWidth;
end;

procedure TFormScreenPaint.Action5PixelExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectPenWidth := 5;
  FPenWidth := FLovelyPaint.SelectPenWidth;
end;

procedure TFormScreenPaint.Action6PixelExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectPenWidth := 6;
  FPenWidth := FLovelyPaint.SelectPenWidth;
end;

procedure TFormScreenPaint.ActionModifyExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  if TAction(Sender).Checked then
    FLovelyPaint.SelectTools := pstModify
  else FLovelyPaint.SelectTools := pstPaint;
end;

function TFormScreenPaint.IsRegistryShell: Boolean;
begin
  Result := False;
  with TRegistry.Create() do try
    RootKey := HKEY_CLASSES_ROOT;
    if not OpenKey(cFileExt, False) then Exit;
    CloseKey;
    if not OpenKey('Screen Paint\shell\open\command', False) then Exit;
    if not SameText(ParamStr(0) + ' "%1"', ReadString('')) then Exit;
  finally
    Free;
  end;
  Result := True;
end;

procedure TFormScreenPaint.RegistryShell;
begin
  FRegistryShell := True;
  with TRegistry.Create do try
    RootKey := HKEY_CLASSES_ROOT;
    OpenKey(cFileExt, True);
    WriteString('', 'Screen Paint');
    CloseKey;
    OpenKey('Screen Paint\shell\open\command', True);
    WriteString('', ParamStr(0) + ' "%1"');
    CloseKey;
    OpenKey('Screen Paint\DefaultIcon', True);
    WriteString('', ParamStr(0) + ',0');
  finally
    Free;
  end;
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST or SHCNF_FLUSH, nil, nil);
end;

procedure TFormScreenPaint.UnregistryShell;
var
  vChangeRegistry: Boolean;
begin
  FRegistryShell := False;
  with TRegistry.Create do try
    RootKey := HKEY_CLASSES_ROOT;
    vChangeRegistry := DeleteKey(cFileExt) and DeleteKey('Screen Paint');
  finally
    Free;
  end;
  if vChangeRegistry then
    SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST or SHCNF_FLUSH, nil, nil);
end;

procedure TFormScreenPaint.ActionFileShellExecute(Sender: TObject);
begin
  if IsRegistryShell then
    UnregistryShell
  else RegistryShell;
end;

procedure TFormScreenPaint.ActionListOneUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  ActionCopy.Enabled := Assigned(FLovelyPaint) and (SendMessage(FLovelyPaint.Handle, LP_CANCOPY, 0, 0) <> 0);
  ActionCut.Enabled := Assigned(FLovelyPaint) and (SendMessage(FLovelyPaint.Handle, LP_CANCUT, 0, 0) <> 0);
  ActionSelectAll.Enabled := Assigned(FLovelyPaint) and (SendMessage(FLovelyPaint.Handle, LP_CANSELECTALL, 0, 0) <> 0);
  ActionDelete.Enabled := Assigned(FLovelyPaint) and (SendMessage(FLovelyPaint.Handle, LP_CANDELETE, 0, 0) <> 0);
  ActionPaste.Enabled := Assigned(FLovelyPaint) and (SendMessage(FLovelyPaint.Handle, LP_CANPASTE, 0, 0) <> 0);
  ActionUndo.Enabled := Assigned(FLovelyPaint) and (SendMessage(FLovelyPaint.Handle, LP_CANUNDO, 0, 0) <> 0);
  ActionRedo.Enabled := Assigned(FLovelyPaint) and (SendMessage(FLovelyPaint.Handle, LP_CANREDO, 0, 0) <> 0);

  ActionPhoto.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectTools = pstPhoto);
  ActionModify.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectTools = pstModify);

  ActionBlack.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectPenColor = clBlack);
  ActionRed.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectPenColor = clRed);
  ActionGreen.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectPenColor = clGreen);
  ActionSky.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectPenColor = clSkyBlue);
  ActionWhite.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectPenColor = clWhite);
  ActionMoreColor.Checked := not (ActionBlack.Checked or
    ActionRed.Checked or
    ActionGreen.Checked or
    ActionSky.Checked or
    ActionWhite.Checked
  );

  Action3Pixel.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectPenWidth = 3);
  Action4Pixel.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectPenWidth = 4);
  Action5Pixel.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectPenWidth = 5);
  Action6Pixel.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectPenWidth = 6);
  Action10Pixel.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectPenWidth = 10);

  ActionPen.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectShape = stPen);
  ActionLine.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectShape = stLine);
  ActionRectangle.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectShape = stHollowRectangle);
  ActionArrow.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectShape = stSingleArrow);
  ActionText.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectShape = stMemo);
  ActionMoreShape.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectShape = stVector);
  ActionEllipse.Checked := Assigned(FLovelyPaint) and (FLovelyPaint.SelectShape = stHollowEllipse);

  if FRegistryShell then
  begin
    ActionFileShell.Caption := '取消关联';
    ActionFileShell.Hint := Format('取消关联|取消"%s"文件关联', [cFileExt]);
  end else
  begin
    ActionFileShell.Caption := '文件关联';
    ActionFileShell.Hint := Format('文件关联|注册"%s"文件关联', [cFileExt]);
  end;
end;

procedure TFormScreenPaint.ActionCopyExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  SendMessage(FLovelyPaint.Handle, LP_COPY, 0, 0);
end;

procedure TFormScreenPaint.ActionCutExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  SendMessage(FLovelyPaint.Handle, LP_CUT, 0, 0);
end;

procedure TFormScreenPaint.ActionDeleteExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  SendMessage(FLovelyPaint.Handle, LP_DELETE, 0, 0);
end;

procedure TFormScreenPaint.ActionSelectAllExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  SendMessage(FLovelyPaint.Handle, LP_SELECTALL, 0, 0);
end;

procedure TFormScreenPaint.ActionPasteExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  SendMessage(FLovelyPaint.Handle, LP_PASTE, 0, 0);
end;

procedure TFormScreenPaint.ActionUndoExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  SendMessage(FLovelyPaint.Handle, LP_UNDO, 0, 0);
end;

procedure TFormScreenPaint.ActionRedoExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  SendMessage(FLovelyPaint.Handle, LP_REDO, 0, 0);
end;

procedure TFormScreenPaint.ActionPhotoExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectTools := pstPhoto;
end;

procedure TFormScreenPaint.ActionSaveToFileExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  if FFileName <> '' then
    SaveDialogOne.FileName := FFileName
  else SaveDialogOne.FileName := '未命名';

  if not SaveDialogOne.Execute then Exit;
  if ExtractFileExt(SaveDialogOne.FileName) = '' then
    case SaveDialogOne.FilterIndex of
      0, 1: SaveDialogOne.FileName := ChangeFileExt(SaveDialogOne.FileName,
        cFileExt);
    end;
  FFileName := SaveDialogOne.FileName;

  if FileExists(SaveDialogOne.FileName) and
    (MessageDlg(Format('文件"%s"已经存在，是否覆盖？',
    [SaveDialogOne.FileName]), mtWarning, [mbYes, mbNo], 0) <> mrYes) then Exit;
    
  FLovelyPaint.SaveToFile(FFileName);
end;

procedure TFormScreenPaint.ActionLoadFromFileExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  if not OpenDialogOne.Execute then Exit;
  if not FileExists(OpenDialogOne.FileName) then Exit;
  FLovelyPaint.LoadFromFile(OpenDialogOne.FileName);
end;

procedure TFormScreenPaint.OpenFile(AFileName: string);
begin
  FFileName := AFileName;
  OpenDialogOne.FileName := FFileName;
  if not Assigned(FLovelyPaint) then Play;
  if not FileExists(OpenDialogOne.FileName) then Exit;
  FLovelyPaint.LoadFromFile(OpenDialogOne.FileName);
end;

procedure TFormScreenPaint.WndProc(var Message: TMessage);
begin
  if Message.Msg = WM_TASKBARCREATED then begin
    AddNotifyIcon;
  end;
  inherited;
end;

procedure TFormScreenPaint.Action10PixelExecute(Sender: TObject);
begin
  if not Assigned(FLovelyPaint) then Exit;
  FLovelyPaint.SelectPenWidth := 10;
  FPenWidth := FLovelyPaint.SelectPenWidth;
end;

procedure TFormScreenPaint.ActionSaveToPngExecute(Sender: TObject);
var
  vBitmap: TBitmap;
  vPngObject: TPNGObject;
begin
  if not Clipboard.HasFormat(CF_BITMAP) then Exit;
  if not SavePictureDialogOne.Execute then Exit;
  if ExtractFileExt(SavePictureDialogOne.FileName) = '' then
    case SavePictureDialogOne.FilterIndex of
      0, 1: SavePictureDialogOne.FileName := ChangeFileExt(SavePictureDialogOne.FileName,
        '.png');
    end;
  if FileExists(SavePictureDialogOne.FileName) and
    (MessageDlg(Format('文件"%s"已经存在，是否覆盖？',
    [SavePictureDialogOne.FileName]), mtWarning, [mbYes, mbNo], 0) <> mrYes) then Exit;
  vBitmap := TBitmap.Create;
  vPngObject := TPNGObject.Create;
  try
    vBitmap.Assign(Clipboard);
    vPngObject.Assign(vBitmap);
    vPngObject.SaveToFile(SavePictureDialogOne.FileName);
  finally
    vBitmap.Free;
    vPngObject.Free;
  end;
end;

initialization
  WM_TASKBARCREATED := RegisterWindowMessage('TaskbarCreated');

finalization

end.

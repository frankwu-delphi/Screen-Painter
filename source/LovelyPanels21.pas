(*//
��Ŀ:LovelyComponents.LovelyPanel
�汾:2.0
����:������ͼƬ��͸�������
˵��:͸��ͨ����������ʵ��
����:2006-05-11
֧��:jihu.wang#gmail.com
���:ZswangY37
//*)

//*******Begin �޸���־*******//
//----------------------------------------------------------------------2.00.001
//2006-08-10 No.1 ZswangY37 ���� ����TurnLife�м���ģʽ��ʾ���жϣ�ɾ���ϴμ�ʱ��
//2006-08-10 No.2 ZswangY37 �ϲ� ��TLovelyFrame20�ϲ����õ�Ԫ
//2006-08-10 No.3 ZswangY37 ��� ClientSpace���Կ��ƿͻ���
//2006-11-12 No.1 ZswangY37 �Ż� ����DibGraphic�滻TBitmap�ϵ��ڴ��GDI��Դ
//2007-03-23 No.1 ZswangY37 ��� IconImages��IconIndex��IconLeft��IconTop����������ͼ����ʾ
//2007-05-16 No.1 ZswangY37 ���� ������͸��ʱҪ�ָ���������
//2007-05-16 No.2 ZswangY37 ���� TLovelyPanel֧�ָı��С
//2007-05-17 No.1 ZswangY37 ���� ����Ƴ�����ָ����ָ��ͼ��
//2007-06-14 No.1 ZswangY37 ��� TCustomLovelyPanel20����
//2007-06-14 No.2 ZswangY37 �ϲ� ��TVertexPanel20�ϲ����õ�Ԫ
//*******End �޸���־*******//

unit LovelyPanels21;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Graphics, Forms, DibGraphic21,
  ImgList;

type
  TRectangleInfo = record
    rType: Char; // V���򽥱�,H���򽥱�,Rʵ�ľ���,r���ľ���
    rLeftSpace: Integer;
    rRightSpace: Integer;
    rTopSpace: Integer;
    rBottomSpace: Integer;
    rWidth: Integer;
    rHeight: Integer;
    rColor1: TColor;
    rColor2: TColor;
  end;
  
type
  TCustomLovelyPanel21 = class(TCustomControl)
  private
    FLockedPoint: Boolean;
    FModaling: Boolean;
    FHasResize: Boolean;
    FIconTop: Integer;
    FIconLeft: Integer;
    FLifeValue: Integer;
    FTitleRight: Integer;
    FLifeCount: Integer;
    FTitleTop: Integer;
    FIconIndex: Integer;
    FTitleHeight: Integer;
    FTitleLeft: Integer;
    FTitleAlignment: TAlignment;
    FTitleShadowColor: TColor;
    FTitleColor: TColor;
    FIconImages: TCustomImageList;
    FModalResult: TModalResult;
    FOnLifeChange: TNotifyEvent;
    FClientSpace: TRect; // �ͻ�����С
    FSizeRect: array[0..8] of TRect;
    FSizing: Integer;
    FIconImagesChangeLink: TChangeLink;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;       //2007-05-17 ZswangY37 No.1

    procedure SetTitleHeight(const Value: Integer);
    procedure SetTitleLeft(const Value: Integer);
    procedure SetTitleRight(const Value: Integer);
    procedure SetTitleShadowColor(const Value: TColor);
    procedure SetTitleColor(const Value: TColor);
    procedure SetTitleAlignment(const Value: TAlignment);
    procedure SetTitleTop(const Value: Integer);
    procedure SetClientSpace(const Index, Value: Integer);
    procedure SetIconImages(const Value: TCustomImageList);
    procedure SetIconIndex(const Value: Integer);
    procedure SetIconLeft(const Value: Integer);
    procedure SetIconTop(const Value: Integer);
  protected
    { Protected declarations }
    procedure Paint; override;
    procedure Resize; override;
    procedure SetLifeValue(const Value: Integer); virtual;
    procedure DrawCaption; virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure AdjustClientRect(var Rect: TRect); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure PictureChanged(Sender: TObject); virtual;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ShowModal: Integer; virtual; //ģ̬��ʾ
    procedure TurnLife; virtual; //��ģ̬�´��
    property ModalResult: TModalResult read FModalResult write FModalResult; //ģ̬����ֵ
    property Modaling: Boolean read FModaling write FModaling; //�Ƿ���ģ̬��ʾ��
    property LifeValue: Integer read FLifeValue write SetLifeValue; //�ȴ�ʱ��
    procedure WMTimer(var Msg: TWMTimer); message WM_TIMER;
  published
    { Published declarations }
    property IconIndex: Integer read FIconIndex write SetIconIndex; //ͼ�����
    property IconImages: TCustomImageList read FIconImages write SetIconImages; //ͼ�꼯
    property IconLeft: Integer read FIconLeft write SetIconLeft; //ͼ����߾�
    property IconTop: Integer read FIconTop write SetIconTop; //ͼ���ϱ߾�

    property TitleHeight: Integer read FTitleHeight write SetTitleHeight; //����߶�
    property TitleLeft: Integer read FTitleLeft write SetTitleLeft; //�������߽�
    property TitleRight: Integer read FTitleRight write SetTitleRight; //������ұ߽�
    property TitleTop: Integer read FTitleTop write SetTitleTop; //������ϱ߽�
    property TitleAlignment: TAlignment read FTitleAlignment write SetTitleAlignment; //����Ķ��뷽ʽ
    property TitleColor: TColor read FTitleColor write SetTitleColor default clBlack; //�������ɫ
    property TitleShadowColor: TColor read FTitleShadowColor write SetTitleShadowColor default clNone; //������Ӱ����ɫ�����ΪclNone����ʾ
    property LifeCount: Integer read FLifeCount write FLifeCount; //���ȴ�ʱ��
    property OnLifeChange: TNotifyEvent read FOnLifeChange write FOnLifeChange; //���������仯
    property LockedPoint: Boolean read FLockedPoint write FLockedPoint default True; //����λ��
    property ClientLeftSpace: Integer index 0 read FClientSpace.Left write SetClientSpace; //�ͻ�����߽�
    property ClientTopSpace: Integer index 1 read FClientSpace.Top write SetClientSpace; //�ͻ����ϱ߽�
    property ClientRightSpace: Integer index 2 read FClientSpace.Right write SetClientSpace; //�ͻ����ұ߽�
    property ClientBottomSpace: Integer index 3 read FClientSpace.Bottom write SetClientSpace; //�ͻ����±߽�
    property HasResize: Boolean read FHasResize write FHasResize default True; //�Ƿ���Ըı��С

    property Align;
    property Anchors;
    property Caption;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Color;
    property Font;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property ParentFont;
    property PopupMenu;
    property Visible;

    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

  TVertexPanel21 = class(TCustomLovelyPanel21)                                  //2007-06-14 No.2 ZswangY37
  private
    { Private declarations }
    FRectangles: array of TRectangleInfo;
    FStrings: TStrings;
    procedure SetStrings(const Value: TStrings);
    procedure StringsChange(Sender: TObject);
  protected
    { Protected declarations }
    procedure Paint; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property Strings: TStrings read FStrings write SetStrings;
  end;

  TLovelyPanel20 = class(TCustomLovelyPanel21)
  private
    { Private declarations }
    FCenter: TPoint;
    FPicture: TPicture;
    FFaceBitmap: TDibGraphic;
    FTransparentColor: TColor; //͸��ɫ
    FTransparentSpace: Integer; //͸������
    procedure SetCenter(const Index: Integer; const Value: Integer);
    procedure SetPicture(const Value: TPicture);
    procedure SetTransparentColor(const Value: TColor);
    procedure SetTransparentSpace(const Value: Integer);
  protected
    { Protected declarations }
    procedure DrawFace; virtual;
    procedure Paint; override;
    procedure Resize; override;
    procedure PictureChanged(Sender: TObject); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property TransparentColor: TColor read FTransparentColor write SetTransparentColor default clFuchsia; //͸��ɫ�����ΪclNone�򲻴���
    property TransparentSpace: Integer read FTransparentSpace write SetTransparentSpace; //͸�������
    property Picture: TPicture read FPicture write SetPicture; //����ͼƬ//������
    property CenterX: Integer index 0 read FCenter.X write SetCenter; //�����е�
    property CenterY: Integer index 1 read FCenter.Y write SetCenter; //�����е�
  end;

  TLovelyFrame20 = class(TLovelyPanel20)
  private
    FParentBoundsRect: TRect;
    FParentWindowProc: TWndMethod;
    FParentAutoScroll: Boolean;
    procedure ParentWindowProc(var Message: TMessage);
  protected
    procedure DrawFace; override;
    procedure SetParent(AParent: TWinControl); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure DblClick; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property HasResize default True;
    property LockedPoint default False;
  end;
  
procedure Register;

function TextToRectangle(
  AText: string
): TRectangleInfo;

function DrawRectangle(
  ACanvas: TCanvas;
  ARectangleInfo: TRectangleInfo;
  AWidth: Integer;
  AHeight: Integer
): Boolean;

implementation

uses Math, GraphicFunctions51, StringFunctions51, CommonFunctions51;

procedure Register;
begin
  RegisterComponents('Lovely20', [TLovelyPanel20]);
  RegisterComponents('Lovely20', [TLovelyFrame20]);
  RegisterComponents('Lovely20', [TVertexPanel21]);
end;

const
  ID_TIMER_SHOWMODAL = 1;
  ID_TIMER_TURNLIFE = 2;

const
  cSizeCursors: array[0..8] of TCursor = (
crSizeNS, //��
crSizeNESW, //����
crSizeWE, //��
crSizeNWSE, //����
crSizeNS, //��
crSizeNESW, //����
crSizeWE, //��
crSizeNWSE, //����
crDefault //����
  );
  cSizeCommand: array[0..8] of Integer = (
SC_SIZE + WMSZ_TOP, //��
SC_SIZE + WMSZ_TOPRIGHT, //����
SC_SIZE + WMSZ_RIGHT, //�� //*
SC_SIZE + WMSZ_BOTTOMRIGHT, //���� //*
SC_SIZE + WMSZ_BOTTOM, //�� //*
SC_SIZE + WMSZ_BOTTOMLEFT, //����
SC_SIZE + WMSZ_LEFT, //��
SC_SIZE + WMSZ_TOPLEFT, //����
SC_MOVE + WMSZ_TOP //����
);

function TextToRectangle(
  AText: string
): TRectangleInfo;
begin
  Result.rType := (ListValue(AText, 0) + '!')[1];
  Result.rLeftSpace := StrToIntDef(ListValue(AText, 1), -1);
  Result.rTopSpace := StrToIntDef(ListValue(AText, 2), -1);
  Result.rRightSpace := StrToIntDef(ListValue(AText, 3), -1);
  Result.rBottomSpace := StrToIntDef(ListValue(AText, 4), -1);
  Result.rWidth := StrToIntDef(ListValue(AText, 5), -1);
  Result.rHeight := StrToIntDef(ListValue(AText, 6), -1);
  Result.rColor1 := StrToIntDef(ListValue(AText, 7), 0);
  Result.rColor2 := StrToIntDef(ListValue(AText, 8), 0);
end; { TextToRectangle }

function DrawRectangle(
  ACanvas: TCanvas;
  ARectangleInfo: TRectangleInfo;
  AWidth: Integer;
  AHeight: Integer
): Boolean;
var
  vRect: TRect;
  vTriVertex: array[0..1] of TTriVertex;
  vGradientRect: TGradientRect;
begin
  Result := False;
  if not Assigned(ACanvas) then Exit;
  if ARectangleInfo.rLeftSpace >= 0 then
    vRect.Left := ARectangleInfo.rLeftSpace
  else if ARectangleInfo.rRightSpace >= 0 then
    vRect.Left := AWidth - ARectangleInfo.rRightSpace - ARectangleInfo.rWidth
  else vRect.Left := (AWidth - ARectangleInfo.rWidth) div 2;

  if ARectangleInfo.rRightSpace >= 0 then
    vRect.Right := AWidth - ARectangleInfo.rRightSpace
  else if ARectangleInfo.rLeftSpace >= 0 then
    vRect.Right := ARectangleInfo.rLeftSpace + ARectangleInfo.rWidth
  else vRect.Right := (AWidth - ARectangleInfo.rWidth) div 2 +
    ARectangleInfo.rWidth;

  if ARectangleInfo.rTopSpace >= 0 then
    vRect.Top := ARectangleInfo.rTopSpace
  else if ARectangleInfo.rBottomSpace >= 0 then
    vRect.Top := AHeight - ARectangleInfo.rTopSpace - ARectangleInfo.rHeight
  else vRect.Top := (AHeight - ARectangleInfo.rHeight) div 2;

  if ARectangleInfo.rBottomSpace >= 0 then
    vRect.Bottom := AHeight - ARectangleInfo.rBottomSpace
  else if ARectangleInfo.rTopSpace >= 0 then
    vRect.Bottom := ARectangleInfo.rTopSpace + ARectangleInfo.rHeight
  else vRect.Top := (AHeight - ARectangleInfo.rHeight) div 2 +
    ARectangleInfo.rHeight;

  case ARectangleInfo.rType of
    'V':
      begin
        vTriVertex[0] := InitTriVertex(vRect.TopLeft, ARectangleInfo.rColor1);
        vTriVertex[1] := InitTriVertex(vRect.BottomRight, ARectangleInfo.rColor2);
        vGradientRect.UpperLeft := 1;
        vGradientRect.LowerRight := 0;
        GradientFill(ACanvas.Handle, @vTriVertex[0], Length(vTriVertex),
          @vGradientRect, 1, GRADIENT_FILL_RECT_V);
      end;
    'H':
      begin
        vTriVertex[0] := InitTriVertex(vRect.TopLeft, ARectangleInfo.rColor1);
        vTriVertex[1] := InitTriVertex(vRect.BottomRight, ARectangleInfo.rColor2);
        vGradientRect.UpperLeft := 1;
        vGradientRect.LowerRight := 0;
        GradientFill(ACanvas.Handle, @vTriVertex[0], Length(vTriVertex),
          @vGradientRect, 1, GRADIENT_FILL_RECT_H);
      end;
    'R':
      begin
        ACanvas.Pen.Color := ARectangleInfo.rColor1;
        ACanvas.Brush.Color := ARectangleInfo.rColor2;
        ACanvas.Rectangle(vRect);
      end;
    'r':
      begin
        ACanvas.Pen.Color := ARectangleInfo.rColor1;
        ACanvas.Brush.Style := bsClear;
        ACanvas.Rectangle(vRect);
      end;
  end;
  Result := True;
end; { DrawRectangle }

{ TLovelyPanel20 }

constructor TLovelyPanel20.Create(AOwner: TComponent);
begin
  inherited;
  FTransparentColor := clFuchsia;
  FPicture := TPicture.Create;
  FPicture.OnChange := PictureChanged;
  FFaceBitmap := TDibGraphic.Create;
end;

destructor TLovelyPanel20.Destroy;
begin
  if Assigned(FPicture) then FPicture.Free;
  if Assigned(FFaceBitmap) then FFaceBitmap.Free;
  inherited;
end;

procedure TLovelyPanel20.DrawFace;
var
  vBitmap: TBitmap;
  vRGN: HRGN;
begin
  if not Assigned(FFaceBitmap) then Exit;
  if not Assigned(FPicture) or not Assigned(FPicture.Graphic) then
  begin
    FFaceBitmap.Clear;
    Exit;
  end;
  FFaceBitmap.Update(FPicture.Graphic);
  if FTransparentColor = clNone then Exit; //����͸��
  if csDesigning in ComponentState then Exit;
  if not Assigned(Parent) then Exit;

  vBitmap := TBitmap.Create;
  try
    vBitmap.Width := Width;
    vBitmap.Height := Height;
    FFaceBitmap.StretchDraw(
      vBitmap.Canvas, 0, 0, Width, Height, FCenter);

    vRGN := GraphicToRGN(vBitmap, FTransparentColor, FTransparentSpace);
    SetWindowRgn(Handle, vRGN, True);
    DeleteObject(vRGN);
  finally
    vBitmap.Free;
  end;
end;

procedure TLovelyPanel20.Paint;
const
  cAlignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
var
  vRect: TRect;
begin
  inherited;
  if Assigned(FFaceBitmap) then
    FFaceBitmap.StretchDraw(
      Canvas, 0, 0, Width, Height, FCenter);

  Canvas.Font.Assign(Font);
  Canvas.Brush.Style := bsClear;

  ///////Begin ���Ʊ�������
  if (FTitleHeight > 0) and (Caption <> '') then
  begin
    vRect.Left := FTitleLeft;
    vRect.Top := FTitleTop;
    vRect.Right := Width - FTitleRight;
    vRect.Bottom := FTitleTop + FTitleHeight;
    if FTitleShadowColor <> clNone then
    begin
      Canvas.Font.Color := FTitleShadowColor; 
      OffsetRect(vRect, 1, 1);
      DrawText(Canvas.Handle, PChar(Caption), Length(Caption), vRect,
        cAlignments[FTitleAlignment] or DT_SINGLELINE or DT_VCENTER);
      OffsetRect(vRect, -1, -1);
    end;
    Canvas.Font.Color := FTitleColor;
    DrawText(Canvas.Handle, PChar(Caption), Length(Caption), vRect,
      cAlignments[FTitleAlignment] or DT_SINGLELINE or DT_VCENTER);
  end;
  ///////End ���Ʊ�������

  if Assigned(FIconImages) and (FIconIndex >= 0) then
    FIconImages.Draw(Canvas, FIconLeft, FIconTop, FIconIndex);
end;

procedure TLovelyPanel20.PictureChanged(Sender: TObject);
begin
  DrawFace;
  if HandleAllocated then Invalidate;
end;

procedure TLovelyPanel20.Resize;
begin
  inherited;
  DrawFace;
  Invalidate;
end;

procedure TLovelyPanel20.SetCenter(const Index: Integer; const Value: Integer);
begin
  case Index of
    0:
      if FCenter.X = Value then
        Exit
      else FCenter.X := Value;
    1:
      if FCenter.Y = Value then
        Exit
      else FCenter.Y := Value;
  end;
  DrawFace;
  Invalidate;
end;

procedure TLovelyPanel20.SetPicture(const Value: TPicture);
begin
  if not Assigned(FPicture) then
  begin
    FPicture := TPicture.Create;
    FPicture.OnChange := PictureChanged;
  end;
  FPicture.Assign(Value);
end;

procedure TLovelyPanel20.SetTransparentColor(const Value: TColor);
begin
  if FTransparentColor = Value then Exit;
  FTransparentColor := Value;
  SetWindowRgn(Handle, 0, True);                                                //2007-05-16 No.1 ZswangY37 ����
  Resize;
end;

procedure TLovelyPanel20.SetTransparentSpace(const Value: Integer);
begin
  if FTransparentSpace = Value then Exit;
  FTransparentSpace := Value;
  Resize;
end;

{ TLovelyFrame20 }

constructor TLovelyFrame20.Create(AOwner: TComponent);
begin
  inherited;
  Align := alClient;
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
    csSetCaption, csOpaque, csDoubleClicks, csReplicatable];
  FHasResize := True;
  FLockedPoint := False;
end;

procedure TLovelyFrame20.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
end;

procedure TLovelyFrame20.DblClick;
begin
  inherited;
  if (Parent is TForm) and (biMaximize in TForm(Parent).BorderIcons) then
  begin
    if PtInRect(Rect(0, 0, Width, FTitleHeight),
      ScreenToClient(Mouse.CursorPos)) then
      if TForm(Parent).WindowState = wsMaximized then
        TForm(Parent).WindowState := wsNormal
      else TForm(Parent).WindowState := wsMaximized;
  end;
end;

procedure TLovelyFrame20.DrawFace;
var
  vBitmap: TBitmap;
  vRGN: HRGN;
  vOffsetPoint: TPoint;
begin
  if not Assigned(FFaceBitmap) then Exit;
  if not Assigned(FPicture) or not Assigned(FPicture.Graphic) then Exit;
  FFaceBitmap.Update(FPicture.Graphic);
  if FTransparentColor = clNone then Exit; //����͸��
  if csDesigning in ComponentState then Exit;
  if not Assigned(Parent) then Exit;
  vBitmap := TBitmap.Create;
  try
    vBitmap.Width := Width;
    vBitmap.Height := Height;
    FFaceBitmap.StretchDraw(
      vBitmap.Canvas, 0, 0, Width, Height, FCenter);
    vRGN := GraphicToRGN(vBitmap, FTransparentColor, FTransparentSpace);
    if not (csDesigning in ComponentState) and (Parent is TForm) then
    begin
      vOffsetPoint := Parent.ClientToScreen(Point(Left, Top));
      vOffsetPoint.X := -(Parent.Left - vOffsetPoint.X);
      vOffsetPoint.Y := -(Parent.Top - vOffsetPoint.Y);
      OffsetRgn(vRGN, vOffsetPoint.X, vOffsetPoint.Y);
      SetWindowRgn(Parent.Handle, vRGN, True);
    end else
    begin
      SetWindowRgn(Handle, vRGN, True);
      vOffsetPoint := Point(0, 0);
    end;
    DeleteObject(vRGN);
  finally
    vBitmap.Free;
  end;
end;

procedure TLovelyFrame20.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  I: Integer;
begin
  for I := Low(FSizeRect) to High(FSizeRect) do
    if PtInRect(FSizeRect[I], Point(X, Y)) then
    begin
      if (I < 8) and not FHasResize then Continue;
      if (I = 8) and FLockedPoint then Continue;
      ReleaseCapture;
      Parent.Perform(WM_SYSCOMMAND, cSizeCommand[I], 0);
      Exit;
    end;
  if Assigned(OnMouseDown) then OnMouseDown(Self, Button, Shift, X, Y);
end;

procedure TLovelyFrame20.ParentWindowProc(var Message: TMessage);
begin
  if Assigned(FParentWindowProc) then FParentWindowProc(Message);

  case Message.Msg of
    WM_WINDOWPOSCHANGED:
      FParentBoundsRect := Parent.BoundsRect;
    WM_SIZING:
    begin
      with FParentBoundsRect do
      begin
        case Message.WParam of
          WMSZ_BOTTOM, WMSZ_BOTTOMLEFT, WMSZ_BOTTOMRIGHT:
          begin
            PRect(Message.LParam)^.Top := Top;
            if Parent.Constraints.MinHeight > 0 then
              PRect(Message.LParam)^.Bottom := Max(Top +
                Parent.Constraints.MinHeight, PRect(Message.LParam)^.Bottom);
          end;
        end;
        case Message.WParam of
          WMSZ_LEFT, WMSZ_BOTTOMLEFT, WMSZ_TOPLEFT:
          begin
            PRect(Message.LParam)^.Right := Right;
            if Parent.Constraints.MinWidth > 0 then
              PRect(Message.LParam)^.Left := Min(Right -
                Parent.Constraints.MinWidth, PRect(Message.LParam)^.Left);
          end;
        end;
        case Message.WParam of
          WMSZ_RIGHT, WMSZ_BOTTOMRIGHT, WMSZ_TOPRIGHT:
          begin
            PRect(Message.LParam)^.Left := Left;
            if Parent.Constraints.MinWidth > 0 then
              PRect(Message.LParam)^.Right := Max(Left +
                Parent.Constraints.MinWidth, PRect(Message.LParam)^.Right);
          end;
        end;
        case Message.WParam of
          WMSZ_TOP, WMSZ_TOPLEFT, WMSZ_TOPRIGHT:
          begin
            PRect(Message.LParam)^.Bottom := Bottom;
            if Parent.Constraints.MinHeight > 0 then
              PRect(Message.LParam)^.Top := Min(Bottom -
                Parent.Constraints.MinHeight, PRect(Message.LParam)^.Top);
          end;
        end;
      end;
    end;
  end;
end;

procedure TLovelyFrame20.SetParent(AParent: TWinControl);
var
  vParent: TForm;
begin
  if Parent is TForm then vParent := TForm(Parent) else vParent := nil;
  inherited;
  if csDesigning in ComponentState then Exit;
  if Assigned(vParent) then //�ָ�ԭ�������״̬
  begin
    TForm(vParent).WindowProc := FParentWindowProc;
    SetWindowRgn(TForm(vParent).Handle, 0, True);
    TForm(vParent).AutoScroll := FParentAutoScroll;
  end;

  if AParent is TForm then //�޸ĵ�ǰ�Ĵ���״̬
  begin
    FParentAutoScroll := TForm(AParent).AutoScroll;
    FParentWindowProc := TForm(AParent).WindowProc;
    TForm(AParent).WindowProc := ParentWindowProc;
    TForm(AParent).AutoScroll := False;
    PictureChanged(FPicture);
  end;
end;

{ TCustomLovelyPanel21 }

procedure TCustomLovelyPanel21.AdjustClientRect(var Rect: TRect);
begin
  inherited;
  Rect.Left := Rect.Left + FClientSpace.Left;
  Rect.Top := Rect.Top + FClientSpace.Top;
  Rect.Right := Rect.Right - FClientSpace.Right;
  Rect.Bottom := Rect.Bottom - FClientSpace.Bottom;
end;

procedure TCustomLovelyPanel21.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Cursor := crDefault;
end;

procedure TCustomLovelyPanel21.CMTextChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

constructor TCustomLovelyPanel21.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
    csSetCaption, csOpaque, csDoubleClicks, csReplicatable];
  DoubleBuffered := True;
  FTitleShadowColor := clNone;
  FTitleColor := clBlack;
  FLockedPoint := True;
  FHasResize := False;
  FIconImagesChangeLink := TChangeLink.Create;
  FIconImagesChangeLink.OnChange := PictureChanged;
end;

destructor TCustomLovelyPanel21.Destroy;
begin
  if Assigned(FIconImagesChangeLink) then FIconImagesChangeLink.Free;
  inherited;
end;

procedure TCustomLovelyPanel21.DrawCaption;
const
  cAlignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
var
  vRect: TRect;
begin
  inherited;
  Canvas.Font.Assign(Font);
  Canvas.Brush.Style := bsClear;

  ///////Begin ���Ʊ�������
  if (FTitleHeight > 0) and (Caption <> '') then
  begin
    vRect.Left := FTitleLeft;
    vRect.Top := FTitleTop;
    vRect.Right := Width - FTitleRight;
    vRect.Bottom := FTitleTop + FTitleHeight;
    if FTitleShadowColor <> clNone then
    begin
      Canvas.Font.Color := FTitleShadowColor; 
      OffsetRect(vRect, 1, 1);
      DrawText(Canvas.Handle, PChar(Caption), Length(Caption), vRect,
        cAlignments[FTitleAlignment] or DT_SINGLELINE or DT_VCENTER);
      OffsetRect(vRect, -1, -1);
    end;
    Canvas.Font.Color := FTitleColor;
    DrawText(Canvas.Handle, PChar(Caption), Length(Caption), vRect,
      cAlignments[FTitleAlignment] or DT_SINGLELINE or DT_VCENTER);
  end;
  ///////End ���Ʊ�������

  if Assigned(FIconImages) and (FIconIndex >= 0) then
    FIconImages.Draw(Canvas, FIconLeft, FIconTop, FIconIndex);
end;

procedure TCustomLovelyPanel21.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if CanFocus then SetFocus;
  if FSizing >= 0 then                                                          //2007-05-16 No.2 ZswangY37
  begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, cSizeCommand[FSizing], 0);
    Exit;
  end;

  if FLockedPoint or (Y > FTitleHeight) then Exit;
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, SC_MOVE or WMSZ_TOP, 0);
end;

procedure TCustomLovelyPanel21.MouseMove(Shift: TShiftState; X,
  Y: Integer);
var
  I: Integer;
begin
  inherited;
  for I := 0 to 7 do                                                            //2007-05-16 No.2 ZswangY37
    if PtInRect(FSizeRect[I], Point(X, Y)) then
    begin
      if (I < 8) and not FHasResize then Continue;
      if (I = 8) and FLockedPoint then Continue;
      Cursor := cSizeCursors[I];
      FSizing := I;
      Exit;
    end;
  FSizing := -1;
  Cursor := crDefault;
end;

procedure TCustomLovelyPanel21.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if Operation <> opRemove then Exit;
  if AComponent = FIconImages then
  begin
    FIconImages.UnRegisterChanges(FIconImagesChangeLink);
    FIconImages := nil;
  end;
end;

procedure TCustomLovelyPanel21.Paint;
begin
  inherited;

end;

procedure TCustomLovelyPanel21.PictureChanged(Sender: TObject);
begin
  Invalidate;
end;

procedure TCustomLovelyPanel21.Resize;
begin
  inherited;
  Invalidate;
end;

procedure TCustomLovelyPanel21.SetClientSpace(const Index, Value: Integer);
begin
  case Index of
    0: if Value = FClientSpace.Left then Exit else
      FClientSpace.Left := Value;
    1: if Value = FClientSpace.Top then Exit else
      FClientSpace.Top := Value;
    2: if Value = FClientSpace.Right then Exit else
      FClientSpace.Right := Value;
    3: if Value = FClientSpace.Bottom then Exit else
      FClientSpace.Bottom := Value;
  end;
  Realign;
end;

procedure TCustomLovelyPanel21.SetIconImages(
  const Value: TCustomImageList);
begin
  if Assigned(FIconImages) then
    FIconImages.UnRegisterChanges(FIconImagesChangeLink);

  FIconImages := Value;
  if Assigned(FIconImages) then
  begin
    FIconImages.RegisterChanges(FIconImagesChangeLink);
    FIconImages.FreeNotification(Self);
  end;
  Invalidate;
end;

procedure TCustomLovelyPanel21.SetIconIndex(const Value: Integer);
begin
  if FIconIndex = Value then Exit;
  FIconIndex := Value;
  Invalidate();
end;

procedure TCustomLovelyPanel21.SetIconLeft(const Value: Integer);
begin
  if FIconLeft = Value then Exit;
  FIconLeft := Value;
  Invalidate();
end;

procedure TCustomLovelyPanel21.SetIconTop(const Value: Integer);
begin
  if FIconTop = Value then Exit;
  FIconTop := Value;
  Invalidate();
end;

procedure TCustomLovelyPanel21.SetLifeValue(const Value: Integer);
begin
  if FLifeValue = Value then Exit;
  FLifeValue := Value;
  if Assigned(FOnLifeChange) then FOnLifeChange(Self);
end;

procedure TCustomLovelyPanel21.SetTitleAlignment(const Value: TAlignment);
begin
  if FTitleAlignment = Value then Exit;
  FTitleAlignment := Value;
  Invalidate;
end;

procedure TCustomLovelyPanel21.SetTitleColor(const Value: TColor);
begin
  if FTitleColor = Value then Exit;
  FTitleColor := Value;
  Invalidate;
end;

procedure TCustomLovelyPanel21.SetTitleHeight(const Value: Integer);
begin
  if FTitleHeight = Value then Exit;
  FTitleHeight := Value;
  Invalidate;
end;

procedure TCustomLovelyPanel21.SetTitleLeft(const Value: Integer);
begin
  if FTitleLeft = Value then Exit;
  FTitleLeft := Value;
  Invalidate;
end;

procedure TCustomLovelyPanel21.SetTitleRight(const Value: Integer);
begin
  if FTitleRight = Value then Exit;
  FTitleRight := Value;
  Invalidate;
end;

procedure TCustomLovelyPanel21.SetTitleShadowColor(const Value: TColor);
begin
  if FTitleShadowColor = Value then Exit;
  FTitleShadowColor := Value;
  Invalidate;
end;

procedure TCustomLovelyPanel21.SetTitleTop(const Value: Integer);
begin
  if FTitleTop = Value then Exit;
  FTitleTop := Value;
  Invalidate;
end;

function TCustomLovelyPanel21.ShowModal: Integer;
begin
  Result := 0;
  if FModaling then Exit;
  FModaling := True;
  try
    LifeValue := FLifeCount;
    if LifeCount > 0 then
    begin
      KillTimer(Handle, ID_TIMER_TURNLIFE); //�����һ�εļ�ʱ��
      SetTimer(Handle, ID_TIMER_SHOWMODAL, 1000, nil);
    end;
    BringToFront;
    Show;
    if CanFocus then SetFocus;
    FModalResult := 0;
    repeat
      if csDestroying in ComponentState then Exit;
      if Application.Terminated then Break;
      if (FLifeCount > 0) and (FLifeValue <= 0) then Break;
      Application.HandleMessage;
    until FModalResult <> 0;
    Result := FModalResult;
    Hide;
  finally
    FModaling := False;
  end;
end;

procedure TCustomLovelyPanel21.TurnLife;
begin
  if FModaling then Exit;                                                       //2006-08-10 No.1
  LifeValue := LifeCount;
  if LifeCount > 0 then
  begin
    KillTimer(Handle, ID_TIMER_TURNLIFE); //�����һ�εļ�ʱ��
    SetTimer(Handle, ID_TIMER_TURNLIFE, 1000, nil);
  end;
  BringToFront;
  Show;
end;

procedure TCustomLovelyPanel21.WMTimer(var Msg: TWMTimer);
begin
  case Msg.TimerID of
    ID_TIMER_SHOWMODAL, ID_TIMER_TURNLIFE:
    begin
      if Visible then
        LifeValue := LifeValue - 1
      else LifeValue := 0;
      if LifeValue <= 0 then
      begin
        KillTimer(Handle, Msg.TimerID);
        Hide;
      end;
    end;
  end;
end;

procedure TCustomLovelyPanel21.WMWindowPosChanged(
  var Message: TWMWindowPosChanged);
begin
  inherited;
  FSizeRect[0] := Rect(4, 0, Width - 4, 4); //��
  FSizeRect[1] := Rect(Width - 4, 0, Width, 4); //����
  FSizeRect[2] := Rect(Width - 4, 4, Width, Height - 4); //��
  FSizeRect[3] := Rect(Width - 4, Height - 4, Width, Height); //����
  FSizeRect[4] := Rect(4, Height - 4, Width - 4, Height); //��
  FSizeRect[5] := Rect(0, Height - 4, 4, Height); //����
  FSizeRect[6] := Rect(0, 4, 4, Height - 4); //��
  FSizeRect[7] := Rect(0, 0, 4, 4); //����
  FSizeRect[8] := Rect(0, 0, Width, FTitleHeight); //����
end;

{ TVertexPanel21 }

constructor TVertexPanel21.Create(AOwner: TComponent);
begin
  inherited;
  FStrings := TStringList.Create;
  TStringList(FStrings).OnChange := StringsChange;
  Width := 175;
  Height := 125;
end;

destructor TVertexPanel21.Destroy;
begin
  if Assigned(FStrings) then FStrings.Free;
  inherited;
end;

procedure TVertexPanel21.Paint;
var
  I: Integer;
begin
  inherited;
  for I := Low(FRectangles) to High(FRectangles) do
    DrawRectangle(Canvas, FRectangles[I], Width, Height);
  DrawCaption;
end;

procedure TVertexPanel21.SetStrings(const Value: TStrings);
begin
  FStrings.Assign(Value);
end;

procedure TVertexPanel21.StringsChange(Sender: TObject);
var
  I: Integer;
begin
  SetLength(FRectangles, FStrings.Count);
  for I := 0 to FStrings.Count - 1 do
    FRectangles[I] := TextToRectangle(FStrings[I]);
  Invalidate;
end;

end.

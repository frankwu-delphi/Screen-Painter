(*//
项目:LovelyComponents.VertexButton
版本:2.0
标题:渐变色按钮
说明:通过GradientFill()API节省GDI和内存资源的使用
日期:2007-06-13
支持:jihu.wang#gmail.com
设计:ZswangY37
//*)

unit VertexButton21;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Graphics, ImgList;

type
  TVertexButton21 = class(TGraphicControl)
  private
    { Private declarations }
    FTopColorList: array[0..3] of TColor;
    FBottomColorList: array[0..3] of TColor;
    FLineColorList: array[0..3] of TColor;
    FShowAccelChar: Boolean;
    FShadowColor: TColor;
    FMouseEnter: Boolean;
    FMouseDown: Boolean;
    FIconLeftSpace: Integer;
    FIconIndex: Integer;
    FIconImages: TCustomImageList;
    FIconImagesChangeLink: TChangeLink;
    procedure SetShadowColor(const Value: TColor);
    procedure SetShowAccelChar(const Value: Boolean);
    procedure SetIconImages(const Value: TCustomImageList);
    procedure SetIconIndex(const Value: Integer);
    procedure SetIconLeftSpace(const Value: Integer);
    procedure PaintChange(Sender: TObject);
    function GetColor(Index: Integer): TColor;
    procedure SetColor(Index: Integer; Value: TColor);
  protected
    { Protected declarations }
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
//    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;

    function OffsetIndex: Integer; virtual; //获取当前显示图片的偏移
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
    property ShadowColor: TColor read FShadowColor write SetShadowColor default clNone; // 标题阴影的颜色，如果为clNone则不显示
    property ShowAccelChar: Boolean read FShowAccelChar write SetShowAccelChar default True; // 是否处理快捷键

    property TopColorComm: TColor index 0 read GetColor write SetColor; // 顶部颜色
    property TopColorMove: TColor index 1 read GetColor write SetColor; // 顶部颜色//鼠标移入
    property TopColorDown: TColor index 2 read GetColor write SetColor; // 顶部颜色//鼠标按下
    property TopColorGray: TColor index 3 read GetColor write SetColor; // 顶部颜色//按钮失效

    property BottomColorComm: TColor index 4 read GetColor write SetColor; // 底部颜色
    property BottomColorMove: TColor index 5 read GetColor write SetColor; // 底部颜色//鼠标移入
    property BottomColorDown: TColor index 6 read GetColor write SetColor; // 底部颜色//鼠标按下
    property BottomColorGray: TColor index 7 read GetColor write SetColor; // 底部颜色//按钮失效

    property LineColorComm: TColor index 8 read GetColor write SetColor; // 边线颜色
    property LineColorMove: TColor index 9 read GetColor write SetColor; // 边线颜色//鼠标移入
    property LineColorDown: TColor index 10 read GetColor write SetColor; // 边线颜色//鼠标按下
    property LineColorGray: TColor index 11 read GetColor write SetColor; // 边线颜色//按钮失效

    property IconImages: TCustomImageList read FIconImages write SetIconImages;
    property IconIndex: Integer read FIconIndex write SetIconIndex;
    property IconLeftSpace: Integer read FIconLeftSpace write SetIconLeftSpace;

    property Action;
    property Anchors;
    property Caption;
    property Enabled;
    property Visible;
    property OnClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

implementation

uses Forms, CommonFunctions51;

{ TVertexButton }

procedure TVertexButton21.CMDialogChar(var Message: TCMDialogChar);
begin
  if Enabled and FShowAccelChar and IsAccel(Message.CharCode, Caption) then
  begin
    Click;
    Message.Result := 1;
  end else inherited;
end;

//procedure TVertexButton21.CMEnabledChanged(var Message: TMessage);
//begin
//  inherited;
//end;

procedure TVertexButton21.CMMouseLeave(var Message: TMessage);
begin
  FMouseEnter := False;
  Invalidate;
end;

procedure TVertexButton21.CMTextChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

constructor TVertexButton21.Create(AOwner: TComponent);
begin
  inherited;
  FShadowColor := clNone;
  FShowAccelChar := True;
  
  FLineColorList[0] := $00E6AC70;
  FLineColorList[1] := $00DBA46B;
  FLineColorList[2] := $00E6AC70;
  FLineColorList[3] := $006B6B6B;

  FTopColorList[0] := $00FDF8F3;
  FTopColorList[1] := $00F1ECE8;
  FTopColorList[2] := $00FDE6CF;
  FTopColorList[3] := $00E3E3E3;

  FBottomColorList[0] := $00FDE6CF;
  FBottomColorList[1] := $00F1DBC5;
  FBottomColorList[2] := $00FDF8F3;
  FBottomColorList[3] := $00BBBBBB;


  FIconImagesChangeLink := TChangeLink.Create;
  FIconImagesChangeLink.OnChange := PaintChange;

  Width := 75;
  Height := 22;
end;

function TVertexButton21.GetColor(Index: Integer): TColor;
begin
  case Index of
    0..3: Result := FTopColorList[Index];
    4..7: Result := FBottomColorList[Index - 4];
    8..11: Result := FLineColorList[Index - 8];
  else Result := clNone;
  end;
  Invalidate;
end;

procedure TVertexButton21.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseDown := True;
  Invalidate;
end;

procedure TVertexButton21.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if FMouseEnter then Exit;
  FMouseEnter := True;
  Invalidate;
end;

procedure TVertexButton21.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
  FMouseDown := False;
  FMouseEnter := False;                                                         
  Invalidate;
end;

procedure TVertexButton21.Notification(AComponent: TComponent;
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

function TVertexButton21.OffsetIndex: Integer;
begin
  if not Enabled then
    Result := 3
  else if FMouseDown then
    Result := 2
  else if FMouseEnter then
    Result := 1
  else Result := 0;
end;

procedure TVertexButton21.Paint;
var
  vTriVertex: array[0..1] of TTriVertex;
  vGradientRect: TGradientRect;
  vRect: TRect;
  vFlags: Longword;
begin
  inherited;
  vTriVertex[0] := InitTriVertex(Point(1, 1), FTopColorList[OffsetIndex]);
  vTriVertex[1] := InitTriVertex(Point(ClientWidth - 1, ClientHeight - 1),
    FBottomColorList[OffsetIndex]);
  vGradientRect.UpperLeft := 1;
  vGradientRect.LowerRight := 0;
  GradientFill(Canvas.Handle, @vTriVertex[0], Length(vTriVertex),
    @vGradientRect, 1, GRADIENT_FILL_RECT_V);
  Canvas.Brush.Style := bsClear;
  Canvas.Pen.Color := FLineColorList[OffsetIndex];
  Canvas.Rectangle(0, 0, Width, Height);

  if Assigned(FIconImages) and (FIconIndex >= 0) then
  begin
    vRect := Rect(FIconLeftSpace + FIconImages.Width, 0, Width, Height);
    FIconImages.Draw(Canvas, FIconLeftSpace,
      (Height - FIconImages.Height) div 2, FIconIndex);
  end else vRect := Rect(0, 0, Width, Height);

  if OffsetIndex = 2 then OffsetRect(vRect, 1, 1);

  Canvas.Font.Assign(Font);
  Canvas.Brush.Style := bsClear;

  vFlags := DT_CENTER or DT_SINGLELINE or DT_VCENTER;
  if not FShowAccelChar then vFlags := vFlags or DT_NOPREFIX;
  if Enabled and (FShadowColor <> clNone) then
  begin
    Canvas.Font.Color := FShadowColor;
    OffsetRect(vRect, 1, 1);
    DrawText(Canvas.Handle, PChar(Caption), Length(Caption), vRect, vFlags);
    OffsetRect(vRect, -1, -1);
    Canvas.Font.Color := Font.Color;
  end;
  if not Enabled then Canvas.Font.Color := clGray;
  DrawText(Canvas.Handle, PChar(Caption), Length(Caption), vRect, vFlags);
end;

procedure TVertexButton21.PaintChange(Sender: TObject);
begin
  Invalidate;
end;

procedure TVertexButton21.SetColor(Index: Integer; Value: TColor);
begin
  case Index of
    0..3: FTopColorList[Index] := Value;
    4..7: FBottomColorList[Index - 4] := Value;
    8..11: FLineColorList[Index - 8] := Value;
  end;
  Invalidate;
end;

procedure TVertexButton21.SetIconImages(const Value: TCustomImageList);
begin
  FIconImages := Value;
end;

procedure TVertexButton21.SetIconIndex(const Value: Integer);
begin
  FIconIndex := Value;
  Invalidate;
end;

procedure TVertexButton21.SetIconLeftSpace(const Value: Integer);
begin
  FIconLeftSpace := Value;
  Invalidate;
end;

procedure TVertexButton21.SetShadowColor(const Value: TColor);
begin
  FShadowColor := Value;
  Invalidate;
end;

procedure TVertexButton21.SetShowAccelChar(const Value: Boolean);
begin
  FShowAccelChar := Value;
  Invalidate;
end;

end.

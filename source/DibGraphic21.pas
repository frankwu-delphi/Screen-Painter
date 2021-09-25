(*//
标题:Dib图像
说明:减少GID和内存开销
//*)

//2006-12-14 ZswangY37 No.1 增加纠错功能,避免缓冲太大的情况没有得到DIB信息出错

unit DibGraphic21;

interface

uses Windows, Classes, SysUtils, Graphics;

type
  TDibGraphic = class // Dib图像
  private
    FBitmapInfo: PBitmapInfo;
    FBitmap: TBitmap;
    FSize: Integer;
  public
    procedure Draw(
      ACanvas: TCanvas; // 绘制的画布
      ALeft, ATop: Integer // 左上坐标
    );
    procedure CopyRect( // 复制区域
      ACanvas: TCanvas; // 绘制的画布
      ADestRect: TRect; // 目标区域
      ASrcRect: TRect // 来源区域
    );
    procedure StretchDraw( // 中点拉伸绘制
      ACanvas: TCanvas; // 绘制的画布
      ALeft, ATop: Integer; // 左上坐标
      AWidth, AHeight: Integer; // 宽高
      ACenter: TPoint // 中心点
    );
    procedure Clear;
    procedure Update(AGraphic: TGraphic);

    destructor Destroy; override;
    property BitmapInfo: PBitmapInfo read FBitmapInfo;
  end;

implementation

{ TDibGraphic }

procedure TDibGraphic.Clear;
begin
  if Assigned(FBitmapInfo) then
  begin
    FreeMem(FBitmapInfo, FSize);
    FBitmapInfo := nil;
  end;
  if Assigned(FBitmap) then
  begin
    FBitmap.Free;
    FBitmap := nil;
  end;
end;

destructor TDibGraphic.Destroy;
begin
  Clear;
  inherited;
end;

procedure TDibGraphic.Update(AGraphic: TGraphic);
var
  vInfoHeaderSize, vImageSize: Longword;
begin
  Clear;
  if not Assigned(AGraphic) then Exit;
  if Assigned(FBitmap) then FBitmap.Free;
  FBitmap := TBitmap.Create;;
  FBitmap.PixelFormat := pf24bit;
  FBitmap.Width := AGraphic.Width;
  FBitmap.Height := AGraphic.Height;
  FBitmap.Canvas.Draw(0, 0, AGraphic);
  vInfoHeaderSize := SizeOf(TBitmapInfoHeader);
  GetDIBSizes(FBitmap.Handle, vInfoHeaderSize, vImageSize);
  FSize := vInfoHeaderSize + vImageSize;
  GetMem(FBitmapInfo, FSize);
  if GetDIB(FBitmap.Handle, FBitmap.Palette, FBitmapInfo^.bmiHeader,
    FBitmapInfo^.bmiColors[0]) then
  begin
    FBitmap.Free;
    FBitmap := nil;
  end else
  begin
    FreeMem(FBitmapInfo, FSize);
    FBitmapInfo := nil;
  end;
end;

procedure TDibGraphic.StretchDraw(ACanvas: TCanvas; ALeft, ATop, AWidth,
  AHeight: Integer; ACenter: TPoint);
begin
  if not Assigned(ACanvas) then Exit;
  if not Assigned(FBitmapInfo) then Exit;
  with FBitmapInfo^, bmiHeader do
  begin
    ///////Begin 绘制四个角
    StretchDIBits(ACanvas.Handle,
      ALeft, ATop, biWidth, biHeight,
      0, 0, biWidth, biHeight, @bmiColors[0], FBitmapInfo^,
      DIB_RGB_COLORS, SRCCOPY
    ); // 左上
    StretchDIBits(ACanvas.Handle,
      ALeft + AWidth - biWidth, ATop, biWidth, biHeight,
      0, 0, biWidth, biHeight, @bmiColors[0], FBitmapInfo^,
      DIB_RGB_COLORS, SRCCOPY
    ); // 右上
    StretchDIBits(ACanvas.Handle,
      ALeft, ATop + AHeight - biHeight, biWidth, biHeight,
      0, 0, biWidth, biHeight, @bmiColors[0], FBitmapInfo^,
      DIB_RGB_COLORS, SRCCOPY
    ); // 左下
    StretchDIBits(ACanvas.Handle,
      ALeft + AWidth - biWidth, ATop + AHeight - biHeight, biWidth, biHeight,
      0, 0, biWidth, biHeight, @bmiColors[0], FBitmapInfo^,
      DIB_RGB_COLORS, SRCCOPY
    ); // 右下
    ///////End 绘制四个角

    StretchDIBits(ACanvas.Handle,
      ALeft + ACenter.X, ATop, AWidth - biWidth, biHeight,
      ACenter.X, 0, 1, biHeight, @bmiColors[0], FBitmapInfo^,
      DIB_RGB_COLORS, SRCCOPY); // 上面拉伸
    StretchDIBits(ACanvas.Handle,
      ALeft + ACenter.X, ATop + AHeight - biHeight, AWidth - biWidth, biHeight,
      ACenter.X, 0, 1, biHeight, @bmiColors[0], FBitmapInfo^,
      DIB_RGB_COLORS, SRCCOPY); // 下面拉伸
    StretchDIBits(ACanvas.Handle,
      ALeft, ATop + ACenter.Y, biWidth, AHeight - biHeight,
      0, biHeight - ACenter.Y, biWidth, 1, @bmiColors[0], FBitmapInfo^,
      DIB_RGB_COLORS, SRCCOPY); // 左面拉伸
    StretchDIBits(ACanvas.Handle,
      ALeft + AWidth - biWidth, ATop + ACenter.Y, biWidth, AHeight - biHeight,
      0, biHeight - ACenter.Y, biWidth, 1, @bmiColors[0], FBitmapInfo^,
      DIB_RGB_COLORS, SRCCOPY); // 右面拉伸
    StretchDIBits(ACanvas.Handle,
      ALeft + ACenter.X, ATop + ACenter.Y, AWidth - biWidth, AHeight - biHeight,
      ACenter.X, biHeight - ACenter.Y, 1, 1, @bmiColors[0], FBitmapInfo^,
      DIB_RGB_COLORS, SRCCOPY); // 中间拉伸
  end;
end;

procedure TDibGraphic.Draw(ACanvas: TCanvas; ALeft, ATop: Integer);
begin
  if not Assigned(ACanvas) then Exit;
  if Assigned(FBitmap) then
  begin
    SetStretchBltMode(ACanvas.Handle, STRETCH_ANDSCANS);
    StretchBlt(ACanvas.Handle,
      ALeft, ATop, FBitmap.Width, FBitmap.Height, FBitmap.Canvas.Handle,
      0, 0, FBitmap.Width, FBitmap.Height, SRCCOPY
    );
  end else if Assigned(FBitmapInfo) then
  begin
    with FBitmapInfo^, FBitmapInfo^.bmiHeader do
    begin
      SetStretchBltMode(ACanvas.Handle, STRETCH_ANDSCANS);
      StretchDIBits(ACanvas.Handle,
        ALeft, ATop, biWidth, biHeight,
        0, 0, biWidth, biHeight, @bmiColors[0], FBitmapInfo^,
        DIB_RGB_COLORS, SRCCOPY
      );
    end;
  end;
end;

procedure TDibGraphic.CopyRect(ACanvas: TCanvas; ADestRect,
  ASrcRect: TRect);
begin
  if not Assigned(ACanvas) then Exit;
  if Assigned(FBitmap) then
  begin
    SetStretchBltMode(ACanvas.Handle, STRETCH_ANDSCANS);
    StretchBlt(ACanvas.Handle,
      ADestRect.Left, ADestRect.Top,
      ADestRect.Right - ADestRect.Left, ADestRect.Bottom - ADestRect.Top,
      FBitmap.Canvas.Handle,
      ASrcRect.Left, ASrcRect.Top,
      ASrcRect.Right - ASrcRect.Left, ASrcRect.Bottom - ASrcRect.Top, SRCCOPY
    );
  end else if Assigned(FBitmapInfo) then
  begin
    with FBitmapInfo^, FBitmapInfo^.bmiHeader do
    begin
      SetStretchBltMode(ACanvas.Handle, STRETCH_ANDSCANS);
      StretchDIBits(ACanvas.Handle,
        ADestRect.Left, ADestRect.Top,
        ADestRect.Right - ADestRect.Left, ADestRect.Bottom - ADestRect.Top,
        ASrcRect.Left, ASrcRect.Top,
        ASrcRect.Right - ASrcRect.Left, ASrcRect.Bottom - ASrcRect.Top,
        @bmiColors[0], FBitmapInfo^, DIB_RGB_COLORS, SRCCOPY
      );
    end;
  end;
end;

end.

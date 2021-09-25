(*//
��Ŀ:LovelyComponents.GraphicFunctions
�汾:5.01
����:ͼ�δ���Ԫ
˵��:���ͼ�δ���ĺ������з�װ
����:2004-07-03
֧��:jihu.wang#gmail.com
���:ZswangY37
//*)

//*******Begin �޸���־*******//
//2004-07-03 ZswangY37 No.1 ����
//----------------------------------------------------------------------5.01.001
//2006-08-10 ZswangY37 No.1 ��� TakePicture--��ȡ����ͼ�εĺ���
//----------------------------------------------------------------------5.01.002
//2006-11-13 ZswangY37 No.1 ��� BitmapDrawHorizontal()��BitmapDrawVertical()λͼ�������
//----------------------------------------------------------------------5.01.003
//2006-11-17 ZswangY37 No.1 ���� BmpToIco()���������Ƶ�������
//2007-03-22 ZswangY37 No.1 ���� ��ͼƬ�߶�Ϊ1ʱScanLine[1]������Խ��
//2007-11-19 ZswangY37 No.1 ���� ��ȡ���ͼ������GDIй¶
//*******End �޸���־*******//

{$DEFINE Unit_GraphicFunctions51}

unit GraphicFunctions51;

interface

uses Forms, Windows, Classes, SysUtils, Graphics, jpeg;

function BmpToIco( // λͼ�����ͼ��
  mBitmap: TBitmap; // λͼ
  mIcon: TIcon; // ͼ��
  mSize32: Boolean = True; // �Ƿ�Ϊ��ͼ��
  mTransparentColor: TColor = clDefault; // ͸����ɫ Ĭ��Ϊ���½�
  mHotspotX: Integer = 0; // �ȵ�X
  mHotspotY: Integer = 0 // �ȵ�Y
): Boolean; // ���ش����Ƿ�ɹ�

function IcoToBmp( // ͼ�괦���λͼ
  mIcon: TIcon; // ͼ��
  mBitmap: TBitmap // λͼ
): Boolean; // ���ش����Ƿ�ɹ�

function JpegToBmp( // JpgͼƬ�����λͼ
  mJPEGImage: TJPEGImage; // JpgͼƬ
  mBitmap: TBitmap // λͼ
): Boolean; // ���ش����Ƿ�ɹ�

function BmpToJpeg( // λͼ�����JpgͼƬ
  mBitmap: TBitmap; // λͼ
  mJPEGImage: TJPEGImage; // JpgͼƬ
  mCompressionQuality: Integer = 75 // ѹ����
): Boolean; // ���ش����Ƿ�ɹ�
  
function BitmapRGBScale( // λͼ��ɫ����
  mBitmap: TBitmap; // Ŀ��λͼ
  R, G, B: Integer; // ��ɫ�仯����
  mTransparentColor: TColor // ͸�����������ɫ
): Boolean; // ���ش����Ƿ�ɹ�

function BitmapGrayScale( // λͼ�Ҷȴ���
  mBitmap: TBitmap; // λͼ
  mTransparentColor: TColor // ͸�����������ɫ
): Boolean; // ���ش����Ƿ�ɹ�

function BitmapReverseRGB( // �ߵ�λͼ��RGBֵ
  mBitmap: TBitmap // λͼ
): Boolean; // ���ش����Ƿ�ɹ�

function BitmapTransparent( // λͼ͸������
  mBitmapBack: TBitmap; // ����ͼ
  mBitmapFace: TBitmap; // ����ͼ
  mTransparentColor: TColor; // ͸�����������ɫ
  mScale: Byte; // �̶� 0~255
  mOffset: TPoint // ���Ƶ�ƫ������
): Boolean; // ���ش����Ƿ�ɹ�

function BitmapRotate90( // ��λͼ��ת90��
  mSource: TBitmap; // Դλͼ
  mDest: TBitmap // Ŀ��λͼ
): Boolean; overload; // ���ش����Ƿ�ɹ�

function BitmapRotate180( // ��λͼ��ת90��
  mSource: TBitmap; // Դλͼ
  mDest: TBitmap // Ŀ��λͼ
): Boolean; overload; // ���ش����Ƿ�ɹ�

function BitmapRotate270( // ��λͼ��ת90��
  mSource: TBitmap; // Դλͼ
  mDest: TBitmap // Ŀ��λͼ
): Boolean; overload; // ���ش����Ƿ�ɹ�

function BitmapRotateHorizontal( // ��λͼˮƽ��ת
  mSource: TBitmap; // Դλͼ
  mDest: TBitmap // Ŀ��λͼ
): Boolean; overload; // ���ش����Ƿ�ɹ�

function BitmapRotateVertical( // ��λͼ��ֱ��ת
  mSource: TBitmap; // Դλͼ
  mDest: TBitmap // Ŀ��λͼ
): Boolean; overload; // ���ش����Ƿ�ɹ�

function BitmapBlur( // λͼģ������
  mBitmap: TBitmap; // Ŀ��λͼ
  mScale: Real; // ģ����
  mTransparentColor: TColor // ͸�����������ɫ
): Boolean; // ���ش����Ƿ�ɹ�

function BitmapGridPoint( // λͼ���㴦��
  mBitmap: TBitmap; // Ŀ��λͼ
  mOffset: Boolean; // ��λ����
  mTransparentColor: TColor // ͸����ɫ
): Boolean; // ���ش����Ƿ�ɹ�

function BitmapDraw( // ͸�����ƣ�͸��ʱCanvas.Draw�Ŀ�Щ
  mBitmapBack: TBitmap; // ��ͼ
  mBitmapFace: TBitmap; // ��ͼ
  mOffset: TPoint; // ƫ��
  mTransparentColor: TColor // ͸�����������ɫ
): Boolean; // ���ش����Ƿ�ɹ�

function BitmapMask( // ȡ��λͼ��ģʽͼ// �ڰ�ͼ
  mBitmap: TBitmap; // Դλͼ
  mTransparentColor: TColor; // ͸����ɫ
  mForeColor: TColor = clBlack; // ǰ��ɫ
  mBackColor: TColor = clWhite // ����ɫ
): Boolean; // ���ش����Ƿ�ɹ�

function BitmapReplace( // �滻λͼ�е���ɫ
  mBitmap: TBitmap; // Դλͼ
  mFromColor: TColor; // ��ʷ��ɫ
  mToColor: TColor // Ŀ����ɫ
): Boolean; // �����滻�Ƿ�ɹ�

procedure HSL2RGB( // HSL�����RGB
  H, S, L: Integer; // HSL
  var R, G, B: Integer // ��ԭɫ
); overload;

procedure HSL2RGB( // HSL�����RGB
  H, S, L: Integer; // HSL
  var nRGB: TColor // RGB
); overload;

procedure RGB2HSL( // RGB�����HSL
  R, G, B: Integer; // RGB
  var H, S, L: Integer // HSL
); overload;

procedure RGB2HSL( // RGB�����HSL
  mRGB: TColor; // RGB
  var H, S, L: Integer // HSL
); overload;

function HSLOffset( // HSLƫ��
  mRGB: TColor; // RGB
  mOffsetH, mOffsetS, mOffsetL: Integer // HSL
): TColor; // ����ƫ�ƺ����ɫ

function GraphicToRGN( // �õ�ͼƬ�Ĳ���������
  mGraphic: TGraphic; // ͼƬ
  mTransparentColor: TColor = clBlack; // ͸��ɫ
  mSpace: Integer = 0 // ��ɫ�����
): HRGN; // ����ͼƬ�Ĳ�����������

function CompareColor( // �Ƚ�������ɫ�Ĳ��
  mColorA, mColorB: TColor
): Integer; overload;

function CompareColor( // �Ƚ�������ɫ�Ĳ��
  mColorA, mColorB: TRGBTriple
): Integer; overload;

function TakePicture( // ��ȡ����ͼƬ
  mHandle: THandle; // ������
  mBitmap: TBitmap; // ���λͼ
  mCursor: Boolean = False // �Ƿ��ȡ���
): Boolean; // ���ؽ�ȡ�Ƿ�ɹ�

function TakeDesktop( // ��ȡ��Ļָ�������ͼ��
  mBitmap: TBitmap; // ���λͼ
  mRect: TRect; //  ��ȡ������
  mCursor: Boolean = False // �Ƿ��ȡ���
): Boolean; // ���ؽ�ȡ�Ƿ�ɹ�

function BitmapDrawHorizontal( // λͼˮƽ�������
  mBitmap: TBitmap; // Դλͼ
  mCanvas: TCanvas; // ���ƵĻ���
  mLeft: Integer; // ���Ƶ���߽�
  mTop: Integer; // ���Ƶ��ϱ߽�
  mWidth: Integer; // ���ƵĿ��
  mCenterX: Integer // λͼ���������X����
): Boolean; // ���ػ����Ƿ�ɹ�

function BitmapDrawVertical( // λͼ��ֱ�������
  mBitmap: TBitmap; // Դλͼ
  mCanvas: TCanvas; // ���ƵĻ���
  mLeft: Integer; // ���Ƶ���߽�
  mTop: Integer; // ���Ƶ��ϱ߽�
  mHeight: Integer; // ���ƵĿ��
  mCenterY: Integer // λͼ���������X����
): Boolean; // ���ػ����Ƿ�ɹ�

function CircleCursor( // ����һ��Բ�ε����ͼ��
  AColor: TColor; // ָ��Բ�ε���ɫ
  ASize: Integer // ָ��Բ�ε�ֱ��
): HCursor; // �������ͼ�����

function DrawThunderEllipse( // ������������
  mCanvas: TCanvas; // ����
  mOrigin: TPoint; // ԭ��
  mRadialMin: Integer;
  mRadialMax: Integer;
  mAngleCount: Integer
): Boolean;

function DrawThunderLine( // ������������
  mCanvas: TCanvas; // ����
  mFromPoint: TPoint; // ��Դ����
  mToPoint: TPoint; // Ŀ������
  mAngle: Double; // �Ƕȷ�Χ +/-
  mSpaceMin: Integer; // ���߳���
  mSpaceMax: Integer // ���߳���
): Boolean; // ���ش����Ƿ�ɹ�

function DrawCursor( // �������ָ��
  mCanvas: TCanvas; // ����
  mCursor: THandle; // ���ָ����
  mPostion: TPoint // ���λ��
): Boolean; // ���ػ����Ƿ�ɹ�

implementation

uses Math, CommonFunctions51;

function DrawThunderEllipse( // ������������
  mCanvas: TCanvas; // ����
  mOrigin: TPoint; // ԭ��
  mRadialMin: Integer;
  mRadialMax: Integer;
  mAngleCount: Integer
): Boolean;
var
  vPoint: TPoint;
  vStart: TPoint;
  vRadial: Integer;
  I: Integer;
begin
  Result := False;
  if not Assigned(mCanvas) then Exit;
  vRadial := mRadialMin + Random(mRadialMax - mRadialMin);
  vStart.X := mOrigin.X + Trunc(Cos(0) * vRadial);
  vStart.Y := mOrigin.Y + Trunc(Sin(0) * vRadial);
  mCanvas.MoveTo(vStart.X, vStart.Y);
  for I := 1 to mAngleCount - 1 do
  begin
    vRadial := mRadialMin + Random(mRadialMax - mRadialMin);
    vPoint.X := mOrigin.X + Trunc(Cos(I / mAngleCount * 2 * PI) * vRadial);
    vPoint.Y := mOrigin.Y + Trunc(Sin(I / mAngleCount * 2 * PI) * vRadial);
    mCanvas.LineTo(vPoint.X, vPoint.Y);
  end;
  mCanvas.LineTo(vStart.X, vStart.Y);
  Result := True;
end; { DrawThunderEllipse }

function DrawThunderLine( // ������������
  mCanvas: TCanvas; // ����
  mFromPoint: TPoint; // ��Դ����
  mToPoint: TPoint; // Ŀ������
  mAngle: Double; // �Ƕȷ�Χ +/-
  mSpaceMin: Integer; // ���߳���
  mSpaceMax: Integer // ���߳���
): Boolean; // ���ش����Ƿ�ɹ�
var
  vPoint: TPoint;
  vAngle: Double;
  vSpace: Integer;
begin
  Result := False;
  if not Assigned(mCanvas) then Exit;
  mCanvas.MoveTo(mFromPoint.X, mFromPoint.Y);
  while PointToPoint(mFromPoint, mToPoint) >= mSpaceMax do
  begin
    vAngle := PointToAngle(mFromPoint, mToPoint);
    vAngle := vAngle + mAngle * Random - mAngle / 2;
    vSpace := mSpaceMin + Random(mSpaceMax - mSpaceMin);
    vPoint.X := mFromPoint.X + Trunc(Cos(vAngle) * vSpace);
    vPoint.Y := mFromPoint.Y + Trunc(Sin(vAngle) * vSpace);
    mFromPoint := vPoint;
    mCanvas.LineTo(mFromPoint.X, mFromPoint.Y);
  end;
  mCanvas.LineTo(mToPoint.X, mToPoint.Y);
  Result := True;
end; { DrawThunder }

function DrawCursor( // �������ָ��
  mCanvas: TCanvas; // ����
  mCursor: THandle; // ���ָ����
  mPostion: TPoint // ���λ��
): Boolean; // ���ػ����Ƿ�ɹ�
var
  vIconInfo: TIconInfo;
begin
  Result := False;
  if not Assigned(mCanvas) then Exit;
  GetIconInfo(mCursor, vIconInfo);
  try
    DrawIcon(mCanvas.Handle,
      mPostion.X - Integer(vIconInfo.xHotspot),
      mPostion.Y - Integer(vIconInfo.yHotspot),
      mCursor);
  finally
    DeleteObject(vIconInfo.hbmMask);                                            //2007-11-19 ZswangY37 No.1
    DeleteObject(vIconInfo.hbmColor);                                           //2007-11-19 ZswangY37 No.1
  end;
  Result := True;
end; { DrawCursor }

function TakePicture( // ��ȡ����ͼƬ
  mHandle: THandle; // ������
  mBitmap: TBitmap; // ���λͼ
  mCursor: Boolean = False // �Ƿ��ȡ���
): Boolean; // ���ؽ�ȡ�Ƿ�ɹ�
var
  vRect: TRect;
  vDC: HDC;
  vCursorInfo: TCursorInfo;
  vIconInfo: TIconInfo;
  vMaxLogPalette: TMaxLogPalette;
begin
  Result := False;
  if mHandle = 0 then mHandle := GetDesktopWindow;
  if not IsWindow(mHandle) then Exit;
  if not Assigned(mBitmap) then Exit;
  GetWindowRect(mHandle, vRect);
  mBitmap.Width := vRect.Right - vRect.Left;
  mBitmap.Height := vRect.Bottom - vRect.Top;
  mBitmap.Canvas.FillRect(mBitmap.Canvas.ClipRect);

  vDC := GetDC(mHandle);
  try
    if GetDeviceCaps(vDC, RASTERCAPS) and RC_PALETTE = RC_PALETTE then
    begin
      FillChar(vMaxLogPalette, SizeOf(TMaxLogPalette), #0);
      vMaxLogPalette.palVersion := $300;
      vMaxLogPalette.palNumEntries := GetSystemPaletteEntries(
        vDC, 0, 256, vMaxLogPalette.palPalEntry);
      if (vMaxLogPalette.PalNumEntries <> 0) then
        mBitmap.Palette := CreatePalette(PLogPalette(@vMaxLogPalette)^);
    end;

    BitBlt(mBitmap.Canvas.Handle, 0, 0, mBitmap.Width, mBitmap.Height,
      vDC, 0, 0, SRCCOPY or CAPTUREBLT);
    if mCursor then
    begin
      vCursorInfo.cbSize := SizeOf(vCursorInfo);
      GetCursorInfo(vCursorInfo);
      try
        GetIconInfo(vCursorInfo.hCursor, vIconInfo);
        try
          DrawIcon(mBitmap.Canvas.Handle,
            vCursorInfo.ptScreenPos.X - vRect.Left - Integer(vIconInfo.xHotspot),
            vCursorInfo.ptScreenPos.Y - vRect.Top - Integer(vIconInfo.yHotspot),
            vCursorInfo.hCursor);
        finally
          DeleteObject(vIconInfo.hbmMask);                                      //2007-11-19 ZswangY37 No.1
          DeleteObject(vIconInfo.hbmColor);                                     //2007-11-19 ZswangY37 No.1
        end;
      finally
        DestroyCursor(vCursorInfo.hCursor);                                     //2007-11-19 ZswangY37 No.1
      end;
    end;
  finally
    DeleteDC(vDC);
  end;
  Result := True;
end; { TakePicture }

function TakeDesktop( // ��ȡ��Ļָ�������ͼ��
  mBitmap: TBitmap; // ���λͼ
  mRect: TRect; //  ��ȡ������
  mCursor: Boolean = False // �Ƿ��ȡ���
): Boolean; // ���ؽ�ȡ�Ƿ�ɹ�
var
  vDC: HDC;
  vCursorInfo: TCursorInfo;
  vIconInfo: TIconInfo;
  vMaxLogPalette: TMaxLogPalette;
begin
  Result := False;
  if not Assigned(mBitmap) then Exit;
  mBitmap.Width := mRect.Right - mRect.Left;
  mBitmap.Height := mRect.Bottom - mRect.Top;
  vDC := GetDC(0);
  mBitmap.Canvas.Lock;
  try
    if GetDeviceCaps(vDC, RASTERCAPS) and RC_PALETTE = RC_PALETTE then
    begin
      FillChar(vMaxLogPalette, SizeOf(TMaxLogPalette), #0);
      vMaxLogPalette.palVersion := $300;
      vMaxLogPalette.palNumEntries := GetSystemPaletteEntries(
        vDC, 0, 256, vMaxLogPalette.palPalEntry);
      if (vMaxLogPalette.PalNumEntries <> 0) then
        mBitmap.Palette := CreatePalette(PLogPalette(@vMaxLogPalette)^);
    end;

    BitBlt(mBitmap.Canvas.Handle, 0, 0, mBitmap.Width, mBitmap.Height,
      vDC, mRect.Left, mRect.Top, SRCCOPY or CAPTUREBLT);
    if mCursor then
    begin
      vCursorInfo.cbSize := SizeOf(vCursorInfo);
      GetCursorInfo(vCursorInfo);
      try
        GetIconInfo(vCursorInfo.hCursor, vIconInfo);
        try
          DrawIcon(mBitmap.Canvas.Handle,
            vCursorInfo.ptScreenPos.X - mRect.Left - Integer(vIconInfo.xHotspot),
            vCursorInfo.ptScreenPos.Y - mRect.Top - Integer(vIconInfo.yHotspot),
            vCursorInfo.hCursor);
        finally
          DeleteObject(vIconInfo.hbmMask);                                      //2007-11-19 ZswangY37 No.1
          DeleteObject(vIconInfo.hbmColor);                                     //2007-11-19 ZswangY37 No.1
        end;
      finally
        DestroyCursor(vCursorInfo.hCursor);                                     //2007-11-19 ZswangY37 No.1
      end;
    end;
  finally
    mBitmap.Canvas.Unlock;
    ReleaseDC(0, vDC);
  end;
  Result := True;
end; { TakeDesktop }

function BitmapDraw( // ͸�����ƣ�͸��ʱCanvas.Draw�Ŀ�Щ
  mBitmapBack: TBitmap; // ��ͼ
  mBitmapFace: TBitmap; // ��ͼ
  mOffset: TPoint; // ƫ��
  mTransparentColor: TColor // ͸�����������ɫ
): Boolean; // ���ش����Ƿ�ɹ�
var
  X, Y: Integer;
  vRGBQuadFace: PRGBQuad;
  vRGBQuadBack: PRGBQuad;
  vTransparence: TRGBQuad;
  vPixelFormatFace: TPixelFormat;
  vPixelFormatBack: TPixelFormat;
begin
  Result := False;
  if not Assigned(mBitmapFace) then Exit;
  if not Assigned(mBitmapBack) then Exit;
  mTransparentColor := ColorToRGB(mTransparentColor);
  vTransparence.rgbBlue := GetBValue(mTransparentColor);
  vTransparence.rgbGreen := GetGValue(mTransparentColor);
  vTransparence.rgbRed := GetRValue(mTransparentColor);
  vTransparence.rgbReserved := 0;
  if not (mBitmapFace.PixelFormat in [pf24bit, pf32bit]) then
    mBitmapFace.PixelFormat := pf24bit;
  vPixelFormatFace := mBitmapFace.PixelFormat;
  if not (mBitmapBack.PixelFormat in [pf24bit, pf32bit]) then
    mBitmapBack.PixelFormat := pf24bit;
  vPixelFormatBack := mBitmapBack.PixelFormat;
  for Y := 0 to mBitmapFace.Height - 1 do begin
    if Y + mOffset.Y < 0 then Continue;
    if Y + mOffset.Y >= mBitmapBack.Height then Continue;
    vRGBQuadFace := mBitmapFace.ScanLine[Y];
    vRGBQuadBack := mBitmapBack.ScanLine[Y + mOffset.Y];
    Inc(Integer(vRGBQuadBack),
      mOffset.X * (SizeOf(TRGBTriple) + Ord(vPixelFormatBack = pf32bit)));
    for X := 0 to mBitmapFace.Width - 1 do begin
      if (DWORD(mTransparentColor) <> RGB(vRGBQuadFace^.rgbRed,
        vRGBQuadFace^.rgbGreen, vRGBQuadFace^.rgbBlue)) and
        (X + mOffset.X >= 0) and
        (X + mOffset.X < mBitmapBack.Width) then
      begin
        vRGBQuadBack^.rgbBlue := vRGBQuadFace^.rgbBlue;
        vRGBQuadBack^.rgbGreen := vRGBQuadFace^.rgbGreen;
        vRGBQuadBack^.rgbRed := vRGBQuadFace^.rgbRed;
      end;
      Inc(Integer(vRGBQuadFace),
        SizeOf(TRGBTriple) + Ord(vPixelFormatFace = pf32bit));
      Inc(Integer(vRGBQuadBack),
        SizeOf(TRGBTriple) + Ord(vPixelFormatBack = pf32bit));
    end;
  end;
  Result := True;
end; { BitmapDraw }

function BitmapMask( // ȡ��λͼ��ģʽͼ// �ڰ�ͼ
  mBitmap: TBitmap; // Դλͼ
  mTransparentColor: TColor; // ͸����ɫ
  mForeColor: TColor = clBlack; // ǰ��ɫ
  mBackColor: TColor = clWhite // ����ɫ
): Boolean; // ���ش����Ƿ�ɹ�
var
  X: Integer;
  Y: Integer;
  vRGBQuad: PRGBQuad;
  vPixelFormat: TPixelFormat;
begin
  Result := False;
  if not Assigned(mBitmap) then Exit;
  if not (mBitmap.PixelFormat in [pf24bit, pf32bit]) then
    mBitmap.PixelFormat := pf24bit;
  vPixelFormat := mBitmap.PixelFormat;
  mTransparentColor := ColorToRGB(mTransparentColor);
  mForeColor := ColorToRGB(mForeColor);
  mBackColor := ColorToRGB(mBackColor);
  for Y := 0 to mBitmap.Height - 1 do
  begin
    vRGBQuad := mBitmap.ScanLine[Y];
    for X := 0 to mBitmap.Width - 1 do
    begin
      if (DWORD(mTransparentColor) = RGB(vRGBQuad^.rgbRed,
        vRGBQuad^.rgbGreen, vRGBQuad^.rgbBlue)) then
        Move(mBackColor, vRGBQuad^, 3)
      else Move(mForeColor, vRGBQuad^, 3);
      Inc(Integer(vRGBQuad), SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
    end;
  end;
  Result := True;
end; { BitmapMask }

function BitmapReplace( // �滻λͼ�е���ɫ
  mBitmap: TBitmap; // Դλͼ
  mFromColor: TColor; // ��ʷ��ɫ
  mToColor: TColor // Ŀ����ɫ
): Boolean; // �����滻�Ƿ�ɹ�
var
  X: Integer;
  Y: Integer;
  vRGBQuad: PRGBQuad;
  vPixelFormat: TPixelFormat;
begin
  Result := False;
  if not Assigned(mBitmap) then Exit;
  if not (mBitmap.PixelFormat in [pf24bit, pf32bit]) then
    mBitmap.PixelFormat := pf24bit;
  vPixelFormat := mBitmap.PixelFormat;
  mFromColor := ColorToRGB(mFromColor);
  mToColor := ColorToRGB(mToColor);
  for Y := 0 to mBitmap.Height - 1 do
  begin
    vRGBQuad := mBitmap.ScanLine[Y];
    for X := 0 to mBitmap.Width - 1 do
    begin
      if (DWORD(mFromColor) = RGB(vRGBQuad^.rgbRed,
        vRGBQuad^.rgbGreen, vRGBQuad^.rgbBlue)) then
        Move(mToColor, vRGBQuad^, 3);
      Inc(Integer(vRGBQuad), SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
    end;
  end;
  Result := True;
end; { BitmapReplace }

procedure HSL2RGB( // HSL�����RGB
  H, S, L: Integer; // HSL
  var R, G, B: Integer // ��ԭɫ
); overload;
var
  Sat, Lum: Double;
begin
  R := 0;
  G := 0;
  B := 0;
  if (H >= 360) or (H < 0) then Exit;
  if (S > 100) or (S < 0) then Exit;
  if (L > 100) or (L < 0) then Exit;
  if H <= 60 then begin
    R := 255;
    G := Round((255 / 60) * H);
    B := 0;
  end else if H <= 120 then begin
    R := Round(255 - (255 / 60) * (H - 60));
    G := 255;
    B := 0;
  end else if H <= 180 then begin
    R := 0;
    G := 255;
    B := Round((255 / 60) * (H - 120));
  end else if H <= 240 then begin
    R := 0;
    G := Round(255 - (255 / 60) * (H - 180));
    B := 255;
  end else if H <= 300 then begin
    R := Round((255 / 60) * (H - 240));
    G := 0;
    B := 255;
  end else if H < 360 then begin
    R := 255;
    G := 0;
    B := Round(255 - (255 / 60) * (H - 300));
  end;

  Sat := Abs((S - 100) / 100);
  R := Round(R - ((R - 128) * Sat));
  G := Round(G - ((G - 128) * Sat));
  B := Round(B - ((B - 128) * Sat));

  Lum := (L - 50) / 50;
  if Lum > 0 then begin
    R := Round(R + ((255 - R) * Lum));
    G := Round(G + ((255 - G) * Lum));
    B := Round(B + ((255 - B) * Lum));
  end else if Lum < 0 then begin
    R := Round(R + (R * Lum));
    G := Round(G + (G * Lum));
    B := Round(B + (B * Lum));
  end;
end; { HSL2RGB }

procedure HSL2RGB( // HSL�����RGB
  H, S, L: Integer; // HSL
  var nRGB: TColor // RGB
); overload;
var
  R, G, B: Integer;
begin
  HSL2RGB(H, S, L, R, G, B);
  nRGB := RGB(R, G, B);
end; { HSL2RGB }

procedure RGB2HSL( // RGB�����HSL
  R, G, B: Integer; // RGB
  var H, S, L: Integer // HSL
); overload;
var
  T: Double;
  vMax, vMin: Double;
  Red, Green, Blue, Hue, Sat, Lum: Double;
begin
  Red := R / 255;
  Green := G / 255;
  Blue := B / 255;
  vMax := Max(Red, Max(Green, Blue));
  vMin := Min(Red, Min(Green, Blue));
  Lum := (vMax + vMin) / 2;
  if vMax = vMin then begin
   Sat := 0;
   Hue := 0;
  end else begin
    if Lum < 0.5 then
      Sat := (vMax - vMin) / (vMax + vMin)
    else Sat := (vMax - vMin) / (2 - vMax - vMin);
    T := vMax - vMin;
    if Red = vMax then
      Hue := (Green - Blue) / T
    else if Green = vMax then
      Hue := 2 + (Blue - Red) / T
    else Hue := 4.0 + (Red - Green) / T;
    Hue := Hue / 6;
    if Hue < 0 then Hue := Hue + 1;
  end;
  H := Round(Hue * 360);
  S := Round(Sat * 100);
  L := Round(Lum * 100);
end; { RGB2HSL }

procedure RGB2HSL( // RGB�����HSL
  mRGB: TColor; // RGB
  var H, S, L: Integer // HSL
); overload;
begin
  mRGB := ColorToRGB(mRGB);
  RGB2HSL(GetRValue(mRGB), GetGValue(mRGB), GetBValue(mRGB), H, S, L);
end; { RGB2HSL }

function HSLOffset( // HSLƫ��
  mRGB: TColor; // RGB
  mOffsetH, mOffsetS, mOffsetL: Integer // HSL
): TColor; // ����ƫ�ƺ����ɫ
var
  H, S, L: Integer;
begin
  RGB2HSL(mRGB, H, S, L);
  H := H + mOffsetH;
  S := S + mOffsetS;
  L := L + mOffsetL;
  HSL2RGB(H, S, L, Result);
end; { HSLOffset }

function BitmapGridPoint( // λͼ���㴦��
  mBitmap: TBitmap; // Ŀ��λͼ
  mOffset: Boolean; // ��λ����
  mTransparentColor: TColor // ͸����ɫ
): Boolean; // ���ش����Ƿ�ɹ�
var
  X, Y: Integer;
  vRGBQuad: PRGBQuad;
  vTransparent: RGBQuad;
  vPixelFormat: TPixelFormat;
begin
  Result := False;
  if not Assigned(mBitmap) then Exit;
  if not (mBitmap.PixelFormat in [pf24bit, pf32bit]) then
    mBitmap.PixelFormat := pf24bit;
  vPixelFormat := mBitmap.PixelFormat;
  mTransparentColor := ColorToRGB(mTransparentColor);
  vTransparent.rgbBlue := GetBValue(mTransparentColor);
  vTransparent.rgbRed := GetRValue(mTransparentColor);
  vTransparent.rgbGreen := GetGValue(mTransparentColor);

  for Y := 0 to mBitmap.Height - 1 do
  begin
    vRGBQuad := mBitmap.ScanLine[Y];
    for X := 0 to mBitmap.Width - 1 do
    begin
      if Odd(X) xor Odd(Y) xor mOffset then
        Move(vTransparent, vRGBQuad^,
          SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
      Inc(Integer(vRGBQuad), SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
    end;
  end;
  Result := True;
end; { BitmapGridPoint }

function BitmapBlur( // λͼģ������ 
  mBitmap: TBitmap; // Ŀ��λͼ
  mScale: Real; // ģ����
  mTransparentColor: TColor // ͸�����������ɫ
): Boolean; // ���ش����Ƿ�ɹ�
var
  X, Y: Integer;
  C: Real;
  vRGBQuadCenter,
  vRGBQuadRight, vRGBQuadLeft,
  vRGBQuadTop, vRGBQuadBottom,
  vRGBQuadLeftTop, vRGBQuadLeftBottom,
  vRGBQuadRightTop, vRGBQuadRightBottom: PRGBQuad;
  vRGBQuad: PRGBQuad;
  vPixelFormat: TPixelFormat;
  vBitmap: TBitmap;
begin
  Result := False;
  if not Assigned(mBitmap) then Exit;
  if not (mBitmap.PixelFormat in [pf24bit, pf32bit]) then
    mBitmap.PixelFormat := pf24bit;
  vPixelFormat := mBitmap.PixelFormat;
  vBitmap := TBitmap.Create;
  try
    vBitmap.Assign(mBitmap);
    for Y := 0 to mBitmap.Height - 1 do
    begin
      vRGBQuadCenter := vBitmap.ScanLine[Y];
      vRGBQuad := mBitmap.ScanLine[Y];
      if Y > 0 then
        vRGBQuadTop := vBitmap.ScanLine[Y - 1]
      else vRGBQuadTop := vRGBQuadCenter;
      if Y < mBitmap.Height - 1 then
        vRGBQuadBottom := vBitmap.ScanLine[Y + 1]
      else vRGBQuadBottom := vRGBQuadCenter;
      for X := 0 to mBitmap.Width - 1 do
      begin
        if DWORD(mTransparentColor) <> RGB(vRGBQuad^.rgbRed,
           vRGBQuad^.rgbGreen, vRGBQuad^.rgbBlue) then
        begin
          vRGBQuadLeft := vRGBQuadCenter;
          if X > 0 then Dec(Integer(vRGBQuadLeft),
            SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
          vRGBQuadRight := vRGBQuadCenter;
          if X < mBitmap.Width - 1 then Inc(Integer(vRGBQuadRight),
            SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));

          vRGBQuadLeftTop := vRGBQuadTop;
          if X > 0 then Dec(Integer(vRGBQuadLeftTop),
            SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
          vRGBQuadRightTop := vRGBQuadTop;
          if X < mBitmap.Width - 1 then Inc(Integer(vRGBQuadRightTop),
            SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));

          vRGBQuadLeftBottom := vRGBQuadBottom;
          if X > 0 then Dec(Integer(vRGBQuadLeftBottom),
            SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
          vRGBQuadRightBottom := vRGBQuadBottom;
          if X < mBitmap.Width - 1 then Inc(Integer(vRGBQuadRightBottom),
            SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));

          C := (vRGBQuadLeftTop^.rgbRed + vRGBQuadLeftBottom^.rgbRed +
            vRGBQuadRightTop^.rgbRed + vRGBQuadRightBottom^.rgbRed +
            vRGBQuadCenter^.rgbRed * mScale + vRGBQuadRight^.rgbRed +
            vRGBQuadLeft^.rgbRed + vRGBQuadTop^.rgbRed +
            vRGBQuadBottom^.rgbRed);
          vRGBQuad^.rgbRed := Max(0, Min(255, Round(C / 9)));

          C := (vRGBQuadLeftTop^.rgbBlue + vRGBQuadLeftBottom^.rgbBlue +
            vRGBQuadRightTop^.rgbBlue + vRGBQuadRightBottom^.rgbBlue +
            vRGBQuadCenter^.rgbBlue * mScale + vRGBQuadRight^.rgbBlue +
            vRGBQuadLeft^.rgbBlue + vRGBQuadTop^.rgbBlue +
            vRGBQuadBottom^.rgbBlue);
          vRGBQuad^.rgbBlue := Max(0, Min(255, Round(C / 9)));

          C := (vRGBQuadLeftTop^.rgbGreen + vRGBQuadLeftBottom^.rgbGreen +
            vRGBQuadRightTop^.rgbGreen + vRGBQuadRightBottom^.rgbGreen +
            vRGBQuadCenter^.rgbGreen * mScale + vRGBQuadRight^.rgbGreen +
            vRGBQuadLeft^.rgbGreen + vRGBQuadTop^.rgbGreen +
            vRGBQuadBottom^.rgbGreen);
          vRGBQuad^.rgbGreen := Max(0, Min(255, Round(C / 9)));
        end;
        Inc(Integer(vRGBQuad),
          SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
        Inc(Integer(vRGBQuadTop),
          SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
        Inc(Integer(vRGBQuadBottom),
          SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
        Inc(Integer(vRGBQuadCenter),
          SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
      end;
    end;
  finally
    vBitmap.Free;
  end;
  Result := True;
end; { BitmapBlur }

function BitmapRotateHorizontal( // ��λͼˮƽ��ת
  mSource: TBitmap; // Դλͼ
  mDest: TBitmap // Ŀ��λͼ
): Boolean; overload; // ���ش����Ƿ�ɹ�
var
  I: Integer;
  J: Integer;
  A, B: PRGBQuad;
  vPixelFormat: TPixelFormat;
begin
  Result := False;
  if not (Assigned(mSource) and Assigned(mDest)) then Exit;
  if not (mSource.PixelFormat in [pf24bit, pf32bit]) then
    mSource.PixelFormat := pf24bit;
  vPixelFormat := mSource.PixelFormat;
  mDest.Assign(mSource);
  mDest.Width := mSource.Width;
  mDest.Height := mSource.Height;

  for J := 0 to mSource.Height - 1 do
  begin
    A := mSource.ScanLine[J];
    B := mDest.ScanLine[J];
    Inc(Integer(B),
      (SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit)) * mSource.Width);
    for I := 0 to mSource.Width - 1 do
    begin
      Dec(Integer(B), SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
      Move(A^, B^, SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
      Inc(Integer(A), SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
    end;
  end;
  Result := True;
end; { BitmapRotateHorizontal }

function BitmapRotateVertical( // ��λͼ��ֱ��ת
  mSource: TBitmap; // Դλͼ
  mDest: TBitmap // Ŀ��λͼ
): Boolean; overload; // ���ش����Ƿ�ɹ�
var
  I: Integer;
  J: Integer;
  A, B: PRGBQuad;
  vPixelFormat: TPixelFormat;
begin
  Result := False;
  if not (Assigned(mSource) and Assigned(mDest)) then Exit;
  if not (mSource.PixelFormat in [pf24bit, pf32bit]) then
    mSource.PixelFormat := pf24bit;
  vPixelFormat := mSource.PixelFormat;
  mDest.Assign(mSource);
  mDest.Width := mSource.Width;
  mDest.Height := mSource.Height;

  for J := 0 to mSource.Height - 1 do
  begin
    A := mSource.ScanLine[J];
    B := mDest.ScanLine[mSource.Height - J - 1];
    for I := 0 to mSource.Width - 1 do
    begin
      Move(A^, B^, SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
      Inc(Integer(A), SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
      Inc(Integer(B), SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
    end;
  end;
  Result := True;
end; { BitmapRotateVertical }

function BitmapRotate90( // ��λͼ��ת90��
  mSource: TBitmap; // Դλͼ
  mDest: TBitmap // Ŀ��λͼ
): Boolean; overload; // ���ش����Ƿ�ɹ�
var
  I: Integer;
  J: Integer;
  A, B: PRGBQuad;
  vPixelFormat: TPixelFormat;
begin
  Result := False;
  if not (Assigned(mSource) and Assigned(mDest)) then Exit;
  if not (mSource.PixelFormat in [pf24bit, pf32bit]) then
    mSource.PixelFormat := pf24bit;
  vPixelFormat := mSource.PixelFormat;
  mDest.Assign(mSource);
  mDest.Width := mSource.Height;
  mDest.Height := mSource.Width;
  for J := 0 to mSource.Height - 1 do
  begin
    A := mSource.ScanLine[J];
    for I := 0 to mSource.Width - 1 do
    begin
      B := mDest.ScanLine[mSource.Width - I - 1];
      Inc(Integer(B),
        (SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit)) * J);
      Move(A^, B^, SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
      Inc(Integer(A), SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
    end;
  end;
  Result := True;
end; { BitmapRotate90 }

function BitmapRotate180( // ��λͼ��ת18��
  mSource: TBitmap; // Դλͼ
  mDest: TBitmap // Ŀ��λͼ
): Boolean; overload; // ���ش����Ƿ�ɹ�
var
  I: Integer;
  J: Integer;
  A, B: PRGBQuad;
  vPixelFormat: TPixelFormat;
begin
  Result := False;
  if not (Assigned(mSource) and Assigned(mDest)) then Exit;
  if not (mSource.PixelFormat in [pf24bit, pf32bit]) then
    mSource.PixelFormat := pf24bit;
  vPixelFormat := mSource.PixelFormat;
  mDest.Assign(mSource);
  mDest.Width := mSource.Width;
  mDest.Height := mSource.Height;
  for J := 0 to mSource.Height - 1 do
  begin
    A := mSource.ScanLine[J];
    B := mDest.ScanLine[mSource.Height - J - 1];
    Inc(Integer(B),
      (SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit)) * mSource.Width);
    for I := 0 to mSource.Width - 1 do
    begin
      Dec(Integer(B), SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
      Move(A^, B^, SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
      Inc(Integer(A), SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
    end;
  end;
  Result := True;
end; { BitmapRotate180 }

function BitmapRotate270( // ��λͼ��ת90��
  mSource: TBitmap; // Դλͼ
  mDest: TBitmap // Ŀ��λͼ
): Boolean; overload; // ���ش����Ƿ�ɹ�
var
  I: Integer;
  J: Integer;
  A, B: PRGBQuad;
  vPixelFormat: TPixelFormat;
begin
  Result := False;
  if not (Assigned(mSource) and Assigned(mDest)) then Exit;
  if not (mSource.PixelFormat in [pf24bit, pf32bit]) then
    mSource.PixelFormat := pf24bit;
  vPixelFormat := mSource.PixelFormat;
  mDest.Assign(mSource);
  mDest.Width := mSource.Height;
  mDest.Height := mSource.Width;
  for J := 0 to mSource.Height - 1 do
  begin
    A := mSource.ScanLine[J];
    for I := 0 to mSource.Width - 1 do
    begin
      B := mDest.Scanline[I];
      Inc(Integer(B),
        (SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit)) *
        (mSource.Height - J - 1));
      Move(A^, B^, SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
      Inc(Integer(A), SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
    end;
  end;
end; { BitmapRotate270 }

function BitmapTransparent( // λͼ͸������
  mBitmapBack: TBitmap; // ����ͼ
  mBitmapFace: TBitmap; // ����ͼ
  mTransparentColor: TColor; // ͸�����������ɫ
  mScale: Byte; // �̶� 0~255
  mOffset: TPoint // ���Ƶ�ƫ������
): Boolean; // ���ش����Ƿ�ɹ�
var
  X, Y: Integer;
  vRGBQuadFace: PRGBQuad;
  vRGBQuadBack: PRGBQuad;
  vPixelFormatFace: TPixelFormat;
  vPixelFormatBack: TPixelFormat;
begin
  Result := False;
  if not Assigned(mBitmapFace) then Exit;
  if not Assigned(mBitmapBack) then Exit;
  if not (mBitmapFace.PixelFormat in [pf24bit, pf32bit]) then
    mBitmapFace.PixelFormat := pf24bit;
  vPixelFormatFace := mBitmapFace.PixelFormat;
  if not (mBitmapBack.PixelFormat in [pf24bit, pf32bit]) then
    mBitmapBack.PixelFormat := pf24bit;
  vPixelFormatBack := mBitmapBack.PixelFormat;
  mTransparentColor := ColorToRGB(mTransparentColor);
  for Y := 0 to mBitmapFace.Height - 1 do
  begin
    if Y + mOffset.Y < 0 then Continue;
    if Y + mOffset.Y >= mBitmapBack.Height then Continue;
    vRGBQuadFace := mBitmapFace.ScanLine[Y];
    vRGBQuadBack := mBitmapBack.ScanLine[Y + mOffset.Y];
    Inc(Integer(vRGBQuadBack),
      mOffset.X * (SizeOf(TRGBTriple) + Ord(vPixelFormatBack = pf32bit)));
    for X := 0 to mBitmapFace.Width - 1 do
    begin
      if (DWORD(mTransparentColor) <> RGB(vRGBQuadFace^.rgbRed,
        vRGBQuadFace^.rgbGreen, vRGBQuadFace^.rgbBlue)) and
        (X + mOffset.X >= 0) and
        (X + mOffset.X < mBitmapBack.Width) then
      begin
        vRGBQuadBack^.rgbBlue :=
          (vRGBQuadBack^.rgbBlue * mScale +
            vRGBQuadFace^.rgbBlue * (255 - mScale)) shr 8 and $FFFFFF;
        vRGBQuadBack^.rgbRed :=
          (vRGBQuadBack^.rgbRed * mScale +
            vRGBQuadFace^.rgbRed * (255 - mScale)) shr 8 and $FFFFFF;
        vRGBQuadBack^.rgbGreen :=
          (vRGBQuadBack^.rgbGreen * mScale +
            vRGBQuadFace^.rgbGreen * (255 - mScale)) shr 8 and $FFFFFF;
      end;
      Inc(Integer(vRGBQuadFace),
        SizeOf(TRGBTriple) + Ord(vPixelFormatFace = pf32bit));
      Inc(Integer(vRGBQuadBack),
        SizeOf(TRGBTriple) + Ord(vPixelFormatBack = pf32bit));
    end;
  end;
  Result := True;
end; { BitmapTransparent }

function BitmapRGBScale( // λͼ��ɫ����
  mBitmap: TBitmap; // Ŀ��λͼ
  R, G, B: Integer; // ��ɫ�仯����
  mTransparentColor: TColor // ͸�����������ɫ
): Boolean; // ���ش����Ƿ�ɹ�
var
  X, Y: Integer;
  I: Byte;
  vColorTable: array[0..255] of TRGBTriple;
  vRGBQuad: PRGBQuad;
  vPixelFormat: TPixelFormat;
begin
  Result := False;
  if not Assigned(mBitmap) then Exit;
  if not (mBitmap.PixelFormat in [pf24bit, pf32bit]) then
    mBitmap.PixelFormat := pf24bit;
  vPixelFormat := mBitmap.PixelFormat;
  for I := 0 to 255 do
  begin
    vColorTable[I].rgbtRed := Max(Min(255, I + R), 0);
    vColorTable[I].rgbtGreen := Max(Min(255, I + G), 0);
    vColorTable[I].rgbtBlue := Max(Min(255, I + B), 0);
  end;
  for Y := 0 to mBitmap.Height - 1 do
  begin
    vRGBQuad := mBitmap.ScanLine[Y];
    for X := 0 to mBitmap.Width - 1 do
    begin
      if (DWORD(mTransparentColor) <> RGB(vRGBQuad^.rgbRed,
        vRGBQuad^.rgbGreen, vRGBQuad^.rgbBlue)) then
      begin
        vRGBQuad^.rgbRed := vColorTable[vRGBQuad^.rgbRed].rgbtRed;
        vRGBQuad^.rgbGreen := vColorTable[vRGBQuad^.rgbGreen].rgbtGreen;
        vRGBQuad^.rgbBlue := vColorTable[vRGBQuad^.rgbBlue].rgbtBlue;
      end;
      Inc(Integer(vRGBQuad), SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
    end;
  end;
  Result := True;
end; { BitmapRGBScale }

function BmpToIco( // λͼ�����ͼ��
  mBitmap: TBitmap; // λͼ
  mIcon: TIcon; // ͼ��
  mSize32: Boolean = True; // �Ƿ�Ϊ��ͼ��
  mTransparentColor: TColor = clDefault; // ͸����ɫ Ĭ��Ϊ���½�
  mHotspotX: Integer = 0; // �ȵ�X
  mHotspotY: Integer = 0 // �ȵ�Y
): Boolean; // ���ش����Ƿ�ɹ�
var
  vIconWidth: Integer;
  vIconHeight: Integer;
  vBitmapMask: TBitmap;
  vBitmapColor: TBitmap;
  vIconInfo: TIconInfo;
begin
  Result := True;
  if mSize32 then begin
    vIconWidth := 32;
    vIconHeight := 32;
  end else begin
    vIconWidth := 16;
    vIconHeight := 16;
  end;

  vBitmapMask := TBitmap.Create;
  vBitmapColor := TBitmap.Create;
  try
    vBitmapMask.Width := vIconWidth;
    vBitmapMask.Height := vIconHeight;
    SetStretchBltMode(vBitmapColor.Canvas.Handle, COLORONCOLOR);                //2006-11-17 ZswangY37 No.1
    if mTransparentColor = clNone then
    begin
      vBitmapMask.Canvas.Brush.Color := clWhite;
      vBitmapMask.Canvas.FillRect(vBitmapMask.Canvas.ClipRect);
    end else
    begin
      StretchBlt(vBitmapMask.Canvas.Handle, 0, 0, vIconWidth, vIconHeight,
        mBitmap.Canvas.Handle, 0, 0, mBitmap.Width, mBitmap.Height, SRCCOPY);
      if mTransparentColor = clDefault then
        mTransparentColor := vBitmapMask.Canvas.Pixels[0, vBitmapMask.Height - 1];
      BitmapMask(vBitmapMask, mTransparentColor);
    end;
    vBitmapColor.Width := vIconWidth;
    vBitmapColor.Height := vIconHeight;
    StretchBlt(vBitmapColor.Canvas.Handle, 0, 0, vIconWidth, vIconHeight,
      mBitmap.Canvas.Handle, 0, 0, mBitmap.Width, mBitmap.Height, SRCCOPY);
    if mTransparentColor <> clNone then
      BitmapReplace(vBitmapColor, mTransparentColor, clBlack);

    vIconInfo.fIcon := True;
    vIconInfo.xHotspot := mHotspotX;
    vIconInfo.yHotspot := mHotspotY;
    vIconInfo.hbmMask := vBitmapMask.Handle;
    vIconInfo.hbmColor := vBitmapColor.Handle;
    mIcon.Handle := CreateIconIndirect(vIconInfo);
  except
    Result := False;
  end;
  vBitmapMask.Free;
  vBitmapColor.Free;
end; { BmpToIco }

function IcoToBmp( // ͼ�괦���λͼ
  mIcon: TIcon; // ͼ��
  mBitmap: TBitmap // λͼ
): Boolean; // ���ش����Ƿ�ɹ�
var
  vIconWidth: Integer;
  vIconHeight: Integer;
begin
  Result := True;
  try
    vIconWidth := mIcon.Width;
    vIconHeight := mIcon.Height;
    mBitmap.Width := vIconWidth;
    mBitmap.Height := vIconHeight;
    mBitmap.Canvas.FillRect(Rect(0, 0, vIconWidth, vIconHeight));
    mBitmap.Canvas.Draw(0, 0, mIcon);
  except
    Result := False;
  end;
end; { IcoToBmp }

function JpegToBmp( // JpgͼƬ�����λͼ
  mJPEGImage: TJPEGImage; // JpgͼƬ
  mBitmap: TBitmap // λͼ
): Boolean; // ���ش����Ƿ�ɹ�
begin
  Result := True;
  try
    mBitmap.Assign(mJPEGImage);
  except
    Result := False;
  end;
end; { JpegToBmp }

function BmpToJpeg( // λͼ�����JpgͼƬ
  mBitmap: TBitmap; // λͼ
  mJPEGImage: TJPEGImage; // JpgͼƬ
  mCompressionQuality: Integer = 75 // ѹ����
): Boolean; // ���ش����Ƿ�ɹ�
begin
  Result := True;
  try
    mJPEGImage.Assign(mBitmap);
    mJPEGImage.CompressionQuality := mCompressionQuality;
    mJPEGImage.Compress;
  except
    Result := False;
  end;
end; { BmpToJpeg }

function BitmapGrayScale( // λͼ�Ҷȴ���
  mBitmap: TBitmap; // λͼ
  mTransparentColor: TColor // ͸�����������ɫ
): Boolean; // ���ش����Ƿ�ɹ�
var
  X: Integer;
  Y: Integer;
  vRGBQuad: PRGBQuad;
  vPixelFormat: TPixelFormat;
begin
  Result := False;
  if not Assigned(mBitmap) then Exit;
  if not (mBitmap.PixelFormat in [pf24bit, pf32bit]) then
    mBitmap.PixelFormat := pf24bit;
  vPixelFormat := mBitmap.PixelFormat;
  mTransparentColor := ColorToRGB(mTransparentColor);
  for Y := 0 to mBitmap.Height - 1 do
  begin
    vRGBQuad := mBitmap.ScanLine[Y];
    for X := 0 to mBitmap.Width - 1 do
    begin
      if (DWORD(mTransparentColor) <> RGB(vRGBQuad^.rgbRed,
        vRGBQuad^.rgbGreen, vRGBQuad^.rgbBlue)) then
      begin
        vRGBQuad^.rgbRed := (77 * vRGBQuad^.rgbRed +
          151 * vRGBQuad^.rgbGreen + 28 * vRGBQuad^.rgbBlue) shr 8;
        vRGBQuad^.rgbGreen := vRGBQuad^.rgbRed;
        vRGBQuad^.rgbBlue := vRGBQuad^.rgbRed;
      end;
      Inc(Integer(vRGBQuad), SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
    end;
  end;
  Result := True;
end; { BitmapGrayScale }

function BitmapReverseRGB( // �ߵ�λͼ��RGBֵ
  mBitmap: TBitmap // λͼ
): Boolean; // ���ش����Ƿ�ɹ�
var
  X: Integer;
  Y: Integer;
  T: Byte;
  vRGBQuad: PRGBQuad;
  vPixelFormat: TPixelFormat;
begin
  Result := False;
  if not Assigned(mBitmap) then Exit;
  if mBitmap.PixelFormat in [pf1bit] then Exit; // ��ɫû�еߵ��ı�Ҫ
  if not (mBitmap.PixelFormat in [pf24bit, pf32bit]) then
    mBitmap.PixelFormat := pf24bit;
  vPixelFormat := mBitmap.PixelFormat;
  for Y := 0 to mBitmap.Height - 1 do
  begin
    vRGBQuad := mBitmap.ScanLine[Y];
    for X := 0 to mBitmap.Width - 1 do
    begin
      T := vRGBQuad^.rgbRed;
      vRGBQuad^.rgbRed := vRGBQuad^.rgbBlue;
      vRGBQuad^.rgbBlue := T;
      Inc(Integer(vRGBQuad), SizeOf(TRGBTriple) + Ord(vPixelFormat = pf32bit));
    end;
  end;
  Result := True;
end; { BitmapReverseRGB }

function CompareColor( // �Ƚ�������ɫ�Ĳ��
  mColorA, mColorB: TColor
): Integer; overload;
begin
  mColorA := ColorToRGB(mColorA);
  mColorB := ColorToRGB(mColorB);
  Result := Abs(GetRValue(mColorA) - GetRValue(mColorB)) +
    Abs(GetGValue(mColorA) - GetGValue(mColorB)) +
    Abs(GetBValue(mColorA) - GetBValue(mColorB));
  Result := Result div 3;
end; { CompareColor }

function CompareColor(  // �Ƚ�������ɫ�Ĳ��
  mColorA, mColorB: TRGBTriple
): Integer; overload;
begin
  Result := Abs(mColorA.rgbtRed - mColorB.rgbtRed) +
    Abs(mColorA.rgbtBlue - mColorB.rgbtBlue) +
    Abs(mColorA.rgbtGreen - mColorB.rgbtGreen);
  Result := Result div 3;
end; { CompareColor }

function GraphicToRGN( // �õ�ͼƬ�Ĳ���������
  mGraphic: TGraphic; // ͼƬ
  mTransparentColor: TColor = clBlack; // ͸��ɫ
  mSpace: Integer = 0 // ��ɫ�����
): HRGN; // ����ͼƬ�Ĳ�����������
const
  cAllocRect = $FF; // Ԥ���������������
  cHeaderSize = SizeOf(TRgnDataHeader);
  cRectSize = SizeOf(TRect);
var
  vRGN: HRGN;
  vRgnData: PRgnData;
  X, Y, X0: Integer;
  vScanLinePtr: Pointer;
  vScanLineInc: Integer;
  vMaxRects: Cardinal;
  vTransparent: TRGBTriple;
  vBitmap: TBitmap;
begin
  Result := 0;
  if not Assigned(mGraphic) then Exit;
  if mGraphic.Height <= 0 then Exit;  
  if mGraphic.Width <= 0 then Exit;
  mTransparentColor := ColorToRGB(mTransparentColor);
  vTransparent.rgbtBlue := GetBValue(mTransparentColor);
  vTransparent.rgbtGreen := GetGValue(mTransparentColor);
  vTransparent.rgbtRed := GetRValue(mTransparentColor);
  vMaxRects := cAllocRect;
  GetMem(vRgnData, cHeaderSize + cRectSize * vMaxRects);
  if mGraphic is TBitmap then
    vBitmap := mGraphic as TBitmap
  else vBitmap := TBitmap.Create;
  with vBitmap do try
    PixelFormat := pf24bit;
    if not (mGraphic is TBitmap) then
    begin
      Width := mGraphic.Width;
      Height := mGraphic.Height;
      Canvas.Draw(0, 0, mGraphic);
    end;

    with vRgnData^.rdh do
    begin
      dwSize := cHeaderSize;
      iType := RDH_RECTANGLES;
      nCount := 0;
      nRgnSize := 0;
      SetRect(rcBound, MAXLONG, MAXLONG, 0, 0);
    end;
    vScanLinePtr := ScanLine[0];
    if Height > 1 then
      vScanLineInc := Integer(ScanLine[1]) - Integer(vScanLinePtr)              //2007-03-22 ZswangY37 No.1
    else vScanLineInc := Width * 3;
    for Y := 0 to Height - 1 do
    begin
      X := 0;
      while X < Width do
      begin
        X0 := X;
        while X < Width do
        begin
          if CompareColor(
            PRGBTriple(Integer(vScanLinePtr) + X * SizeOf(TRGBTriple))^,
            vTransparent) <= mSpace then
            Break;
          Inc(X);
        end;
        if X > X0 then
        begin
          if vRgnData^.rdh.nCount >= vMaxRects then
          begin
            Inc(vMaxRects, cAllocRect);
            ReallocMem(vRgnData, cHeaderSize + cRectSize * vMaxRects);
          end;
          with vRgnData^.rdh do
          begin
            SetRect(PRect(DWORD(@vRgnData^.Buffer) + nCount * cRectSize)^,
              X0, Y, X, Y + 1);
            if X0 < rcBound.Left then rcBound.Left := X0;
            if Y < rcBound.Top then rcBound.Top := Y;
            if X > rcBound.Right then rcBound.Right := X;
            if Y + 1 > rcBound.Bottom then rcBound.Bottom := Y + 1;
            Inc(nCount);
          end;
        end;
        if vRgnData^.rdh.nCount = 2000 then
        begin
          vRGN := ExtCreateRegion(nil,
            cHeaderSize + cRectSize * vMaxRects, vRgnData^);
          if Result > 0 then
          begin
            CombineRgn(Result, Result, vRGN, RGN_OR);
            DeleteObject(vRGN);
          end else Result := vRGN;
          vRgnData^.rdh.nCount := 0;
          SetRect(vRgnData^.rdh.rcBound, MAXLONG, MAXLONG, 0, 0);
        end;
        Inc(X);
      end;
      Inc(Integer(vScanLinePtr), vScanLineInc);
    end;
    vRGN := ExtCreateRegion(nil,
      cHeaderSize + cRectSize * vMaxRects, vRgnData^);
    if Result > 0 then
    begin
      CombineRgn(Result, Result, vRGN, RGN_OR);
      DeleteObject(vRGN);
    end else Result := vRGN;
  finally
    FreeMem(vRgnData, cHeaderSize + cRectSize * vMaxRects);
    if not (mGraphic is TBitmap) then vBitmap.Free;
  end;
end; { GraphicToRGN }

function BitmapDrawHorizontal( // λͼˮƽ�������
  mBitmap: TBitmap; // Դλͼ
  mCanvas: TCanvas; // ���ƵĻ���
  mLeft: Integer; // ���Ƶ���߽�
  mTop: Integer; // ���Ƶ��ϱ߽�
  mWidth: Integer; // ���ƵĿ��
  mCenterX: Integer // λͼ���������X����
): Boolean; // ���ػ����Ƿ�ɹ�
begin
  Result := False;
  if not Assigned(mBitmap) then Exit;
  if not Assigned(mCanvas) then Exit;
  StretchBlt(mCanvas.Handle, mLeft, mTop, mCenterX, mBitmap.Height,
    mBitmap.Canvas.Handle, 0, 0, mCenterX, mBitmap.Height, SRCCOPY); // ���

  StretchBlt(mCanvas.Handle, mLeft + mWidth - mBitmap.Width + mCenterX, mTop,
    mBitmap.Width - mCenterX, mBitmap.Height, mBitmap.Canvas.Handle,
    mCenterX, 0, mBitmap.Width - mCenterX, mBitmap.Height, SRCCOPY); // �ұ�

  StretchBlt(mCanvas.Handle, mLeft + mCenterX, mTop, mWidth - mBitmap.Width,
    mBitmap.Height, mBitmap.Canvas.Handle,
    mCenterX, 0, 1, mBitmap.Height, SRCCOPY); // �м�����
  Result := True;
end; { BitmapDrawHorizontal }

function BitmapDrawVertical( // λͼ��ֱ�������
  mBitmap: TBitmap; // Դλͼ
  mCanvas: TCanvas; // ���ƵĻ���
  mLeft: Integer; // ���Ƶ���߽�
  mTop: Integer; // ���Ƶ��ϱ߽�
  mHeight: Integer; // ���ƵĿ��
  mCenterY: Integer // λͼ���������X����
): Boolean; // ���ػ����Ƿ�ɹ�
begin
  Result := False;
  if not Assigned(mBitmap) then Exit;
  if not Assigned(mCanvas) then Exit;
  StretchBlt(mCanvas.Handle, mLeft, mTop, mBitmap.Width, mCenterY,
    mBitmap.Canvas.Handle, 0, 0, mBitmap.Width, mCenterY, SRCCOPY); // �ϱ�

  StretchBlt(mCanvas.Handle, mLeft, mTop + mHeight - mBitmap.Height + mCenterY,
    mBitmap.Width, mBitmap.Height - mCenterY, mBitmap.Canvas.Handle,
    0, mCenterY, mBitmap.Width, mBitmap.Height - mCenterY, SRCCOPY); // �±�

  StretchBlt(mCanvas.Handle, mLeft, mTop + mCenterY,  mBitmap.Width,
    mHeight - mBitmap.Height, mBitmap.Canvas.Handle,
    0, mCenterY, mBitmap.Width, 1, SRCCOPY); // �м�����
  Result := True;
end; { BitmapDrawVertical }

function CircleCursor( // ����һ��Բ�ε����ͼ��
  AColor: TColor; // ָ��Բ�ε���ɫ
  ASize: Integer // ָ��Բ�ε�ֱ��
): HCursor; // �������ͼ�����
var
  vBitmapMask: TBitmap;
  vBitmapColor: TBitmap;
  vIconInfo: TIconInfo;
begin
  vBitmapMask := TBitmap.Create;
  vBitmapColor := TBitmap.Create;
  try
    vBitmapMask.PixelFormat := pf24bit;
    vBitmapColor.PixelFormat := pf24bit;

    vBitmapMask.Width := 32;
    vBitmapMask.Height := 32;
    vBitmapMask.Canvas.Brush.Color := clWhite;
    vBitmapMask.Canvas.FillRect(Rect(0, 0, 32, 32));
    vBitmapMask.Canvas.Brush.Color := clBlack;
    vBitmapMask.Canvas.Ellipse(0, 0, ASize, ASize);

    vBitmapColor.Width := 32;
    vBitmapColor.Height := 32;
    vBitmapColor.Canvas.Brush.Color := clBlack;
    vBitmapColor.Canvas.FillRect(Rect(0, 0, 32, 32));
    vBitmapColor.Canvas.Pen.Color := AColor;
    vBitmapColor.Canvas.Brush.Color := AColor;
    vBitmapColor.Canvas.Ellipse(0, 0, ASize, ASize);

    vIconInfo.fIcon := True;
    vIconInfo.xHotspot := ASize div 2;
    vIconInfo.yHotspot := ASize div 2;
    vIconInfo.hbmMask := vBitmapMask.Handle;
    vIconInfo.hbmColor := vBitmapColor.Handle;
    Result := CreateIconIndirect(vIconInfo);
  finally
    vBitmapMask.Free;
    vBitmapColor.Free;
  end;
end; { CircleCursor }

end.


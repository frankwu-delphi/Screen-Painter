unit CursorResource21;

interface

{$R 'CursorResource21.res' 'CursorResource21.rc'}

uses Windows, Graphics, Controls, Forms;

const
  crPen: TCursor = $1000 + 1; // ��ˢ
  crLeftLabel: TCursor = $1000 + 2; // ��ע��
  crRightLabel: TCursor = $1000 + 3; // ��ע��
  crLine: TCursor = $1000 + 4; // ֱ��
  crSingleArrow: TCursor = $1000 + 5; // ��ͷ��
  crDoubleArrow: TCursor = $1000 + 6; // ��ͷ˫
  crHollowRectangle: TCursor = $1000 + 7; // ���ο�
  crSolidRectangle: TCursor = $1000 + 8; // ����ʵ
  crHollowEllipse: TCursor = $1000 + 9; // ԰�ο�
  crSolidEllipse: TCursor = $1000 + 10; // ԰��ʵ
  crClock: TCursor = $1000 + 11; // ʱ��
  crHuman: TCursor = $1000 + 12; // С��
  crFace: TCursor = $1000 + 13; // Ц��
  crSelect: TCursor = crDefault; //$1000 + 14; // ѡȡ
  crTriangle: TCursor = $1000 + 15; // ����
  crLaserOn: TCursor = $1000 + 16; // ��ʿ�
  crLaserOff: TCursor = $1000 + 17; // ��ʹ�
  crError: TCursor = $1000 + 18; // ���
  crSucceed: TCursor = $1000 + 19; // ����
  crHollowDiamond: TCursor = $1000 + 19 + 1; // ���ο�
  crSolidDiamond: TCursor = $1000 + 21; // ����ʵ
  crHollowPentagon: TCursor = $1000 + 22; // ��ǿ�
  crSolidPentagon: TCursor = $1000 + 23; // ���ʵ
  crRoundA: TCursor = $1000 + 24; // ��ת1
  crRoundB: TCursor = $1000 + 25; // ��ת2

implementation

procedure LoadCursorResource;
begin
  Screen.Cursors[crPen] := LoadCursor(HInstance, 'Cursor_Pen20');
  Screen.Cursors[crLeftLabel] := LoadCursor(HInstance, 'Cursor_LeftLabel20');
  Screen.Cursors[crRightLabel] := LoadCursor(HInstance, 'Cursor_RightLabel20');
  Screen.Cursors[crLine] := LoadCursor(HInstance, 'Cursor_Line20');
  Screen.Cursors[crSingleArrow] := LoadCursor(HInstance, 'Cursor_SingleArrow20');
  Screen.Cursors[crDoubleArrow] := LoadCursor(HInstance, 'Cursor_DoubleArrow20');
  Screen.Cursors[crHollowRectangle] := LoadCursor(HInstance, 'Cursor_HollowRectangle20');
  Screen.Cursors[crSolidRectangle] := LoadCursor(HInstance, 'Cursor_SolidRectangle20');
  Screen.Cursors[crHollowEllipse] := LoadCursor(HInstance, 'Cursor_HollowEllipse20');
  Screen.Cursors[crSolidEllipse] := LoadCursor(HInstance, 'Cursor_SolidEllipse20');
  Screen.Cursors[crClock] := LoadCursor(HInstance, 'Cursor_Clock20');
  Screen.Cursors[crHuman] := LoadCursor(HInstance, 'Cursor_Human20');
  Screen.Cursors[crFace] := LoadCursor(HInstance, 'Cursor_Face20');
  Screen.Cursors[crSelect] := LoadCursor(HInstance, 'Cursor_Select20');
  Screen.Cursors[crTriangle] := LoadCursor(HInstance, 'Cursor_Triangle20');
  Screen.Cursors[crLaserOn] := LoadCursor(HInstance, 'Cursor_LaserOn20');
  Screen.Cursors[crLaserOff] := LoadCursor(HInstance, 'Cursor_LaserOff20');
  Screen.Cursors[crError] := LoadCursor(HInstance, 'Cursor_Error20');
  Screen.Cursors[crSucceed] := LoadCursor(HInstance, 'Cursor_Succeed20');
  Screen.Cursors[crHollowDiamond] := LoadCursor(HInstance, 'Cursor_HollowDiamond20');
  Screen.Cursors[crSolidDiamond] := LoadCursor(HInstance, 'Cursor_SolidDiamond20');
  Screen.Cursors[crHollowPentagon] := LoadCursor(HInstance, 'Cursor_HollowPentagon20');
  Screen.Cursors[crSolidPentagon] := LoadCursor(HInstance, 'Cursor_SolidPentagon20');
  Screen.Cursors[crRoundA] := LoadCursor(HInstance, 'Cursor_RoundA20');
  Screen.Cursors[crRoundB] := LoadCursor(HInstance, 'Cursor_RoundB20');
end;

procedure FreeCursorResource;
begin
  DeleteObject(Screen.Cursors[crPen]);
  DeleteObject(Screen.Cursors[crLeftLabel]);
  DeleteObject(Screen.Cursors[crRightLabel]);
  DeleteObject(Screen.Cursors[crLine]);
  DeleteObject(Screen.Cursors[crSingleArrow]);
  DeleteObject(Screen.Cursors[crDoubleArrow]);
  DeleteObject(Screen.Cursors[crHollowRectangle]);
  DeleteObject(Screen.Cursors[crSolidRectangle]);
  DeleteObject(Screen.Cursors[crHollowEllipse]);
  DeleteObject(Screen.Cursors[crSolidEllipse]);
  DeleteObject(Screen.Cursors[crClock]);
  DeleteObject(Screen.Cursors[crHuman]);
  DeleteObject(Screen.Cursors[crFace]);
  DeleteObject(Screen.Cursors[crSelect]);
  DeleteObject(Screen.Cursors[crTriangle]);
  DeleteObject(Screen.Cursors[crLaserOn]);
  DeleteObject(Screen.Cursors[crLaserOff]);
  DeleteObject(Screen.Cursors[crError]);
  DeleteObject(Screen.Cursors[crSucceed]);
  DeleteObject(Screen.Cursors[crHollowDiamond]);
  DeleteObject(Screen.Cursors[crSolidDiamond]);
  DeleteObject(Screen.Cursors[crHollowPentagon]);
  DeleteObject(Screen.Cursors[crSolidPentagon]);
  DeleteObject(Screen.Cursors[crRoundA]);
  DeleteObject(Screen.Cursors[crRoundB]);
end;

initialization
  LoadCursorResource;

finalization
  FreeCursorResource;

end.

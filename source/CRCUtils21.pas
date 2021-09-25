(*//
��Ŀ:LovelyComponents.CRCUtils
�汾:2.0
����:CRC��֤��Ԫ
˵��:CRC16��CRC32
����:2005-01-16
֧��:jihu.wang#gmail.com
���:ZswangY37
//*)

//*******Begin �޸���־*******//
//----------------------------------------------------------------------1.00.001
//2005-01-16 Zswang No.1 �½�
//----------------------------------------------------------------------1.00.002
//2005-01-17 Zswang No.1 ��� StreamCRC16()��StreamCRC32()����
//2005-01-17 Zswang No.2 ��� BufferCRC16()��BufferCRC32()����
//*******End �޸���־*******//

unit CRCUtils21;

interface

uses Windows, Classes, SysUtils;

function UpdateCRC16( //����CRC16��ֵ
  mChar: Char; //�ַ�
  mSeed: Word //Seed
): Word; //���ظ��º��CRC16ֵ

function UpdateCRC32( //����CRC32��ֵ
  mChar: Char; //�ַ�
  mSeed: Longword //Seed
): Longword; //���ظ��º��CRC32ֵ

function StringCRC16( //ȡ���ַ�����CRC16ֵ
  mString: string //�ַ���
): Word; //�����ַ�����CRC16ֵ

function StringCRC32( //ȡ���ַ�����CRC32ֵ
  mString: string //�ַ���
): Longword;//�����ַ�����CRC32ֵ

function FileCRC16( //ȡ���ļ���CRC16ֵ
  mFileName: TFileName //�ļ���
): Word; //�����ļ���CRC16ֵ

function FileCRC32( //ȡ���ļ���CRC32ֵ
  mFileName: TFileName //�ļ���
): Longword; //�����ļ���CRC32ֵ

function StreamCRC16( //ȡ������CRC16ֵ
  mStream: TStream //��
): Word; //��������CRC16ֵ

function StreamCRC32( //ȡ������CRC32ֵ
  mStream: TStream //��
): Longword; //��������CRC32ֵ

function BufferCRC16( //ȡ�û�������CRC16ֵ
  const mBuffer; //������
  mSize: Integer //��������С
): Word; //���ػ�������CRC16ֵ

function BufferCRC32( //ȡ�û�������CRC32ֵ
  const mBuffer; //������
  mSize: Integer //��������С
): Longword; //���ػ�������CRC32ֵ

procedure MakeCRC16Table; //����CRC16��
procedure MakeCRC32Table; //����CRC32��

implementation

uses CommonFunctions51;

const
  cBufferSize = $1000; //Ԥ����Ļ����С

var
  vCRC16Table: array of Word = nil; //CRC16��
  vCRC32Table: array of Longword = nil; //CRC32��

procedure MakeCRC16Table; //����CRC16��
const
//X^16+X^12+X^5+1
  cMask: array [0..2] of Byte = (0, 5, 12);

//x^16+x^15+x^2+1
//  cMask: array [0..2] of Byte = (0, 2, 15);
var
  vCRC: Word;
  I, J: Byte;
  vMask: Word;
begin
  if Assigned(vCRC16Table) then Exit;
  vMask := 0;
  for I := Low(cMask) to High(cMask) do
    vMask := vMask or (1 shl (15 - cMask[I]));
  SetLength(vCRC16Table, 256);
  for I := 0 to 255 do
  begin
    vCRC := I;
    for J := 1 to 8 do
      if Odd(vCRC) then
        vCRC := (vCRC shr 1) xor vMask
      else vCRC := vCRC shr 1;
    vCRC16Table[I] := vCRC;
  end;
end; { MakeCRC16Table }

procedure MakeCRC32Table; //����CRC32��
const
  cMask: array [0..13] of Byte =
(0, 1, 2, 4, 5, 7, 8, 10, 11, 12, 16, 22, 23, 26);
//x^32+x^26+x^23+x^22+x^16+x^12+x^11+x^10+x^8+x^7+x^5+x^4+x^2+x+1
var
  vCRC: Longword;
  I, J: Byte;
  vMask: Longword;
begin
  if Assigned(vCRC32Table) then Exit;
  vMask := 0;
  for I := Low(cMask) to High(cMask) do
    vMask := vMask or (1 shl (31 - cMask[I]));
  SetLength(vCRC32Table, 256);
  for I := 0 to 255 do
  begin
    vCRC := I;
    for J := 1 to 8 do
      if Odd(vCRC) then
        vCRC := (vCRC shr 1) xor vMask //$EDB88320
      else vCRC := vCRC shr 1;
    vCRC32Table[I] := vCRC;
  end;
end; { MakeCRC32Table }

function UpdateCRC16( //����CRC16��ֵ
  mChar: Char; //�ַ�
  mSeed: Word //Seed
): Word; //���ظ��º��CRC16ֵ
begin
  Result :=
    vCRC16Table[(mSeed and $000000FF) xor Byte(mChar)] xor (mSeed shr 8);
end; { UpdateCRC16 }

function UpdateCRC32( //����CRC32��ֵ
  mChar: Char; //�ַ�
  mSeed: Longword //Seed
): Longword; //���ظ��º��CRC32ֵ
begin
  Result :=
    vCRC32Table[(mSeed and $000000FF) xor Byte(mChar)] xor (mSeed shr 8);
end; { UpdateCRC32 }

function StringCRC16( //ȡ���ַ�����CRC16ֵ
  mString: string //�ַ���
): Word; //�����ַ�����CRC16ֵ
var
  I: Integer;
begin
  MakeCRC16Table;
  Result := $FFFF;
  for I := 1 to Length(mString) do Result := UpdateCRC16(mString[I], Result);
  Result := not Result;
end; { StringCRC16 }

function StringCRC32( //ȡ���ַ�����CRC32ֵ
  mString: string //�ַ���
): Longword;//�����ַ�����CRC32ֵ
var
  I: Integer;
begin
  MakeCRC32Table;
  Result := $FFFFFFFF;
  for I := 1 to Length(mString) do Result := UpdateCRC32(mString[I], Result);
  Result := not Result;
end; { StringCRC32 }

function FileCRC16( //ȡ���ļ���CRC16ֵ
  mFileName: TFileName //�ļ���
): Word; //�����ļ���CRC16ֵ
var
  vFileStream: TFileStream;
  vFileHandle: THandle;
begin
  MakeCRC16Table;
  Result := $FFFF;
  if not FileExists(mFileName) then Exit;
  vFileHandle := _lopen(PChar(mFileName), OF_READ or OF_SHARE_DENY_NONE);     
  if Integer(vFileHandle) <= 0 then Exit;
  vFileStream := TFileStream.Create(vFileHandle);
  try
    Result := StreamCRC16(vFileStream);
  finally
    vFileStream.Free;
  end;
end; { FileCRC16 }

function FileCRC32( //ȡ���ļ���CRC32ֵ
  mFileName: TFileName //�ļ���
): Longword; //�����ļ���CRC32ֵ
var
  vFileStream: TFileStream;
  vFileHandle: THandle;
begin
  MakeCRC32Table;
  Result := $FFFFFFFF;
  if not FileExists(mFileName) then Exit;
  vFileHandle := _lopen(PChar(mFileName), OF_READ or OF_SHARE_DENY_NONE);     
  if Integer(vFileHandle) <= 0 then Exit;
  vFileStream := TFileStream.Create(vFileHandle);
  try
    Result := StreamCRC32(vFileStream);
  finally
    vFileStream.Free;
  end;
end; { FileCRC32 }

function StreamCRC16( //ȡ������CRC16ֵ
  mStream: TStream //�ļ���
): Word; //�����ļ���CRC16ֵ
var
  vBuffer: array[0..cBufferSize - 1] of Char;
  I, J: Integer;
begin
  MakeCRC16Table;
  Result := $FFFF;
  I := mStream.Read(vBuffer[0], SizeOf(vBuffer));
  while I > 0 do
  begin
    for J := 0 to I - 1 do Result := UpdateCRC16(vBuffer[J], Result);
    I := mStream.Read(vBuffer[0], SizeOf(vBuffer));
  end;
  Result := not Result;
end; { StreamCRC16 }

function StreamCRC32( //ȡ������CRC32ֵ
  mStream: TStream //�ļ���
): Longword; //�����ļ���CRC32ֵ
var
  vBuffer: array[0..cBufferSize - 1] of Char;
  I, J: Integer;
begin
  MakeCRC32Table;
  Result := $FFFFFFFF;
  I := mStream.Read(vBuffer[0], SizeOf(vBuffer));
  while I > 0 do
  begin
    for J := 0 to I - 1 do Result := UpdateCRC32(vBuffer[J], Result);
    I := mStream.Read(vBuffer[0], SizeOf(vBuffer));
  end;
  Result := not Result;
end; { StreamCRC32 }

function BufferCRC16( //ȡ�û�������CRC16ֵ
  const mBuffer; //������
  mSize: Integer //��������С
): Word; //���ػ�������CRC16ֵ
var
  P: PChar;
  I: Integer;
begin
  MakeCRC16Table;
  Result := $FFFF;
  P := PChar(@mBuffer);
  for I := 0 to mSize - 1 do
    Result := UpdateCRC16(P[I], Result);
  Result := not Result;
end; { BufferCRC16 }

function BufferCRC32( //ȡ�û�������CRC32ֵ
  const mBuffer; //������
  mSize: Integer //��������С
): Longword; //���ػ�������CRC32ֵ
var
  P: PChar;
  I: Integer;
begin
  MakeCRC32Table;
  Result := $FFFFFFFF;
  P := PChar(@mBuffer);
  for I := 0 to mSize - 1 do
    Result := UpdateCRC32(P[I], Result);
  Result := not Result;
end; { BufferCRC32 }

initialization
//  MakeCRC16Table;
//  MakeCRC32Table;

finalization

end.


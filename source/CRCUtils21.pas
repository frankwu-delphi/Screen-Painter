(*//
项目:LovelyComponents.CRCUtils
版本:2.0
标题:CRC验证单元
说明:CRC16和CRC32
日期:2005-01-16
支持:jihu.wang#gmail.com
设计:ZswangY37
//*)

//*******Begin 修改日志*******//
//----------------------------------------------------------------------1.00.001
//2005-01-16 Zswang No.1 新建
//----------------------------------------------------------------------1.00.002
//2005-01-17 Zswang No.1 添加 StreamCRC16()、StreamCRC32()函数
//2005-01-17 Zswang No.2 添加 BufferCRC16()、BufferCRC32()函数
//*******End 修改日志*******//

unit CRCUtils21;

interface

uses Windows, Classes, SysUtils;

function UpdateCRC16( //更新CRC16的值
  mChar: Char; //字符
  mSeed: Word //Seed
): Word; //返回更新后的CRC16值

function UpdateCRC32( //更新CRC32的值
  mChar: Char; //字符
  mSeed: Longword //Seed
): Longword; //返回更新后的CRC32值

function StringCRC16( //取得字符串的CRC16值
  mString: string //字符串
): Word; //返回字符串的CRC16值

function StringCRC32( //取得字符串的CRC32值
  mString: string //字符串
): Longword;//返回字符串的CRC32值

function FileCRC16( //取得文件的CRC16值
  mFileName: TFileName //文件名
): Word; //返回文件的CRC16值

function FileCRC32( //取得文件的CRC32值
  mFileName: TFileName //文件名
): Longword; //返回文件的CRC32值

function StreamCRC16( //取得流的CRC16值
  mStream: TStream //流
): Word; //返回流的CRC16值

function StreamCRC32( //取得流的CRC32值
  mStream: TStream //流
): Longword; //返回流的CRC32值

function BufferCRC16( //取得缓冲区的CRC16值
  const mBuffer; //缓冲区
  mSize: Integer //缓冲区大小
): Word; //返回缓冲区的CRC16值

function BufferCRC32( //取得缓冲区的CRC32值
  const mBuffer; //缓冲区
  mSize: Integer //缓冲区大小
): Longword; //返回缓冲区的CRC32值

procedure MakeCRC16Table; //生存CRC16表
procedure MakeCRC32Table; //生存CRC32表

implementation

uses CommonFunctions51;

const
  cBufferSize = $1000; //预处理的缓冲大小

var
  vCRC16Table: array of Word = nil; //CRC16表
  vCRC32Table: array of Longword = nil; //CRC32表

procedure MakeCRC16Table; //生存CRC16表
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

procedure MakeCRC32Table; //生存CRC32表
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

function UpdateCRC16( //更新CRC16的值
  mChar: Char; //字符
  mSeed: Word //Seed
): Word; //返回更新后的CRC16值
begin
  Result :=
    vCRC16Table[(mSeed and $000000FF) xor Byte(mChar)] xor (mSeed shr 8);
end; { UpdateCRC16 }

function UpdateCRC32( //更新CRC32的值
  mChar: Char; //字符
  mSeed: Longword //Seed
): Longword; //返回更新后的CRC32值
begin
  Result :=
    vCRC32Table[(mSeed and $000000FF) xor Byte(mChar)] xor (mSeed shr 8);
end; { UpdateCRC32 }

function StringCRC16( //取得字符串的CRC16值
  mString: string //字符串
): Word; //返回字符串的CRC16值
var
  I: Integer;
begin
  MakeCRC16Table;
  Result := $FFFF;
  for I := 1 to Length(mString) do Result := UpdateCRC16(mString[I], Result);
  Result := not Result;
end; { StringCRC16 }

function StringCRC32( //取得字符串的CRC32值
  mString: string //字符串
): Longword;//返回字符串的CRC32值
var
  I: Integer;
begin
  MakeCRC32Table;
  Result := $FFFFFFFF;
  for I := 1 to Length(mString) do Result := UpdateCRC32(mString[I], Result);
  Result := not Result;
end; { StringCRC32 }

function FileCRC16( //取得文件的CRC16值
  mFileName: TFileName //文件名
): Word; //返回文件的CRC16值
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

function FileCRC32( //取得文件的CRC32值
  mFileName: TFileName //文件名
): Longword; //返回文件的CRC32值
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

function StreamCRC16( //取得流的CRC16值
  mStream: TStream //文件名
): Word; //返回文件的CRC16值
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

function StreamCRC32( //取得流的CRC32值
  mStream: TStream //文件名
): Longword; //返回文件的CRC32值
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

function BufferCRC16( //取得缓冲区的CRC16值
  const mBuffer; //缓冲区
  mSize: Integer //缓冲区大小
): Word; //返回缓冲区的CRC16值
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

function BufferCRC32( //取得缓冲区的CRC32值
  const mBuffer; //缓冲区
  mSize: Integer //缓冲区大小
): Longword; //返回缓冲区的CRC32值
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


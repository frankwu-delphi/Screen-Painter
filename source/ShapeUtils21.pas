//2006-11-28 ZswangY37 No.1 ���� ��ѡ�ƶ���ɾ��,����֧��ѡ����ѡ
//2006-11-28 ZswangY37 No.2 ���� ����ʱ�����������
//2006-11-30 ZswangY37 No.1 ���� �������ֵĹ��ܣ�Ŀǰֻ֧�ֵ���
//2006-11-30 ZswangY37 No.2 ���� ����ʱ��ͷ��λ��û�и���
//2006-12-01 ZswangY37 No.1 ���� �����ʽ
//2006-12-02 ZswangY37 No.1 �Ż� ��Offset����ת��ΪMove
//2006-12-03 ZswangY37 No.1 ���� �ı��༭��ĸ��ƺ�ճ������
//2006-12-04 ZswangY37 No.1 ���� ������������
//2006-12-05 ZswangY37 No.1 ���� �ı��༭��ĳ����Ĺ���
//2006-12-06~2006-12-08 Zswang No.1 ���� ����ΪLovelyPaint20��ShapeUtils��Ԫ
//2006-12-09 ZswangY37 No.1 ���� ��������#13#10����һ��
//2006-12-09 ZswangY37 No.2 ���� �����ǰɾ������#13#10��һ��ɾ��
//2006-12-10 ZswangY37 No.1 ��� ����Բʸ��ͼ��
//2006-12-12 ZswangY37 No.1 ���� ʵ�ְ���Բ������ж�
//2006-12-13 ZswangY37 No.1 �Ż� �����ı�����ƶ���ʱ���ڵ���Canvas
//2007-05-19 ZswangY37 No.1 ���� ��ʱ������ѹ�������
//2007-05-22 ZswangY37 No.1 ���� ������Ctrl+X����
//2007-05-28 ZswangY37 No.1 ��� �ı�������������
//2007-06-13 ZswangY37 No.1 ���� �ı�ͼ���Redo��Undo��CanRedo��CanUndo����
//2007-07-28 ZswangY37 No.1 ���� ��ɫ͸��״̬���ܸ���
//2007-08-02 ZswangY37 No.1 �Ż� ����HotRect()�����жϾ����Ƿ�ѡ��ͼ��
//2007-08-03 ZswangY37 No.1 �Ż� ������ת�ǶȻ��ƺ�ѡ�����
//2007-08-04 ZswangY37 No.1 �Ż� ѡ��ͼ�����С�ı�
//2007-08-13 ZswangY37 No.1 ���� �����ֱ༭��ʱ�򲻳�����תê��
//2007-08-17 ZswangY37 No.1 ��� ����ͼ������V��Բ�Ǿ���oO������A
//2007-11-19 ZswangY37 No.1 ���� δѡ������ɾ��δˢ�½��棬����ѡ��״̬δ���ͱ仯 bug#236
//2007-11-19 ZswangY37 No.2 ���� ˫�����ı�ʱ������δ���߽��鵼���쳣 bug#236
//2007-11-19 ZswangY37 No.3 ���� ˫�����ſ�����϶�������ʼ����λ�ü������
//2007-11-19 ZswangY37 No.4 ��� TCustomShapeText.OldText���ԣ��Ա��ж��ı��Ƿ����ı���ύ
//2007-11-25 ZswangY37 No.1 ��� ��Դ��ʽ���������
//2007-12-07 ZswangY37 No.1 ���� ���ʼ�������û��ƫ�Ƶ�һ�����λ��
//2011-04-03 ZswangY37 No.1 ���� ȡ����Դid��ͳһʹ��crc32��size��λ��Դ 

{$R-}

unit ShapeUtils21;

interface

uses Windows, Messages, Classes, SysUtils, Graphics, Controls,
  CursorResource21, Forms;

type
  TShapeModify = (smUnknown, smPoints, smPloy, smLine, smRect, smVector, smText, smImage); // ͼ�α༭�ʹ洢��ʽ
                //δ֪��ʽ   ��ˢ��    �����  ֱ����  ������  ���/ʸ��  �ı���  ͼƬ


  TShapeType = Byte; // ÿ��ͼ�α��뱣֤Ψһ // ��һ���ֽڱ�ʾ�༭����

const
  stUnknown = $00; // δ֪ͼ��
  stPen = $10; // ��ˢ
  stLine = $30; // ֱ��
  stSingleArrow = $31; // ����ͷ
  stDoubleArrow = $32; // ˫��ͷ
  stHollowRectangle = $33; // ���ľ���
  stSolidRectangle = $34; // ʵ�ľ���
  stHollowEllipse = $35; // ����Բ
  stSolidEllipse = $36; // ʵ��Բ
  stEdit = $40; // �����ı�
  stMemo = $41; // �����ı�
  stVector = $50; // ���ͼ��
  stImage = $60; // ͼƬ

type
  TIdents = array of Longword;
  TShapeInfo = packed record
    rType: TShapeType; // 1byte // ͼ������
    rIdent: Longword; // 4byte // ͼ��Ψһ��ʶ
    rPenWidth: Byte; // 1byte // ���ʿ��
    rPenColor: TColor; // 4byte // ������ɫ
    rTranslucency: Boolean; // 1byte // �Ƿ��͸��
    rAngle: Byte; // 1byte // �Ƕ�
    rDataSize: Word; // 2byte // ���ݴ�С
    rData: array[0..0] of Char; // ��������
  end;
  PShapeInfo = ^TShapeInfo;

  TResourceInfo = packed record
    rCrc32: Longword;
    rReceiveSize: Integer; // ���յĴ�С
    rSize: Integer;
    rData: array[0..0] of Char;
  end;
  PResourceInfo = ^TResourceInfo;

type
  TPercentPoint = packed record // ���������� // N/255
    X: Byte; //0..255
    Y: Byte; //0..255
  end;
  PPercentPoint = ^TPercentPoint;

  TPercentRect = packed record // ����������
    rFrom: TPercentPoint;
    rTo: TPercentPoint;
  end;
  PPercentRect = TPercentRect;

  TPercentPolygon = packed record // �����Ͷ����
    rCount: Word;
    rPoints: array[0..0] of TPercentPoint;
  end;

  TPercentChord = packed record // ������
    rTopLeft: TPercentPoint;
    rBottomRight: TPercentPoint;
    rRadialBegin: TPercentPoint;
    rRadialEnd: TPercentPoint;
  end;

  TPercentRound = packed record // Բ��
    rTL: TPercentPoint;
    rBR: TPercentPoint;
    rRadial: TPercentPoint;
  end;

  TPercentBezier = packed record // ����
    rStartPoint: TPercentPoint;
    rStartHelper: TPercentPoint;
    rEndHelper: TPercentPoint;
    rEndPoint: TPercentPoint;
  end;

  TVectorType = (vtLine, vtHollowRectangle, vtSolidRectangle,
    vtHollowEllipse, vtSolidEllipse, vtHollowPolygon, vtSolidPolygon,
    vtPolyline, vtHollowChord, vtSolidChord, vtArc,
    vtHollowRound, vtSolidRound, vtBezier);

  TVectorInfo = packed record // ����ͼ��Ϣ
    rType: TVectorType;
    case TVectorType of
      vtHollowRectangle, vtSolidRectangle, vtHollowEllipse, vtSolidEllipse:
        (rRect: TPercentRect);
      vtHollowPolygon, vtSolidPolygon, vtPolyline: (rPolygon: TPercentPolygon);
      vtHollowChord, vtSolidChord, vtArc: (rChord: TPercentChord);
      vtHollowRound, vtSolidRound: (rRound: TPercentRound);
      vtBezier: (rBezier: TPercentBezier);
  end;
  PVectorInfo = ^TVectorInfo;

const
  cVectorShapeChar: array[TVectorType] of Char = 'LrReEpPVcCAoOB';

const
  cShapeInfoHeadSize = SizeOf(TShapeInfo) - SizeOf(Char);
  cResourceInfoHeadSize = SizeOf(TResourceInfo) - SizeOf(Char);

type
  TPointsData = packed record // �������
    rOffset: TSmallPoint;
    rResourceCrc32: Longword; // ��ԴУ����
    rResourceSize: Longword; // ��Դ��С
  end;
  PPointsData = ^TPointsData;

  TRectData = packed record // ˫������
    rFromPoint: TSmallPoint;
    rToPoint: TSmallPoint;
  end;
  PRectData = ^TRectData;

  TTextData = packed record // �ı�����
    rPoint: TSmallPoint;
    rCount: Word;
    rChars: array[0..0] of WideChar;
  end;
  PTextData = ^TTextData;

  TMemoData = packed record // �����ı�����
    rPoint: TSmallPoint;
    rResourceCrc32: Longword; // ��ԴУ����
    rResourceSize: Longword; // ��Դ��С
  end;
  PMemoData = ^TMemoData;

  TImageData = packed record // ͼƬ����
    rType: Byte; // ͼƬ����
    rRect: TRectData; // ����
    rResourceCrc32: Longword; // ��ԴУ����
    rResourceSize: Longword; // ��Դ��С
  end;
  PImageData = ^TImageData;

  TVectorData = packed record // ����ͼ
    rRect: TRectData; // ��������
    rModels: array[0..0] of Char; // ������Ϣ
  end;
  PVectorData = ^TVectorData;

type
  TCustomShape = class;
  TShapeClass = class of TCustomShape;

  TCustomShape = class // ͼ�λ���
  private
    FIdent: Longword; // ��ʶ
    FPenWidth: Integer; // �߶ο��
    FPenColor: TColor; // �߶���ɫ
    FRect: TRect; // ͼ�ε�����
    FSelected: Boolean; // �Ƿ�ѡ��
    FHighlight: Boolean; // �Ƿ����
    FModified: Boolean; // �Ƿ����ڱ༭
    FVisible: Boolean; // �Ƿ�ɼ�
    FTranslucency: Boolean; // �Ƿ���ð�͸��//Mask��Copy
    FAngle: Byte;
    FCanReangle: Boolean; // ��ת�Ƕ�
  protected
    FResourceCrc32: Longword; // ��ԴУ����
    FResourceSize: Longword; // ��Դ��С
    FHasResource: Boolean; // �Ƿ�ʹ����Դ
  public
    function GetResource(var AResource: Pointer; var ASize: Integer): Boolean; virtual; 
    function SetResource(AResource: Pointer; ASize: Integer): Boolean; virtual;
    
    function GetData(var AData: Pointer; var ASize: Integer): Boolean; virtual; abstract;
    function SetData(AData: Pointer; ASize: Integer): Boolean; virtual; abstract;
    function StreamWrite(AStream: TStream): Integer; virtual; // д������
    function StreamRead(AStream: TStream): Integer; virtual; // �����ж�ȡ����
    function ResourceWrite(AStream: TStream): Integer; virtual; // ��Դд������
    property PenColor: TColor read FPenColor write FPenColor; // �߶���ɫ
    property PenWidth: Integer read FPenWidth write FPenWidth; // �߶ο��
    property Rect: TRect read FRect; // ͼ�ε�����
    property Selected: Boolean read FSelected write FSelected; // �Ƿ�ѡ��
    property Highlight: Boolean read FHighlight write FHighlight; // �Ƿ����
    property Modified: Boolean read FModified write FModified; // �Ƿ����ڱ༭
    property Ident: Longword read FIdent write FIdent; // ͼ�α�ʶ
    property Visible: Boolean read FVisible write FVisible; // �Ƿ�ɼ�
    property Translucency: Boolean read FTranslucency write FTranslucency; // �Ƿ��͸��
    property Angle: Byte read FAngle write FAngle; // �Ƕ�
    property ResourceCrc32: Longword read FResourceCrc32 write FResourceCrc32; // ��ԴУ����
    property ResourceSize: Longword read FResourceSize write FResourceSize; // ��Դ��С
    property HasResource: Boolean read FHasResource; // �Ƿ�ʹ����Դ
    property CanReangle: Boolean read FCanReangle write FCanReangle; // �Ƿ�����ת 

    function GetAnchorPoint(AIndex: Integer): TPoint; virtual; // ê������ //AIndex: 0-8
    function GetAnchorVisible(AIndex: Integer): Boolean; virtual; // ê���Ƿ�ɼ�
    function GetAnchorCursor(AIndex: Integer; AMouseDown: Boolean): TCursor; // ���ê������ͼ��
    procedure UpdateRect; virtual; abstract; // ���������Ա��ж�HotPoint
    procedure Offset(AOffset: TPoint); virtual; // λ��
    procedure RoundAngle(AAngle: Byte); virtual; // ��תһ���Ƕ�
    procedure Draw(AOffset: TPoint; ACanvas: TCanvas); virtual; // ���Ƶ�ACanvas��
    procedure DrawBox(AOffset: TPoint; ACanvas: TCanvas); virtual; // ����ѡ��
    procedure DrawShape(AOffset: TPoint; ACanvas: TCanvas); virtual; abstract; // ����ͼ��
    procedure DrawAnchor(AOffset: TPoint; ACanvas: TCanvas); virtual; // ����ê��
    function HotAnchor(APoint: TPoint): Integer; virtual; // �������ͣ����ê����
    function HotPoint(APoint: TPoint): Boolean; virtual; // ��ǰ�����Ƿ���ͼ����
    function HotRect(ARect: TRect): Boolean; virtual; // ��ǰ�����Ƿ��ͼ���ཻ //2007-08-02 ZswangY37 No.1
    function CalcAngle(APoint: TPoint): Byte; virtual; // �����ĽǶ�
    function AnchorResize(AIndex: Integer; ACenter: TPoint; APoint: TPoint): Boolean; virtual; // �仯��С
    function Accept: Boolean; virtual; abstract; // �Ƿ���ܻ���
    constructor Create; virtual;
  end;

  TCustomShapePoints = class(TCustomShape) // ��ˢ
  private
    FPoints: TList; // ���б�
    FOffset: TPoint;
    function GetPoints(Index: Integer): TPoint;
    function GetPointCount: Integer;
  public
    function GetResource(var AResource: Pointer; var ASize: Integer): Boolean; override;
    function SetResource(AResource: Pointer; ASize: Integer): Boolean; override;
    function GetData(var AData: Pointer; var ASize: Integer): Boolean; override;
    function SetData(AData: Pointer; ASize: Integer): Boolean; override;

    procedure Offset(AOffset: TPoint); override; // λ��
    procedure UpdateRect; override; // ���������Ա��ж�HotPoint
    function Accept: Boolean; override; // �Ƿ���ܻ���
    procedure Clear;

    property Points[Index: Integer]: TPoint read GetPoints; // ����ûһ����
    property PointCount: Integer read GetPointCount; // ����
    procedure Append(APoint: TPoint); virtual; // ���һ����
    constructor Create; override;
    destructor Destroy; override;
  end;

  TShapePen = class(TCustomShapePoints) // ӫ���
  public
    function HotPoint(APoint: TPoint): Boolean; override; // ��ǰ�����Ƿ���ͼ����
    function HotRect(ARect: TRect): Boolean; override; // ��ǰ�����Ƿ��ͼ���ཻ
    procedure DrawShape(AOffset: TPoint; ACanvas: TCanvas); override; // ����ͼ��
    function GetAnchorVisible(AIndex: Integer): Boolean; override; // ê���Ƿ�ɼ�
  end;
  TCustomShapePloy = class(TCustomShapePoints); // �������

  TCustomShapeRect = class(TCustomShape) // ������
  private
    FFromPoint: TPoint;
    FToPoint: TPoint;
  public
    function GetData(var AData: Pointer; var ASize: Integer): Boolean; override;
    function SetData(AData: Pointer; ASize: Integer): Boolean; override;

    procedure Offset(AOffset: TPoint); override; // λ��
    procedure UpdateRect; override; // ���������Ա��ж�HotPoint
    function CalcAngle(APoint: TPoint): Byte; override; // �����ĽǶ�
    function AnchorResize(AIndex: Integer; ACenter: TPoint; APoint: TPoint): Boolean; override; // �仯��С
    function GetAnchorPoint(AIndex: Integer): TPoint; override; // ê������ //AIndex: 0-8
    function Accept: Boolean; override; // �Ƿ���ܻ���

    property FromPoint: TPoint read FFromPoint write FFromPoint; // ��Դ��
    property ToPoint: TPoint read FToPoint write FToPoint; // Ŀ���
  end;

  TCustomShapeImage = class(TCustomShapeRect)
  private
    FGraphicType: Byte;
    FMemoryStream: TMemoryStream;
    FGraphic: TGraphic;
  public
    function GetResource(var AResource: Pointer; var ASize: Integer): Boolean; override; 
    function SetResource(AResource: Pointer; ASize: Integer): Boolean; override;

    property GraphicType: Byte read FGraphicType write FGraphicType; // ͼ������

    function GetData(var AData: Pointer; var ASize: Integer): Boolean; override;
    function SetData(AData: Pointer; ASize: Integer): Boolean; override;
    procedure DrawShape(AOffset: TPoint; ACanvas: TCanvas); override; // ����ͼ��
    function PasteImage(APoint: TPoint; AGraphic: TGraphic): Boolean; virtual;

    procedure UpdateRect; override;
    function Accept: Boolean; override; // �Ƿ���ܻ���
    constructor Create; override;
    destructor Destroy; override;
  end;

  TShapeImage = class(TCustomShapeImage)
  private
  public
  end;

  TShapeLine = class(TCustomShapeRect) // ֱ����
  public
    procedure DrawShape(AOffset: TPoint; ACanvas: TCanvas); override; // ����ͼ��
    function GetAnchorVisible(AIndex: Integer): Boolean; override; // ê���Ƿ�ɼ�
    function GetAnchorPoint(AIndex: Integer): TPoint; override; // ê���Ƿ�ɼ�
    procedure DrawBox(AOffset: TPoint; ACanvas: TCanvas); override; // ���Ƶ�ACanvas��
    function HotPoint(APoint: TPoint): Boolean; override; // ��ǰ�����Ƿ���ͼ����
    function HotRect(ARect: TRect): Boolean; override; // ��ǰ�����Ƿ��ͼ���ཻ
    function AnchorResize(AIndex: Integer; ACenter: TPoint; APoint: TPoint): Boolean; override; // �仯��С
  end;

  TCustomShapeArrow = class(TCustomShapeRect) // ��ͷ
  private
    FBoneAngle: Double; // ��ͷ��ĽǶ� // PiΪ��λ // Ĭ��0.93 * Pi
    FBoneLengthBase: Integer; // ��ͷ��ĳ��� // Ĭ��16
    FBoneLengthRate: Byte; // ��PenWidth�ı������� // Ĭ��Ϊ4
  public
    function GetAnchorVisible(AIndex: Integer): Boolean; override; // ê���Ƿ�ɼ�
    function GetAnchorPoint(AIndex: Integer): TPoint; override; // ê���Ƿ�ɼ�
    function AnchorResize(AIndex: Integer; ACenter: TPoint; APoint: TPoint): Boolean; override; // �仯��С
    procedure DrawBox(AOffset: TPoint; ACanvas: TCanvas); override; // ���Ƶ�ACanvas��
    constructor Create; override;
  end;

  TShapeSingleArrow = class(TCustomShapeArrow) // ����ͷ
  private
    FBonePointA: TPoint; // ��ͷ��A
    FBonePointB: TPoint; // ��ͷ��B
  public
    procedure Offset(AOffset: TPoint); override; // λ��
    procedure DrawShape(AOffset: TPoint; ACanvas: TCanvas); override; // ����ͼ��
    function HotPoint(APoint: TPoint): Boolean; override; // ��ǰ�����Ƿ���ͼ����
    function HotRect(ARect: TRect): Boolean; override; // ��ǰ�����Ƿ��ͼ���ཻ
    procedure UpdateRect; override; // ���������Ա��ж�HotPoint
  end;

  TShapeDoubleArrow = class(TCustomShapeArrow) // ˫��ͷ
  private
    FBonePointA: TPoint; // ��ͷ��A
    FBonePointB: TPoint; // ��ͷ��B
    FBonePointC: TPoint; // ��ͷ��C
    FBonePointD: TPoint; // ��ͷ��D
  public
    procedure Offset(AOffset: TPoint); override; // λ��
    procedure DrawShape(AOffset: TPoint; ACanvas: TCanvas); override; // ����ͼ��
    //procedure Draw(AOffset: TPoint; ACanvas: TCanvas); override; // ���Ƶ�ACanvas��
    function HotPoint(APoint: TPoint): Boolean; override; // ��ǰ�����Ƿ���ͼ����
    function HotRect(ARect: TRect): Boolean; override; // ��ǰ�����Ƿ��ͼ���ཻ
    procedure UpdateRect; override; // ���������Ա��ж�HotPoint
  end;

  TShapeHollowRectangle = class(TCustomShapeRect) // ���ľ���
  public
    //procedure Draw(AOffset: TPoint; ACanvas: TCanvas); override; // ���Ƶ�ACanvas��
    procedure DrawShape(AOffset: TPoint; ACanvas: TCanvas); override; // ����ͼ��
    function HotPoint(APoint: TPoint): Boolean; override; // ��ǰ�����Ƿ���ͼ����
    function HotRect(ARect: TRect): Boolean; override; // ��ǰ�����Ƿ��ͼ���ཻ
  end;

  TShapeSolidRectangle = class(TCustomShapeRect) // ʵ�ľ���
  public
    procedure DrawShape(AOffset: TPoint; ACanvas: TCanvas); override; // ����ͼ��
    //procedure Draw(AOffset: TPoint; ACanvas: TCanvas); override; // ���Ƶ�ACanvas��
  end;

  TShapeHollowEllipse = class(TCustomShapeRect) // ����Բ��
  public
    //procedure Draw(AOffset: TPoint; ACanvas: TCanvas); override; // ���Ƶ�ACanvas��
    procedure DrawShape(AOffset: TPoint; ACanvas: TCanvas); override; // ����ͼ��
    function HotPoint(APoint: TPoint): Boolean; override; // ��ǰ�����Ƿ���ͼ����
    function HotRect(ARect: TRect): Boolean; override; // ��ǰ�����Ƿ��ͼ���ཻ
  end;

  TShapeSolidEllipse = class(TCustomShapeRect) // ʵ��Բ��
  public
    //procedure Draw(AOffset: TPoint; ACanvas: TCanvas); override; // ���Ƶ�ACanvas��
    procedure DrawShape(AOffset: TPoint; ACanvas: TCanvas); override; // ����ͼ��
    function HotPoint(APoint: TPoint): Boolean; override; // ��ǰ�����Ƿ���ͼ����
    function HotRect(ARect: TRect): Boolean; override; // ��ǰ�����Ƿ��ͼ���ཻ
  end;

  TCustomShapeText = class(TCustomShape) // �ı�ͼ�λ���
  private
    FText: WideString; // �ı�
    FPoint: TPoint; // ���Ƶ�
    FCaretFirst: Boolean;
    FSelLength: Integer;
    FSelStart: Integer;
    FCaretHeight: Integer; // ���ĸ߶�
    FMaxLength: Integer;
    FDownChar: Integer; // ����ʱ����ַ����
    FZoom: Double;
    FFontName: TFontName;
    FOldText: WideString;
    function GetTextChanged: Boolean; // ��ʷ�ı� // ����Ƿ��޸�
  protected
    function GetCaretPos: TPoint; virtual; // �õ�����λ��
    procedure SetSelLength(const Value: Integer); virtual;
    procedure SetSelStart(const Value: Integer); virtual;
    procedure SetSelText(Value: WideString); virtual;
    function GetSelText: WideString; virtual;
    procedure SetMaxLength(const Value: Integer); virtual;
    procedure SetText(const Value: WideString); virtual;
  public
    function GetResource(var AResource: Pointer; var ASize: Integer): Boolean; override; 
    function SetResource(AResource: Pointer; ASize: Integer): Boolean; override;

    function CanUndo: Boolean; virtual;
    function CanRedo: Boolean; virtual;
    function Undo: Boolean; virtual;
    function Redo: Boolean; virtual;
    function Delete: Boolean; virtual;
    function CopyToClipboard: Boolean; virtual;
    function CutToClipboard: Boolean; virtual;
    function PasteFromClipboard: Boolean; virtual; // �Ӽ�������ճ�� // �����Ƿ�ɹ�
    function SelectAll: Boolean; virtual; // ȫѡ

    function GetData(var AData: Pointer; var ASize: Integer): Boolean; override;
    function SetData(AData: Pointer; ASize: Integer): Boolean; override;
    function GetAnchorVisible(AIndex: Integer): Boolean; override; // ê���Ƿ�ɼ�
    procedure DrawBox(AOffset: TPoint; ACanvas: TCanvas); override; // ����ѡ��
    procedure DrawShape(AOffset: TPoint; ACanvas: TCanvas); override; // ����ͼ��

    function KeyDown(var Key: Word; Shift: TShiftState): Boolean; virtual;
    function KeyUp(var Key: Word; Shift: TShiftState): Boolean; virtual;
    function MouseMove(Shift: TShiftState; X, Y: Integer): Boolean; virtual;
    function MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean; virtual;
    function MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean; virtual;
    function KeyPress(Char: WideChar): Boolean; virtual;

//    procedure Draw(AOffset: TPoint; ACanvas: TCanvas); override; // ���Ƶ�ACanvas��
    procedure Offset(AOffset: TPoint); override; // λ��
    function Accept: Boolean; override; // �Ƿ���ܻ���
    function PosFromChar(AStart: Integer): TPoint; virtual; abstract; // �����ַ���Ż���ַ�������
    function CharFromPos(APos: TPoint): Integer; virtual; abstract; // �����������ַ����
    property CaretPos: TPoint read GetCaretPos; // ����λ��
    procedure SelectText(AStart, AEnd: Integer); virtual; // ѡ���ı�

    property Text: WideString read FText write SetText; // �ı�
    property OldText: WideString read FOldText write FOldText; // �޸�ǰ���ı�  //2007-11-19 ZswangY37 No.4
    property TextChanged: Boolean read GetTextChanged;
    property Point: TPoint read FPoint write FPoint; // ��������
    property MaxLength: Integer read FMaxLength write SetMaxLength; // ������볤��
    property SelLength: Integer read FSelLength write SetSelLength; // ѡ�񳤶�
    property SelStart: Integer read FSelStart write SetSelStart; // ѡ����ʼλ��
    property SelText: WideString read GetSelText write SetSelText; // ѡ���ı�
    property CaretFirst: Boolean read FCaretFirst write FCaretFirst; // ����Ƿ�ͣ����ǰ��
    property CaretHeight: Integer read FCaretHeight write FCaretHeight; // ���ĸ߶�
    property Zoom: Double read FZoom write FZoom;
    property FontName: TFontName read FFontName write FFontName;
    constructor Create; override;
  end;

  TShapeEdit = class(TCustomShapeText) // �����ı� // ��������ƶ����ı�
  public
    function KeyUp(var Key: Word; Shift: TShiftState): Boolean; override;
    function KeyPress(Char: WideChar): Boolean; override;

    procedure UpdateRect; override; // ���������Ա��ж�HotPoint
    procedure DrawShape(AOffset: TPoint; ACanvas: TCanvas); override; // ����ͼ��
    //procedure Draw(AOffset: TPoint; ACanvas: TCanvas); override; // ���Ƶ�ACanvas��
    function PosFromChar(AStart: Integer): TPoint; override; // �����ַ���Ż���ַ�������
    function CharFromPos(APos: TPoint): Integer; override; // �����������ַ����
  end;

  TShapeMemo = class(TCustomShapeText) // �����ı�
  private
    FLines: TStrings; // ���б� // ��ÿ�еĿ�ȱ�����Objects������
  public
    function GetData(var AData: Pointer; var ASize: Integer): Boolean; override;
    function SetData(AData: Pointer; ASize: Integer): Boolean; override;
    
    function KeyDown(var Key: Word; Shift: TShiftState): Boolean; override;
    function KeyUp(var Key: Word; Shift: TShiftState): Boolean; override;

    procedure UpdateRect; override; // ���������Ա��ж�HotPoint
    procedure DrawShape(AOffset: TPoint; ACanvas: TCanvas); override; // ����ͼ��
    //procedure Draw(AOffset: TPoint; ACanvas: TCanvas); override; // ���Ƶ�ACanvas��
    function PosFromChar(AStart: Integer): TPoint; override; // �����ַ���Ż���ַ�������
    function CharFromPos(APos: TPoint): Integer; override; // �����������ַ����
    function LineFromChar(AStart: Integer): Integer; virtual; // �����ַ���ŷ��������к�
    function LineIndex(ALine: Integer): Integer; virtual; // �����кŷ��ظ������ַ����
    function HotPoint(APoint: TPoint): Boolean; override; // ��ǰ�����Ƿ���ͼ����
    function HotRect(ARect: TRect): Boolean; override; // ��ǰ�����Ƿ��ͼ���ཻ
    constructor Create; override;
    destructor Destroy; override;
  end;

  TCustomShapeVector = class(TCustomShapeRect) // ����ͼ
  private
    FModels: TList; // ģ���б�
    function GetModelText: string;
    procedure SetModelText(const Value: string);
  public
    function GetData(var AData: Pointer; var ASize: Integer): Boolean; override;
    function SetData(AData: Pointer; ASize: Integer): Boolean; override;

    function Accept: Boolean; override; // �Ƿ���ܻ���
    property ModelText: string read GetModelText write SetModelText; // ģ�ͽű�
    function ModelSize: Integer;
    procedure DrawShape(AOffset: TPoint; ACanvas: TCanvas); override; // ����ͼ��
    //procedure Draw(AOffset: TPoint; ACanvas: TCanvas); override;
    function HotPoint(APoint: TPoint): Boolean; override; // ��ǰ�����Ƿ���ͼ����
    function HotRect(ARect: TRect): Boolean; override; // ��ǰ�����Ƿ��ͼ���ཻ
    procedure Clear; // ���ģ��

    constructor Create; override;
    destructor Destroy; override;
  end;

  TShapeVector = class(TCustomShapeVector);

type
  TUndoTextInfo = record // �ı�������Ϣ,������
    rText: WideString; // ����
    rSelStart: Integer; // ѡ����ʼλ��
    rSelLength: Integer; // ѡ�񳤶�
    rCaretFirst: Boolean; // ������ڷ���
  end;
  PUndoTextInfo = ^TUndoTextInfo;

type
  TUndoText = class // �����ı�
  private
    FUndos: TList;
    FEditor: TObject;
    FUndoNumber: Integer; // ��������

    FMaxUndo: Integer; // �������
    procedure SetMaxUndo(const Value: Integer);
  public
    procedure Clear;
    constructor Create;
    destructor Destroy; override;

    procedure RecordUndo( // ��¼һ��������Ϣ
      AEditor: TObject; // �����ߣ���������߷����ı��������ʷ������Ϣ
      AText: WideString; // �ı�
      ASelStart, ASelLength: Integer;
      ACaretFirst: Boolean
    );

    function ExecuteUndo(AEditor: TObject): PUndoTextInfo; // ִ�г���
    function ExecuteRedo(AEditor: TObject): PUndoTextInfo; // ִ���ظ�
    function CanUndo(AEditor: TObject): Boolean;
    function CanRedo(AEditor: TObject): Boolean;
    property MaxUndo: Integer read FMaxUndo write SetMaxUndo default $16;
    property Editor: TObject read FEditor;
    property UndoNumber: Integer read FUndoNumber;
  end;

procedure RegisterShape( // ע��༭��ʽ�ʹ洢��ʽ
  AType: TShapeType; // ���ͱ�ʶ
  AModify: TShapeModify; // �༭�ʹ洢��ʽ
  AClass: TShapeClass; // ͼ����
  ACursor: TCursor // ���ָ��
);

procedure UnregisterShape( // ע��ͼ�α༭�ʹ洢��ʽ
  AClass: TShapeClass // ͼ����
);

function FindShapeType( // ��ѯͼ�ε�����
  AClass: TClass
): TShapeType;

function FindShapeCursor( // ��ѯͼ�����ָ��
  AType: TShapeType
): TCursor;

function FindShapeModify( // ��ѯͼ�εı༭��ʽ
  AClass: TClass
): TShapeModify; 

function FindShapeClass( // ��ѯͼ�ε���
  AType: TShapeType
): TShapeClass;

function NewShape(
  AShapeType: TShapeType
): TCustomShape; // �����������һ��ͼ�β����أ�������ӵ��б���

const cHotOffset = 5; // ���ѡ�����������
const cMemoMaxLength = 10000;

//const cFontName = 'arial'; // ����//'Courier New';

implementation

uses Math, Clipbrd, Types, jpeg, CrcUtils21, CommonFunctions51, StringFunctions51;

const
  cIdentText = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

const
  cGraphicTypes: array[0..3] of TGraphicClass =
    (TMetafile, TIcon, TBitmap, TJpegImage);
  
var
  vUndoText: TUndoText;
  
type
  PShapeFormat = ^TShapeFormat;
  TShapeFormat = record
    rClass: TShapeClass; // ͼ����
    rType: TShapeType; // ͼ������
    rModify: TShapeModify; // �༭��ʽ
    rCursor: TCursor; // ���ָ��
  end;

var
  vShapeFormats: TList;

function NewShape(
  AShapeType: TShapeType
): TCustomShape; // �����������һ��ͼ�β����أ�������ӵ��б���
var
  vShapeClass: TShapeClass;
begin
  Result := nil;
  vShapeClass := FindShapeClass(AShapeType);
  if not Assigned(vShapeClass) then Exit;
  Result := vShapeClass.Create;
  Result.Visible := True;
end; { NewShape } 

function FindShapeType(AClass: TClass): TShapeType;
var
  I: Integer;
  vShapeFormat: PShapeFormat;
begin
  for I := 0 to vShapeFormats.Count - 1 do
  begin
    vShapeFormat := vShapeFormats[I];
    if vShapeFormat^.rClass = AClass then
    begin
      Result := vShapeFormat^.rType;
      Exit;
    end;
  end;
  Result := stUnknown;
end; { FindShapeType }

function FindShapeModify(AClass: TClass): TShapeModify;
var
  I: Integer;
  vShapeFormat: PShapeFormat;
begin
  for I := 0 to vShapeFormats.Count - 1 do
  begin
    vShapeFormat := vShapeFormats[I];
    if vShapeFormat^.rClass = AClass then
    begin
      Result := vShapeFormat^.rModify;
      Exit;
    end;
  end;
  Result := smUnknown;
end; { FindShapeModify }

function FindShapeCursor( // ��ѯͼ�����ָ��
  AType: TShapeType
): TCursor;
var
  I: Integer;
  vShapeFormat: PShapeFormat;
begin
  for I := 0 to vShapeFormats.Count - 1 do
  begin
    vShapeFormat := vShapeFormats[I];
    if vShapeFormat^.rType = AType then
    begin
      Result := vShapeFormat^.rCursor;
      Exit;
    end;
  end;
  Result := crDefault;
end; { FindShapeModify }

function FindShapeClass( // ��ѯͼ�ε�����
  AType: TShapeType
): TShapeClass;
var
  I: Integer;
  vShapeFormat: PShapeFormat;
begin
  for I := 0 to vShapeFormats.Count - 1 do
  begin
    vShapeFormat := vShapeFormats[I];
    if vShapeFormat^.rType = AType then
    begin
      Result := vShapeFormat^.rClass;
      Exit;
    end;
  end;
  Result := nil;
end; { FindShapeClass }

procedure RegisterShape( // ע��༭��ʽ�ʹ洢��ʽ
  AType: TShapeType; // ���ͱ�ʶ
  AModify: TShapeModify; // �༭�ʹ洢��ʽ
  AClass: TShapeClass; // ͼ����
  ACursor: TCursor // ���ָ��
);
var
  vShapeFormat: PShapeFormat;
begin
  if not Assigned(AClass) then Exit;
  New(vShapeFormat);
  vShapeFormat^.rType := AType;
  vShapeFormat^.rClass := AClass;
  vShapeFormat^.rModify := AModify;
  vShapeFormat^.rCursor := ACursor;

  vShapeFormats.Add(vShapeFormat);
end; { RegisterShape }

procedure UnregisterShape(AClass: TShapeClass);
var
  I: Integer;
  vShapeFormat: PShapeFormat;
begin
  for I := vShapeFormats.Count - 1 downto 0 do
  begin
    vShapeFormat := PShapeFormat(vShapeFormats[I]);
    if vShapeFormat^.rClass = AClass then
    begin
      Dispose(vShapeFormat);
      vShapeFormats.Delete(I);
    end;
  end;
end;

{ TCustomShape }

function TCustomShape.AnchorResize(AIndex: Integer;
  ACenter: TPoint; APoint: TPoint): Boolean;
begin
  Result := False;
end;

function TCustomShape.CalcAngle(APoint: TPoint): Byte;
var
  vCenterPoint: TPoint;
  vSourceAngle, vDestAngle: Double;
begin
  vCenterPoint := CenterPoint(FRect);
  vSourceAngle := (Angle / 255) * PI * 2 - PI / 2;
  vDestAngle := PointToAngle(vCenterPoint, APoint);
  vDestAngle := vDestAngle - vSourceAngle;
  while vDestAngle < 0 do vDestAngle := vDestAngle + 2 * PI;
  while vDestAngle > 2 * PI do vDestAngle := vDestAngle - 2 * PI;
  Result := Round((vDestAngle / (2 * PI)) * 255);
end;

constructor TCustomShape.Create;
begin
  inherited;
  FVisible := True;
  FIdent := $FFFFFFFF;
  FCanReangle := True;
end;

procedure TCustomShape.Draw(AOffset: TPoint; ACanvas: TCanvas);
var
  vGraphicMode: Integer;
  vXForm: TXForm;
  vCenterPoint: TPoint;
begin
  ACanvas.Brush.Style := bsClear;
  ACanvas.Pen.Color := FPenColor;
  if (Angle <> 0) and not FModified then // ��ת�Ƕ�
  begin
    vCenterPoint := CenterPoint(FRect);
    vXForm := InitXFrom(vCenterPoint, (Angle / 255) * 2 * PI);
    vGraphicMode := SetGraphicsMode(ACanvas.Handle, GM_ADVANCED);
    SetWorldTransform(ACanvas.Handle, vXForm);
    AOffset := MovePoint(AOffset, -vCenterPoint.X, -vCenterPoint.Y);
  end else vGraphicMode := 0;
  if Translucency then
    ACanvas.Pen.Mode := pmMask
  else ACanvas.Pen.Mode := pmCopy;
  DrawBox(AOffset, ACanvas);
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Width := FPenWidth + Ord(FHighlight) * 2;
  DrawShape(AOffset, ACanvas);
  if Selected then DrawAnchor(AOffset, ACanvas);
  if (Angle <> 0) and not FModified then
  begin
    ModifyWorldTransform(ACanvas.Handle, vXForm, MWT_IDENTITY);
    SetGraphicsMode(ACanvas.Handle, vGraphicMode);
  end;
end;

procedure TCustomShape.DrawAnchor(AOffset: TPoint; ACanvas: TCanvas);
var
  I: Integer;
  vPointA, vPointB: TPoint;
begin
  ACanvas.Pen.Mode := pmCopy;
  ACanvas.Pen.Width := 1;
  ACanvas.Pen.Color := clBlack;
  vPointA := CenterPoint(FRect);
  if CanReangle and GetAnchorVisible(8) then
  begin
    vPointA := GetAnchorPoint(8);
    vPointB := GetAnchorPoint(0);
    ACanvas.MoveTo(AOffset.X + vPointA.X, AOffset.Y + vPointA.Y);
    ACanvas.LineTo(AOffset.X + vPointB.X, AOffset.Y + vPointB.Y);
    ACanvas.Brush.Color := clGreen;
    ACanvas.Ellipse(ZoomRect(Types.Rect(
      AOffset.X + vPointA.X, AOffset.Y + vPointA.Y,
      AOffset.X + vPointA.X, AOffset.Y + vPointA.Y), 3 + FPenWidth div 2));
  end;
  ACanvas.Brush.Color := clWhite;

  for I := 0 to 7 do
  begin
    if GetAnchorVisible(I) then
    begin
      vPointA := GetAnchorPoint(I);
      ACanvas.Ellipse(ZoomRect(Types.Rect(
        AOffset.X + vPointA.X, AOffset.Y + vPointA.Y,
        AOffset.X + vPointA.X, AOffset.Y + vPointA.Y), 3 + FPenWidth div 2));
    end;
  end;
end;

procedure TCustomShape.DrawBox(AOffset: TPoint; ACanvas: TCanvas);
begin
  if FSelected and not FModified then
  begin
    if FHighlight then
      ACanvas.Pen.Style := psDot
    else ACanvas.Pen.Style := psDashDot;
    ACanvas.Pen.Width := 1;
    ACanvas.Rectangle(MoveRect(ZoomRect(Rect, 1), AOffset));
  end;
end;

function TCustomShape.GetAnchorCursor(AIndex: Integer;
  AMouseDown: Boolean): TCursor;
const
  cAnchorCursors: array[0..7] of TCursor = (
    crSizeWE, //2
    crSizeNWSE, //3
    crSizeNS, //4
    crSizeNESW, //5
    crSizeWE, //6
    crSizeNWSE, //7
    crSizeNS, //0
    crSizeNESW //1
  );
var
  vAngle: Double;
  vPoint: TPoint;
  vCenterPoint: TPoint;
  I: Integer;
begin
  Result := crDefault;
  case AIndex of
    0..7:
      if AMouseDown then
        Result := crCross
      else
      begin
        vCenterPoint := CenterPoint(FRect);
        vPoint := GetAnchorPoint(AIndex);
        vAngle := PointToAngle(vCenterPoint, vPoint) + (Angle / 255) * PI * 2;
        I := Angle8Index(vPoint, vAngle);
        if I >= 0 then Result := cAnchorCursors[I];
      end;
    8: if AMouseDown then Result := crRoundB else Result := crRoundA;
  end;
end;

function TCustomShape.GetAnchorPoint(AIndex: Integer): TPoint;
var
  vCenterPoint: TPoint;
begin
  vCenterPoint := CenterPoint(FRect);
  case AIndex of
    5, 6, 7: Result.X := FRect.Left;
    1, 2, 3: Result.X := FRect.Right;
    0, 4, 8: Result.X := vCenterPoint.X;
  end;
  case AIndex of
    0, 1, 7: Result.Y := FRect.Top;
    2, 6: Result.Y := vCenterPoint.Y;
    3, 4, 5: Result.Y := FRect.Bottom;
    8: Result.Y := FRect.Top - 32 + FPenWidth div 2 - 1;
  end;
end;

function TCustomShape.GetAnchorVisible(AIndex: Integer): Boolean;
begin
  case AIndex of
    0..8: Result := True;
  else Result := False;
  end;
end;

function TCustomShape.GetResource(var AResource: Pointer;
  var ASize: Integer): Boolean;
begin
  Result := False;
end;

function TCustomShape.HotAnchor(APoint: TPoint): Integer;
var
  I: Integer;
begin
  Result := -1;
  if not Selected then Exit; // û��ѡ��
  if (Angle <> 0) and (not FModified) then
    APoint := RotatePoint(APoint, CenterPoint(FRect), -(Angle / 255) * 2 * PI);
  for I := 8 - Ord(not CanReangle) downto 0 do
  begin
    if GetAnchorVisible(I) then
      if PointToPoint(GetAnchorPoint(I), APoint) <= 3 + FPenWidth div 2 then
      begin
        Result := I;
        Break;
      end;
  end;
end;

function TCustomShape.HotPoint(APoint: TPoint): Boolean;
begin
  if (Angle <> 0) and (not FModified) then
    APoint := RotatePoint(APoint, CenterPoint(FRect), -(Angle / 255) * 2 * PI);
  Result := PtInRect(FRect, APoint);
end;

function TCustomShape.HotRect(ARect: TRect): Boolean;
var
  vCenterPoint: TPoint;
  vCenter: PPoint;
begin
  if (Angle <> 0) and (not FModified) then
  begin
    vCenterPoint := CenterPoint(FRect);
    vCenter := @vCenterPoint;
  end else vCenter := nil;
  Result := RectByRect(FRect, ARect, vCenter, -(Angle / 255) * 2 * PI);
end;

procedure TCustomShape.Offset(AOffset: TPoint);
begin
  OffsetRect(FRect, AOffset.X, AOffset.Y);
end;

function TCustomShape.ResourceWrite(AStream: TStream): Integer;
var
  vResourceInfo: PResourceInfo;
  vData: Pointer;
  vSize: Integer;
begin
  Result := -1;
  if not FHasResource then Exit;
  if not Assigned(AStream) then Exit;
  if not GetResource(vData, vSize) then Exit;
  try
    GetMem(vResourceInfo, SizeOf(TResourceInfo) - SizeOf(Char) + vSize);
    try
      Move(vData^, vResourceInfo^.rData[0], vSize);
      vResourceInfo^.rCrc32 := BufferCRC32(vResourceInfo^.rData[0], vSize);
      vResourceInfo^.rReceiveSize := vSize;
      vResourceInfo^.rSize := vSize;
      Result := AStream.Write(vResourceInfo^,
        SizeOf(TResourceInfo) - SizeOf(Char) + vSize);
    finally
      FreeMem(vResourceInfo, SizeOf(TResourceInfo) - SizeOf(Char) + vSize);
    end;
  finally
    FreeMem(vData, vSize);
  end;
end;

procedure TCustomShape.RoundAngle(AAngle: Byte);
begin
  if Angle + AAngle <= 255 then
    Angle := Angle + AAngle
  else Angle := Angle + AAngle - 255;
end;

function TCustomShape.SetResource(AResource: Pointer;
  ASize: Integer): Boolean;
begin
  Result := False;
end;

function TCustomShape.StreamRead(AStream: TStream): Integer;
var
  vShapeInfo: TShapeInfo;
  vData: Pointer;
begin
  Result := -1;
  if not Assigned(AStream) then Exit;
  Result := AStream.Read(vShapeInfo, SizeOf(vShapeInfo) - SizeOf(Char));
  GetMem(vData, vShapeInfo.rDataSize);
  try
    AStream.Read(vData^, vShapeInfo.rDataSize);
    { TODO -c2006.12.07 -oZswangY37 : ��������Ƿ�Ϸ� }
    if vShapeInfo.rType <> FindShapeType(ClassType) then Exit;
    FIdent := vShapeInfo.rIdent;
    FPenWidth := vShapeInfo.rPenWidth;
    FPenColor := vShapeInfo.rPenColor;
    FTranslucency := vShapeInfo.rTranslucency;                                  //2007-07-28 ZswangY37 No.1 ���� ��ɫ͸��״̬���ܸ���
    FAngle := vShapeInfo.rAngle;
    SetData(vData, vShapeInfo.rDataSize);
    UpdateRect;
  finally
    FreeMem(vData, vShapeInfo.rDataSize);
  end;
end;

function TCustomShape.StreamWrite(AStream: TStream): Integer;
var
  vShapeInfo: PShapeInfo;
  vData: Pointer;
  vSize: Integer;
begin
  Result := -1;
  if not Assigned(AStream) then Exit;
  GetData(vData, vSize);
  try
    GetMem(vShapeInfo, SizeOf(TShapeInfo) - SizeOf(Char) + vSize);
    try
      vShapeInfo^.rIdent := FIdent;
      vShapeInfo^.rType := FindShapeType(ClassType);
      vShapeInfo^.rPenWidth := FPenWidth;
      vShapeInfo^.rPenColor := FPenColor;
      vShapeInfo^.rTranslucency := FTranslucency;
      vShapeInfo^.rAngle := Angle;
      vShapeInfo^.rDataSize := vSize;
      Move(vData^, vShapeInfo^.rData[0], vSize);
      Result := AStream.Write(vShapeInfo^, SizeOf(TShapeInfo) - SizeOf(Char) + vSize);
    finally
      FreeMem(vShapeInfo, SizeOf(TShapeInfo) - SizeOf(Char) + vSize);
    end;
  finally
    if vSize <> 0 then FreeMem(vData, vSize);
  end;
end;

{ TCustomShapePoints }

function TCustomShapePoints.Accept: Boolean;
begin
  Result := FPoints.Count > 0;
end;

procedure TCustomShapePoints.Append(APoint: TPoint);
var
  vPointA: PPoint;
  vPointB: PPoint;
  vPointC: PPoint;
  I: Integer;
begin
  New(vPointC);
  vPointC^ := APoint;
  FPoints.Add(vPointC);

  if FPoints.Count >= 3 then // �������һֱ�ߣ���ȥ���м��
  begin
    I := FPoints.Count - 3;
    vPointA := FPoints[I + 0];
    vPointB := FPoints[I + 1];
    { TODO -c2006.12.03 -oZswangY37 : ����ͨ������������ʿ���ѹ���� }
    if PointToLine(vPointB^, vPointA^, vPointC^) <= 0.27 then
    begin
      Dispose(vPointB);
      FPoints.Delete(I + 1);
    end;
  end;
end;

procedure TCustomShapePoints.Clear;
var
  I: Integer;
begin
  for I := FPoints.Count - 1 downto 0 do
    Dispose(PPoint(FPoints[I]));
  FPoints.Clear;  
end;

constructor TCustomShapePoints.Create;
begin
  inherited;
  FPoints := TList.Create;
  FHasResource := True;
  FOffset := Point(0, 0);
end;

destructor TCustomShapePoints.Destroy;
var
  I: Integer;
begin
  if Assigned(FPoints) then
  begin
    for I := FPoints.Count - 1 downto 0 do
      Dispose(PPoint(FPoints[I]));
    FPoints.Free;
  end;
  inherited;
end;

function TCustomShapePoints.GetData(var AData: Pointer;
  var ASize: Integer): Boolean;
begin
  Result := False;
  if FPoints.Count <= 0 then
  begin
    AData := nil;
    ASize := 0;
    Exit;
  end;
  ASize := SizeOf(TPointsData);
  GetMem(AData, ASize);
  PPointsData(AData)^.rResourceCrc32 := FResourceCrc32;
  PPointsData(AData)^.rResourceSize := FResourceSize;
  PPointsData(AData)^.rOffset.x := FOffset.X;
  PPointsData(AData)^.rOffset.y := FOffset.Y;
  Result := True;
end;

function TCustomShapePoints.GetPointCount: Integer;
begin
  Result := FPoints.Count;
end;

function TCustomShapePoints.GetPoints(Index: Integer): TPoint;
begin
  if (0 <= Index) and (Index < FPoints.Count) then
    Result := PPoint(FPoints[Index])^
  else Result := Point(-1, -1);
end;

function TCustomShapePoints.GetResource(var AResource: Pointer;
  var ASize: Integer): Boolean;
var
  I: Integer;
  vSmallPoint: PSmallPoint;
  vPoint: PPoint;
begin
  ASize := FPoints.Count * SizeOf(TSmallPoint);
  GetMem(AResource, ASize);
  vSmallPoint := AResource;
  for I := 0 to FPoints.Count - 1 do
  begin
    vPoint := FPoints[I];
    vSmallPoint.x := vPoint^.X;
    vSmallPoint.y := vPoint^.Y;
    Inc(vSmallPoint);
  end;
  Result := True;
end;

procedure TCustomShapePoints.Offset(AOffset: TPoint);
//var
//  I: Integer;
begin
  inherited;
  FOffset := Point(FOffset.X + AOffset.X, FOffset.Y + AOffset.Y);
//  for I := 0 to FPoints.Count - 1 do
//    with PPoint(FPoints[I])^ do
//    begin
//      X := X + AOffset.X;
//      Y := Y + AOffset.Y;
//    end;
end;

function TCustomShapePoints.SetData(AData: Pointer; ASize: Integer): Boolean;
var
  I: Integer;
begin
  ///////Begin �����ʷ
  for I := 0 to FPoints.Count - 1 do
    Dispose(PPoint(FPoints[I]));
  FPoints.Clear;
  ///////End �����ʷ
  FResourceCrc32 := PPointsData(AData)^.rResourceCrc32;
  FResourceSize := PPointsData(AData)^.rResourceSize;
  FOffset.X := PPointsData(AData)^.rOffset.x;
  FOffset.Y := PPointsData(AData)^.rOffset.y;
  Result := True;
end;

function TCustomShapePoints.SetResource(AResource: Pointer;
  ASize: Integer): Boolean;
var
  I: Integer;
  vSmallPoint: PSmallPoint;
  vPoint: TPoint;
begin
  vSmallPoint := AResource;
  for I := 0 to ASize div SizeOf(TSmallPoint) - 1 do
  begin
    vPoint.X := vSmallPoint.x;
    vPoint.y := vSmallPoint.y;
    Append(vPoint);
    Inc(vSmallPoint);
  end;
  Result := True;
end;

procedure TCustomShapePoints.UpdateRect;
var
  I: Integer;
  vPoint: PPoint;
  P: TPoint;
begin
  inherited;
  if FPoints.Count <= 0 then Exit;
  ///////Begin ���㱾ͼ��ռ�õ�����
  vPoint := FPoints[0];
  P := Point(vPoint^.X + FOffset.X, vPoint.Y + FOffset.Y);
  FRect.TopLeft := P;                                                           //2007-12-07 ZswangY37 No.1
  FRect.BottomRight := P;
  for I := 0 to FPoints.Count - 1 do
  begin
    vPoint := FPoints[I];
    P := Point(vPoint^.X + FOffset.X, vPoint.Y + FOffset.Y);
    if FRect.Left > P.X then FRect.Left := P.X;
    if FRect.Top > P.Y then FRect.Top := P.Y;
    if FRect.Right < P.X then FRect.Right := P.X;
    if FRect.Bottom < P.Y then FRect.Bottom := P.Y;
  end;
  ///////End ���㱾ͼ��ռ�õ�����
  InflateRect(FRect, Trunc(FPenWidth / 2 + 0.9), Trunc(FPenWidth / 2 + 0.9));
end;

{ TShapePen }

procedure TShapePen.DrawShape(AOffset: TPoint; ACanvas: TCanvas);
var
  I: Integer;
  vPoint: PPoint;
begin
  inherited;
  if FPoints.Count <= 0 then Exit;
  vPoint := FPoints[0];
  ACanvas.MoveTo(FOffset.X + vPoint^.X + AOffset.X,
    FOffset.Y + vPoint^.Y + AOffset.Y);
  for I := 0 to FPoints.Count - 1 do
  begin
    vPoint := FPoints[I];
    ACanvas.LineTo(FOffset.X + vPoint^.X + AOffset.X,
      FOffset.Y + vPoint^.Y + AOffset.Y);
  end;
end;

function TShapePen.GetAnchorVisible(AIndex: Integer): Boolean;
begin
  Result := AIndex = 8;
end;

function TShapePen.HotPoint(APoint: TPoint): Boolean;
var
  I: Integer;
begin
  Result := inherited HotPoint(APoint);
  if (FPoints.Count <= 1) or not Result then Exit;
  if Selected then Exit;
  if Angle > 0 then
    APoint := RotatePoint(APoint, CenterPoint(FRect), -(Angle / 255) * 2 * PI);
  Result := False;
  for I := 1 to FPoints.Count - 1 do
    if PtInLine(APoint,
      Point(
        FOffset.X + PPoint(FPoints[I - 1])^.X,
        FOffset.Y + PPoint(FPoints[I - 1])^.Y),
      Point(
        FOffset.X + PPoint(FPoints[I])^.X,
        FOffset.Y + PPoint(FPoints[I])^.Y),
      Max(FPenWidth, cHotOffset)) then
    begin
      Result := True;
      Exit;
    end;
end;

function TShapePen.HotRect(ARect: TRect): Boolean;
var
  vPointA, vPointB: TPoint;
  I: Integer;
  vCenterPoint: TPoint;
  vCenter: PPoint;
  vAngle: Double;
begin
  Result := inherited HotRect(ARect);
  if (FPoints.Count <= 1) or not Result then Exit;
  vAngle := 0;
  if (Angle <> 0) and (not FModified) then
  begin
    vCenterPoint := CenterPoint(FRect);
    vCenter := @vCenterPoint;
    vAngle := -(Angle / 255) * PI * 2;
  end else vCenter := nil;
  for I := 1 to FPoints.Count - 1 do
  begin
    vPointA := Point(
      FOffset.X + PPoint(FPoints[I])^.X,
      FOffset.Y + PPoint(FPoints[I])^.Y);
    vPointB := Point(
      FOffset.X + PPoint(FPoints[I - 1])^.X,
      FOffset.Y + PPoint(FPoints[I - 1])^.Y);
    if PointInRect(vPointA, ARect, vCenter, vAngle) then Exit;
    if PointInRect(vPointB, ARect, vCenter, vAngle) then Exit;
    if LineByRect(vPointA, vPointB, ARect, vCenter, vAngle) then Exit;
  end;
  Result := False;
end;

{ TCustomShapeRect }

function TCustomShapeRect.Accept: Boolean;
begin
  Result := (FFromPoint.X <> FToPoint.X) or(FFromPoint.Y <> FToPoint.Y);
end;

function TCustomShapeRect.AnchorResize(
  AIndex: Integer;
  ACenter: TPoint;
  APoint: TPoint): Boolean;
var
  vCenterPoint: TPoint;
begin
  Result := False;
  if (AIndex < 0) or (AIndex > 7) then Exit;
  if Angle > 0 then
    APoint := RotatePoint(APoint, ACenter, -(Angle / 255) * 2 * PI);
  case AIndex of
    0, 1, 7: FFromPoint.Y := APoint.Y;
    3, 4, 5: FToPoint.Y := APoint.Y;
  end;
  case AIndex of
    5, 6, 7: FFromPoint.X := APoint.X;
    1, 2, 3: FToPoint.X := APoint.X;
  end;
  UpdateRect;
  vCenterPoint := CenterPoint(FRect);
  Offset(Point(ACenter.X - vCenterPoint.X, ACenter.Y - vCenterPoint.Y));
  Result := True;
end;

function TCustomShapeRect.CalcAngle(APoint: TPoint): Byte;
var
  vCenterPoint: TPoint;
  vSourceAngle, vDestAngle: Double;
begin
  vCenterPoint := CenterPoint(FRect);
  vSourceAngle := (Angle / 255) * PI * 2 - PI / 2;
  vDestAngle := PointToAngle(vCenterPoint, APoint);
  vDestAngle := vDestAngle - vSourceAngle;
  if (FFromPoint.Y > FToPoint.Y) then vDestAngle := vDestAngle + PI;
  while vDestAngle < 0 do vDestAngle := vDestAngle + 2 * PI;
  while vDestAngle > 2 * PI do vDestAngle := vDestAngle - 2 * PI;
  Result := Round((vDestAngle / (2 * PI)) * 255);
end;

function TCustomShapeRect.GetAnchorPoint(AIndex: Integer): TPoint;
var
  vCenterPoint: TPoint;
begin
  vCenterPoint := CenterPoint(FRect);
  if FFromPoint.Y < FToPoint.Y then
  begin
    case AIndex of
      5, 6, 7: Result.X := FFromPoint.X;
      1, 2, 3: Result.X := FToPoint.X;
      0, 4, 8: Result.X := vCenterPoint.X;
    end;
    case AIndex of
      0, 1, 7: Result.Y := FFromPoint.Y;
      2, 6: Result.Y := vCenterPoint.Y;
      3, 4, 5: Result.Y := FToPoint.Y;
      8: Result.Y := FFromPoint.Y - (32 + FPenWidth div 2 - 1)
    end;
  end else
  begin
    case AIndex of
      5, 6, 7: Result.X := FFromPoint.X;
      1, 2, 3: Result.X := FToPoint.X;
      0, 4, 8: Result.X := vCenterPoint.X;
    end;
    case AIndex of
      0, 1, 7: Result.Y := FFromPoint.Y;
      2, 6: Result.Y := vCenterPoint.Y;
      3, 4, 5: Result.Y := FToPoint.Y;
      8: Result.Y := FFromPoint.Y + (32 + FPenWidth div 2 - 1)
    end;
  end;
//  if AIndex = 8 then OutputDebugString(PChar(Format('%d,%d', [Result.X, Result.Y])));
end;

function TCustomShapeRect.GetData(var AData: Pointer;
  var ASize: Integer): Boolean;
begin
  ASize := SizeOf(TRectData);
  GetMem(AData, ASize);
  PRectData(AData)^.rFromPoint.x := FFromPoint.X;
  PRectData(AData)^.rFromPoint.y := FFromPoint.Y;
  PRectData(AData)^.rToPoint.x := FToPoint.X;
  PRectData(AData)^.rToPoint.y := FToPoint.Y;
  Result := True;
end;

procedure TCustomShapeRect.Offset(AOffset: TPoint);
begin
  inherited;
  FFromPoint := Point(FFromPoint.X + AOffset.X, FFromPoint.Y + AOffset.Y);
  FToPoint := Point(FToPoint.X + AOffset.X, FToPoint.Y + AOffset.Y);
end;

function TCustomShapeRect.SetData(AData: Pointer; ASize: Integer): Boolean;
begin
  Result := False;
  if ASize <> SizeOf(TRectData) then Exit;
  FFromPoint.X := PRectData(AData)^.rFromPoint.x;
  FFromPoint.Y := PRectData(AData)^.rFromPoint.y;
  FToPoint.X := PRectData(AData)^.rToPoint.x;
  FToPoint.Y := PRectData(AData)^.rToPoint.y;
  Result := True;
end;

procedure TCustomShapeRect.UpdateRect;
begin
  inherited;
  FRect.TopLeft := FFromPoint;
  FRect.BottomRight := FToPoint;
  FRect := ReviseRect(FRect);
  InflateRect(FRect, Max(1, Trunc(FPenWidth / 2 + 0.9)),
    Max(1, Trunc(FPenWidth / 2 + 0.9)));
end;

{ TShapeLine }

function TShapeLine.AnchorResize(AIndex: Integer; ACenter: TPoint;
  APoint: TPoint): Boolean;
begin
  if Angle > 0 then
  begin
    FFromPoint := RotatePoint(FFromPoint, CenterPoint(FRect), (Angle / 255) * 2 * PI);
    FToPoint := RotatePoint(FToPoint, CenterPoint(FRect), (Angle / 255) * 2 * PI);
    Angle := 0;
  end;

  Result := False;
  case AIndex of
    1: FFromPoint := APoint;
    0: FToPoint := APoint;
  else Exit;
  end;
  UpdateRect;
  Result := True;
end;

procedure TShapeLine.DrawBox(AOffset: TPoint; ACanvas: TCanvas);
begin
end;

procedure TShapeLine.DrawShape(AOffset: TPoint; ACanvas: TCanvas);
begin
  inherited;
  ACanvas.MoveTo(AOffset.X + FFromPoint.X, AOffset.Y + FFromPoint.Y);
  ACanvas.LineTo(AOffset.X + FToPoint.X, AOffset.Y + FToPoint.Y);
end;

function TShapeLine.GetAnchorPoint(AIndex: Integer): TPoint;
begin
  case AIndex of
    0: Result := FToPoint;
    1: Result := FFromPoint;
  end;
end;

function TShapeLine.GetAnchorVisible(AIndex: Integer): Boolean;
begin
  case AIndex of
    0, 1: Result := True;
  else Result := False;
  end;
end;

function TShapeLine.HotPoint(APoint: TPoint): Boolean;
begin
  Result := inherited HotPoint(APoint);
  if not Result then Exit;
  if Angle > 0 then
    APoint := RotatePoint(APoint, CenterPoint(FRect), -(Angle / 255) * 2 * PI);
  Result := PtInLine(APoint, FFromPoint, FToPoint, Max(FPenWidth, cHotOffset));
end;

function TShapeLine.HotRect(ARect: TRect): Boolean;
var
  vCenterPoint: TPoint;
  vCenter: PPoint;
begin
  Result := inherited HotRect(ARect);
  if not Result then Exit;
  if (Angle <> 0) and (not FModified) then
  begin
    vCenterPoint := CenterPoint(FRect);
    vCenter := @vCenterPoint;
  end else vCenter := nil;
  Result := LineByRect(FFromPoint, FToPoint, ARect,
    vCenter, -(Angle / 255) * 2 * PI);
end;

{ TShapeSingleArrow }


procedure TShapeSingleArrow.DrawShape(AOffset: TPoint; ACanvas: TCanvas);
begin
  inherited;
  ACanvas.MoveTo(FFromPoint.X + AOffset.X, FFromPoint.Y + AOffset.Y);
  ACanvas.LineTo(FToPoint.X + AOffset.X, FToPoint.Y + AOffset.Y);
  ACanvas.MoveTo(FToPoint.X + AOffset.X, FToPoint.Y + AOffset.Y);
  ACanvas.LineTo(FBonePointA.X + AOffset.X, FBonePointA.Y + AOffset.Y);
  ACanvas.MoveTo(FToPoint.X + AOffset.X, FToPoint.Y + AOffset.Y);
  ACanvas.LineTo(FBonePointB.X + AOffset.X, FBonePointB.Y + AOffset.Y);
end;

function TShapeSingleArrow.HotPoint(APoint: TPoint): Boolean;
begin
  Result := inherited HotPoint(APoint);
  if not Result then Exit;
  if Angle > 0 then
    APoint := RotatePoint(APoint, CenterPoint(FRect), -(Angle / 255) * 2 * PI);
  Result :=
    PtInLine(APoint, FFromPoint, FToPoint, Max(FPenWidth, cHotOffset)) or
    PtInLine(APoint, FToPoint, FBonePointA, Max(FPenWidth, cHotOffset)) or
    PtInLine(APoint, FToPoint, FBonePointB, Max(FPenWidth, cHotOffset));
end;

function TShapeSingleArrow.HotRect(ARect: TRect): Boolean;
var
  vCenter: TPoint;
begin
  Result := inherited HotRect(ARect);
  if not Result then Exit;
  vCenter := CenterPoint(FRect);
  if LineByRect(FFromPoint, FToPoint, ARect,
    @vCenter, -(Angle / 255) * 2 * PI) then Exit;
  if LineByRect(FBonePointA, FToPoint, ARect,
    @vCenter, -(Angle / 255) * 2 * PI) then Exit;
  if LineByRect(FBonePointB, FToPoint, ARect,
    @vCenter, -(Angle / 255) * 2 * PI) then Exit;
  Result := False;
end;

procedure TShapeSingleArrow.Offset(AOffset: TPoint);
begin
  inherited;
  FBonePointA.X := FBonePointA.X + AOffset.X;
  FBonePointA.Y := FBonePointA.Y + AOffset.Y;
  FBonePointB.X := FBonePointB.X + AOffset.X;
  FBonePointB.Y := FBonePointB.Y + AOffset.Y;
end;

procedure TShapeSingleArrow.UpdateRect;
var
  vAngle: Double;
  R: Double;
begin
  inherited;

  R := FBoneLengthBase + FPenWidth * FBoneLengthRate; // �����ͷ��ĳ���
  vAngle := PointToAngle(FFromPoint, FToPoint); // ����ĽǶ�
  FBonePointA.X := Trunc(Cos(vAngle + FBoneAngle) * R) + FToPoint.X;
  FBonePointA.Y := Trunc(Sin(vAngle + FBoneAngle) * R) + FToPoint.Y;
  FBonePointB.X := Trunc(Cos(vAngle - FBoneAngle) * R) + FToPoint.X;
  FBonePointB.Y := Trunc(Sin(vAngle - FBoneAngle) * R) + FToPoint.Y;
end;

{ TCustomShapeArrow }

function TCustomShapeArrow.AnchorResize(AIndex: Integer; ACenter,
  APoint: TPoint): Boolean;
begin
  if Angle > 0 then
  begin
    FFromPoint := RotatePoint(FFromPoint, CenterPoint(FRect), (Angle / 255) * 2 * PI);
    FToPoint := RotatePoint(FToPoint, CenterPoint(FRect), (Angle / 255) * 2 * PI);
    Angle := 0;
  end;

  Result := False;
  case AIndex of
    1: FFromPoint := APoint;
    0: FToPoint := APoint;
  else Exit;
  end;
  UpdateRect;
  Result := True;
end;

constructor TCustomShapeArrow.Create;
begin
  inherited;
  FBoneAngle := 0.93 * Pi; // ��ͷ��ĽǶ� // PiΪ��λ // Ĭ��0.93
  FBoneLengthBase := 16; // ��ͷ��ĳ��� // Ĭ��16
  FBoneLengthRate := 4; // ��PenWidth�ı������� // Ĭ��Ϊ4
end;

procedure TCustomShapeArrow.DrawBox(AOffset: TPoint; ACanvas: TCanvas);
begin
end;

function TCustomShapeArrow.GetAnchorPoint(AIndex: Integer): TPoint;
begin
  case AIndex of
    0: Result := FToPoint;
    1: Result := FFromPoint;
  end;
end;

function TCustomShapeArrow.GetAnchorVisible(AIndex: Integer): Boolean;
begin
  case AIndex of
    0, 1: Result := True;
  else Result := False;
  end;
end;

{ TShapeDoubleArrow }

procedure TShapeDoubleArrow.DrawShape(AOffset: TPoint; ACanvas: TCanvas);
begin
  inherited;
  ACanvas.MoveTo(FFromPoint.X + AOffset.X, FFromPoint.Y + AOffset.Y);
  ACanvas.LineTo(FToPoint.X + AOffset.X, FToPoint.Y + AOffset.Y);
  ACanvas.MoveTo(FToPoint.X + AOffset.X, FToPoint.Y + AOffset.Y);
  ACanvas.LineTo(FBonePointA.X + AOffset.X, FBonePointA.Y + AOffset.Y);
  ACanvas.MoveTo(FToPoint.X + AOffset.X, FToPoint.Y + AOffset.Y);
  ACanvas.LineTo(FBonePointB.X + AOffset.X, FBonePointB.Y + AOffset.Y);
  ACanvas.MoveTo(FFromPoint.X + AOffset.X, FFromPoint.Y + AOffset.Y);
  ACanvas.LineTo(FBonePointC.X + AOffset.X, FBonePointC.Y + AOffset.Y);
  ACanvas.MoveTo(FFromPoint.X + AOffset.X, FFromPoint.Y + AOffset.Y);
  ACanvas.LineTo(FBonePointD.X + AOffset.X, FBonePointD.Y + AOffset.Y);
end;

function TShapeDoubleArrow.HotPoint(APoint: TPoint): Boolean;
begin
  Result := inherited HotPoint(APoint);
  if not Result then Exit;
  if Angle > 0 then
    APoint := RotatePoint(APoint, CenterPoint(FRect), -(Angle / 255) * 2 * PI);
  Result :=
    PtInLine(APoint, FFromPoint, FToPoint, Max(FPenWidth, cHotOffset)) or
    PtInLine(APoint, FToPoint, FBonePointA, Max(FPenWidth, cHotOffset)) or
    PtInLine(APoint, FToPoint, FBonePointB, Max(FPenWidth, cHotOffset)) or
    PtInLine(APoint, FFromPoint, FBonePointC, Max(FPenWidth, cHotOffset)) or
    PtInLine(APoint, FFromPoint, FBonePointD, Max(FPenWidth, cHotOffset));
end;

function TShapeDoubleArrow.HotRect(ARect: TRect): Boolean;
var
  vCenterPoint: TPoint;
  vCenter: PPoint;
begin
  Result := inherited HotRect(ARect);
  if not Result then Exit;
  if (Angle <> 0) and (not FModified) then
  begin
    vCenterPoint := CenterPoint(FRect);
    vCenter := @vCenterPoint;
  end else vCenter := nil;
  if LineByRect(FFromPoint, FToPoint, ARect,
    vCenter, -(Angle / 255) * 2 * PI) then Exit;
  if LineByRect(FBonePointA, FToPoint, ARect,
    vCenter, -(Angle / 255) * 2 * PI) then Exit;
  if LineByRect(FBonePointB, FToPoint, ARect,
    vCenter, -(Angle / 255) * 2 * PI) then Exit;
  if LineByRect(FBonePointC, FToPoint, ARect,
    vCenter, -(Angle / 255) * 2 * PI) then Exit;
  if LineByRect(FBonePointD, FToPoint, ARect,
    vCenter, -(Angle / 255) * 2 * PI) then Exit;
  Result := False;
end;

procedure TShapeDoubleArrow.Offset(AOffset: TPoint);
begin
  inherited;
  FBonePointA.X := FBonePointA.X + AOffset.X;
  FBonePointA.Y := FBonePointA.Y + AOffset.Y;
  FBonePointB.X := FBonePointB.X + AOffset.X;
  FBonePointB.Y := FBonePointB.Y + AOffset.Y;
  FBonePointC.X := FBonePointC.X + AOffset.X;
  FBonePointC.Y := FBonePointC.Y + AOffset.Y;
  FBonePointD.X := FBonePointD.X + AOffset.X;
  FBonePointD.Y := FBonePointD.Y + AOffset.Y;
end;

procedure TShapeDoubleArrow.UpdateRect;
var
  vAngle: Double;
  R: Double;
begin
  inherited;
  R := FBoneLengthBase + FPenWidth * FBoneLengthRate; // �����ͷ��ĳ���
  vAngle := PointToAngle(FFromPoint, FToPoint); // ����ĽǶ�
  FBonePointA.X := Trunc(Cos(vAngle + FBoneAngle) * R) + FToPoint.X;
  FBonePointA.Y := Trunc(Sin(vAngle + FBoneAngle) * R) + FToPoint.Y;
  FBonePointB.X := Trunc(Cos(vAngle - FBoneAngle) * R) + FToPoint.X;
  FBonePointB.Y := Trunc(Sin(vAngle - FBoneAngle) * R) + FToPoint.Y;

  vAngle := PointToAngle(FToPoint, FFromPoint); // ����ĽǶ�
  FBonePointC.X := Trunc(Cos(vAngle + FBoneAngle) * R) + FFromPoint.X;
  FBonePointC.Y := Trunc(Sin(vAngle + FBoneAngle) * R) + FFromPoint.Y;
  FBonePointD.X := Trunc(Cos(vAngle - FBoneAngle) * R) + FFromPoint.X;
  FBonePointD.Y := Trunc(Sin(vAngle - FBoneAngle) * R) + FFromPoint.Y;
end;

{ TShapeHollowRectangle }

procedure TShapeHollowRectangle.DrawShape(AOffset: TPoint;
  ACanvas: TCanvas);
var
  vRect: TRect;
begin
  inherited;
  vRect.TopLeft := FFromPoint;
  vRect.BottomRight := FToPoint;
  ACanvas.Rectangle(MoveRect(vRect, AOffset));
end;

function TShapeHollowRectangle.HotPoint(APoint: TPoint): Boolean;
begin
  Result := inherited HotPoint(APoint);
  if Selected or not Result then Exit;
  if Angle > 0 then
    APoint := RotatePoint(APoint, CenterPoint(FRect), -(Angle / 255) * 2 * PI);
  Result := not PtInRect(ZoomRect(FRect, -Max(FPenWidth, cHotOffset)), APoint);
end;

function TShapeHollowRectangle.HotRect(ARect: TRect): Boolean;
var
  vCenterPoint: TPoint;
  vCenter: PPoint;
begin
  Result := inherited HotRect(ARect);
  if not Result then Exit;
  if (Angle <> 0) and (not FModified) then
  begin
    vCenterPoint := CenterPoint(FRect);
    vCenter := @vCenterPoint;
  end else vCenter := nil;
  Result := not RectInRect(ARect, FRect, vCenter, -(Angle / 255) * 2 * PI);
end;

{ TShapeSolidRectangle }

procedure TShapeSolidRectangle.DrawShape(AOffset: TPoint;
  ACanvas: TCanvas);
var
  vRect: TRect;
begin
  inherited;
  vRect.TopLeft := FFromPoint;
  vRect.BottomRight := FToPoint;
  ACanvas.Brush.Color := FPenColor;
  ACanvas.Rectangle(MoveRect(vRect, AOffset));
end;

{ TShapeHollowEllipse }

procedure TShapeHollowEllipse.DrawShape(AOffset: TPoint; ACanvas: TCanvas);
var
  vRect: TRect;
begin
  inherited;
  vRect.TopLeft := FFromPoint;
  vRect.BottomRight := FToPoint;
  ACanvas.Ellipse(MoveRect(vRect, AOffset));
end;

function TShapeHollowEllipse.HotPoint(APoint: TPoint): Boolean;
begin
  Result := inherited HotPoint(APoint);
  if Selected or not Result then Exit;
  if Angle > 0 then
    APoint := RotatePoint(APoint, CenterPoint(FRect), -(Angle / 255) * 2 * PI);
  Result := PtInEllipse(APoint, FRect) and
    not PtInEllipse(APoint, ZoomRect(FRect, -Max(FPenWidth, cHotOffset)));
end;

function TShapeHollowEllipse.HotRect(ARect: TRect): Boolean;
var
  vCenterPoint: TPoint;
  vCenter: PPoint;
begin
  Result := inherited HotRect(ARect);
  if not Result then Exit;
  if (Angle <> 0) and (not FModified) then
  begin
    vCenterPoint := CenterPoint(FRect);
    vCenter := @vCenterPoint;
  end else vCenter := nil;
  Result := EllipseInRect(FRect, ARect, vCenter, -(Angle / 255) * 2 * PI) or
    RectByEllipse(ARect, FRect, vCenter, -(Angle / 255) * 2 * PI);
end;

{ TShapeSolidEllipse }

procedure TShapeSolidEllipse.DrawShape(AOffset: TPoint; ACanvas: TCanvas);
var
  vRect: TRect;
begin
  inherited;
  vRect.TopLeft := FFromPoint;
  vRect.BottomRight := FToPoint;
  ACanvas.Brush.Color := FPenColor;
  ACanvas.Ellipse(MoveRect(vRect, AOffset));
end;

function TShapeSolidEllipse.HotPoint(APoint: TPoint): Boolean;
begin
  Result := inherited HotPoint(APoint);
  if Selected or not Result then Exit;
  if Angle > 0 then
    APoint := RotatePoint(APoint, CenterPoint(FRect), -(Angle / 255) * 2 * PI);
  Result := PtInEllipse(APoint, FRect);
end;

function TShapeSolidEllipse.HotRect(ARect: TRect): Boolean;
var
  vCenterPoint: TPoint;
  vCenter: PPoint;
begin
  Result := inherited HotRect(ARect);
  if not Result then Exit;
  if (Angle <> 0) and (not FModified) then
  begin
    vCenterPoint := CenterPoint(FRect);
    vCenter := @vCenterPoint;
  end else vCenter := nil;
  Result := EllipseInRect(FRect, ARect, vCenter, (Angle / 255) * 2 * PI) or
    RectByEllipse(ARect, FRect, vCenter, (Angle / 255) * 2 * PI) or
    RectInEllipse(ARect, FRect, vCenter, (Angle / 255) * 2 * PI);
end;

{ TCustomShapeText }

function TCustomShapeText.Accept: Boolean;
begin
  Result := Trim(FText) <> ''; // �ɼ�
end;

function TCustomShapeText.CanRedo: Boolean;
begin
  Result := vUndoText.CanRedo(Self);
end;

function TCustomShapeText.CanUndo: Boolean;
begin
  Result := vUndoText.CanUndo(Self);
end;

function TCustomShapeText.CopyToClipboard: Boolean;
begin
  if SelLength > 0 then
  begin
    Clipboard.AsText := SelText;
    Result := True;
  end else Result := False;
end;

constructor TCustomShapeText.Create;
begin
  inherited;
  FZoom := 1;
  FMaxLength := 500;                                                            //2007-05-28 ZswangY37 No.1
end;

function TCustomShapeText.CutToClipboard: Boolean;
begin
  if SelLength > 0 then
  begin
    Clipboard.AsText := SelText;
    if FModified then
    begin
      vUndoText.RecordUndo(Self, FText, FSelStart, FSelLength, FCaretFirst);
      SelText := '';
    end;
    Result := True;
  end else Result := False;
end;

function TCustomShapeText.Delete: Boolean;
begin
  Result := (FSelLength > 0) or (FSelStart < Length(FText));
  if FSelLength > 0 then
  begin
    vUndoText.RecordUndo(Self, FText, FSelStart, FSelLength, FCaretFirst);
    SelText := '';
  end else if Result then
  begin
    vUndoText.RecordUndo(Self, FText, FSelStart, FSelLength, FCaretFirst);
    if (FSelStart > 0) and (Copy(FText, FSelStart, 2) = #13#10) then
    begin
      Dec(FSelStart);
      FSelLength := 2;
    end else if Copy(FText, FSelStart + 1, 2) = #13#10 then
      FSelLength := 2
    else FSelLength := 1;
    SelText := ''
  end;
end;

procedure TCustomShapeText.DrawBox(AOffset: TPoint; ACanvas: TCanvas);
begin
  if FModified then inherited;
end;

procedure TCustomShapeText.DrawShape(AOffset: TPoint; ACanvas: TCanvas);
begin
  inherited;
  if FModified then // ���Ʊ༭�ı߿�
  begin
    ACanvas.Pen.Width := 1;
    ACanvas.Pen.Color := clBlack;
    ACanvas.Brush.Style := bsClear;
    ACanvas.Rectangle(ZoomRect(FRect, 2));
  end;
  ACanvas.Font.Name := FFontName;
  ACanvas.Font.Height := 14 + (FPenWidth - 1) * 2;
  ACanvas.Font.Color := FPenColor;
  ACanvas.Font.Style := [];
  if FModified then Exit;
  if FSelected then
    ACanvas.Font.Style := ACanvas.Font.Style + [fsUnderline];
  if FHighlight then
    ACanvas.Font.Style := ACanvas.Font.Style + [fsItalic];
end;

function TCustomShapeText.GetAnchorVisible(AIndex: Integer): Boolean;
begin
  Result := not Modified and (AIndex = 8);                                      //2007-08-13 ZswangY37 No.1 
end;

function TCustomShapeText.GetCaretPos: TPoint;
begin
  if FCaretFirst then
    Result := PosFromChar(FSelStart)
  else Result := PosFromChar(FSelStart + FSelLength);
end;

function TCustomShapeText.GetData(var AData: Pointer;
  var ASize: Integer): Boolean;
begin
  Result := False;
  if FText = '' then
  begin
    AData := nil;
    ASize := 0;
    Exit;
  end;
  ASize := SizeOf(TTextData) - SizeOf(WideChar) +
    SizeOf(WideChar) * Length(FText);
  GetMem(AData, ASize);
  PTextData(AData)^.rPoint.x := FPoint.X;
  PTextData(AData)^.rPoint.y := FPoint.Y;
  PTextData(AData)^.rCount := Length(FText);
  Move(FText[1], PTextData(AData)^.rChars[0], SizeOf(WideChar) * Length(FText));
  Result := True;
end;

function TCustomShapeText.GetResource(var AResource: Pointer;
  var ASize: Integer): Boolean;
begin
  Result := False;
  ASize := Length(FText) * SizeOf(WideChar);
  if ASize <= 0 then Exit;
  GetMem(AResource, ASize);
  Move(FText[1], AResource^, ASize);
  Result := True;
end;

function TCustomShapeText.GetSelText: WideString;
begin
  Result := Copy(FText, FSelStart + 1, FSelLength);
end;

function TCustomShapeText.GetTextChanged: Boolean;
begin
  Result := FText <> FOldText;
end;

function TCustomShapeText.KeyDown(var Key: Word;
  Shift: TShiftState): Boolean;
var
  vSelStart: Integer;
  vSelLength: Integer;
  vCaretFirst: Boolean;
  I, J: Integer;
  A, B: Integer;
begin
  Result := False;
  if ssAlt in Shift then Exit;
  vSelStart := FSelStart;
  vSelLength := FSelLength;
  vCaretFirst := FCaretFirst;
  case Key of
    VK_LEFT, VK_RIGHT, VK_HOME, VK_END:
      begin
        if FCaretFirst then
        begin
          A := FSelStart;
          B := FSelStart + FSelLength;
        end else
        begin
          A := FSelStart + FSelLength;
          B := FSelStart;
        end;
        case Key of
          VK_LEFT:
            begin
              Dec(A);
              if Copy(FText, A, 2) = #13#10 then
                Dec(A)
              else if ssCtrl in Shift then
              begin
                J := 0;
                for I := A downto 1 do
                  case FText[I] of
                    #33..#127: J := I - 1;
                  else if J <> 0 then Break;
                  end;
                A := J;
              end;
            end;
          VK_RIGHT:
            begin
              Inc(A);
              if Copy(FText, A, 2) = #13#10 then Inc(A);
              if ssCtrl in Shift then
              begin
                J := Length(FText);
                for I := A to Length(FText) do
                  case FText[I] of
                    #13: Break;
                    #33..#127:
                      if J < 0 then
                      begin
                        J := I - 1;
                        Break;
                      end else J := I;
                  else J := -Length(FText);
                  end;
                A := Abs(J);
              end;
            end;
          VK_HOME: A := 0;
          VK_END: A := Length(FText);
        end;
        if (A < 0) or (A > Length(FText)) then Exit;
        if ssShift in Shift then
          SelectText(B, A)
        else SelectText(A, A);
      end;
    VK_DELETE: // ɾ��
      if ([ssCtrl, ssShift, ssAlt] * Shift = []) and FModified then
        Result := Delete;                                                       //2007-11-19 ZswangY37 No.1
    VK_Z: // ��������
      if ssCtrl in Shift then
      begin
        Key := 0;
        if ssShift in Shift then
          Result := Redo()
        else Result := Undo();
      end;
    VK_A:
      if ssCtrl in Shift then
      begin
        Key := 0;
        Result := SelectAll;
      end;
    VK_V:
      if ssCtrl in Shift then
      begin
        Key := 0;
        Result := PasteFromClipboard;
      end;
    VK_C:
      if ssCtrl in Shift then
      begin
        Key := 0;                                                               //2007-05-22 ZswangY37 No.1
        Result := CopyToClipboard;
      end;
    VK_X:
      if ssCtrl in Shift then
      begin
        key := 0;
        Result := CutToClipboard;
      end;
  end; // case Key of
  Result := Result or (vSelStart <> FSelStart) or (vSelLength <> FSelLength) or
    (vCaretFirst <> FCaretFirst);
end;

function TCustomShapeText.KeyPress(Char: WideChar): Boolean;
begin
  Result := False;
  if not Modified then Exit;
  Result := True;
  case Char of
    #0..#7, #9..#12, #14..#27, #128..#255: Result := False;
    #13:
      begin
        vUndoText.RecordUndo(Self, FText, FSelStart, FSelLength, FCaretFirst);
        SelText := #13#10;
      end;
    #8:
      begin
        if FSelLength > 0 then
        begin
          vUndoText.RecordUndo(Self, FText, FSelStart, FSelLength, FCaretFirst);
          SelText := ''
        end else if (FText <> '') or (FSelStart > 0) then
        begin
          vUndoText.RecordUndo(Self, FText, FSelStart, FSelLength, FCaretFirst);
          if Copy(FText, FSelStart - 1, 2) = #13#10 then                        //2006-12-09 ZswangY37 No.2
          begin
            System.Delete(FText, FSelStart - 1, 2);
            SelStart := FSelStart - 2;
          end else if Copy(FText, FSelStart, 2) = #13#10 then
          begin
            System.Delete(FText, FSelStart, 2);
            SelStart := FSelStart - 1;
          end else begin
            System.Delete(FText, FSelStart, 1);
            SelStart := FSelStart - 1;
          end;
        end;
      end;
  else
    begin
      vUndoText.RecordUndo(Self, FText, FSelStart, FSelLength, FCaretFirst);
      SelText := Char;
    end;
  end;
end;

function TCustomShapeText.KeyUp(var Key: Word; Shift: TShiftState): Boolean;
begin
  Result := False;
end;

function TCustomShapeText.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer): Boolean;
{$J+}
const vTickCount: DWORD = 0;
{$J-}
var
  vSelStart: Integer;
  vSelLength: Integer;
  vCaretFirst: Boolean;
  A, B: Integer;
begin
  Result := False;
  FDownChar := -1;
  if not (ssLeft in Shift) then Exit;
  vSelStart := FSelStart;
  vSelLength := FSelLength;
  vCaretFirst := FCaretFirst;

  A := CharFromPos(Classes.Point(X, Y));
  FDownChar := A;                                                               //2007-11-19 ZswangY37 No.3
  if GetTickCount - vTickCount <= GetDoubleClickTime then // ����˫��ѡ�е����
  begin
    if Length(FText) <= 0 then Exit;                                            //2007-11-19 ZswangY37 No.2
    A := Max(A, 1);
    if Pos(FText[A], cIdentText) <= 0 then Exit;
    B := A;
    while (A > 1) and (Pos(FText[A - 1], cIdentText) > 0) do Dec(A);
    B := B - A;
    while (B + A < Length(FText)) and (Pos(FText[B + A + 1], cIdentText) > 0) do
      Inc(B);
    SelectText(A - 1, A + B);
    vTickCount := 0;
    FDownChar := FSelStart + FSelLength;                                        //2007-11-19 ZswangY37 No.3
  end else
  begin
    SelStart := CharFromPos(Classes.Point(X, Y));
    FDownChar := FSelStart;
    SelLength := 0;
    vTickCount := GetTickCount;                
  end;
  Result := (vSelStart <> FSelStart) or (vSelLength <> FSelLength) or
    (vCaretFirst <> FCaretFirst);
end;

function TCustomShapeText.MouseMove(Shift: TShiftState; X, Y: Integer): Boolean;
var
  vSelStart: Integer;
  vSelLength: Integer;
  vCaretFirst: Boolean;
begin
  Result := False;
  if not (ssLeft in Shift) then Exit;
  vSelStart := FSelStart;
  vSelLength := FSelLength;
  vCaretFirst := FCaretFirst;
  SelectText(FDownChar, CharFromPos(Classes.Point(X, Y)));
  Result := (vSelStart <> FSelStart) or (vSelLength <> FSelLength) or
    (vCaretFirst <> FCaretFirst);
end;

function TCustomShapeText.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer): Boolean;
begin
  Result := False;
end;

procedure TCustomShapeText.Offset(AOffset: TPoint);
begin
  inherited;
  FPoint.X := FPoint.X + AOffset.X;
  FPoint.Y := FPoint.Y + AOffset.Y;
end;

function TCustomShapeText.PasteFromClipboard: Boolean;
begin
  if Clipboard.HasFormat(CF_TEXT) then
  begin
    vUndoText.RecordUndo(Self, FText, FSelStart, FSelLength, FCaretFirst);
    SelText := Clipboard.AsText;
    Result := True;
  end else Result := False;
end;

function TCustomShapeText.Redo: Boolean;
var
  vUndoTextInfo: PUndoTextInfo;
begin
  Result := False;
  vUndoTextInfo := vUndoText.ExecuteRedo(Self);
  if Assigned(vUndoTextInfo) then
  begin
    FText := vUndoTextInfo^.rText;
    FSelLength := vUndoTextInfo^.rSelLength;
    FSelStart := vUndoTextInfo^.rSelStart;
    FCaretFirst := vUndoTextInfo^.rCaretFirst;
    Result := True;
  end;
end;

function TCustomShapeText.SelectAll: Boolean;
begin
  Result := False;
  if FText = '' then Exit;
  FSelStart := 0;
  FSelLength := Length(FText);
  Result := True;
end;

procedure TCustomShapeText.SelectText(AStart, AEnd: Integer);
begin
  FCaretFirst := AStart > AEnd;
  SelStart := Min(AStart, AEnd);
  SelLength := Abs(AStart - AEnd);
end;

function TCustomShapeText.SetData(AData: Pointer; ASize: Integer): Boolean;
begin
  Result := False;
  if PTextData(AData)^.rCount <= 0 then Exit;
  FPoint.X := PTextData(AData)^.rPoint.x;
  FPoint.Y := PTextData(AData)^.rPoint.y;
  SetLength(FText, PTextData(AData)^.rCount);
  Move(PTextData(AData)^.rChars[0], FText[1], Length(FText) * SizeOf(WideChar));
  Result := True;
end;

procedure TCustomShapeText.SetMaxLength(const Value: Integer);
begin
  if FMaxLength = Value then Exit;
  FMaxLength := Value;
  if FMaxLength <> 0 then
  begin
    FText := Copy(FText, 1, FMaxLength);
    FSelStart := Max(Min(Length(FText), Value), 0);
    FSelLength := Max(0, Min(Length(FText) - FSelStart, FSelLength));
  end;
end;

function TCustomShapeText.SetResource(AResource: Pointer;
  ASize: Integer): Boolean;
begin
  Result := False;
  if ASize div 2 <= 0 then Exit;
  SetLength(FText, ASize div 2);
  Move(AResource^, FText[1], ASize);
  Result := True;
end;

procedure TCustomShapeText.SetSelLength(const Value: Integer);
begin
  if FSelLength = Value then Exit;
  FSelLength := Max(0, Min(Length(FText) - FSelStart, Value));
end;

procedure TCustomShapeText.SetSelStart(const Value: Integer);
begin
  if FSelStart = Value then Exit;
  FSelStart := Max(Min(Length(FText), Value), 0);
  FSelLength := Max(0, Min(Length(FText) - FSelStart, FSelLength));
end;

procedure TCustomShapeText.SetSelText(Value: WideString);
var                                          
  vText: WideString;
begin
  vText := FText;
  System.Delete(vText, FSelStart + 1, FSelLength);
  if (FMaxLength > 0) and (Length(vText) + Length(Value) > FMaxLength) then
    Value := '';
  Insert(Value, vText, FSelStart + 1);
  FText := vText;
  FSelLength := 0;
  if Value <> '' then SelStart := FSelStart + Length(Value);
end;

procedure TCustomShapeText.SetText(const Value: WideString);
begin
  FOldText := Value;
  if FText = Value then Exit;
  if FMaxLength > 0 then
    FText := Copy(Value, 1, FMaxLength)
  else FText := Value;
  FSelStart := 0;
  FSelLength := 0;
end;

function TCustomShapeText.Undo: Boolean;
var
  vUndoTextInfo: PUndoTextInfo;
begin
  Result := False;
  if (vUndoText.Editor = Self) and (vUndoText.UndoNumber = 0) then // ��һ�γ���
  begin
    vUndoText.RecordUndo(Self, FText, FSelStart, FSelLength, FCaretFirst);
    vUndoText.ExecuteUndo(Self);
  end;

  vUndoTextInfo := vUndoText.ExecuteUndo(Self);
  if Assigned(vUndoTextInfo) then
  begin
    FText := vUndoTextInfo^.rText;
    FSelLength := vUndoTextInfo^.rSelLength;
    FSelStart := vUndoTextInfo^.rSelStart;
    FCaretFirst := vUndoTextInfo^.rCaretFirst;
    Result := True;
  end;
end;

{ TShapeEdit }

function TShapeEdit.CharFromPos(APos: TPoint): Integer;
var
  I, J: Integer;
  vSize: TSize;
  vPoint: TPoint;
begin
  Result := 0;
  if (FText = '') or (FZoom = 0) then Exit;
  if APos.X - FPoint.X <= 0 then Exit;
  Result := Length(FText);

  with TControlCanvas.Create do try
    Handle := GetDC(0);
    Font.Name := FFontName;
    Font.Height := 14 + (FPenWidth - 1) * 2;

    if FZoom <> 1 then
    begin
      SetMapMode(Handle, MM_ANISOTROPIC);
      SetWindowExtEx(Handle, 500, 500, nil);
      SetViewportExtEx(Handle, Trunc(500 * FZoom), Trunc(500 * FZoom), nil);
    end;

    J := 0;
    for I := 1 to Length(FText) do
    begin
      GetTextExtentPoint32W(Handle, PWideChar(Copy(FText, 1, I)), I, vSize);
      vPoint := Classes.Point(vSize.cx, vSize.cy);
      LPtoDP(Handle, vPoint, 1);
      vPoint := Classes.Point(Trunc(vPoint.X / FZoom), Trunc(vPoint.Y / FZoom));

      if (APos.X - FPoint.X >= J) and (APos.X - FPoint.X < vPoint.X) then
      begin
        Result := I;
        if APos.X - FPoint.X < J + (vPoint.X - J) div 2 then
          Result := -Result;
        Break;
      end;
      J := vPoint.X;
    end;
  finally
    ReleaseDC(0, Handle);
    Free;
  end;

  Result := Abs(Result) - Ord(Result < 0);
end;


procedure TShapeEdit.DrawShape(AOffset: TPoint; ACanvas: TCanvas);
var
  vSelPos: TPoint;
  vText: WideString;
begin
  inherited;
  ACanvas.Font.Name := FFontName;

  ExtTextOutW(ACanvas.Handle, AOffset.X + FPoint.X, AOffset.Y + FPoint.Y,
    ETO_CLIPPED, nil,
    PWideChar(FText), Length(FText), nil); // �����Ի���

  ///////Begin ����ѡ������
  if FSelLength > 0 then
  begin
    vSelPos := PosFromChar(FSelStart);
    ACanvas.Font.Color := clHighlightText;
    ACanvas.Brush.Color := clHighlight;
    vText := SelText;
    ExtTextOutW(ACanvas.Handle, vSelPos.X, vSelPos.Y,
      ETO_CLIPPED, nil, PWideChar(vText), Length(vText), nil); // �����Ի���
  end;
  ///////End ����ѡ������
end;

function TShapeEdit.KeyPress(Char: WideChar): Boolean;
begin
  case Char of
    #13: Result := False;
  else Result := inherited KeyPress(Char);
  end;
end;

function TShapeEdit.KeyUp(var Key: Word; Shift: TShiftState): Boolean;
begin
  Result := False;
end;

function TShapeEdit.PosFromChar(AStart: Integer): TPoint;
var
  vSize: TSize;
  vText: WideString;
  vPoint: TPoint;
begin
  if (AStart <= 0) or (FZoom = 0) then
  begin
    Result := FPoint;
    Exit;
  end;
  if FText = '' then
    vText := '|'
  else vText := FText;
  with TControlCanvas.Create do try
    Handle := GetDC(0);
    Font.Name := FFontName;
    Font.Height := 14 + (FPenWidth - 1) * 2;
    if FZoom <> 1 then
    begin
      SetMapMode(Handle, MM_ANISOTROPIC);
      SetWindowExtEx(Handle, 500, 500, nil);
      SetViewportExtEx(Handle, Trunc(500 * FZoom), Trunc(500 * FZoom), nil);
    end;

    GetTextExtentPoint32W(
      Handle, PWideChar(Copy(vText, 1, AStart)), AStart, vSize);
    vPoint := Classes.Point(vSize.cx, vSize.cy);
    LPtoDP(Handle, vPoint, 1);
    
    Result.Y := FPoint.Y;
    Result.X := FPoint.X + Trunc(vPoint.X / FZoom);
  finally
    ReleaseDC(0, Handle);
    Free;
  end;
end;

procedure TShapeEdit.UpdateRect;
var
  vSize: TSize;
  vText: WideString;
  vPoint: TPoint;
begin
  inherited;
  if FZoom = 0 then Exit;
  FRect.Left := FPoint.X;
  FRect.Top := FPoint.Y;
  if FText = '' then
    vText := '|'
  else vText := FText;
  with TControlCanvas.Create do try
    Handle := GetDC(0);
    Font.Name := FFontName;
    Font.Height := 14 + (FPenWidth - 1) * 2;
    if FZoom <> 1 then
    begin
      SetMapMode(Handle, MM_ANISOTROPIC);
      SetWindowExtEx(Handle, 500, 500, nil);
      SetViewportExtEx(Handle, Trunc(500 * FZoom), Trunc(500 * FZoom), nil);
    end;
    GetTextExtentPoint32W(Handle, PWideChar(vText), Length(vText), vSize);
    vPoint := Classes.Point(vSize.cx, vSize.cy);
    LPtoDP(Handle, vPoint, 1);
    vPoint := Classes.Point(Trunc(vPoint.X / FZoom), Trunc(vPoint.Y / FZoom));

    FCaretHeight := vPoint.Y;
    FRect.Right := FRect.Left + vPoint.X;
    FRect.Bottom := FRect.Top + vPoint.Y;
  finally
    ReleaseDC(0, Handle);
    Free;
  end;
  InflateRect(FRect, Trunc(FPenWidth / 2 + 0.9), Trunc(FPenWidth / 2 + 0.9));
end;

{ TShapeMemo }

function TShapeMemo.CharFromPos(APos: TPoint): Integer;
var
  I, J, T: Integer;
  vSize: TSize;
  vLine: Integer;
  vText: WideString;
  vPoint: TPoint;
begin
  Result := 0;
  if FText = '' then Exit;
  if FZoom = 0 then Exit;
  if APos.X - FPoint.X <= 0 then Exit;
  if APos.Y - FPoint.Y < 0 then Exit;
  Result := Length(FText);
  vLine := (APos.Y - FPoint.Y) div FCaretHeight;
  if vLine >= FLines.Count then Exit;
  vText := FLines[vLine];
  Result := LineIndex(vLine);
  if vText = '' then Exit;
  with TControlCanvas.Create do try
    Handle := GetDC(0);
    Font.Name := FFontName;
    Font.Height := 14 + (FPenWidth - 1) * 2;
    if FZoom <> 1 then
    begin
      SetMapMode(Handle, MM_ANISOTROPIC);
      SetWindowExtEx(Handle, 500, 500, nil);
      SetViewportExtEx(Handle, Trunc(500 * FZoom), Trunc(500 * FZoom), nil);
    end;
    T := Length(vText);
    J := 0;
    for I := 1 to Length(vText) do
    begin
      GetTextExtentPoint32W(Handle, PWideChar(Copy(vText, 1, I)), I, vSize);
      vPoint := Classes.Point(vSize.cx, vSize.cy);
      LPtoDP(Handle, vPoint, 1);
      vPoint := Classes.Point(Trunc(vPoint.X / FZoom), Trunc(vPoint.Y / FZoom));
      if (APos.X - FPoint.X >= J) and (APos.X - FPoint.X < vPoint.X) then
      begin
        T := I;
        if APos.X - FPoint.X < J + (vPoint.X - J) div 2 then
          T := -T;
        Break;
      end;
      J := vPoint.X;
    end;
    T := Abs(T) - Ord(T < 0);
    Result := T + LineIndex(vLine);
  finally
    ReleaseDC(0, Handle);
    Free;
  end;
end;

constructor TShapeMemo.Create;
begin
  inherited;
  FLines := TStringList.Create;
  FMaxLength := cMemoMaxLength;
  FHasResource := True;
end;

destructor TShapeMemo.Destroy;
begin
  if Assigned(FLines) then FLines.Free;
  inherited;
end;


procedure TShapeMemo.DrawShape(AOffset: TPoint; ACanvas: TCanvas);
var
  vSelPos: TPoint;
  vLineStart, vLineEnd: Integer;
  I, J: Integer;
  vText: WideString;
begin
  inherited;
  ACanvas.Font.Name := FFontName;
  for I := 0 to FLines.Count - 1 do
  begin
    vText := FLines[I];
    if vText <> '' then
      ExtTextOutW(ACanvas.Handle, AOffset.X + FPoint.X,
        AOffset.Y + FPoint.Y + I * FCaretHeight,
        ETO_CLIPPED, nil, PWideChar(vText), Length(vText), nil); // �����Ի���
  end;
  ///////Begin ����ѡ������
  if FSelLength > 0 then
  begin
    ACanvas.Font.Color := clHighlightText;
    ACanvas.Brush.Color := clHighlight;

    vLineStart := LineFromChar(FSelStart);
    vLineEnd := LineFromChar(FSelStart + FSelLength);
    for I := vLineStart to vLineEnd do
    begin
      vText := FLines[I];
      if vLineStart = I then
      begin
        vSelPos := PosFromChar(FSelStart);
        if vLineStart = vLineEnd then // û�п���
          vText := SelText
        else System.Delete(vText, 1, FSelStart - LineIndex(I));
      end else
      begin
        J := LineIndex(I);
        vSelPos := PosFromChar(J);
        if vLineEnd = I then
        begin
          J := FSelStart + FSelLength - J;
          vText := Copy(vText, 1, J);
        end;
      end;
      ExtTextOutW(ACanvas.Handle, AOffset.X + vSelPos.X, AOffset.Y + vSelPos.Y,
        ETO_CLIPPED, nil, PWideChar(vText), Length(vText), nil); // �����Ի���
    end;
  end;
  ///////End ����ѡ������
end;

function TShapeMemo.GetData(var AData: Pointer;
  var ASize: Integer): Boolean;
begin
  Result := False;
  if FText = '' then
  begin
    AData := nil;
    ASize := 0;
    Exit;
  end;

  ASize := SizeOf(TMemoData);
  GetMem(AData, ASize);
  PMemoData(AData)^.rPoint.x := FPoint.X;
  PMemoData(AData)^.rPoint.y := FPoint.Y;
  PMemoData(AData)^.rResourceCrc32 := FResourceCrc32;
  PMemoData(AData)^.rResourceSize := FResourceSize;
  Result := True;
end;

function TShapeMemo.HotPoint(APoint: TPoint): Boolean;
var
  vLine: Integer;
begin
  Result := inherited HotPoint(APoint);
  if not Result or FModified or Selected then Exit;
  if Angle > 0 then
    APoint := RotatePoint(APoint, CenterPoint(FRect), -(Angle / 255) * 2 * PI);
  vLine := (APoint.Y - FPoint.Y) div FCaretHeight;
  if (vLine < 0) or (vLine >= FLines.Count) then Exit;
  Result := APoint.X - FPoint.X < Integer(FLines.Objects[vLine]);
end;

function TShapeMemo.HotRect(ARect: TRect): Boolean;
var
  I: Integer;
  vCenterPoint: TPoint;
  vCenter: PPoint;
begin
  Result := inherited HotRect(ARect);
  if not Result then Exit;
  if (Angle <> 0) and (not FModified) then
  begin
    vCenterPoint := CenterPoint(FRect);
    vCenter := @vCenterPoint;
  end else vCenter := nil;
  for I := 0 to FLines.Count - 1 do
    if RectByRect(Bounds(FPoint.X, FPoint.Y + I * FCaretHeight,
      Integer(FLines.Objects[I]), FCaretHeight), ARect, vCenter,
      -(Angle / 255) * 2 * PI) then Exit;
  Result := False;
end;

function TShapeMemo.KeyDown(var Key: Word; Shift: TShiftState): Boolean;
var
  vSelStart: Integer;
  vSelLength: Integer;
  vCaretFirst: Boolean;
  I, J: Integer;
  A, B: Integer;
begin
  Result := False;
  if ssAlt in Shift then Exit;

  case Key of
    VK_RETURN: if [ssCtrl] * Shift = [] then Key := 0; // �����ı����Ե��س�
    VK_UP, VK_DOWN, VK_HOME, VK_END:
      begin
        vSelStart := FSelStart;
        vSelLength := FSelLength;
        vCaretFirst := FCaretFirst;
        if FCaretFirst then
        begin
          A := FSelStart;
          B := FSelStart + FSelLength;
        end else
        begin
          A := FSelStart + FSelLength;
          B := FSelStart;
        end;
        case Key of
          VK_UP:
            begin
              I := LineFromChar(A);
              if I <= 0 then Exit;
              J := A - LineIndex(I);
              A := LineIndex(I - 1) + Min(J, Length(WideString(FLines[I - 1])));
            end;
          VK_DOWN:
            begin
              I := LineFromChar(A);
              if I >= FLines.Count - 1 then Exit;
              J := A - LineIndex(I);
              A := LineIndex(I + 1) + Min(J, Length(WideString(FLines[I + 1])));
            end;
          VK_HOME:
            begin
              if ssCtrl in Shift then
                A := 0
              else begin
                I := LineFromChar(A);
                A := LineIndex(I);
              end;
            end;
          VK_END:
            begin
              if ssCtrl in Shift then
                A := Length(FText)
              else begin
                I := LineFromChar(A);
                A := LineIndex(I) + Length(WideString(FLines[I]));
              end;
            end;
        end;

        if (A < 0) or (A > Length(FText)) then Exit;
        if ssShift in Shift then
          SelectText(B, A)
        else SelectText(A, A);
        Result := Result or (vSelStart <> FSelStart) or (vSelLength <> FSelLength) or
          (vCaretFirst <> FCaretFirst);
      end;
  else Result := inherited KeyDown(Key, Shift);
  end;
end;

function TShapeMemo.KeyUp(var Key: Word; Shift: TShiftState): Boolean;
begin
  Result := False;
end;

function TShapeMemo.LineFromChar(AStart: Integer): Integer;
begin
  Result := 0;
  if AStart <= 0 then Exit;
  if AStart > Length(FText) then
  begin
    Result := FLines.Count - 1;
    Exit;
  end;
  Result := ListCount(Copy(FText, 1, AStart), #13#10) - 1;
end;

function TShapeMemo.LineIndex(ALine: Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  if ALine <= 0 then Exit;
  for I := 1 to Min(ALine, FLines.Count - 1) do
    Inc(Result, Length(WideString(FLines[I - 1] + #13#10)));
end;

function TShapeMemo.PosFromChar(AStart: Integer): TPoint;
var
  vSize: TSize;
  vText: WideString;
  I: Integer;
  vPoint: TPoint;
begin
  Result := FPoint;
  if FZoom = 0 then Exit;
  if AStart <= 0 then Exit;
  if FLines.Count < 0 then Exit;
  with TControlCanvas.Create do try
    Handle := GetDC(0);
    Font.Name := FFontName;
    Font.Height := 14 + (FPenWidth - 1) * 2;
    if FZoom <> 1 then
    begin
      SetMapMode(Handle, MM_ANISOTROPIC);
      SetWindowExtEx(Handle, 500, 500, nil);
      SetViewportExtEx(Handle, Trunc(500 * FZoom), Trunc(500 * FZoom), nil);
    end;
    I := LineFromChar(AStart);
    Result.Y := FPoint.Y + I * FCaretHeight;
    vText := FLines[I];
    if vText = '' then vText := '|';
    GetTextExtentPoint32W(Handle,
      PWideChar(Copy(vText, 1, AStart - LineIndex(I))), AStart - LineIndex(I), vSize);
    vPoint := Classes.Point(vSize.cx, vSize.cy);
    LPtoDP(Handle, vPoint, 1);
    vPoint := Classes.Point(Trunc(vPoint.X / FZoom), Trunc(vPoint.Y / FZoom));
    Result.X := FPoint.X + vPoint.X;
  finally
    ReleaseDC(0, Handle);
    Free;
  end;
end;

function TShapeMemo.SetData(AData: Pointer; ASize: Integer): Boolean;
begin
  Result := False;
  if PTextData(AData)^.rCount <= 0 then Exit;
  FPoint.X := PMemoData(AData)^.rPoint.x;
  FPoint.Y := PMemoData(AData)^.rPoint.y;
  FResourceCrc32 := PMemoData(AData)^.rResourceCrc32;
  FResourceSize := PMemoData(AData)^.rResourceSize;
  Result := True;
end;

procedure TShapeMemo.UpdateRect;
var
  vSize: TSize;
  vText: WideString;
  I: Integer;
  vPoint: TPoint;
begin
  inherited;
  if FZoom = 0 then Exit;
  FLines.Text := FText;
  if Copy(FText, Length(FText) - 1, MaxInt) = #13#10 then FLines.Add('');       //2006-12-09 ZswangY37 No.1
  FRect.Left := FPoint.X;
  FRect.Top := FPoint.Y;
  with TControlCanvas.Create do try
    Handle := GetDC(0);
    Font.Name := FFontName;
    Font.Height := 14 + (FPenWidth - 1) * 2;
    if FZoom <> 1 then
    begin
      SetMapMode(Handle, MM_ANISOTROPIC);
      SetWindowExtEx(Handle, 500, 500, nil);
      SetViewportExtEx(Handle, Trunc(500 * FZoom), Trunc(500 * FZoom), nil);
    end;
    FRect.Bottom := FRect.Top + 0;
    vText := '|';
    GetTextExtentPoint32W(Handle, PWideChar(vText), 1, vSize);
    vPoint := Classes.Point(vSize.cx, vSize.cy);
    LPtoDP(Handle, vPoint, 1);
    vPoint := Classes.Point(Trunc(vPoint.X / FZoom), Trunc(vPoint.Y / FZoom));

    FCaretHeight := vPoint.Y;
    FRect.Right := FRect.Left + vPoint.X;
    FRect.Bottom := FRect.Top + vPoint.Y;
    if FText = '' then Exit;
    FRect.Bottom := FRect.Top + FLines.Count * vPoint.Y;
    for I := 0 to FLines.Count - 1 do
    begin
      vText := FLines[I];
      if vText = '' then vText := '|';
      GetTextExtentPoint32W(Handle, PWideChar(vText), Length(vText), vSize);
      vPoint := Classes.Point(vSize.cx, vSize.cy);
      LPtoDP(Handle, vPoint, 1);
      vPoint := Classes.Point(Trunc(vPoint.X / FZoom), Trunc(vPoint.Y / FZoom));
      FLines.Objects[I] := TObject(vPoint.X);                                   //2006-12-13 ZswangY37 No.1
      if FRect.Right < FRect.Left + vPoint.X then
        FRect.Right := FRect.Left + vPoint.X;
    end;
  finally
    ReleaseDC(0, Handle);
    Free;
  end;

  InflateRect(FRect, Trunc(FPenWidth / 2 + 0.9), Trunc(FPenWidth / 2 + 0.9));
end;

{ TCustomShapeVector }

function TCustomShapeVector.Accept: Boolean;
begin
  Result := inherited Accept and (FModels.Count > 0);
end;   

procedure TCustomShapeVector.Clear;
var
  I, T: Integer;
  vShapeInfo: PVectorInfo;
begin
  for I := 0 to FModels.Count - 1 do
  begin
    vShapeInfo := FModels[I];
    with vShapeInfo^, rPolygon do
      case rType of
        vtLine..vtSolidEllipse:
          T := SizeOf(TPercentRect);
        else T := SizeOf(Word) + SizeOf(TPercentPoint) * rCount;
      end;
    Inc(T, SizeOf(TVectorType));
    FreeMem(vShapeInfo, T);
  end;
  FModels.Clear;
end;

constructor TCustomShapeVector.Create;
begin
  inherited;
  FModels := TList.Create;
end;

destructor TCustomShapeVector.Destroy;
begin
  Clear;
  if Assigned(FModels) then FModels.Free;
  inherited;
end;

function TCustomShapeVector.HotRect(ARect: TRect): Boolean;
var
  I, J: Integer;
  vShapeInfo: PVectorInfo;
  vPoints: array of TPoint;
  vRect: TRect;
  vTemp: TPoint;
  vRadialBegin: TPoint; // ��ʼ�뾶����
  vRadialEnd: TPoint; // �����뾶����
  vCenterPoint: TPoint;
  vCenter: PPoint;
  vAngle: Double;
begin
  Result := inherited HotRect(ARect);
  if not Result then Exit;
  if (Angle <> 0) and (not FModified) then
  begin
    vCenterPoint := CenterPoint(FRect);
    vCenter := @vCenterPoint;
  end else vCenter := nil;
  vAngle := -(Angle / 255) * 2 * PI;
  for I := 0 to FModels.Count - 1 do
  begin
    vShapeInfo := FModels[I];
    with vShapeInfo^, rRect, rPolygon, rChord, rRound, rBezier do
    begin
      case rType of
        vtLine..vtSolidEllipse:
          begin
            vRect.Left := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rFrom.X / 255));
            vRect.Top := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rFrom.Y / 255));
            vRect.Right := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rTo.X / 255));
            vRect.Bottom := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rTo.Y / 255));
            if rType <> vtLine then vRect := ReviseRect(vRect);
            case rType of
              vtLine: Result := LineByRect(vRect.TopLeft,
                vRect.BottomRight, ARect, vCenter, vAngle);
              vtHollowRectangle: Result :=
                RectByRect(vRect, ARect, vCenter, vAngle) and
                not RectInRect(ARect, vRect, vCenter, vAngle);
              vtSolidRectangle: Result :=
                RectByRect(vRect, ARect, vCenter, vAngle);
              vtHollowEllipse: Result :=
                EllipseInRect(vRect, ARect, vCenter, vAngle) or
                (RectByEllipse(ARect, vRect, vCenter, vAngle) and
                not RectInEllipse(ARect, vRect, vCenter, vAngle));
              vtSolidEllipse: Result :=
                EllipseInRect(vRect, ARect, vCenter, vAngle) or
                RectByEllipse(ARect, vRect, vCenter, vAngle);
            end;
          end;
        vtHollowPolygon, vtSolidPolygon, vtPolyline:
          begin
            if rCount <= 1 then Continue;
            SetLength(vPoints, rCount); // �����ʵ�Ķ����
            for J := 0 to rCount - 1 do
            begin
              vPoints[J].X := FFromPoint.X +
                Trunc((FToPoint.X - FFromPoint.X) * (rPoints[J].X / 255));
              vPoints[J].Y := FFromPoint.Y +
                Trunc((FToPoint.Y - FFromPoint.Y) * (rPoints[J].Y / 255));
            end;
            case rType of
              vtHollowPolygon: Result := RectByPolygon(ARect, vPoints, vCenter, vAngle) and
                not RectInPolygon(ARect, vPoints, vCenter, vAngle);
              vtSolidPolygon: Result := RectByPolygon(ARect, vPoints, vCenter, vAngle);
              vtPolyline: Result := RectByPolyline(ARect, vPoints, vCenter, vAngle);
            end;
            SetLength(vPoints, 0);
            vPoints := nil;
          end;
        vtHollowChord, vtSolidChord, vtArc:
          begin
            vRect.Left := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rTopLeft.X / 255));
            vRect.Right := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rBottomRight.X / 255));
            vRect.Top := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rTopLeft.Y / 255));
            vRect.Bottom := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rBottomRight.Y / 255));
            vRadialBegin.X := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rRadialBegin.X / 255));
            vRadialBegin.Y := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rRadialBegin.Y / 255));
            vRadialEnd.X := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rRadialEnd.X / 255));
            vRadialEnd.Y := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rRadialEnd.Y / 255));

            { DONE -c2006.12.12 -oZswangY37 : �о�����Բ����ת }
            if FFromPoint.X > FToPoint.X then
            begin
              vTemp := vRadialBegin;
              vRadialBegin := vRadialEnd;
              vRadialEnd := vTemp;
            end;
            if FFromPoint.Y > FToPoint.Y then
            begin
              vTemp := vRadialBegin;
              vRadialBegin := vRadialEnd;
              vRadialEnd := vTemp;
            end;
            case rType of
              vtHollowChord:
                Result := (ChordInRect(vRect, vRadialBegin, vRadialEnd, ARect,
                  vCenter, vAngle) or RectByChord(ARect, vRect, vRadialBegin,
                  vRadialEnd, vCenter, vAngle)) and
                  not RectInChord(ARect, vRect, vRadialBegin, vRadialEnd,
                  vCenter, vAngle);
              vtSolidChord:
                Result := ChordInRect(vRect, vRadialBegin, vRadialEnd, ARect,
                  vCenter, vAngle) or RectByChord(ARect, vRect, vRadialBegin,
                  vRadialEnd, vCenter, vAngle);
              vtArc:
                Result := ChordInRect(vRect, vRadialBegin, vRadialEnd, ARect,
                  vCenter, vAngle) or RectByChord(ARect, vRect, vRadialBegin,
                  vRadialEnd, vCenter, vAngle) and
                  not RectInEllipse(ARect, vRect, vCenter, vAngle);
            end;
          end;
        vtHollowRound, vtSolidRound:
          begin
            vRect.Left := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rTL.X / 255));
            vRect.Top := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rTL.Y / 255));
            vRect.Right := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rBR.X / 255));
            vRect.Bottom := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rBR.Y / 255));
            case rType of
              vtHollowRound:
                Result := RectByRound(ARect, vRect, Point(rRadial.X, rRadial.Y),
                  vCenter, vAngle) and
                  not RectInRound(ARect, vRect, Point(rRadial.X, rRadial.Y),
                  vCenter, vAngle);
              vtSolidRound:
                Result := RectByRound(ARect, vRect, Point(rRadial.X, rRadial.Y),
                  vCenter, vAngle);
            end;
          end;
        vtBezier:
          begin
            vRect.Left := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rStartPoint.X / 255));
            vRect.Top := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rStartPoint.Y / 255));
            vRect.Right := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rEndPoint.X / 255));
            vRect.Bottom := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rEndPoint.Y / 255));
            vRadialBegin.X := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rStartHelper.X / 255));
            vRadialBegin.Y := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rStartHelper.Y / 255));
            vRadialEnd.X := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rEndHelper.X / 255));
            vRadialEnd.Y := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rEndHelper.Y / 255));
            Result := RectByBezier(ARect, vRect.TopLeft, vRadialBegin, vRadialEnd, vRect.BottomRight, vCenter, vAngle);
          end;
      end; // case
    end; // with
    if Result then Exit;
  end; // for
end;

procedure TCustomShapeVector.DrawShape(AOffset: TPoint; ACanvas: TCanvas);
var
  I, J: Integer;
  vShapeInfo: PVectorInfo;
  vPoints: array of TPoint;
  vRect: TRect;
  vTemp: TPoint;
  vRadialBegin: TPoint; // ��ʼ�뾶����
  vRadialEnd: TPoint; // �����뾶����
begin
  inherited;
  for I := 0 to FModels.Count - 1 do
  begin
    vShapeInfo := FModels[I];
    with vShapeInfo^, rRect, rPolygon, rChord, rRound, rBezier do
    begin
      case rType of
        vtLine:
          begin
            ACanvas.MoveTo(
              AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rFrom.X / 255)),
              AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rFrom.Y / 255))
            );
            ACanvas.LineTo(
              AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rTo.X / 255)),
              AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rTo.Y / 255))
            );
          end;
        vtHollowRectangle..vtSolidEllipse:
          begin
            case rType of
              vtHollowRectangle, vtHollowEllipse: ACanvas.Brush.Style := bsClear;
              vtSolidRectangle, vtSolidEllipse: ACanvas.Brush.Color := ACanvas.Pen.Color;
            end;
            case rType of
              vtHollowRectangle, vtSolidRectangle:
                ACanvas.Rectangle(
                  AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rFrom.X / 255)),
                  AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rFrom.Y / 255)),
                  AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rTo.X / 255)),
                  AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rTo.Y / 255))
                );
              vtHollowEllipse, vtSolidEllipse:
                ACanvas.Ellipse(
                  AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rFrom.X / 255)),
                  AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rFrom.Y / 255)),
                  AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rTo.X / 255)),
                  AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rTo.Y / 255))
                );
            end;
          end;
        vtHollowPolygon, vtSolidPolygon, vtPolyline:
          begin
            SetLength(vPoints, rCount);
            for J := 0 to rCount - 1 do
            begin
              vPoints[J].X := AOffset.X + FFromPoint.X +
                Trunc((FToPoint.X - FFromPoint.X) * (rPoints[J].X / 255));
              vPoints[J].Y := AOffset.Y + FFromPoint.Y +
                Trunc((FToPoint.Y - FFromPoint.Y) * (rPoints[J].Y / 255));
            end;
            case rType of
              vtHollowPolygon:
                begin
                  ACanvas.Brush.Style := bsClear;
                  ACanvas.Polygon(vPoints);
                end;
              vtSolidPolygon:
                begin
                  ACanvas.Brush.Color := ACanvas.Pen.Color;
                  ACanvas.Polygon(vPoints);
                end;
              vtPolyline: ACanvas.Polyline(vPoints);
            end;
            SetLength(vPoints, 0);
            vPoints := nil;
          end;
        vtHollowChord, vtSolidChord, vtArc:
          begin
            vRect.Left := AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rTopLeft.X / 255));
            vRect.Top := AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rTopLeft.Y / 255));
            vRect.Right := AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rBottomRight.X / 255));
            vRect.Bottom := AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rBottomRight.Y / 255));
            vRadialBegin.X := AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rRadialBegin.X / 255));
            vRadialBegin.Y := AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rRadialBegin.Y / 255));
            vRadialEnd.X := AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rRadialEnd.X / 255));
            vRadialEnd.Y := AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rRadialEnd.Y / 255));

            { DONE -c2006.12.12 -oZswangY37 : �о�����Բ����ת }
            if FFromPoint.X > FToPoint.X then
            begin
              vTemp := vRadialBegin;
              vRadialBegin := vRadialEnd;
              vRadialEnd := vTemp;
            end;
            if FFromPoint.Y > FToPoint.Y then
            begin
              vTemp := vRadialBegin;
              vRadialBegin := vRadialEnd;
              vRadialEnd := vTemp;
            end;
            case rType of
              vtHollowChord:
                begin
                  ACanvas.Brush.Style := bsClear;
                  ACanvas.Chord(
                    vRect.Left, vRect.Top,
                    vRect.Right, vRect.Bottom,
                    vRadialBegin.X, vRadialBegin.Y,
                    vRadialEnd.X, vRadialEnd.Y
                  );
                end;
              vtSolidChord:
                begin
                  ACanvas.Brush.Color := ACanvas.Pen.Color;
                  ACanvas.Chord(
                    vRect.Left, vRect.Top,
                    vRect.Right, vRect.Bottom,
                    vRadialBegin.X, vRadialBegin.Y,
                    vRadialEnd.X, vRadialEnd.Y
                  );
                end;
              vtArc:
                begin
                  ACanvas.Brush.Style := bsClear;
                  ACanvas.Arc(
                    vRect.Left, vRect.Top,
                    vRect.Right, vRect.Bottom,
                    vRadialBegin.X, vRadialBegin.Y,
                    vRadialEnd.X, vRadialEnd.Y
                  );
                end;
            end;
          end;
        vtHollowRound, vtSolidRound:
          begin
            vRect.Left := AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rTL.X / 255));
            vRect.Top := AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rTL.Y / 255));
            vRect.Right := AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rBR.X / 255));
            vRect.Bottom := AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rBR.Y / 255));
            case rType of
              vtHollowRound: ACanvas.Brush.Style := bsClear;
              vtSolidRound: ACanvas.Brush.Color := ACanvas.Pen.Color;
            end;
            ACanvas.RoundRect(vRect.Left, vRect.Top, vRect.Right, vRect.Bottom,
              rRadial.X, rRadial.Y);
          end;
        vtBezier:
          begin
            vRect.Left := AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rStartPoint.X / 255));
            vRect.Top := AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rStartPoint.Y / 255));
            vRect.Right := AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rEndPoint.X / 255));
            vRect.Bottom := AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rEndPoint.Y / 255));
            vRadialBegin.X := AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rStartHelper.X / 255));
            vRadialBegin.Y := AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rStartHelper.Y / 255));
            vRadialEnd.X := AOffset.X + FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rEndHelper.X / 255));
            vRadialEnd.Y := AOffset.Y + FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rEndHelper.Y / 255));
            ACanvas.PolyBezier([vRect.TopLeft, vRadialBegin, vRadialEnd, vRect.BottomRight]);
          end;
      end; // case
    end; // with
  end; // for
end;

function TCustomShapeVector.GetModelText: string;
var
  vShapeInfo: PVectorInfo;
  I, J: Integer;
  S: string;
begin
  with TStringList.Create do try
    for I := 0 to FModels.Count - 1 do
    begin
      vShapeInfo := FModels[I];
      S := '';
      with vShapeInfo^, rRect, rPolygon, rChord do
        case rType of
          vtLine..vtSolidEllipse:
            S := Format('%s%d,%d-%d,%d', [cVectorShapeChar[rType],
              rFrom.X, rFrom.Y,
              rTo.X, rTo.Y
            ]);
          vtHollowPolygon..vtSolidPolygon:
            begin
              for J := 0 to rCount - 1 do
                S := Format('%s-%d,%d', [S,
                  rPoints[J].X, rPoints[J].Y,
                  rPoints[J].X, rPoints[J].Y
                ]);
              System.Delete(S, 1, 1);
              S := cVectorShapeChar[rType] + S;
            end;
          vtHollowChord, vtSolidChord:
            begin
              S := Format('%s%d,%d-%d,%d-%d,%d-%d,%d', [cVectorShapeChar[rType],
                rTopLeft.X, rTopLeft.Y,
                rBottomRight.X, rBottomRight.Y,
                rRadialBegin.X, rRadialBegin.Y,
                rRadialEnd.X, rRadialEnd.Y
              ]);
            end;
        end;
      if S <> '' then Add(S);
    end;
    Result := Text;
  finally
    Free;
  end;
end;

function TCustomShapeVector.GetData(var AData: Pointer;
  var ASize: Integer): Boolean;
var
  I, J, T: Integer;
  vShapeInfo: PVectorInfo;
  vRectData: TRectData;
begin
  Result := False;
  J := 0;
  for I := 0 to FModels.Count - 1 do
  begin
    vShapeInfo := FModels[I];
    with vShapeInfo^, rPolygon do
      case rType of
        vtLine..vtSolidEllipse:
          T := SizeOf(TPercentRect);
        vtHollowPolygon, vtSolidPolygon, vtPolyline:
          T := SizeOf(Word) + SizeOf(TPercentPoint) * rCount;
        vtHollowChord, vtSolidChord, vtArc:
          T := SizeOf(TPercentChord);
        vtHollowRound, vtSolidRound:
          T := SizeOf(TPercentRound);
        vtBezier:
          T := SizeOf(TPercentBezier);
      else T := 0;
      end;
    Inc(T, SizeOf(TVectorType));
    Inc(J, T);
  end;
  if J <= 0 then Exit;
  ASize := SizeOf(TRectData) + J;
  GetMem(AData, ASize);
  vRectData.rFromPoint.x := FFromPoint.X;
  vRectData.rFromPoint.y := FFromPoint.Y;
  vRectData.rToPoint.x := FToPoint.X;
  vRectData.rToPoint.y := FToPoint.Y;
  J := 0;
  T := SizeOf(TRectData);
  Move(vRectData, Pointer(Integer(AData) + J)^, T);
  Inc(J, T);
  for I := 0 to FModels.Count - 1 do
  begin
    vShapeInfo := FModels[I];
    with vShapeInfo^, rPolygon do
      case rType of
        vtLine..vtSolidEllipse:
          T := SizeOf(TPercentRect);
        vtHollowPolygon, vtSolidPolygon, vtPolyline:
          T := SizeOf(Word) + SizeOf(TPercentPoint) * rCount;
        vtHollowChord, vtSolidChord, vtArc:
          T := SizeOf(TPercentChord);
        vtHollowRound, vtSolidRound:
          T := SizeOf(TPercentRound);
        vtBezier:
          T := SizeOf(TPercentBezier);
      else T := 0;
      end;
    Inc(T, SizeOf(TVectorType));
    Move(vShapeInfo^, Pointer(Integer(AData) + J)^, T);
    Inc(J, T);
  end;
  Result := ASize > 0;
end;

function TCustomShapeVector.HotPoint(APoint: TPoint): Boolean;
var
  I, J: Integer;
  vShapeInfo: PVectorInfo;
  vPoints: array of TPoint;
  vRect: TRect;
  vTemp: TPoint;
  vRadialBegin: TPoint; // ��ʼ�뾶����
  vRadialEnd: TPoint; // �����뾶����
begin
  Result := inherited HotPoint(APoint);
  if not Result or Selected then Exit;
  if Angle > 0 then
    APoint := RotatePoint(APoint, CenterPoint(FRect), -(Angle / 255) * 2 * PI);
  for I := 0 to FModels.Count - 1 do
  begin
    vShapeInfo := FModels[I];
    with vShapeInfo^, rRect, rPolygon, rChord, rRound, rBezier do
    begin
      case rType of
        vtLine..vtSolidEllipse:
          begin
            vRect.Left := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rFrom.X / 255));
            vRect.Top := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rFrom.Y / 255));
            vRect.Right := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rTo.X / 255));
            vRect.Bottom := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rTo.Y / 255));
            if rType <> vtLine then vRect := ReviseRect(vRect);
            case rType of
              vtLine: Result := PtInLine(APoint,
                vRect.TopLeft, vRect.BottomRight, Max(FPenWidth, cHotOffset));
              vtHollowRectangle: Result := PtInRect(vRect, APoint) and
                not PtInRect(ZoomRect(vRect, -Max(FPenWidth, cHotOffset)), APoint);
              vtSolidRectangle: Result := PtInRect(vRect, APoint);
              vtHollowEllipse: Result := PtInEllipse(APoint, vRect) and
                not PtInEllipse(APoint, ZoomRect(vRect, -Max(FPenWidth, cHotOffset)));
              vtSolidEllipse: Result := PtInEllipse(APoint, vRect);
            end;
          end;
        vtHollowPolygon, vtSolidPolygon, vtPolyline:
          begin
            if rCount <= 1 then Continue;
            SetLength(vPoints, rCount);
            for J := 0 to rCount - 1 do
            begin
              vPoints[J].X := FFromPoint.X +
                Trunc((FToPoint.X - FFromPoint.X) * (rPoints[J].X / 255));
              vPoints[J].Y := FFromPoint.Y +
                Trunc((FToPoint.Y - FFromPoint.Y) * (rPoints[J].Y / 255));
            end;
            case rType of
              vtHollowPolygon:
                Result := PtInHollowPolygon(APoint, vPoints, Max(FPenWidth, cHotOffset));
              vtSolidPolygon:
                Result := PtInHollowPolygon(APoint, vPoints, Max(FPenWidth, cHotOffset)) or
                PtInPolygon(APoint, vPoints);
              vtPolyline: Result := PtInPolyline(APoint, vPoints, Max(FPenWidth, cHotOffset));
            end;
            SetLength(vPoints, 0);
            vPoints := nil;
          end;
        vtHollowChord, vtSolidChord, vtArc:
          begin
            vRect.Left := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rTopLeft.X / 255));
            vRect.Right := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rBottomRight.X / 255));
            vRect.Top := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rTopLeft.Y / 255));
            vRect.Bottom := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rBottomRight.Y / 255));
            vRadialBegin.X := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rRadialBegin.X / 255));
            vRadialBegin.Y := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rRadialBegin.Y / 255));
            vRadialEnd.X := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rRadialEnd.X / 255));
            vRadialEnd.Y := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rRadialEnd.Y / 255));

            { DONE -c2006.12.12 -oZswangY37 : �о�����Բ����ת }
            if FFromPoint.X > FToPoint.X then
            begin
              vTemp := vRadialBegin;
              vRadialBegin := vRadialEnd;
              vRadialEnd := vTemp;
            end;
            if FFromPoint.Y > FToPoint.Y then
            begin
              vTemp := vRadialBegin;
              vRadialBegin := vRadialEnd;
              vRadialEnd := vTemp;
            end;
            case rType of
              vtHollowChord:
                Result :=
                  PtInChordLine(APoint, vRect, vRadialBegin, vRadialEnd,
                  Max(FPenWidth, cHotOffset)) or
                  PtInChord(APoint, vRect, vRadialBegin, vRadialEnd) and
                  not PtInEllipse(APoint,
                  ZoomRect(ReviseRect(vRect), -Max(FPenWidth, cHotOffset)));
              vtSolidChord:
                Result := PtInChord(APoint, vRect, vRadialBegin, vRadialEnd);
              vtArc:
                Result := PtInChord(APoint, vRect, vRadialBegin, vRadialEnd) and
                  not PtInEllipse(APoint,
                  ZoomRect(ReviseRect(vRect), -Max(FPenWidth, cHotOffset)));
            end;
          end;
        vtHollowRound, vtSolidRound:
          begin
            vRect.Left := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rTL.X / 255));
            vRect.Top := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rTL.Y / 255));
            vRect.Right := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rBR.X / 255));
            vRect.Bottom := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rBR.Y / 255));
            vRect := ReviseRect(vRect);
            case rType of
              vtHollowRound:
                begin
                  Result := PtInRound(APoint, ZoomRect(vRect, Max(FPenWidth, cHotOffset)),
                    Point(rRadial.X, rRadial.Y)) and
                    not PtInRound(APoint, ZoomRect(vRect, -Max(FPenWidth, cHotOffset)),
                    Point(rRadial.X, rRadial.Y));
                end;
              vtSolidRound:
                begin
                  Result := PtInRound(APoint, ZoomRect(vRect, Max(FPenWidth, cHotOffset)),
                    Point(rRadial.X, rRadial.Y));
                end;
            end;
          end;
        vtBezier:
          begin
            vRect.Left := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rStartPoint.X / 255));
            vRect.Top := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rStartPoint.Y / 255));
            vRect.Right := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rEndPoint.X / 255));
            vRect.Bottom := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rEndPoint.Y / 255));
            vRadialBegin.X := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rStartHelper.X / 255));
            vRadialBegin.Y := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rStartHelper.Y / 255));
            vRadialEnd.X := FFromPoint.X + Round((FToPoint.X - FFromPoint.X) * (rEndHelper.X / 255));
            vRadialEnd.Y := FFromPoint.Y + Round((FToPoint.Y - FFromPoint.Y) * (rEndHelper.Y / 255));
            Result := PtInBezier(APoint, vRect.TopLeft, vRadialBegin, vRadialEnd, vRect.BottomRight, Max(FPenWidth, cHotOffset));
          end;
      end; // case
    end; // with
    if Result then Exit;
  end; // for
end;

procedure TCustomShapeVector.SetModelText(const Value: string);
var
  I, J: Integer;
  S: string;
  vShapeInfo: PVectorInfo;
  vCount: Integer;
begin
  Clear;
  with TStringList.Create do try
    Text := StringReplace(Value, ';', #13#10, [rfReplaceAll]);
    for I := 0 to Count - 1 do
    begin
      S := Strings[I];
      if S = '' then Continue;
      case S[1] of
        'L', 'r', 'R', 'e', 'E':
          begin
            GetMem(vShapeInfo, SizeOf(TVectorType) + SizeOf(TPercentRect));
            FModels.Add(vShapeInfo);
            vShapeInfo^.rType := TVectorType(Pos(S[1], cVectorShapeChar) - 1);
            System.Delete(S, 1, 1);
            vShapeInfo^.rRect.rFrom.X := Trunc(
              StrToIntDef(ListValue(ListValue(S, 0, '-'), 0), 0));
            vShapeInfo^.rRect.rFrom.Y := Trunc(
              StrToIntDef(ListValue(ListValue(S, 0, '-'), 1), 0));
            vShapeInfo^.rRect.rTo.X := Trunc(
              StrToIntDef(ListValue(ListValue(S, 1, '-'), 0), 0));
            vShapeInfo^.rRect.rTo.Y := Trunc(
              StrToIntDef(ListValue(ListValue(S, 1, '-'), 1), 0));
          end;
        'p', 'P', 'V':
          begin
            vCount := ListCount(S, '-');
            if vCount <= 0 then Exit;
            GetMem(vShapeInfo, SizeOf(TVectorType) + SizeOf(Word) +
              vCount * SizeOf(TPercentPoint));
            FModels.Add(vShapeInfo);
            vShapeInfo^.rType := TVectorType(Pos(S[1], cVectorShapeChar) - 1);
            vShapeInfo^.rPolygon.rCount := vCount;
            System.Delete(S, 1, 1);
            for J := 0 to vCount - 1 do
            begin
              vShapeInfo^.rPolygon.rPoints[J].X := Trunc(
                StrToIntDef(ListValue(ListValue(S, J, '-'), 0), 0));
              vShapeInfo^.rPolygon.rPoints[J].Y := Trunc(
                StrToIntDef(ListValue(ListValue(S, J, '-'), 1), 0));
            end;
          end;
        'c', 'C', 'A':
          begin
            GetMem(vShapeInfo, SizeOf(TVectorType) + SizeOf(TPercentChord));
            FModels.Add(vShapeInfo);
            vShapeInfo^.rType := TVectorType(Pos(S[1], cVectorShapeChar) - 1);
            System.Delete(S, 1, 1);
            vShapeInfo^.rChord.rTopLeft.X := Trunc(
              StrToIntDef(ListValue(ListValue(S, 0, '-'), 0), 0));
            vShapeInfo^.rChord.rTopLeft.Y := Trunc(
              StrToIntDef(ListValue(ListValue(S, 0, '-'), 1), 0));
            vShapeInfo^.rChord.rBottomRight.X := Trunc(
              StrToIntDef(ListValue(ListValue(S, 1, '-'), 0), 0));
            vShapeInfo^.rChord.rBottomRight.Y := Trunc(
              StrToIntDef(ListValue(ListValue(S, 1, '-'), 1), 0));
            vShapeInfo^.rChord.rRadialBegin.X := Trunc(
              StrToIntDef(ListValue(ListValue(S, 2, '-'), 0), 0));
            vShapeInfo^.rChord.rRadialBegin.Y := Trunc(
              StrToIntDef(ListValue(ListValue(S, 2, '-'), 1), 0));
            vShapeInfo^.rChord.rRadialEnd.X := Trunc(
              StrToIntDef(ListValue(ListValue(S, 3, '-'), 0), 0));
            vShapeInfo^.rChord.rRadialEnd.Y := Trunc(
              StrToIntDef(ListValue(ListValue(S, 3, '-'), 1), 0));
          end;
        'o', 'O':
          begin
            GetMem(vShapeInfo, SizeOf(TVectorType) + SizeOf(TPercentRound));
            FModels.Add(vShapeInfo);
            vShapeInfo^.rType := TVectorType(Pos(S[1], cVectorShapeChar) - 1);
            System.Delete(S, 1, 1);
            vShapeInfo^.rRound.rTL.X := Trunc(
              StrToIntDef(ListValue(ListValue(S, 0, '-'), 0), 0));
            vShapeInfo^.rRound.rTL.Y := Trunc(
              StrToIntDef(ListValue(ListValue(S, 0, '-'), 1), 0));
            vShapeInfo^.rRound.rBR.X := Trunc(
              StrToIntDef(ListValue(ListValue(S, 1, '-'), 0), 0));
            vShapeInfo^.rRound.rBR.Y := Trunc(
              StrToIntDef(ListValue(ListValue(S, 1, '-'), 1), 0));
            vShapeInfo^.rRound.rRadial.X := Trunc(
              StrToIntDef(ListValue(ListValue(S, 2, '-'), 0), 0));
            vShapeInfo^.rRound.rRadial.Y := Trunc(
              StrToIntDef(ListValue(ListValue(S, 2, '-'), 1), 0));
          end;
        'B':
          begin
            GetMem(vShapeInfo, SizeOf(TVectorType) + SizeOf(TPercentBezier));
            FModels.Add(vShapeInfo);
            vShapeInfo^.rType := TVectorType(Pos(S[1], cVectorShapeChar) - 1);
            System.Delete(S, 1, 1);
            vShapeInfo^.rBezier.rStartPoint.X := Trunc(
              StrToIntDef(ListValue(ListValue(S, 0, '-'), 0), 0));
            vShapeInfo^.rBezier.rStartPoint.Y := Trunc(
              StrToIntDef(ListValue(ListValue(S, 0, '-'), 1), 0));
            vShapeInfo^.rBezier.rStartHelper.X := Trunc(
              StrToIntDef(ListValue(ListValue(S, 1, '-'), 0), 0));
            vShapeInfo^.rBezier.rStartHelper.Y := Trunc(
              StrToIntDef(ListValue(ListValue(S, 1, '-'), 1), 0));
            vShapeInfo^.rBezier.rEndHelper.X := Trunc(
              StrToIntDef(ListValue(ListValue(S, 2, '-'), 0), 0));
            vShapeInfo^.rBezier.rEndHelper.Y := Trunc(
              StrToIntDef(ListValue(ListValue(S, 2, '-'), 1), 0));
            vShapeInfo^.rBezier.rEndPoint.X := Trunc(
              StrToIntDef(ListValue(ListValue(S, 3, '-'), 0), 0));
            vShapeInfo^.rBezier.rEndPoint.Y := Trunc(
              StrToIntDef(ListValue(ListValue(S, 3, '-'), 1), 0));
          end;
      end;
    end;
  finally
    Free;
  end;
end;

function TCustomShapeVector.SetData(AData: Pointer; ASize: Integer): Boolean;
var
  I, T: Integer;
  vShapeInfo: PVectorInfo;
  vRectData: TRectData;
begin
  Result := False;
  Clear;
  T := SizeOf(TRectData);
  if ASize < T then Exit;
  I := 0;
  Move(PPointer(Integer(AData) + I)^, vRectData, T);
  Inc(I, T);
  FFromPoint.X := vRectData.rFromPoint.x;
  FFromPoint.Y := vRectData.rFromPoint.y;
  FToPoint.X := vRectData.rToPoint.x;
  FToPoint.Y := vRectData.rToPoint.y;
  while I < ASize do
  begin
    with PVectorInfo(Integer(AData) + I)^, rPolygon do
      case rType of
        vtLine..vtSolidEllipse:
          T := SizeOf(TPercentRect);
        vtHollowPolygon, vtSolidPolygon, vtPolyline:
          T := SizeOf(Word) + SizeOf(TPercentPoint) * rCount;
        vtHollowChord, vtSolidChord, vtArc:
          T := SizeOf(TPercentChord);
        vtHollowRound, vtSolidRound:
          T := SizeOf(TPercentRound);
        vtBezier:
          T := SizeOf(TPercentBezier);
      else T := 0;
      end;
    Inc(T, SizeOf(TVectorType));
    if I + T > ASize then Break;
    if T = 0 then Continue;
    GetMem(vShapeInfo, T);
    Move(PPointer(Integer(AData) + I)^, vShapeInfo^, T);
    Inc(I, T);
    FModels.Add(vShapeInfo);
  end;
  Result := True;
end;

function TCustomShapeVector.ModelSize: Integer;
var
  vShapeInfo: PVectorInfo;
  I: Integer;
begin
  Result := 0;
  for I := 0 to FModels.Count - 1 do
  begin
    vShapeInfo := FModels[I];
    with vShapeInfo^, rPolygon do
      case rType of
        vtLine..vtSolidEllipse:
          Inc(Result, SizeOf(TPercentRect));
        vtHollowPolygon, vtSolidPolygon, vtPolyline:
          Inc(Result, SizeOf(Word) + SizeOf(TPercentPoint) * rCount);
        vtHollowChord, vtSolidChord, vtArc:
          Inc(Result, SizeOf(TPercentChord));
        vtHollowRound, vtSolidRound:
          Inc(Result, SizeOf(TPercentRound));
        vtBezier:
          Inc(Result, SizeOf(TPercentBezier));
      end;
    Inc(Result, SizeOf(TVectorType));
  end;
end;

{ TUndoText }

function TUndoText.CanRedo(AEditor: TObject): Boolean;
begin
  Result := (AEditor = FEditor) and (FUndoNumber - 1 > 0) and
    (FUndos.Count > 0);
end;

function TUndoText.CanUndo(AEditor: TObject): Boolean;
begin
  Result := (AEditor = FEditor) and (FUndoNumber < FUndos.Count);
end;

procedure TUndoText.Clear;
var
  I: Integer;
begin
  for I := FUndos.Count - 1 downto 0 do
    Dispose(PUndoTextInfo(FUndos[I]));
  FUndos.Clear;
  FUndoNumber := 0;
end;

constructor TUndoText.Create;
begin
  inherited;
  FUndos := TList.Create;
  FMaxUndo := $16;
end;

destructor TUndoText.Destroy;
begin
  Clear;
  if Assigned(FUndos) then FUndos.Free;
  inherited;
end;

function TUndoText.ExecuteRedo(AEditor: TObject): PUndoTextInfo;
begin
  Result := nil;
  if AEditor <> FEditor then Exit;
  if FUndoNumber - 1 <= 0 then Exit;
  if FUndos.Count <= 0 then Exit;
  Dec(FUndoNumber);
  Result := FUndos[FUndos.Count - FUndoNumber];
end;

function TUndoText.ExecuteUndo(AEditor: TObject): PUndoTextInfo;
begin
  Result := nil;
  if AEditor <> FEditor then Exit;
  if FUndoNumber >= FUndos.Count then Exit;
  Inc(FUndoNumber);
  Result := FUndos[FUndos.Count - FUndoNumber];
end;

procedure TUndoText.RecordUndo(AEditor: TObject; AText: WideString; ASelStart,
  ASelLength: Integer; ACaretFirst: Boolean);
var
  vUndoTextInfo: PUndoTextInfo;
  I: Integer;
begin
  FEditor := AEditor;
  if FEditor <> AEditor then
    Clear
  else begin
    ///////Begin ɾ���������Ĳ���
    for I := FUndos.Count - 1 downto FUndos.Count - FUndoNumber do
    begin
      Dispose(PUndoTextInfo(FUndos[I]));
      FUndos.Delete(I);
    end;
    ///////End ɾ���������Ĳ���
    while FUndos.Count > FMaxUndo do
    begin
      Dispose(PUndoTextInfo(FUndos[0]));
      FUndos.Delete(0);
    end;
    FUndoNumber := 0;
  end;
  New(vUndoTextInfo);
  vUndoTextInfo^.rText := AText;
  vUndoTextInfo^.rSelStart := ASelStart;
  vUndoTextInfo^.rSelLength := ASelLength;
  vUndoTextInfo^.rCaretFirst := ACaretFirst;
  FUndos.Add(vUndoTextInfo);
end;

procedure FreeShapeFormats;
var
  I: Integer;
begin
  if not Assigned(vShapeFormats) then Exit;
  for I := vShapeFormats.Count - 1 downto 0 do
    Dispose(PShapeFormat(vShapeFormats[I]));
  vShapeFormats.Free;
  vShapeFormats := nil;
end;

procedure FreeUndoText;
begin
  if not Assigned(vUndoText) then Exit;
  vUndoText.Clear;
  vUndoText.Free;
  vUndoText := nil;
end;

procedure TUndoText.SetMaxUndo(const Value: Integer);
begin
  FMaxUndo := Value;
end;

{ TCustomShapeImage }

function TCustomShapeImage.Accept: Boolean;
begin
  Result := (FGraphicType <= High(cGraphicTypes)) and (FMemoryStream.Size > 0);
end;

constructor TCustomShapeImage.Create;
begin
  inherited;
  FHasResource := True;
  FMemoryStream := TMemoryStream.Create;
end;

destructor TCustomShapeImage.Destroy;
begin
  if Assigned(FMemoryStream) then FMemoryStream.Free;
  if Assigned(FGraphic) then FGraphic.Free;
  inherited;
end;

procedure TCustomShapeImage.DrawShape(AOffset: TPoint; ACanvas: TCanvas);
var
  vRect: TRect;
  S: WideString;
begin
  inherited;
  if not Assigned(FGraphic) and (FMemoryStream.Size > 0) then
  begin
    FGraphic := cGraphicTypes[FGraphicType].Create;
    FMemoryStream.Position := 0;
    FGraphic.LoadFromStream(FMemoryStream);
  end;
  vRect.TopLeft := FFromPoint;
  vRect.BottomRight := FToPoint;
  vRect := ReviseRect(vRect);
  OffsetRect(vRect, AOffset.X, AOffset.Y);

  if Assigned(FGraphic) then
    ACanvas.StretchDraw(vRect, FGraphic)
  else
  begin
    S := '[��Դ��Ч]';
    ACanvas.Brush.Color := clWindow;
    ACanvas.FillRect(vRect);
    ACanvas.Font.Assign(Screen.MenuFont);
    DrawTextW(ACanvas.Handle, PWideChar(S), Length(S), vRect,
      DT_SINGLELINE or DT_CENTER or DT_VCENTER);
  end;
end;

function TCustomShapeImage.GetData(var AData: Pointer;
  var ASize: Integer): Boolean;
begin
  ASize := SizeOf(TImageData);
  GetMem(AData, ASize);
  PImageData(AData)^.rType := FGraphicType;
  PImageData(AData)^.rRect.rFromPoint.X := FFromPoint.X;
  PImageData(AData)^.rRect.rFromPoint.Y := FFromPoint.Y;
  PImageData(AData)^.rRect.rToPoint.X := FToPoint.X;
  PImageData(AData)^.rRect.rToPoint.Y := FToPoint.Y;
  PImageData(AData)^.rResourceCrc32 := FResourceCrc32;
  PImageData(AData)^.rResourceSize := FResourceSize;
  Result := True;
end;

function TCustomShapeImage.GetResource(var AResource: Pointer;
  var ASize: Integer): Boolean;
begin
  ASize := FMemoryStream.Size;
  GetMem(AResource, ASize);
  FMemoryStream.Position := 0;
  FMemoryStream.Read(AResource^, ASize);
  Result := True;
end;

function TCustomShapeImage.PasteImage(APoint: TPoint;
  AGraphic: TGraphic): Boolean;
var
  I: Byte;
begin
  Result := False;
  FFromPoint := APoint;
  FToPoint := APoint;
  FMemoryStream.Clear;
  FGraphicType := $FF;
  if not Assigned(AGraphic) then Exit;
  for I := Low(cGraphicTypes) to High(cGraphicTypes) do
  begin
    if cGraphicTypes[I] = AGraphic.ClassType then
    begin
      FGraphicType := I;
      Break;
    end;
  end;
  if FGraphicType = $FF then Exit;
  FToPoint := Point(FFromPoint.X + AGraphic.Width,
    FFromPoint.Y + AGraphic.Height);
  AGraphic.SaveToStream(FMemoryStream);
  Result := True;
end;

function TCustomShapeImage.SetData(AData: Pointer;
  ASize: Integer): Boolean;
begin
  FGraphicType := PImageData(AData)^.rType;
  FFromPoint.X := PImageData(AData)^.rRect.rFromPoint.X;
  FFromPoint.Y := PImageData(AData)^.rRect.rFromPoint.Y;
  FToPoint.X := PImageData(AData)^.rRect.rToPoint.X;
  FToPoint.Y := PImageData(AData)^.rRect.rToPoint.Y;
  FResourceCrc32 := PImageData(AData)^.rResourceCrc32;
  FResourceSize := PImageData(AData)^.rResourceSize;
  if Assigned(FGraphic) then
  begin
    FGraphic.Free;
    FGraphic := nil;
  end;
  Result := True;
end;

function TCustomShapeImage.SetResource(AResource: Pointer;
  ASize: Integer): Boolean;
begin
  FMemoryStream.Clear;
  FMemoryStream.Write(AResource^, ASize);
  Result := True;
end;

procedure TCustomShapeImage.UpdateRect;
begin
  FRect.TopLeft := FFromPoint;
  FRect.BottomRight := FToPoint;
  FRect := ReviseRect(FRect);
  if not Visible and Assigned(FGraphic) then
  begin
    FGraphic.Free;
    FGraphic := nil;
  end;
end;

initialization
  vUndoText := TUndoText.Create;
  vShapeFormats := TList.Create;
  RegisterShape(stPen, smPoints, TShapePen, crPen);
  RegisterShape(stLine, smLine, TShapeLine, crLine);
  RegisterShape(stSingleArrow, smLine, TShapeSingleArrow, crSingleArrow);
  RegisterShape(stDoubleArrow, smLine, TShapeDoubleArrow, crDoubleArrow);
  RegisterShape(stHollowRectangle, smRect, TShapeHollowRectangle, crHollowRectangle);
  RegisterShape(stSolidRectangle, smRect, TShapeSolidRectangle, crSolidRectangle);
  RegisterShape(stHollowEllipse, smRect, TShapeHollowEllipse, crHollowEllipse);
  RegisterShape(stSolidEllipse, smRect, TShapeSolidEllipse, crSolidEllipse);
  RegisterShape(stEdit, smText, TShapeEdit, crIBeam);
  RegisterShape(stMemo, smText, TShapeMemo, crIBeam);
  RegisterShape(stVector, smVector, TShapeVector, crSelect);
  RegisterShape(stImage, smImage, TShapeImage, crDefault);

finalization
  FreeShapeFormats;
  FreeUndoText;

end.

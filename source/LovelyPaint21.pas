//2006-11-28 ZswangY37 No.1 增加 多选移动和删除,包括支持选择框多选
//2006-11-28 ZswangY37 No.2 增加 绘制时限制鼠标区域
//2006-11-30 ZswangY37 No.1 增加 输入文字的功能，目前只支持单行
//2006-11-30 ZswangY37 No.2 修正 载入时箭头标位置没有更新
//2006-12-01 ZswangY37 No.1 增加 命令处理方式
//2006-12-02 ZswangY37 No.1 优化 将Offset函数转换为Move
//2006-12-03 ZswangY37 No.1 增加 文本编辑框的复制和粘贴功能
//2006-12-04 ZswangY37 No.1 增加 命令导出导入机制
//2006-12-05 ZswangY37 No.1 增加 文本编辑框的撤销的功能
//2006-12-06~2006-12-08 Zswang No.1 升级 重新分离为LovelyPaint20和ShapeUtils单元
//2006-12-09 ZswangY37 No.1 完善 如果最后是#13#10则多加一行
//2006-12-09 ZswangY37 No.2 完善 如果向前删除的是#13#10则一起删除
//2006-12-10 ZswangY37 No.1 添加 半椭圆矢量图案
//2006-12-12 ZswangY37 No.1 完善 实现半椭圆区域的判断
//2006-12-14 ZswangY37 No.1 完善 实现多页控制
//2006-12-14 ZswangY37 No.2 完善 实现取消鼠标移动的功能
//2006-12-14 ZswangY37 No.3 添加 键盘微调移动图形
//2006-12-15 ZswangY37 No.1 添加 重新开始的命令
//2006-12-15 ZswangY37 No.2 添加 生成预览图的函数CommandToCanvas
//2006-12-15 ZswangY37 No.3 添加 背景和阴影颜色属性
//2006-12-18 ZswangY37 No.1 添加 光笔和标注控制
//2006-12-18 ZswangY37 No.2 修正 当键盘微调时出现窗体焦点切换后移动鼠标重新计算是否处于键盘微调中
//2006-12-19 ZswangY37 No.1 添加 相应的鼠标指针
//2006-12-19 ZswangY37 No.2 添加 跟随模式(不能修改和滚动)
//2006-12-20 ZswangY37 No.1 优化 优化绘制的速度，采用改变坐标系
//2006-12-24 ZswangY37 No.1 修正 大小改变后，滚动条需先计算后绘制
//2006-12-26 ZswangY37 No.1 优化 处理鼠标在画布区域之外的情况
//2006-12-26 ZswangY37 No.2 添加 自动适合高宽和大小的方法
//2006-12-26 ZswangY37 No.3 添加 适合方式的属性
//2006-12-26 ZswangY37 No.4 完善 绘制预览图的时候需要传入字体
//2006-12-29 ZswangY37 No.1 完善 判断窗体句柄是否有效
//2006-12-31 ZswangY37 No.1 添加 StreamToCommands、CommandsToStream函数
//2007-01-02 ZswangY37 No.1 完善 处理没有MouseDown的MouseMove事件（双击文件对话框的时候会出现）
//2007-01-05 ZswangY37 No.1 修正 文本图形没有初始化字体
//2007-02-04 ZswangY37 No.1 完善 鼠标按下时不处理滚动
//2007-02-05 ZswangY37 No.1 添加 禁止滚动EstopScorll的属性
//2007-03-14 ZswangY37 No.1 添加 文字颜色选项
//2007-03-14 ZswangY37 No.2 屏蔽 SelectPenColor改变文字的功能
//2007-03-20 ZswangY37 No.1 添加 文字大小选项
//2007-03-23 ZswangY37 No.1 完善 右键切换时让标签消失
//2007-03-31 ZswangY37 No.1 优化 UpdatePage()效率
//2007-04-03 ZswangY37 No.1 修正 参数未赋初值，导致调用时出现溢出
//2007-04-09 ZswangY37 No.1 修正 输入法字体显示不正确
//2007-04-09 ZswangY37 No.2 修正 输入法位置不正确
//2007-04-09 ZswangY37 No.3 修正 窗体热键会影响正常输入,DLGC_WANTCHARS
//2007-05-14 ZswangY37 No.1 优化 降低画笔图形的点数
//2007-05-14 ZswangY37 No.2 修正 笔刷绘制的分包的时候会出现断层的现象
//2007-05-17 ZswangY37 No.1 修正 文档关闭的功能
//2007-05-18 ZswangY37 No.1 增加 原点改变的事件
//2007-05-21 ZswangY37 No.1 修正 改变原点坐标未刷新
//2007-05-22 ZswangY37 No.1 完善 图形列表中对编辑中的图形不绘制
//2007-05-23 ZswangY37 No.1 修正 改变图形不用生成新Ident
//2007-05-23 ZswangY37 No.2 修正 粘贴后重新计算图形的位置
//2007-05-22 ZswangY37 No.3 修正 将滚轮的滚动范围缩小一些
//2007-05-24 ZswangY37 No.1 完善 设置原点后更新滚动条位置
//2007-05-24 ZswangY37 No.2 修正 按下Shift多选是界面没有刷新
//2007-05-24 ZswangY37 No.3 修正 放开鼠标后从新绘制一次，保证图形的层次关系
//2007-05-24 ZswangY37 No.4 完善 粘贴图形的时候让起始位置居可见范围的左上
//2007-05-26 ZswangY37 No.1 添加 图片半透明属性
//2007-05-29 ZswangY37 No.1 优化 OnOriginChange由SB_ENDSCROLL触发
//2007-05-30 ZswangY37 No.1 添加 RemoveLabel移出自己标签的方法
//2007-05-30 ZswangY37 No.2 添加 ClearLabel移出所有标签的方法
//2007-06-04 ZswangY37 No.1 完善 标注点右键的时候只切换方向
//2007-06-13 ZswangY37 No.1 整理 支持外部编辑消息
//2007-06-14 ZswangY37 No.1 完善 粘贴文字默认大小为字体大小
//2007-06-15 ZswangY37 No.1 完善 标签名太短时加上适当的空格
//2007-07-19 ZswangY37 No.1 优化 滚动的的显示，缩小的时候采用高质量整图滚动
//2007-08-02 ZswangY37 No.1 优化 加入HotRect()方法判断矩形是否选中图形
//2007-08-03 ZswangY37 No.1 优化 处理旋转角度绘制和选择情况
//2007-08-04 ZswangY37 No.1 优化 选中图像处理大小改变
//2007-08-13 ZswangY37 No.1 修正 改变大小或角度后无法撤销
//2007-08-13 ZswangY37 No.2 修正 鼠标按下状态禁止撤销
//2007-08-13 ZswangY37 No.3 修正 缩小翻页不更新底图 Bug#169
//2007-08-14 ZswangY37 No.1 修正 scChange执行无效，错误将命令标识当成了图形标识
//2007-08-14 ZswangY37 No.2 修正 微调位置无效，未调用KeyUp方法
//2007-08-23 ZswangY37 No.1 修正 滚动按钮滚动的时候次数会多三次，取消重载即可
//2007-08-23 ZswangY37 No.2 添加 选择矢量模板的功能
//2007-08-28 ZswangY37 No.1 完善 修改粘贴的图形位置的计算
//2007-08-28 ZswangY37 No.2 完善 光笔采用右键开关，左键为显示特效
//2007-08-29 ZswangY37 No.1 修正 由于添加边界显示导致的各种问题，包括Resize堆栈溢出，滚动条状态控制
//2007-08-29 ZswangY37 No.2 修正 绘制选中框后边框会出现闪烁，由于没有重新设置Pen.Mode导致
//2007-08-29 ZswangY37 No.3 修正 框选的时候没有计算边界
//2007-09-12 ZswangY37 No.1 修正 当最后一次撤销时会导致下标为-1
//2007-09-13 ZswangY37 No.1 完善 当背景图为位图时只通过Assign()赋值,另外需清空内存
//2007-09-17 ZswangY37 No.1 完善 绘制光笔点击效果并鼠标滚动时更新移动点图片
//2007-09-25 ZswangY37 No.1 添加 PageUp、PageDown、Home、End键的处理
//2007-10-08 ZswangY37 No.1 修正 当小图放大后会出现显示不全的情况
//2007-10-15 ZswangY37 No.1 修正 切换文档的时，光笔会失效的情况 Bug#191
//2007-10-15 ZswangY37 No.2 修正 光笔点下的效果，当切换文档的时候需关闭
//2007-10-24 ZswangY37 No.1 修正 更新光标时会导致其他编辑框中光标消失
//2007-10-25 ZswangY37 No.1 完善 不设置为24位色可能会导致2000和98机器上异常
//2007-11-14 ZswangY37 No.1 优化 如果比率未改变则不用重新绘制缩略图
//2007-11-19 ZswangY37 No.1 完善 关闭文档时将正编辑的内容提交
//2007-11-20 ZswangY37 No.1 修正 如果是在修改状态则不添加到图像列表中
//2007-11-23 ZswangY37 No.1 完善 将粘贴提交统一为ShapeAccpet中，方便处理资源
//2007-11-24 ZswangY37 No.1 完善 控制文本编辑鼠标指针的图案
//2007-11-25 ZswangY37 No.1 添加 支持资源方式处理大数据
//2007-11-26 ZswangY37 No.1 添加 支持复制粘贴资源
//2007-12-07 ZswangY37 No.1 完善 允许在绘制状态也可以粘贴
//2007-12-07 ZswangY37 No.2 完善 通知调用方滚动翻页或修改状态改变
//2007-12-07 ZswangY37 No.3 完善 边缘滚动5次才翻页，避免误操作
//2007-12-20 ZswangY37 No.1 修正 资源绘制，命名没有释放内存，导致内存泄露
//2011-04-02 ZswangY37 No.1 完善 添加截屏功能
//2011-04-03 ZswangY37 No.1 完善 能够保证图像列表和资源列表
//2011-04-03 ZswangY37 No.2 完善 增加感应边缘，放大时停留在边缘自动滚动
//2011-04-03 ZswangY37 No.3 修正 第一次粘贴两个资源型图形，撤销重复导致的异常，原因是通过资源id获取资源存在风险TResourceList.IndexFromIdent
//2011-04-03 ZswangY37 No.4 完善 粘贴时优先图片格式
{$R-}

unit LovelyPaint21;

interface

uses Windows, Messages, Classes, SysUtils, Graphics, Controls, Forms, Types,
  ExtCtrls, ShapeUtils21, CursorResource21, VectorSelectBoxUnit;

type
  TPaintFileHeader = packed record //luf文件头信息
    rFlag: array[0..2] of Char; // 标识 // pat
    rVersion: Byte; // 文件版本 // 1
    rData: array[0..0] of Char; // 数据块(资源区+图形区)
  end;

///////Begin 外部编辑消息
const
  LP_CANCOPY = WM_USER + $2101;
  LP_CANCUT = WM_USER + $2102;
  LP_CANSELECTALL = WM_USER + $2103;
  LP_CANDELETE = WM_USER + $2104;
  LP_CANPASTE = WM_USER + $2105;
  LP_CANUNDO = WM_USER + $2106;
  LP_CANREDO = WM_USER + $2107;

  LP_COPY = WM_USER + $1001;
  LP_CUT = WM_USER + $1002;
  LP_SELECTALL = WM_USER + $1003;
  LP_DELETE = WM_USER + $1004;
  LP_PASTE = WM_USER + $1005;
  LP_UNDO = WM_USER + $1006;
  LP_REDO = WM_USER + $1007;
///////End 外部编辑消息

type
  TShapeTools = (pstFollow, pstBrowse, pstPaint, pstModify, pstLabel, pstLaser, pstPhoto);
               //跟随       预览        绘制      修改状态  名字标注  光笔      截图
  TShapeCommand = (scClear, scPaint, scPaste, scMove, scDelete, scChange,
                 //清除     绘制     粘贴     移动    删除      图形改变
    scPenColor, scPenWidth, scTranslucency, scAngle, scReserve1, scReserve2, 
  //颜色改变    宽度改变    半透明          角度改变 预留1       预留2
    scReserve3, scReserve4, scReserve5, scReserve6, scReserve7, scResource,
  //预留3       预留4       预留5       预留6       预留7       扩展数据
    scRemove, scReplay, scClearLabel);
  //删除命令  重新开始  清除标签
  //--------------------------非记录命令

  TAdaptStyle = (asNone, asSize, asHeight, asWidth);
              //固定显示 适合大小 适合高度 适合宽度 
  TCommandInfo = packed record
    rIdent: Longword; // 控制号
    rType: TShapeCommand; // 命令类型
    rParamSize: Word; // 参数大小
    rParam: array[0..0] of Char; // 命令参数
  end;
  PCommandInfo = ^TCommandInfo;

  TPaintCommand = packed record // 绘制命令
    rShapeInfo: TShapeInfo; // 图形信息
  end;
  PPaintCommand = ^TPaintCommand;

  TPasteCommand = packed record // 粘贴命令
    rShapeInfos: array[0..0] of TShapeInfo; // 图形信息
  end;
  PPasteCommand = TPasteCommand;

  TOffsetCommand = packed record // 位移命令
    rPoint: TSmallPoint; // 位移坐标
    rCount: Word; // 移动的图形个数
    rIdents: array[0..0] of Longword; // 移动的图形Ident
  end;
  POffsetCommand = ^TOffsetCommand;
  TDeleteCommand = packed record // 删除命令
    rCount: Word; // 移动的图形个数
    rIdents: array[0..0] of Longword; // 移动的图形Ident
  end;
  PDeleteCommand = ^TDeleteCommand;
  TPenColorCommand = packed record // 改变颜色命令
    rColor: TColor; // 改变的颜色
    rCount: Word; // 移动的图形个数
    rIdents: array[0..0] of Longword; // 移动的图形Ident
  end;
  PPenColorCommand = ^TPenColorCommand;
  TPenWidthCommand = packed record // 改变宽度命令
    rWidth: Byte; // 改变的宽度
    rCount: Word; // 移动的图形个数
    rIdents: array[0..0] of Longword; // 移动的图形Ident
  end;
  PPenWidthCommand = ^TPenWidthCommand;

  TTranslucencyCommand = packed record // 改变宽度命令                          //2007-05-26 ZswangY37 No.1
    rTranslucency: Boolean; // 是否半透明
    rCount: Word; // 移动的图形个数
    rIdents: array[0..0] of Longword; // 移动的图形Ident
  end;
  PTranslucencyCommand = ^TTranslucencyCommand;

  TAngleCommand = packed record // 角度改变命令
    rAngle: Byte; // 旋转角度
    rCount: Word; // 移动的图形个数
    rIdents: array[0..0] of Longword; // 移动的图形Ident
  end;
  PAngleCommand = ^TAngleCommand;

  TResourceCommand = packed record // 扩展数据命令
    rResourceSize: Integer; // 数据总大小
    rResourceCrc32: Longword; // CRC校正码
    rBlockPostion: Integer; // 起始位置
    rBlockSize: Word; // 数据内容
    rBlockBuffer: array[0..0] of Char; // 数据块
  end;
  PResourceCommand = ^TResourceCommand;
  
  TLabelInfo = packed record // 标注信息
    rIdent: Word; // 标识
    rColor: TColor; // 颜色
    rStyle: Byte; // 显示风格
    rPoint: TSmallPoint; // 显示坐标
    rRemove: Boolean; // 是否移除
    rName: array[0..19] of WideChar; // 名字
  end;
  PLabelInfo = ^TLabelInfo;

  TLaserInfo = packed record // 激光信息
    rIdent: Word; // 标识
    rPoint: TSmallPoint; // 显示坐标
    rRemove: Boolean; // 是否移除
  end;
  PLaserInfo = ^TLaserInfo;

const
  cCommandInfoHeadSize = SizeOf(TCommandInfo) - SizeOf(Char);

type
  TDispatchType = (dtPageUp, dtPageDown, dtSelectTool, dtPhoto);

type
  TDispatchEvent = procedure(Sender: TObject; ADispatchType: TDispatchType; AParam: Integer) of object;
  TShapeCommandEvent = procedure(Sender: TObject; ACommand: Pointer; ASize: Integer) of object;
  TLabelChangeEvent = procedure(Sender: TObject; APoint: TPoint; ARemove: Boolean) of object;
  TLaserChangeEvent = procedure(Sender: TObject; APoint: TPoint; ARemove: Boolean) of object;

type
  TLabelList = class // 标签列表
  private
    FLabels: TList;
    FParasite: TList;
    procedure SetParasite(const Value: TList);
    function GetCount: Integer;
    function GetItems(AIndex: Integer): PLabelInfo;
  public
    property Count: Integer read GetCount;
    property Items[AIndex: Integer]: PLabelInfo read GetItems; default;
    property Parasite: TList read FParasite write SetParasite; // 寄生列表
    procedure Clear;
    function AcceptLabel(AIdent: Word; APoint: TPoint; AColor: TColor;
      AStyle: Byte; AName: WideString; ARemove: Boolean): Boolean;
    function RemoveLabel(AIdent: Word): Boolean; // 移除标注
    function FindLabel(AIdent: Word): Integer;
    constructor Create;
    destructor Destroy; override;
  end;

type
  TResourceList = class // 数据列表                                             //2007-11-25 ZswangY37 No.1
  private
    FResourceList: TList;
    FControlIdent: Word; // 控制ID
    FLastIdent: Word; // 当前ID生成的序号
    function GetItems(AIndex: Integer): PResourceInfo;
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    function SaveToStream(AStream: TStream): Boolean; // 保存到流中
    function LoadFromStream(AStream: TStream): Boolean; // 从流中载入
    //function IndexFromIdent(AIdent: Longword): Integer;                       //2011-04-03 ZswangY37 No.3
    function IndexFromCrc32(ACrc32: Longword; ASize: Integer): Integer;
    procedure Clear; // 清除全部数据
    procedure Delete(AIndex: Integer); // 删除一个数据
    function ReadStream(AStream: TStream; var AAppend: Boolean): Integer;
    function AcceptCommand( // 接受一条命令
      AResourceCommand: PResourceCommand // 数据命令
    ): Boolean; // 返回处理是否成功
    function NewResource(AData: Pointer; ASize: Integer): PResourceInfo;

    property Items[AIndex: Integer]: PResourceInfo read GetItems; default; // 每一条数据
    property Count: Integer read GetCount;
  end;

  TShapeList = class // 图形列表
  private
    FShapes: TList;
    FHighlightShape: TCustomShape;
    FControlIdent: Word;
    FLastIdent: Word;
    FZoom: Double;
    FFontName: TFontName;
    function GetItems(AIndex: Integer): TCustomShape;
    procedure SetHighlightShape(const Value: TCustomShape);
    function GetCount: Integer;
    procedure SetFontName(const Value: TFontName);
    procedure SetZoom(const Value: Double);
  public
    function IndexFromIdent(AIdent: Longword): Integer;
    function SaveToStream(AStream: TStream): Boolean; // 保存到流中
    function LoadFromStream(AStream: TStream; AResourceList: TResourceList): Boolean; // 从流中载入
    procedure SelectIdents(var AIdents: TIdents); // 获得选中的标识列表
    procedure ClearSelect; // 清除选择
    procedure DeleteSelect; // 删除选择项
    function SelectCount: Integer; // 选择的个数
    function SelectRect(ARect: TRect; ASelected: Boolean): Integer; // 从一格区域中选中图形 //返回改变了多少个图形
    function HotIndex(APoint: TPoint): Integer; // 返回坐标点上的图形
    function HotShape(APoint: TPoint): TCustomShape; // 返回坐标点上的图形
    function HotAnchor(APoint: TPoint; var AAnchorIndex: Integer; var AAnchorShape: TCustomShape): Boolean; // 计算锚点图形
    procedure Draw(AOffset: TPoint; ACanvas: TCanvas); // 绘制到画布上
    procedure DrawSelect(AOffset: TPoint; ACanvas: TCanvas; ASelected: Boolean); // 绘制选中的图像
    procedure Append(AShape: TCustomShape); // 添加一个图形
    function Add(AShapeType: TShapeType): TCustomShape; // 根据类型添加一个图形并返回
    procedure Delete(AShape: TCustomShape); overload; // 删除一个图形
    procedure Delete(AIndex: Integer); overload; // 删除一个图形
    procedure Offset(AOffset: TPoint); // 位移
    procedure SelectOffset(AOffset: TPoint); // 选中的位移
    procedure SelectPenColor(APenColor: TColor); // 选中项颜色改变
    procedure SelectPenWidth(APenWidth: Integer); // 选中项大小改变
    procedure SelectTranslucency(ATranslucency: Boolean); // 选中项半透明改变
    procedure SelectAngle(AAngle: Byte); // 选中项旋转
    procedure Clear; // 清除全部图像
    property Zoom: Double read FZoom write SetZoom;
    property FontName: TFontName read FFontName write SetFontName;

    property Count: Integer read GetCount;
    property Items[AIndex: Integer]: TCustomShape read GetItems; default; // 每一张图片
    property HighlightShape: TCustomShape read FHighlightShape write SetHighlightShape;

    constructor Create;
    destructor Destroy; override;
  end;

  TCommandList = class // 图形列表
  private
    FCommands: TList; // 命令列表
    FParasite: TList; // 命令列表为外部
    FControlIdent: Word; // 控制ID
    FLastIdent: Word; // 当前ID生成的序号
    function GetCount: Integer;
    function GetItems(Index: Integer): PCommandInfo;
    procedure SetParasite(const Value: TList);
  public
    procedure Clear; // 清除命令
    function ExecuteTo(AStepIndex: Integer; AShapeList: TShapeList;
      AResourceList: TResourceList): Boolean; // 执行到
    procedure AppendCommand(ACommandInfo: PCommandInfo); // 添加一条命令
    function ExecuteCommand(ACommandInfo: PCommandInfo; AShapeList: TShapeList;
      AResourceList: TResourceList): Boolean; // 执行一条命令
    procedure DeleteCommand(AIdent: Longword; AIsFree: Boolean = True); // 删除一条命令
    function AcceptCommand(ACommandInfo: PCommandInfo; AShapeList: TShapeList;
      AResourceList: TResourceList): PCommandInfo; // 接受一条命令

    function NewClearCommand: PCommandInfo; // 产生一个清除命令
    function NewPaintCommand(AShape: TCustomShape): PCommandInfo;
    function NewPasteCommand(AStream: TStream): PCommandInfo;
    function NewOffsetCommand(AOffset: TPoint; AIdents: array of Longword): PCommandInfo;
    function NewChangeCommand(AShape: TCustomShape): PCommandInfo;
    function NewDeleteCommand(AIdents: array of Longword): PCommandInfo;
    function NewPenColorCommand(APenColor: TColor; AIdents: array of Longword): PCommandInfo;
    function NewPenWidthCommand(APenWidth: Byte; AIdents: array of Longword): PCommandInfo;
    function NewTranslucencyCommand(ATranslucency: Boolean; AIdents: array of Longword): PCommandInfo;
    function NewAngleCommand(AAngle: Byte; AIdents: array of Longword): PCommandInfo;
    function NewResourceCommand(AResourceInfo: PResourceInfo; var ABlockPostion: Integer): PCommandInfo;

    function ExecuteClearCommand(ACommandInfo: PCommandInfo; AShapeList: TShapeList): Boolean;
    function ExecutePaintCommand(ACommandInfo: PCommandInfo; AShapeList: TShapeList; AResourceList: TResourceList): Boolean;
    function ExecutePasteCommand(ACommandInfo: PCommandInfo; AShapeList: TShapeList; AResourceList: TResourceList): Boolean;
    function ExecuteMoveCommand(ACommandInfo: PCommandInfo; AShapeList: TShapeList): Boolean;
    function ExecuteChangeCommand(ACommandInfo: PCommandInfo; AShapeList: TShapeList; AResourceList: TResourceList): Boolean;
    function ExecuteDeleteCommand(ACommandInfo: PCommandInfo; AShapeList: TShapeList): Boolean;
    function ExecutePenColorCommand(ACommandInfo: PCommandInfo; AShapeList: TShapeList): Boolean;
    function ExecutePenWidthCommand(ACommandInfo: PCommandInfo; AShapeList: TShapeList): Boolean;
    function ExecuteTranslucencyCommand(ACommandInfo: PCommandInfo; AShapeList: TShapeList): Boolean;
    function ExecuteAngleCommand(ACommandInfo: PCommandInfo; AShapeList: TShapeList): Boolean;
    function ExecuteResourceCommand(ACommandInfo: PCommandInfo; AResourceList: TResourceList): Boolean;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: PCommandInfo read GetItems; default;
    property Parasite: TList read FParasite write SetParasite; // 寄生列表

    constructor Create;
    destructor Destroy; override;
  end;

  TLovelyPaint21 = class(TCustomControl)
  private
    FShapeList: TShapeList; // 图形列表
    FCommandList: TCommandList; // 命令列表
    FCommandRedo: TCommandList; // 恢复命令
    FLabelList: TLabelList; // 标注列表

    FBackBitmap: TBitmap; // 底图,作为原始图

    FCurrentBitmap: TBitmap; // 当前图像
    FModifyShape: TCustomShape; // 预览图形

    FOrigin: TPoint; // 原点
    FZoom: Double; // 缩放比率

    FSelectPenWidth: Integer; // 当前选择的画笔宽度
    FSelectPenColor: TColor; // 当前选择的画笔颜色
    FSelectTools: TShapeTools; // 当前选择的工具
    FSelectShape: TShapeType; // 当前选择的图形
    FControlIdent: Word; // 控制ID
    FHasSelectRect: Boolean; // 是否有选择框
    FSelectRect: TRect; // 选取框
    FOnCommand: TShapeCommandEvent; // 命令触发事件
    FSelectModel: string; // 当前选择的矢量图模型
    FMouseDown: Boolean; // 鼠标是否按下
    FMovePoint: TPoint; // 偏移的参考坐标
    FDownPoint: TPoint; // 判断按下的点和放开的点是否同一位置
    FMouseMoving: Boolean; // 是否移动中
    FKeyMoving: Boolean; // 用键盘改变位置中
    FShadowColor: TColor; // 是否移动中
    FLabelStyle: Byte;
    FLabelColor: TColor;
    FFirstMouse: Boolean; // 第一次移动鼠标
    FLabelName: WideString;
    FLaserPoint: TPoint; // 激光笔的坐标
    FLaserActive: Boolean; // 激光是否激活
    FLaserGraphic: TGraphic;
    FOnLabelChange: TLabelChangeEvent;
    FOnLaserChange: TLaserChangeEvent;
    FOnDispatch: TDispatchEvent;
    FModelCursor: TCursor;

    FClientBitmap: TBitmap; // 客户层
    FShapeBitmap: TBitmap; // 图形层
    FPaintBitmap: TBitmap; // 绘制层
    FLaserBitmap: TBitmap; // 光笔层
    FMouseInBox: Boolean; // 鼠标是否在绘制区

    ///////Begin 历史画布坐标系
    FPrevMode: Integer;
    FWinOrig, FViewOrig: TPoint;
    FWinSize, FViewSize: TSize;
    ///////End 历史画布坐标系
    FUpdateing: Boolean; // 是否在更新中
    FAdaptStyle: TAdaptStyle; // 适合方式
    FOnZoom: TNotifyEvent;
    FEstopScorll: Boolean;
    FSelectTextColor: TColor;
    FSelectTextSize: Integer;
    FOnOriginChange: TNotifyEvent;
    FSelectTranslucency: Boolean;
    FZoomBitmap: TBitmap;

    FAnchorIndex: Integer;
    FAnchorShape: TCustomShape;
    FAnchoring: Boolean; // 调整大小或角度中
    FAnchorAngle: Byte; // 开始的角度
    FAnchorCenter: TPoint;
    FVectorShapePath: string;
    FFormVectorSelectBox: TFormVectorSelectBox; // 矢量图选择框

    FTimerLaser: TTimer; // 光笔动画的计时器
    FTimerScroll: TTimer; // 滚动计时器
    FLaserDownPoint: TPoint; // 光笔按下的地方
    FLaserDownCount: Integer; // 光笔按下的变化参数
    FBorder: TPoint; // 边线
    FBorderWidth: Integer; // 默认边线宽度
    FOldWidth: Integer;
    FOldHeight: Integer;
    FResourceList: TResourceList;
    FCanReangle: Boolean;
    FIsScreenPaint: Boolean;
    FPhotoRect: TRect; // 截屏区域
    FScrollOrigin: TPoint; // 滚动的偏移

    procedure SetControlIdent(const Value: Word);
    procedure SetSelectTranslucency(const Value: Boolean);
    procedure SetSelectPenColor(const Value: TColor);
    procedure SetSelectTextColor(const Value: TColor);
    procedure SetSelectPenWidth(const Value: Integer);
    procedure SetSelectTextSize(const Value: Integer);
    procedure SetSelectShape(const Value: TShapeType);
    procedure SetSelectTools(const Value: TShapeTools);
    procedure SetSelectModel(const Value: string); // 更新滚动条
    procedure SetZoom(Value: Double); // 缩放比率
    procedure AdjustScrollBars; // 重新计算滚动条布局
    procedure ShapeAccept;
    procedure ResourceAccept;
    procedure SetOrigin(Value: TPoint);
    procedure SetShadowColor(const Value: TColor); // 接受绘制的图形
    function PageWidth(mZoom: Double; mBorder: Boolean = False): Integer;       //2007-08-29 ZswangY37 No.1
    function PageHeight(mZoom: Double; mBorder: Boolean = False): Integer;      //2007-08-29 ZswangY37 No.1
    procedure SetLabelColor(const Value: TColor);
    procedure SetLabelName(const Value: WideString);
    procedure SetLaserPoint(const Value: TPoint);
    procedure SetLaserGraphic(const Value: TGraphic);
    procedure SetLaserActive(const Value: Boolean);
    procedure SetModelCursor(const Value: TCursor);

    procedure UpdateZoom; // 更新缩放

    procedure CanvasZoomBegin(ACanvas: TCanvas);
    procedure CanvasZoomEnd(ACanvas: TCanvas);
    procedure SetAdaptStyle(const Value: TAdaptStyle);
    procedure SetVectorShapePath(const Value: string);
    procedure TimerLaserTimer(Sender: TObject);
    procedure TimerScrollTimer(Sender: TObject);

    procedure SetBorderWidth(const Value: Integer);
    procedure SetCanReangle(const Value: Boolean);
  protected
    procedure LPCANCOPY(var Msg: TMessage); message LP_CANCOPY;
    procedure LPCANCUT(var Msg: TMessage); message LP_CANCUT;
    procedure LPCANSELECTALL(var Msg: TMessage); message LP_CANSELECTALL;
    procedure LPCANDELETE(var Msg: TMessage); message LP_CANDELETE;
    procedure LPCANPASTE(var Msg: TMessage); message LP_CANPASTE;
    procedure LPCANUNDO(var Msg: TMessage); message LP_CANUNDO;
    procedure LPCANREDO(var Msg: TMessage); message LP_CANREDO;

    procedure LPCOPY(var Msg: TMessage); message LP_COPY;
    procedure LPCUT(var Msg: TMessage); message LP_CUT;
    procedure LPSELECTALL(var Msg: TMessage); message LP_SELECTALL;
    procedure LPDELETE(var Msg: TMessage); message LP_DELETE;
    procedure LPPASTE(var Msg: TMessage); message LP_PASTE;
    procedure LPUNDO(var Msg: TMessage); message LP_UNDO;
    procedure LPREDO(var Msg: TMessage); message LP_REDO;

    function CanRedo: Boolean;
    function CanUndo: Boolean;
    function Redo: Boolean;
    function Undo: Boolean;
    function Delete: Boolean;

    procedure WMMouseWheel(var Message: TWMMouseWheel); message WM_MOUSEWHEEL;
    procedure DrawZoom; virtual; // 绘制缩略图
    procedure DrawBack; virtual;
    procedure DrawShape; virtual; // 绘制图形层
    procedure DrawCurrent; virtual; // 绘制当前的图像
    procedure DrawPaint; virtual;
    procedure PaintThis; virtual;
//    procedure PaintLaser; virtual; // 显示光笔

    procedure UpdateCaret; virtual; // 跟新输入光标
    procedure UpdateCursor; virtual; // 跟新鼠标指针
    procedure DoChange; virtual; // 触发改变
    procedure ClipCursor(ALock: Boolean); virtual; // 锁定鼠标区域

    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure CMWantSpecialKey(var Message: TCMWantSpecialKey); message CM_WANTSPECIALKEY;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
    procedure WMHScroll(var Message: TWMHScroll); message WM_HSCROLL;
    //procedure WMImeChar(var Msg: TMessage); message WM_IME_CHAR;
    procedure WMImeComposition(var Msg: TMessage); message WM_IME_COMPOSITION;
    procedure WMImeNotify(var Msg: TMessage); message WM_IME_NOTIFY;
    procedure WMChar(var Msg: TWMChar); message WM_CHAR;

    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure Paint; override;
    procedure Resize; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    procedure CreateParams(var Params: TCreateParams); override;
  public
    property BackBitmap: TBitmap read FBackBitmap;
    property LabelName: WideString read FLabelName write SetLabelName; // 标注名
    property LabelColor: TColor read FLabelColor write SetLabelColor; // 标注颜色
    property LabelStyle: Byte read FLabelStyle write FLabelStyle; // 标注风格 // 0 为左指向
    property LaserPoint: TPoint read FLaserPoint write SetLaserPoint; // 激光位置
    property LaserActive: Boolean read FLaserActive write SetLaserActive; // 激光是否激活
    property LaserGraphic: TGraphic read FLaserGraphic write SetLaserGraphic;
    property ShapeList: TShapeList read FShapeList;
    property IsScreenPaint: Boolean read FIsScreenPaint write FIsScreenPaint; // 是否屏幕画笔

    property ResourceList: TResourceList read FResourceList; // 资源列表
    property ControlIdent: Word read FControlIdent write SetControlIdent; // 控制ID
    procedure CutToClipboard; virtual; // 剪贴到剪贴板中
    procedure CopyToClipboard; virtual; // 复制到剪贴板中
    function PasteFromClipboard: Boolean; virtual; // 从剪贴板中粘贴 // 返回是否成功
    function PasteImage(APoint: TPoint; AGraphic: TGraphic): Boolean;
    function MouseToPoint(APoint: TPoint): TPoint; // 屏幕坐标转换成画布坐标
    function PointToMouse(APoint: TPoint): TPoint; //画布坐标转换成屏幕坐标
    function ExecuteTo(AIndex: Integer): Boolean; // 执行到
    procedure AcceptCommand(ACommand: Pointer; ASize: Integer); // 接受一条命令
    procedure AcceptLaser(APoint: TPoint; ARemove: Boolean); // 接受光笔的改变
    procedure AcceptLabel(AIdent: Word; APoint: TPoint; AColor: TColor;
      AStyle: Byte; AName: WideString; ARemove: Boolean); // 接收标注的改变
    function SaveToStream(AStream: TStream): Boolean; // 保存到流中
    function LoadFromStream(AStream: TStream): Boolean; // 从流中载入
    function SaveToFile(AFileName: TFileName): Boolean; // 保存到文件中
    function LoadFromFile(AFileName: TFileName): Boolean; // 从文件中载入
    procedure Clear; // 清除
    procedure Replay; // 重新开始
    procedure SelectAll; // 全选
    procedure FaceSize(AWidth, AHeight: Integer); // 改变画布大小
    procedure SetBackGraphic(AGraphic: TGraphic); // 设置背景图片
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ClearLabel(); // 清除所有标签                                     //2007-05-30 ZswangY37 No.2
    procedure RemoveLabel(); // 清除自己的标签                                  //2007-05-30 ZswangY37 No.1
    function IsTextInput(): Boolean; // 是否文字输入中

    procedure UpdatePage( // 跟新当前页
      AZoom: Double; // 缩放比率
      AOrigin: TPoint; // 原点
      ABackGraphic: TGraphic; // 底图
      ACommandList: TList; // 命令列表
      ACommandRedo: TList // 恢复命令
    );
    property Origin: TPoint read FOrigin write SetOrigin; // 原点

    procedure AdaptToWidth; // 适合宽度
    procedure AdaptToHeight; //适合高度
    procedure AdaptToSize; // 适合大小
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure Close;                                                            //2007-05-17 ZswangY37 No.1
    function SelectVectorShape: Boolean; // 返回选择矢量图模板是否成功          //2007-08-23 ZswangY37 No.2
  published
    property Align;
    property Color;
    property Font;
    property PopupMenu;
    property ShadowColor: TColor read FShadowColor write SetShadowColor; // 阴影颜色
    property ParentColor;
    property EstopScorll: Boolean read FEstopScorll write FEstopScorll; // 禁止滚动
    property Zoom: Double read FZoom write SetZoom; // 缩放比率
    property AdaptStyle: TAdaptStyle read FAdaptStyle write SetAdaptStyle;
    property SelectTools: TShapeTools read FSelectTools write SetSelectTools; // 选择的工具类型
    property SelectShape: TShapeType read FSelectShape write SetSelectShape; // 选择的图形类型
    property SelectPenColor: TColor read FSelectPenColor write SetSelectPenColor; // 选择的图形颜色
    property SelectTextColor: TColor read FSelectTextColor write SetSelectTextColor; // 选择的文字颜色
    property SelectPenWidth: Integer read FSelectPenWidth write SetSelectPenWidth; // 选择的线条宽度
    property SelectTextSize: Integer read FSelectTextSize write SetSelectTextSize; // 选择的文字大小
    property SelectModel: string read FSelectModel write SetSelectModel; // 矢量图模型
    property SelectTranslucency: Boolean read FSelectTranslucency write SetSelectTranslucency; // 是否采用半透明
    property CanReangle: Boolean read FCanReangle write SetCanReangle default True; // 是否能修改角度
    property ModelCursor: TCursor read FModelCursor write SetModelCursor; // 模型的光标
    property VectorShapePath: string read FVectorShapePath write SetVectorShapePath; // 矢量图的路径

    property OnCommand: TShapeCommandEvent read FOnCommand write FOnCommand; // 触发命名
    property OnLabelChange: TLabelChangeEvent read FOnLabelChange write FOnLabelChange; // 标注发生改变
    property OnLaserChange: TLaserChangeEvent read FOnLaserChange write FOnLaserChange; // 光笔发生改变
    property OnZoom: TNotifyEvent read FOnZoom write FOnZoom; // 缩放比率发生变化
                                                                                //2007-05-18 ZswangY37 No.1
    property OnOriginChange: TNotifyEvent read FOnOriginChange write FOnOriginChange; // 原点发生改变
    property OnDispatch: TDispatchEvent read FOnDispatch write FOnDispatch; // 派遣事件   
    property BorderWidth: Integer read FBorderWidth write SetBorderWidth;
  end;

function CommandsToCanvas(
  ACommands: TList;
  ACanvas: TCanvas;
  AFontName: string;                                                            //2006-12-26 ZswangY37 No.4
  AResrouceList: TResourceList = nil
): Boolean; // 将命令绘制到画布上

function FreeCommands(ACommands: TList): Boolean; // 清空并释放命令列表

function StreamToCommands(AStream: TStream; ASize: Integer; ACommands: TList): Integer; // 返回流中读取命令是否成功

function CommandsToStream(ACommands: TList; AStream: TStream): Integer; // 返回命令写到流中多少数据

procedure Register;

implementation

uses Math, Clipbrd, Imm, jpeg, CrcUtils21, CommonFunctions51, GraphicFunctions51;

//const cStretchStyle = STRETCH_ANDSCANS; // 中等效果
//const cStretchStyle = STRETCH_DELETESCANS; // 最差效果
//const cStretchStyle = STRETCH_HALFTONE; // 最佳效果

const cPageSpace = 3; // 页面的空隙
const cMinVectorSize = 42; // 适量图最小大小

var CF_SHAPES: Longword;
var CF_RESOURCES: Longword;

procedure Register;
begin
  RegisterComponents('Lovely20', [TLovelyPaint21]);
end;

function StreamToCommands(AStream: TStream; ASize: Integer; ACommands: TList): Integer; // 返回流中读取命令是否成功
var
  vSize: Integer;
  vCommandInfo: TCommandInfo;
  vCommand: PCommandInfo;
begin
  Result := 0;
  if not Assigned(AStream) or not Assigned(ACommands) then Exit;
  while Result + cCommandInfoHeadSize <= ASize do
  begin
    if cCommandInfoHeadSize <>
      AStream.Read(vCommandInfo, cCommandInfoHeadSize) then Break;
    vSize := cCommandInfoHeadSize + vCommandInfo.rParamSize;
    if Result + vSize > ASize then Break;
    AStream.Seek(-cCommandInfoHeadSize, soFromCurrent);
    GetMem(vCommand, vSize);
    if vSize <> AStream.Read(vCommand^, vSize) then
    begin
      FreeMem(vCommand, vSize);
      Break;
    end;
    ACommands.Add(vCommand);
    Inc(Result, cCommandInfoHeadSize + vCommandInfo.rParamSize);
  end;
end; { StreamToCommands }

function CommandsToStream(ACommands: TList; AStream: TStream): Integer; // 返回命令写到流中多少数据
var
  vCommand: PCommandInfo;
  vSize: Integer;
  I: Integer;
begin
  Result := 0;
  if not Assigned(AStream) or not Assigned(ACommands) then Exit;
  for I := 0 to ACommands.Count - 1 do
  begin
    vCommand := ACommands[I];
    vSize := cCommandInfoHeadSize + vCommand^.rParamSize;
    AStream.Write(vCommand^, vSize);
    Inc(Result, vSize);
  end;
end;

function FreeCommands(ACommands: TList): Boolean; // 清空并释放命令列表
var
  I: Integer;
  vCommandInfo: PCommandInfo;
begin
  Result := False;
  if not Assigned(ACommands) then Exit;
  for I := ACommands.Count - 1 downto 0 do
  begin
    vCommandInfo := ACommands[I];
    FreeMem(vCommandInfo, cCommandInfoHeadSize + vCommandInfo.rParamSize);
  end;
  ACommands.Clear;
end; { FreeCommands }

function CommandsToCanvas(
  ACommands: TList;
  ACanvas: TCanvas;
  AFontName: string;
  AResrouceList: TResourceList = nil
): Boolean; // 将命令绘制到画布上
var
  vShapeList: TShapeList;
  vCommandList: TCommandList;
  vResourceList: TResourceList;
begin                                                                           
  Result := False;
  if not Assigned(ACommands) then Exit;
  if not Assigned(ACanvas) then Exit;
  vShapeList := TShapeList.Create;
  vCommandList := TCommandList.Create;
  if Assigned(AResrouceList) then
    vResourceList := AResrouceList
  else vResourceList := TResourceList.Create;
  vShapeList.Zoom := 1;
  vShapeList.FontName := AFontName;
  try
    vCommandList.Parasite := ACommands;
    vCommandList.ExecuteTo(ACommands.Count - 1, vShapeList, vResourceList);
    vShapeList.Draw(Point(0, 0), ACanvas);
  finally
    if not Assigned(AResrouceList) then vResourceList.Free;
    vCommandList.Free;
    vShapeList.Free;
  end;
end; { CommandToShape }

{ TShapeList }

function TShapeList.Add(AShapeType: TShapeType): TCustomShape;
begin
  Result := NewShape(AShapeType);
  if not Assigned(Result) then Exit;
  Result.Ident := MakeLong(FLastIdent, FControlIdent);
  Inc(FLastIdent);
  FShapes.Add(Result);
end;

procedure TShapeList.Append(AShape: TCustomShape);
begin
  if FShapes.IndexOf(AShape) < 0 then
  begin
    AShape.Ident := MakeLong(FLastIdent, FControlIdent);
    FShapes.Add(AShape);
    Inc(FLastIdent);
  end;
end;

procedure TShapeList.Clear;
var
  I: Integer;
begin
  for I := FShapes.Count - 1 downto 0 do Delete(I);
end;

procedure TShapeList.ClearSelect;
var
  I: Integer;                                       
begin
  for I := 0 to FShapes.Count - 1 do TCustomShape(FShapes[I]).Selected := False;
end;

constructor TShapeList.Create;
begin
  inherited;
  FShapes := TList.Create;
end;

procedure TShapeList.Delete(AShape: TCustomShape);
begin
  Delete(FShapes.IndexOf(AShape));
end;

procedure TShapeList.Delete(AIndex: Integer);
begin
  if (AIndex < 0) or (AIndex >= FShapes.Count) then Exit;
  if FHighlightShape = TCustomShape(FShapes[AIndex]) then
    FHighlightShape := nil; // 清楚热点
  TCustomShape(FShapes[AIndex]).Free;
  FShapes.Delete(AIndex);
end;

procedure TShapeList.DeleteSelect;
var
  I: Integer;
begin
  for I := FShapes.Count - 1 downto 0 do
    if TCustomShape(FShapes[I]).Selected then Delete(I);
end;

destructor TShapeList.Destroy;
var
  I: Integer;
begin
  if Assigned(FShapes) then
  begin
    for I := 0 to FShapes.Count - 1 do
      TCustomShape(FShapes[I]).Free;
    FShapes.Free;
  end;
  inherited;
end;

procedure TShapeList.Draw(AOffset: TPoint; ACanvas: TCanvas);
var
  I: Integer;
begin
  for I := 0 to FShapes.Count - 1 do
    if TCustomShape(FShapes[I]).Visible and
      not TCustomShape(FShapes[I]).Modified then                                //2007-05-22 ZswangY37 No.1
        TCustomShape(FShapes[I]).Draw(AOffset, ACanvas);
end;

procedure TShapeList.DrawSelect(AOffset: TPoint; ACanvas: TCanvas;
  ASelected: Boolean);
var
  I: Integer;
begin
  for I := 0 to FShapes.Count - 1 do
    if TCustomShape(FShapes[I]).Visible and
      (TCustomShape(FShapes[I]).Selected = ASelected) then
      TCustomShape(FShapes[I]).Draw(AOffset, ACanvas);
end;

function TShapeList.GetCount: Integer;
begin
  Result := FShapes.Count;
end;

function TShapeList.GetItems(AIndex: Integer): TCustomShape;
begin
  if (AIndex >= 0) and (AIndex < FShapes.Count) then
    Result := FShapes[AIndex]
  else Result := nil;
end;

function TShapeList.HotAnchor(APoint: TPoint; var AAnchorIndex: Integer;
  var AAnchorShape: TCustomShape): Boolean;
var
  I: Integer;
  J: Integer;
begin
  Result := False;
  for I := FShapes.Count - 1 downto 0 do
    if TCustomShape(FShapes[I]).Visible then
    begin
      J := TCustomShape(FShapes[I]).HotAnchor(APoint);
      if J >= 0 then
      begin
        AAnchorIndex := J;
        AAnchorShape := TCustomShape(FShapes[I]);
        Result := True;
        Exit;
      end;
    end;
end;

function TShapeList.HotIndex(APoint: TPoint): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := FShapes.Count - 1 downto 0 do
    if TCustomShape(FShapes[I]).Visible and
      TCustomShape(FShapes[I]).HotPoint(APoint) then
    begin
      Result := I;
      Exit;
    end;
end;

function TShapeList.HotShape(APoint: TPoint): TCustomShape;
var
  I: Integer;
begin
  Result := nil;
  for I := FShapes.Count - 1 downto 0 do
    if TCustomShape(FShapes[I]).Visible and
      TCustomShape(FShapes[I]).HotPoint(APoint) then
    begin
      Result := FShapes[I];
      Exit;
    end;
end;

function TShapeList.IndexFromIdent(AIdent: Longword): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := FShapes.Count - 1 downto 0 do
    if TCustomShape(FShapes[I]).Ident = AIdent then
    begin
      Result := I;
      Break;
    end;
end;

function TShapeList.LoadFromStream(AStream: TStream; AResourceList: TResourceList): Boolean;
var
  vShape: TCustomShape;
  vShapeInfo: TShapeInfo;
  vResourceInfo: PResourceInfo;
  vCount: Integer;
  I, J: Integer;
begin
  Result := False;
  if not Assigned(AStream) then Exit;
  AStream.Read(vCount, SizeOf(vCount));
  for J := 0 to vCount - 1 do
  begin
    if AStream.Read(vShapeInfo, cShapeInfoHeadSize) <= 0 then Break;
    { TODO -c2006.12.01 -oZswangY37 : 判断DataSize是否合法 }
    vShape := NewShape(vShapeInfo.rType);
    if Assigned(vShape) then
    begin
      AStream.Seek(-cShapeInfoHeadSize, soFromCurrent);
      vShape.StreamRead(AStream);
      if vShape.HasResource and Assigned(AResourceList) then
      begin
        I := AResourceList.IndexFromCrc32(
          vShape.ResourceCrc32, vShape.ResourceSize);
        if I >= 0 then
        begin
          vResourceInfo := AResourceList[I];
          vShape.SetResource(@vResourceInfo^.rData[0], vResourceInfo^.rSize);
        end;
      end;
      vShape.UpdateRect;
      Append(vShape);
    end else AStream.Seek(vShapeInfo.rDataSize, soFromCurrent);
  end;
  Result := True;
end;

procedure TShapeList.Offset(AOffset: TPoint);
var
  I: Integer;
begin
  for I := 0 to FShapes.Count - 1 do
    TCustomShape(FShapes[I]).Offset(AOffset);
end;

function TShapeList.SaveToStream(AStream: TStream): Boolean;
var
  I: Integer;
  vCount: Integer;
begin
  Result := False;
  if not Assigned(AStream) then Exit;
  vCount := FShapes.Count;
  AStream.Write(vCount, SizeOf(vCount));
  for I := 0 to FShapes.Count - 1 do
    TCustomShape(FShapes[I]).StreamWrite(AStream);
  Result := True;
end;

procedure TShapeList.SelectAngle(AAngle: Byte);
var
  I: Integer;
begin
  for I := 0 to FShapes.Count - 1 do
    if TCustomShape(FShapes[I]).Selected then
      TCustomShape(FShapes[I]).RoundAngle(AAngle);
end;

function TShapeList.SelectCount: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to FShapes.Count - 1 do
    if TCustomShape(FShapes[I]).Selected then
      Inc(Result);
end;

procedure TShapeList.SelectIdents(var AIdents: TIdents);
var
  I, J: Integer;
begin
  SetLength(AIdents, SelectCount);
  J := 0;
  for I := 0 to FShapes.Count - 1 do
    if TCustomShape(FShapes[I]).Selected then
    begin
      AIdents[J] := TCustomShape(FShapes[I]).Ident;
      Inc(J);
    end;
end;

procedure TShapeList.SelectOffset(AOffset: TPoint);
var
  I: Integer;
begin
  for I := 0 to FShapes.Count - 1 do
    if TCustomShape(FShapes[I]).Selected then
      TCustomShape(FShapes[I]).Offset(AOffset);
end;

procedure TShapeList.SelectPenColor(APenColor: TColor);
var
  I: Integer;
begin
  for I := 0 to FShapes.Count - 1 do
    if TCustomShape(FShapes[I]).Selected then
      TCustomShape(FShapes[I]).PenColor := APenColor;
end;

procedure TShapeList.SelectPenWidth(APenWidth: Integer);
var
  I: Integer;
begin
  for I := 0 to FShapes.Count - 1 do
    if TCustomShape(FShapes[I]).Selected then
    begin
      TCustomShape(FShapes[I]).PenWidth := APenWidth;
      if TCustomShape(FShapes[I]) is TCustomShapeText then
      begin
        TCustomShapeText(FShapes[I]).Zoom := FZoom;
        TCustomShapeText(FShapes[I]).FontName := FFontName;
      end;
      TCustomShape(FShapes[I]).UpdateRect;
    end;
end;

function TShapeList.SelectRect(ARect: TRect; ASelected: Boolean): Integer;
var
  I: Integer;
begin
  Result := 0;
  ARect := ReviseRect(ARect);
  for I := 0 to FShapes.Count - 1 do
    if TCustomShape(FShapes[I]).HotRect(ARect) then
//    if RectInRect(TCustomShape(FShapes[I]).Rect, ARect) then
    begin
      TCustomShape(FShapes[I]).Selected := ASelected;
      Inc(Result);
    end;
end;

procedure TShapeList.SelectTranslucency(ATranslucency: Boolean);
var
  I: Integer;
begin
  for I := 0 to FShapes.Count - 1 do
    if TCustomShape(FShapes[I]).Selected then
      TCustomShape(FShapes[I]).Translucency := ATranslucency;
end;

procedure TShapeList.SetFontName(const Value: TFontName);
var
  I: Integer;
begin
  if FFontName = Value then Exit;
  FFontName := Value;

  for I := 0 to FShapes.Count - 1 do
    if TCustomShape(FShapes[I]) is TCustomShapeText then
    begin
      TCustomShapeText(FShapes[I]).Zoom := FZoom;
      TCustomShapeText(FShapes[I]).FontName := FFontName;
      TCustomShape(FShapes[I]).UpdateRect;
    end;
end;

procedure TShapeList.SetHighlightShape(const Value: TCustomShape);
begin
  if Assigned(FHighlightShape) then FHighlightShape.Highlight := False;
  FHighlightShape := Value;
  if Assigned(FHighlightShape) then FHighlightShape.Highlight := True;
end;

procedure TShapeList.SetZoom(const Value: Double);
var
  I: Integer;
begin
  if FZoom = Value then Exit;
  FZoom := Value;

  for I := 0 to FShapes.Count - 1 do
    if TCustomShape(FShapes[I]) is TCustomShapeText then
    begin
      TCustomShapeText(FShapes[I]).Zoom := FZoom;
      TCustomShapeText(FShapes[I]).FontName := FFontName;
      TCustomShape(FShapes[I]).UpdateRect;
    end;
end;

{ TLovelyPaint21 }

procedure TLovelyPaint21.AcceptCommand(ACommand: Pointer; ASize: Integer);
begin
  case PCommandInfo(ACommand)^.rType of
    scReplay:
      begin
        FCommandList.Clear;
        FShapeList.Clear;
        FLabelList.Clear;
        DrawShape;
        DrawCurrent;
        DrawPaint;
        PaintThis;
        Exit;
      end;
    scRemove:
      begin
        FCommandList.DeleteCommand(PCommandInfo(ACommand)^.rIdent);
        ExecuteTo(FCommandList.Count - 1);
        Exit;
      end;
    scClearLabel:
      begin
        FLabelList.Clear;
        DrawPaint;
        PaintThis;
        Exit;
      end;
    scResource:
      begin
        FCommandList.ExecuteResourceCommand(ACommand, FResourceList);
        Exit;
      end;
  end;

  FCommandList.AcceptCommand(ACommand, FShapeList, FResourceList);
  DrawShape;
  DrawCurrent;
  DrawPaint;
  PaintThis;
end;

procedure TLovelyPaint21.AcceptLabel(AIdent: Word; APoint: TPoint;
  AColor: TColor; AStyle: Byte; AName: WideString; ARemove: Boolean);
begin
  { TODO -c2006.12.18 -oZswangY37 : 接受标注改变 }
  if not FLabelList.AcceptLabel(
    AIdent, APoint, AColor, AStyle, AName, ARemove) then Exit;
  DrawPaint;
  PaintThis;
end;

procedure TLovelyPaint21.AcceptLaser(APoint: TPoint; ARemove: Boolean);
begin
  LaserActive := not ARemove;
  if FLaserActive and (APoint.X < 0) then
  begin
    FLaserPoint := Point(-APoint.X, -APoint.Y);
    DrawPaint;
    FLaserDownPoint := FLaserPoint;
    FLaserDownCount := 50;
    FTimerLaser.Enabled := True;
  end else
  begin
    FLaserPoint := APoint;
    UpdateCursor;
    DrawPaint;
    PaintThis;
  end;
end;

procedure TLovelyPaint21.AdaptToHeight;
var
  vZoom: Double;
begin
  FBorder.X := FBorderWidth;
  FBorder.Y := FBorderWidth;
  vZoom := 0.01;
  while PageHeight(vZoom) < Height do
    vZoom := vZoom + 0.05; // 先大范围搜索
  while PageHeight(vZoom) >= Height do
    vZoom := vZoom - 0.001;
  while PageHeight(vZoom) >= Height -
    Ord(PageWidth(vZoom) > Width) * GetSystemMetrics(SM_CYVSCROLL) do
    vZoom := vZoom - 0.001;
  FZoom := vZoom;
  FBorder.X := Max(FBorderWidth, Trunc(Width - FBackBitmap.Width * FZoom -
    GetSystemMetrics(SM_CYVSCROLL)) div 2);
  FAdaptStyle := asHeight;
  UpdateZoom;
end;

procedure TLovelyPaint21.AdaptToSize;
var
  vZoom: Double;
begin
  FBorder.X := FBorderWidth;
  FBorder.Y := FBorderWidth;
  vZoom := 0.01;
  while (PageHeight(vZoom) < Height) and (PageWidth(vZoom) < Width) do
    vZoom := vZoom + 0.05; // 先大范围搜索
  while not ((PageHeight(vZoom) < Height) and (PageWidth(vZoom) < Width)) do
    vZoom := vZoom - 0.001;
  FZoom := vZoom;

  if Width - PageWidth(vZoom) > Height - PageHeight(vZoom) then
    FBorder.X := Max(FBorderWidth, Trunc(Width - FBackBitmap.Width * FZoom -
      GetSystemMetrics(SM_CYVSCROLL)) div 2);
  if Width - PageWidth(vZoom) < Height - PageHeight(vZoom) then
    FBorder.Y := Max(FBorderWidth, Trunc(Height - FBackBitmap.Height * FZoom -
      GetSystemMetrics(SM_CXHSCROLL)) div 2);
  FAdaptStyle := asSize;
  UpdateZoom;
end;

procedure TLovelyPaint21.AdaptToWidth;
var
  vZoom: Double;
begin
  FBorder.X := FBorderWidth;
  FBorder.Y := FBorderWidth;
  vZoom := 0.01;
  while PageWidth(vZoom) < Width do
    vZoom := vZoom + 0.05; // 先大范围搜索
  while PageWidth(vZoom) >= Width do
    vZoom := vZoom - 0.001;
  while PageWidth(vZoom) >= Width -
    Ord(PageHeight(vZoom) > Height) * GetSystemMetrics(SM_CXHSCROLL) do
    vZoom := vZoom - 0.001;
  FZoom := vZoom;

  FBorder.Y := Max(FBorderWidth, Trunc(Height - FBackBitmap.Height * FZoom -
    GetSystemMetrics(SM_CXHSCROLL)) div 2);
  FAdaptStyle := asWidth;
  UpdateZoom;
end;

procedure TLovelyPaint21.AdjustScrollBars;
var
  vScrollInfo: TScrollInfo;
begin
  if not HandleAllocated then Exit;
  if IsScreenPaint then
  begin
    ShowScrollBar(Handle, SB_HORZ, False);
    ShowScrollBar(Handle, SB_VERT, False);
    Exit;
  end;
  if (PageWidth(FZoom, True) <= Width) and
    (PageHeight(FZoom, True) <= Height) then
  begin
    ShowScrollBar(Handle, SB_HORZ, False);
    ShowScrollBar(Handle, SB_VERT, False);
  end else if PageWidth(FZoom, True) > Width then
  begin
    ShowScrollBar(Handle, SB_HORZ, True);
    ShowScrollBar(Handle, SB_VERT,
      PageHeight(FZoom, True) > Height - GetSystemMetrics(SM_CYVSCROLL));
  end else if PageHeight(FZoom, True) > Height then
  begin
    ShowScrollBar(Handle, SB_HORZ,
      PageWidth(FZoom, True) > Width - GetSystemMetrics(SM_CXVSCROLL));
    ShowScrollBar(Handle, SB_VERT, True);
  end else
  begin
    ShowScrollBar(Handle, SB_HORZ, True);
    ShowScrollBar(Handle, SB_VERT, True);
  end;
  if FSelectTools = pstFollow then
  begin
    EnableScrollBar(Handle, SB_HORZ, ESB_DISABLE_BOTH);
    EnableScrollBar(Handle, SB_VERT, ESB_DISABLE_BOTH);
  end else
  begin
    EnableScrollBar(Handle, SB_HORZ, ESB_ENABLE_BOTH);
    EnableScrollBar(Handle, SB_VERT, ESB_ENABLE_BOTH);
  end;
  if FOrigin.X > PageWidth(FZoom, True) - ClientWidth + 1 then
    FOrigin.X := PageWidth(FZoom, True) - ClientWidth + 1;
  if FOrigin.X < 0 then FOrigin.X := 0;
  if FOrigin.Y > PageHeight(FZoom, True) - ClientHeight + 1 then
    FOrigin.Y := PageHeight(FZoom, True) - ClientHeight + 1;
  if FOrigin.Y < 0 then FOrigin.Y := 0;

  if PageWidth(FZoom, True) > ClientWidth then
  begin
    SetScrollRange(Handle, SB_HORZ, 0, PageWidth(FZoom), True);
    vScrollInfo.fMask := SIF_PAGE;
    vScrollInfo.nPage := ClientWidth;
    SetScrollInfo(Handle, SB_HORZ, vScrollInfo, True);
    SetScrollPos(Handle, SB_HORZ, FOrigin.X, True);
  end;
  if PageHeight(FZoom, True) > ClientHeight then
  begin
    SetScrollRange(Handle, SB_VERT, 0, PageHeight(FZoom), True);
    vScrollInfo.fMask := SIF_PAGE;
    vScrollInfo.nPage := ClientHeight;
    SetScrollInfo(Handle, SB_VERT, vScrollInfo, True);
    SetScrollPos(Handle, SB_VERT, FOrigin.Y, True);
  end;
end;

procedure TLovelyPaint21.BeginUpdate;
begin
  FUpdateing := True;
end;

function TLovelyPaint21.CanRedo: Boolean;
begin
  Result := (FCommandRedo.Count > 0);
end;

function TLovelyPaint21.CanUndo: Boolean;
begin
  Result := (FCommandList.Count > 0);
end;

procedure TLovelyPaint21.CanvasZoomBegin(ACanvas: TCanvas);
begin
  FPrevMode := SetMapMode(ACanvas.Handle, MM_ANISOTROPIC);
  SetWindowOrgEx(ACanvas.Handle,
    Trunc((FOrigin.X - FBorder.X) / FZoom),
    Trunc((FOrigin.Y - FBorder.Y) / FZoom), @FWinOrig);
  SetWindowExtEx(ACanvas.Handle, FBackBitmap.Width, FBackBitmap.Height,
    @FWinSize);
  SetViewportOrgEx(ACanvas.Handle, 0, 0, @FViewOrig);
  SetViewportExtEx(ACanvas.Handle,
    Trunc(FBackBitmap.Width * FZoom), Trunc(FBackBitmap.Height * FZoom),
    @FViewSize);
end;

procedure TLovelyPaint21.CanvasZoomEnd(ACanvas: TCanvas);
begin
  SetViewportOrgEx(ACanvas.Handle, FViewOrig.x, FViewOrig.y, nil);
  SetViewportExtEx(ACanvas.Handle, FViewSize.cX, FViewSize.cY, nil);
  SetWindowOrgEx(ACanvas.Handle, FWinOrig.X, FWinOrig.Y, nil);
  SetWindowExtEx(ACanvas.Handle, FWinSize.cX, FWinSize.cY, nil);
  SetMapMode(ACanvas.Handle, FPrevMode);
end;

procedure TLovelyPaint21.Clear;
var
  vCommand: PCommandInfo;
begin
  FShapeList.Clear;
  vCommand := FCommandList.NewClearCommand;
  FCommandRedo.Clear;

  if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
    cCommandInfoHeadSize + vCommand^.rParamSize);
  DrawShape;
  DrawCurrent;
  DrawPaint;
  PaintThis;
end;

procedure TLovelyPaint21.ClearLabel;
var
  vCommandInfo: TCommandInfo;
begin
  if Assigned(FOnCommand) then
  begin
    vCommandInfo.rIdent := MakeLong(FCommandList.FLastIdent, MaxWord);
    vCommandInfo.rType := scClearLabel;
    vCommandInfo.rParamSize := 0;
    FOnCommand(Self, @vCommandInfo,
      cCommandInfoHeadSize + vCommandInfo.rParamSize);
  end;

  FLabelList.Clear;
  DrawPaint;
  PaintThis;
end;

procedure TLovelyPaint21.ClipCursor(ALock: Boolean);
var
  vRect: TRect;
begin
  if ALock then
  begin
    vRect.TopLeft := PointToMouse(Point(0, 0));
    vRect.BottomRight :=
      PointToMouse(Point(FBackBitmap.Width, FBackBitmap.Height));
    vRect.TopLeft := ClientToScreen(vRect.TopLeft);
    vRect.BottomRight := ClientToScreen(vRect.BottomRight);
    Windows.ClipCursor(@vRect); // 限制鼠标的区域
  end else
  begin
    Windows.ClipCursor(nil);
    Screen.Cursor := crDefault;
  end;
end;

procedure TLovelyPaint21.Close;
begin
  if Assigned(FModifyShape) then ShapeAccept; // 如果是从绘制状态改变           //2007-11-19 ZswangY37 No.1
  FTimerLaser.Enabled := False;                                                 //2007-10-15 ZswangY37 No.2
  FLaserDownCount := 0;
  if Assigned(FLaserBitmap) then
  begin
    FLaserBitmap.Free;
    FLaserBitmap := nil;
  end;

  FShapeList.Clear;
  FCommandList.Parasite := nil;
  FCommandRedo.Parasite := nil;
  //FLaserActive := False;                                                      //2007-10-15 ZswangY37 No.1
  FLabelList.Clear;
end;

procedure TLovelyPaint21.CMFontChanged(var Message: TMessage);
begin
  inherited;
  FShapeList.FontName := Font.Name;
  DrawShape;
  DrawCurrent;
  DrawPaint;
  PaintThis;
  UpdateCaret;
end;

procedure TLovelyPaint21.CMWantSpecialKey(var Message: TCMWantSpecialKey);
begin
  case Message.CharCode of
    VK_LEFT, VK_UP, VK_DOWN, VK_RIGHT: Message.Result := 1;
  end;
  inherited;                                                                    //2007-08-14 ZswangY37 No.2
end;

procedure TLovelyPaint21.CopyToClipboard;
var
  I: Integer;
  vShapeStream: TMemoryStream;
  vShape: TCustomShape;
  vResourceStream: TMemoryStream;
  vData: THandle;
  vGlobal: Pointer;
  vResourceList: TStringList;
  vResourceKey: string;
begin
  if FShapeList.SelectCount <= 0 then Exit;
  vShapeStream := TMemoryStream.Create;
  vResourceStream := TMemoryStream.Create;                                      //2007-11-26 ZswangY37 No.1
  try
    vResourceList := TStringList.Create;
    try
      for I := 0 to FShapeList.Count - 1 do
      begin
        vShape := FShapeList[I];
        if vShape.Selected then // 选中
        begin
          vResourceKey := Format('%d,%d', [vShape.ResourceCrc32, vShape.ResourceSize]);
          if vShape.HasResource and
            (vResourceList.IndexOf(vResourceKey) < 0) then //没有添加过
          begin
            vShape.ResourceWrite(vResourceStream);
            vResourceList.Add(vResourceKey);
          end;
        end;
      end;
    finally
      vResourceList.Free;
    end;
    for I := 0 to FShapeList.Count - 1 do
      if FShapeList[I].Selected then
        FShapeList[I].StreamWrite(vShapeStream);
    vShapeStream.Position := 0;
    Clipboard.Clear;
    Clipboard.Open;
    try
      vData := GlobalAlloc(GMEM_MOVEABLE or GMEM_DDESHARE,
        vShapeStream.Size);
      vGlobal := GlobalLock(vData);
      try
        vShapeStream.Position := 0;
        vShapeStream.Read(
          vGlobal^, vShapeStream.Size);
        SetClipboardData(CF_SHAPES, vData);
      finally
        GlobalUnlock(vData);
      end;

      vData := GlobalAlloc(GMEM_MOVEABLE or GMEM_DDESHARE,
        vResourceStream.Size);
      vGlobal := GlobalLock(vData);
      try
        vResourceStream.Position := 0;
        vResourceStream.Read(
          vGlobal^, vResourceStream.Size);
        SetClipboardData(CF_RESOURCES, vData);
      finally
        GlobalUnlock(vData);
      end;
    finally
      Clipboard.Close;
    end;
  finally
    vShapeStream.Free;
    vResourceStream.Free;
  end;
end;

constructor TLovelyPaint21.Create(AOwner: TComponent);
begin
  inherited;
  FTimerLaser := TTimer.Create(nil);
  FTimerLaser.Enabled := False;
  FTimerLaser.Interval := 40;
  FTimerLaser.OnTimer := TimerLaserTimer;

  FTimerScroll := TTimer.Create(nil);
  FTimerScroll.Enabled := False;
  FTimerScroll.Interval := 50;
  FTimerScroll.OnTimer := TimerScrollTimer;

  FZoomBitmap := TBitmap.Create;
  FZoomBitmap.PixelFormat := pf24bit;                                           //2007-10-25 ZswangY37 No.1

  FShapeList := TShapeList.Create; // 图形列表
  FCommandList := TCommandList.Create; // 命令列表
  FCommandRedo := TCommandList.Create; // 恢复命令
  FResourceList := TResourceList.Create; // 资源列表

  FLabelList := TLabelList.Create; // 标注列表
  FBackBitmap := TBitmap.Create; // 底图,作为原始图
  FBackBitmap.PixelFormat := pf24bit;

  FCurrentBitmap := TBitmap.Create; // 当前图像
  FCurrentBitmap.PixelFormat := pf24bit;
  FClientBitmap := TBitmap.Create; // 客户层
  FClientBitmap.PixelFormat := pf24bit;
  FShapeBitmap := TBitmap.Create; // 图形层
  FShapeBitmap.PixelFormat := pf24bit;
  FPaintBitmap := TBitmap.Create; // 绘制层
  FPaintBitmap.PixelFormat := pf24bit;

  FBackBitmap.Width := 800;
  FBackBitmap.Height := 600;
  FBorderWidth := 0;
  Width := 300;
  Height := 400;
  FZoom := 1;
  FCanReangle := True;
  ParentColor := False;
  Color := clBtnFace;
  ParentFont := False;
  if Screen.Fonts.IndexOf('宋体') >= 0 then
    Font.Name := '宋体'
  else Font.Assign(Screen.MenuFont);
  FShapeList.Zoom := FZoom;
  FShapeList.FontName := Font.Name;
  FSelectModel := 'L0,0-100,100';
  ControlStyle := ControlStyle + [csOpaque, csCaptureMouse, csAcceptsControls];
  DoubleBuffered := True;
end;

procedure TLovelyPaint21.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_VSCROLL or WS_HSCROLL;
  end;
end;

procedure TLovelyPaint21.CutToClipboard;
var
  vIdents: TIdents;
  vCommand: PCommandInfo;
begin
  if FShapeList.Count <= 0 then Exit;
  CopyToClipboard;
  FShapeList.SelectIdents(vIdents);
  FShapeList.DeleteSelect;
  vCommand := FCommandList.NewDeleteCommand(vIdents);
  if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
    cCommandInfoHeadSize + vCommand^.rParamSize);
  SetLength(vIdents, 0);
  vIdents := nil;
  DrawShape;
  DrawCurrent;
  DrawPaint;
  PaintThis;
end;

function TLovelyPaint21.Delete: Boolean;
var
  vIdents: TIdents;
  vCommand: PCommandInfo;
begin
  Result := False;
  case FSelectTools of
    pstModify:
      if not Assigned(FModifyShape) and (FShapeList.SelectCount > 0) then
      begin
        FShapeList.SelectIdents(vIdents);
        FShapeList.DeleteSelect;
        vCommand := FCommandList.NewDeleteCommand(vIdents);
        if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
          cCommandInfoHeadSize + vCommand^.rParamSize);
        SetLength(vIdents, 0);
        vIdents := nil;
        DrawShape;
        DrawCurrent;
        DrawPaint;
        PaintThis;
        Result := True;
      end;
  end;
end;

destructor TLovelyPaint21.Destroy;
begin
  if Assigned(FTimerLaser) then FTimerLaser.Free;
  if Assigned(FTimerScroll) then FTimerScroll.Free;
  if Assigned(FShapeList) then FShapeList.Free;
  if Assigned(FCommandList) then FCommandList.Free;
  if Assigned(FCommandRedo) then FCommandRedo.Free;
  if Assigned(FResourceList) then FResourceList.Free;
  if Assigned(FLabelList) then FLabelList.Free;
  if Assigned(FBackBitmap) then FBackBitmap.Free;
  if Assigned(FCurrentBitmap) then FCurrentBitmap.Free;
  if Assigned(FShapeBitmap) then FShapeBitmap.Free;
  if Assigned(FPaintBitmap) then FPaintBitmap.Free;
  if Assigned(FClientBitmap) then FClientBitmap.Free;
  if Assigned(FZoomBitmap) then FZoomBitmap.Free;
  if Assigned(FFormVectorSelectBox) then FFormVectorSelectBox.Free;
  if Assigned(FLaserBitmap) then FLaserBitmap.Free;
  inherited;
end;

procedure TLovelyPaint21.DoChange;
begin
  UpdateCursor;
  AdjustScrollBars;
  UpdateCaret;
  Invalidate;
end;

procedure TLovelyPaint21.DoEnter;
begin
  inherited;
  DoChange;
end;

procedure TLovelyPaint21.DoExit;
begin
  inherited;
  DoChange;
  DestroyCaret;                                                                 //2007-10-24 ZswangY37 No.1
end;

function TLovelyPaint21.DoMouseWheelDown(Shift: TShiftState;
  MousePos: TPoint): Boolean;
{$J+}const vCount: Integer = 0;{$J-}
var AM, BM: TPoint;
begin
  //  Result := inherited DoMouseWheelDown(Shift, MousePos);                    //2007-08-23 ZswangY37 No.1
  Result := True;
  if IsScreenPaint then
  begin
    MousePos := ScreenToClient(Mouse.CursorPos);
    AM := MouseToPoint(MousePos);
    Zoom := Max(1, Zoom * 0.8);
    BM := MouseToPoint(MousePos);
    if (AM.X = BM.X) and (AM.Y = BM.Y) then Exit;
    if Zoom = 1 then
       Origin := Point(0, 0)
    else Origin := Point(Origin.X + Trunc((AM.X - BM.X) * Zoom), Origin.Y + Trunc((AM.Y - BM.Y) * Zoom));
    Exit;
  end;

  if Assigned(FOnDispatch) and ((PageHeight(FZoom) <= Height) or
    (FOrigin.Y = PageHeight(FZoom) - ClientHeight + 1)) then
  begin
    Inc(vCount);
    if vCount > 5 then                                                          //2007-12-07 ZswangY37 No.3
    begin
      FOnDispatch(Self, dtPageDown, 0);
      vCount := 0;
    end;
  end else vCount := 0;

  if WindowFromPoint(Mouse.CursorPos) <> Handle then Exit;
  if FEstopScorll then Exit;
  if SelectTools = pstFollow then Exit;
  if GetKeyState(VK_LBUTTON) and $80 = $80 then Exit;                           //2007-02-04 ZswangY37 No.1
  if FOrigin.Y >= PageHeight(FZoom) - ClientHeight + 1 then Exit;
  Perform(WM_VSCROLL, MakeWParam(SB_LINEDOWN, 0), 0);
  Perform(WM_VSCROLL, MakeWParam(SB_ENDSCROLL, 0), 0);                          //2007-05-29 ZswangY37 No.1
  MousePos := ScreenToClient(Mouse.CursorPos);
  MouseMove(Shift, MousePos.X, MousePos.Y);
end;

function TLovelyPaint21.DoMouseWheelUp(Shift: TShiftState;
  MousePos: TPoint): Boolean;
{$J+}const vCount: Integer = 0;{$J-}
var AM, BM: TPoint;
begin
//  Result := inherited DoMouseWheelUp(Shift, MousePos);                        //2007-08-23 ZswangY37 No.1
  Result := True;
  if IsScreenPaint then
  begin
    MousePos := ScreenToClient(Mouse.CursorPos);
    AM := MouseToPoint(MousePos);
    Zoom := Min(20, Zoom * 1.2);
    BM := MouseToPoint(MousePos);
    if (AM.X = BM.X) and (AM.Y = BM.Y) then Exit;
    if Zoom = 1 then
       Origin := Point(0, 0)
    else Origin := Point(Origin.X + Trunc((AM.X - BM.X) * Zoom), Origin.Y + Trunc((AM.Y - BM.Y) * Zoom));
    Exit;
  end;
  if Assigned(FOnDispatch) and (
    (PageHeight(FZoom) <= Height) or (FOrigin.Y = 0)) then
  begin
    Inc(vCount);
    if vCount > 5 then                                                          //2007-12-07 ZswangY37 No.3
    begin
      FOnDispatch(Self, dtPageUp, 0);
      vCount := 0;
    end;
  end else vCount := 0;

  if WindowFromPoint(Mouse.CursorPos) <> Handle then Exit;
  if FEstopScorll then Exit;
  if SelectTools = pstFollow then Exit;
  if GetKeyState(VK_LBUTTON) and $80 = $80 then Exit;
  if FOrigin.Y <= 0 then Exit;
  Perform(WM_VSCROLL, MakeWParam(SB_LINEUP, 0), 0);                             //2007-05-22 ZswangY37 No.3
  Perform(WM_VSCROLL, MakeWParam(SB_ENDSCROLL, 0), 0);                          //2007-05-29 ZswangY37 No.1
  MousePos := ScreenToClient(Mouse.CursorPos);
  MouseMove(Shift, MousePos.X, MousePos.Y);
end;

procedure TLovelyPaint21.DrawBack;
var
  vRect: TRect;
begin
  if FUpdateing then Exit;
  if not HandleAllocated then Exit;                                             //2006-12-29 ZswangY37 No.1
  FClientBitmap.Canvas.Lock;
  try
    FClientBitmap.Width := ClientWidth;
    FClientBitmap.Height := ClientHeight;
    FClientBitmap.Canvas.Pen.Mode := pmCopy;
    FClientBitmap.Canvas.Brush.Color := clWindow;
    FClientBitmap.Canvas.FillRect(FClientBitmap.Canvas.ClipRect);
    if FZoom < 1 then                                                           //2007-07-19 ZswangY37 No.1
      FClientBitmap.Canvas.Draw(
        -FOrigin.X + FBorder.X, -FOrigin.Y + FBorder.Y, FZoomBitmap)
    else
    begin
      SetStretchBltMode(FClientBitmap.Canvas.Handle, STRETCH_ANDSCANS);
      vRect := MoveRect(                                                        //2007-10-08 ZswangY37 No.1
        Rect(0, 0, Trunc(ClientWidth / FZoom), Trunc(ClientHeight / FZoom)),
        Point(Trunc(FOrigin.X / FZoom - FBorder.X / FZoom),
        Trunc(FOrigin.Y / FZoom - FBorder.Y / FZoom)));
      StretchBlt(FClientBitmap.Canvas.Handle,
        0, 0, ClientWidth, ClientHeight, FBackBitmap.Canvas.Handle,
        vRect.Left, vRect.Top, vRect.Right - vRect.Left,
        vRect.Bottom - vRect.Top, SRCCOPY);
    end;
  finally
    FClientBitmap.Canvas.Unlock;
  end;
end;

procedure TLovelyPaint21.DrawCurrent;
begin
  if FUpdateing then Exit;
  if not HandleAllocated then Exit;                                             //2006-12-29 ZswangY37 No.1
  FCurrentBitmap.Canvas.Lock;
  try
    FCurrentBitmap.Width := ClientWidth;
    FCurrentBitmap.Height := ClientHeight;
    FCurrentBitmap.Canvas.CopyRect(FCurrentBitmap.Canvas.ClipRect,
      FShapeBitmap.Canvas, FCurrentBitmap.Canvas.ClipRect);
    CanvasZoomBegin(FCurrentBitmap.Canvas);
    try
      if Assigned(FModifyShape) then
      begin
        FModifyShape.UpdateRect;
        FModifyShape.Draw(Point(0, 0), FCurrentBitmap.Canvas);
      end else if FMouseMoving then // 如果在用鼠标移动图形中
        FShapeList.DrawSelect(Point(0, 0), FCurrentBitmap.Canvas, True);
    finally
      CanvasZoomEnd(FCurrentBitmap.Canvas);
    end;
  finally
    FCurrentBitmap.Canvas.Unlock;
  end;
end;

procedure TLovelyPaint21.DrawPaint;
var
  vPoint: TPoint;
  vRect: TRect;
  vLabelInfo: PLabelInfo;
  I: Integer;
  T: WideString;
begin
  if FUpdateing then Exit;
  if not HandleAllocated then Exit;                                             //2006-12-29 ZswangY37 No.1
  FPaintBitmap.Canvas.Lock;
  try
    FPaintBitmap.Width := ClientWidth;
    FPaintBitmap.Height := ClientHeight;
    FPaintBitmap.Canvas.Draw(0, 0, FCurrentBitmap);

    if FLaserActive and Assigned(FLaserGraphic) and (FLaserDownCount <= 0) then   // 绘制光笔
    begin
      vPoint := PointToMouse(FLaserPoint);
      FPaintBitmap.Canvas.Draw(
        vPoint.X - FLaserGraphic.Width div 2,
        vPoint.Y - FLaserGraphic.Height div 2,
        FLaserGraphic
      );
    end;

    for I := 0 to FLabelList.Count - 1 do // 绘制标注
    begin
      vLabelInfo := FLabelList[I];
      FPaintBitmap.Canvas.Brush.Color := vLabelInfo^.rColor;
      FPaintBitmap.Canvas.Pen.Color := vLabelInfo^.rColor;
      FPaintBitmap.Canvas.Font.Name := Font.Name;
      FPaintBitmap.Canvas.Font.Height := 15;
      FPaintBitmap.Canvas.Font.Color :=
        SymmetryColor(ColorToRGB(vLabelInfo^.rColor));

      vPoint := PointToMouse(
        Point(vLabelInfo^.rPoint.x, vLabelInfo^.rPoint.y));

      vRect := Rect(vPoint.X, vPoint.Y, vPoint.X + 199, vPoint.Y + 40);
      T := ' ' + Copy(WideString(vLabelInfo^.rName), 1, 19 + 1) + ' ';
      if Length(string(T)) < 8 then
        T := StringOfChar(' ', (8 - Length(string(T))) div 2) + T +
          StringOfChar(' ', (8 - Length(string(T))) div 2);                       //2007-06-15 ZswangY37 No.1
      DrawTextW(FPaintBitmap.Canvas.Handle, PWideChar(T), Length(T), vRect,
        DT_LEFT or DT_NOCLIP or DT_NOPREFIX or DT_CALCRECT);
      if vLabelInfo^.rStyle <> 0 then // 左边朝向
      begin
        OffsetRect(vRect,
          -(vRect.Right - vRect.Left) - (vRect.Bottom - vRect.Top),
          -(vRect.Bottom - vRect.Top) div 2);
        FPaintBitmap.Canvas.Brush.Color := clBlack;
        FPaintBitmap.Canvas.Pen.Color := clBlack;
        FPaintBitmap.Canvas.FillRect(ZoomRect(vRect, 1));
        FPaintBitmap.Canvas.Polygon([
          Point(vRect.Right - 1, vRect.Top - (vRect.Bottom - vRect.Top) div 2 - 1 - 2),
          Point(vPoint.X + 1, vPoint.Y),
          Point(vRect.Right - 1, vRect.Bottom + (vRect.Bottom - vRect.Top) div 2 + 2)
        ]);

        FPaintBitmap.Canvas.Brush.Color := vLabelInfo^.rColor;
        FPaintBitmap.Canvas.Pen.Color := vLabelInfo^.rColor;
        FPaintBitmap.Canvas.Polygon([
          Point(vRect.Right, vRect.Top - (vRect.Bottom - vRect.Top) div 2 - 1),
          vPoint,
          Point(vRect.Right, vRect.Bottom + (vRect.Bottom - vRect.Top) div 2)
        ]);
        DrawTextW(FPaintBitmap.Canvas.Handle, PWideChar(T), Length(T), vRect,
          DT_LEFT or DT_NOCLIP or DT_NOPREFIX);
      end else
      begin
        OffsetRect(vRect, (vRect.Bottom - vRect.Top),
          -(vRect.Bottom - vRect.Top) div 2);
        FPaintBitmap.Canvas.Brush.Color := clBlack;
        FPaintBitmap.Canvas.Pen.Color := clBlack;
        FPaintBitmap.Canvas.FillRect(ZoomRect(vRect, 1));
        FPaintBitmap.Canvas.Polygon([
          Point(vRect.Left + 1, vRect.Top - (vRect.Bottom - vRect.Top) div 2 - 1 - 2),
          Point(vPoint.X - 1, vPoint.Y),
          Point(vRect.Left + 1, vRect.Bottom + (vRect.Bottom - vRect.Top) div 2 + 2)
        ]);

        FPaintBitmap.Canvas.Brush.Color := vLabelInfo^.rColor;
        FPaintBitmap.Canvas.Pen.Color := vLabelInfo^.rColor;
        FPaintBitmap.Canvas.Polygon([
          Point(vRect.Left, vRect.Top - (vRect.Bottom - vRect.Top) div 2 - 1),
          vPoint,
          Point(vRect.Left, vRect.Bottom + (vRect.Bottom - vRect.Top) div 2)
        ]);
        DrawTextW(FPaintBitmap.Canvas.Handle, PWideChar(T), Length(T), vRect,
          DT_LEFT or DT_NOCLIP or DT_NOPREFIX);
      end;
    end;
  finally
    FPaintBitmap.Canvas.Unlock;
  end;
end;

procedure TLovelyPaint21.DrawShape;
var
  I: Integer;
begin
  if FUpdateing then Exit;
  if not HandleAllocated then Exit;                                             //2006-12-29 ZswangY37 No.1
  for I := 0 to FShapeList.Count - 1 do
    FShapeList[I].CanReangle := FCanReangle;

  FShapeBitmap.Canvas.Lock;
  try
    FShapeBitmap.Width := ClientWidth;
    FShapeBitmap.Height := ClientHeight;
    FShapeBitmap.Canvas.CopyRect(FShapeBitmap.Canvas.ClipRect,
      FClientBitmap.Canvas, FShapeBitmap.Canvas.ClipRect);

    CanvasZoomBegin(FShapeBitmap.Canvas);
    try
      if FMouseMoving then // 如果是在鼠标移动图形中
        FShapeList.DrawSelect(
          Point(0, 0), FShapeBitmap.Canvas, False)
      else FShapeList.Draw(Point(0, 0), FShapeBitmap.Canvas);
    finally
      CanvasZoomEnd(FShapeBitmap.Canvas);
    end;
  finally
    FShapeBitmap.Canvas.Unlock;
  end;
end;

procedure TLovelyPaint21.DrawZoom;
begin
  if FZoom < 1 then // 缩小                                                     //2007-07-19 ZswangY37 No.1
  begin
    if (FOldWidth = Trunc(FBackBitmap.Width * FZoom)) and // 比率没有改变则不用重新绘制
      (FOldHeight = Trunc(FBackBitmap.Height * FZoom)) then Exit;               //2007-11-14 ZswangY37 No.1
    FZoomBitmap.Canvas.Lock;
    try
      FZoomBitmap.Width := Trunc(FBackBitmap.Width * FZoom);
      FZoomBitmap.Height := Trunc(FBackBitmap.Height * FZoom);
      SetStretchBltMode(FZoomBitmap.Canvas.Handle, STRETCH_HALFTONE);
      StretchBlt(FZoomBitmap.Canvas.Handle,
        0, 0, FZoomBitmap.Width, FZoomBitmap.Height, FBackBitmap.Canvas.Handle,
        0, 0, FBackBitmap.Width, FBackBitmap.Height, SRCCOPY);
      FOldWidth := FZoomBitmap.Width;
      FOldHeight := FZoomBitmap.Height;
    finally
      FZoomBitmap.Canvas.Unlock;
    end;
  end else
  begin
    FZoomBitmap.Width := 0;
    FZoomBitmap.Height := 0;
    FOldWidth := 0;
    FOldHeight := 0;
  end;
end;

procedure TLovelyPaint21.EndUpdate;
begin
  FUpdateing := False;
  DrawZoom;
  DrawBack;
  DrawShape;
  DrawCurrent;
  DrawPaint;
  Invalidate;
end;

function TLovelyPaint21.ExecuteTo(AIndex: Integer): Boolean;
begin
  Result := FCommandList.ExecuteTo(AIndex, FShapeList, FResourceList);
  FShapeList.Zoom := FZoom;
  FShapeList.FontName := Font.Name;
  DrawShape;
  DrawCurrent;
  DrawPaint;
  PaintThis;
  AdjustScrollBars;
end;

procedure TLovelyPaint21.FaceSize(AWidth, AHeight: Integer);
begin
  FBackBitmap.Width := AWidth;
  FBackBitmap.Height := AHeight;
  DoChange;
end;

function TLovelyPaint21.IsTextInput: Boolean;
begin
  Result := FModifyShape is TCustomShapeText;
end;

procedure TLovelyPaint21.KeyDown(var Key: Word; Shift: TShiftState);
const
{$J+}
  vShiftState: Byte = 0;
{$J-}
var
  vPoint: TPoint;
  I: Integer;
  vLabelInfo: PLabelInfo;
//  vCommand: PCommandInfo;
//  vIdents: TIdents;
begin
  inherited;
  if SelectTools = pstFollow then Exit;
  if FMouseMoving then Exit;
  if FAnchoring then Exit;                                                      //2007-08-13 ZswangY37 No.2
  if FModifyShape is TCustomShapeText then
  begin
    if TCustomShapeText(FModifyShape).KeyDown(Key, Shift) then
    begin
      DrawCurrent;
      DrawPaint;
      UpdateCaret;
      Invalidate;
      Exit;
    end;
  end;
  { TODO -c2006.12.18 -oZswangY37 : 考虑延迟处理 }
  case Key of
    VK_HOME, VK_END:                                                            //2007-09-25 ZswangY37 No.1
      begin
        if WindowFromPoint(Mouse.CursorPos) <> Handle then Exit;
        if FEstopScorll then Exit;
        if SelectTools = pstFollow then Exit;
        if GetKeyState(VK_LBUTTON) and $80 = $80 then Exit;
        case Key of
          VK_HOME:
            begin
              if FOrigin.Y = 0 then Exit;
              FOrigin.Y := 0;
            end;
          VK_END:
            begin
              if FOrigin.Y = PageHeight(FZoom, True) - ClientHeight + 1 then Exit;
              FOrigin.Y := PageHeight(FZoom, True) - ClientHeight + 1;
            end;
        end;
        SetScrollPos(Handle, SB_VERT, FOrigin.Y, True);
        UpdateCaret;
        DrawBack;
        DrawShape;
        DrawCurrent;
        DrawPaint;
        PaintThis;
        if Assigned(OnOriginChange) then OnOriginChange(Self);
      end;
    VK_PRIOR: DoMouseWheelUp([], vPoint);                                       //2007-09-25 ZswangY37 No.1
    VK_NEXT: DoMouseWheelDown([], vPoint);
    VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN:
      case FSelectTools of
        pstLabel:
          begin
            case Key of
              VK_LEFT:
                begin
                  if FLabelStyle = 0 then Exit;
                  FLabelStyle := 0;
                  UpdateCursor;

                  I := FLabelList.FindLabel(FControlIdent);
                  if I < 0 then Exit;
                  vLabelInfo := FLabelList[I];
                  vLabelInfo.rStyle := FLabelStyle;
//                  AcceptLabel(FControlIdent, Point(vLabelInfo^.rPoint.x,
//                      vLabelInfo^.rPoint.y), FLabelColor, FLabelStyle, True);
                  if Assigned(FOnLabelChange) then
                    FOnLabelChange(Self, Point(vLabelInfo^.rPoint.x,
                      vLabelInfo^.rPoint.y), True);
                  PaintThis;
                end;
              VK_RIGHT:
                begin
                  if FLabelStyle <> 0 then Exit;
                  FLabelStyle := 1;
                  UpdateCursor;
                  I := FLabelList.FindLabel(FControlIdent);
                  if I < 0 then Exit;
                  vLabelInfo := FLabelList[I];
                  vLabelInfo.rStyle := FLabelStyle;
                  if Assigned(FOnLabelChange) then
                    FOnLabelChange(Self, Point(vLabelInfo^.rPoint.x,
                      vLabelInfo^.rPoint.y), True);
                  PaintThis;
                end;
              VK_ESCAPE:
                begin
                  I := FLabelList.FindLabel(FControlIdent);
                  if I < 0 then Exit;
                  vLabelInfo := FLabelList[I];
                  if Assigned(FOnLabelChange) then
                    FOnLabelChange(Self, Point(vLabelInfo^.rPoint.x,
                      vLabelInfo^.rPoint.y), True);
                  PaintThis;
                end;
            end;
          end;
        pstModify:
          if not Assigned(FModifyShape) and (FShapeList.SelectCount > 0) then 
          begin
            { DONE -c2006.12.14 -oZswangY37 : 键盘微调移动图形 }
            vPoint := Point(0, 0);
            if not FKeyMoving then
              FMovePoint := Point(0, 0);
            FKeyMoving := True;
            if GetKeyState(VK_LEFT) and $80 = $80 then
              vPoint.X := -1 - Ord(ssCtrl in Shift) * 9;
            if GetKeyState(VK_RIGHT) and $80 = $80 then
              vPoint.X := +1 + Ord(ssCtrl in Shift) * 9;
            if GetKeyState(VK_UP) and $80 = $80 then
              vPoint.Y := -1 - Ord(ssCtrl in Shift) * 9;
            if GetKeyState(VK_DOWN) and $80 = $80 then
              vPoint.Y := +1 + Ord(ssCtrl in Shift) * 9;
            FMovePoint.X := FMovePoint.X + vPoint.X;
            FMovePoint.Y := FMovePoint.Y + vPoint.Y;
            FShapeList.SelectOffset(vPoint);
            { DONE -c2006.11.25 -oZswangY37 : 不用实时移动更新 }
            DrawShape;
            DrawCurrent;
            DrawPaint;
            PaintThis;
          end;
      end;
    VK_RETURN:
      case FSelectTools of
        pstPaint:
          if Assigned(FModifyShape) then
          begin
            ShapeAccept;
            UpdateCaret;
            PaintThis;
          end;
      end;
    VK_X:
      case FSelectTools of
        pstModify: if ssCtrl in Shift then CutToClipboard;
      end;
    VK_C:
      case FSelectTools of
        pstModify: if ssCtrl in Shift then CopyToClipboard;
      end;
    VK_V:
      case FSelectTools of
        pstModify: if ssCtrl in Shift then PasteFromClipboard;
        pstPhoto: if (ssCtrl in Shift) then
          begin
            if PasteFromClipboard then SelectTools := pstModify;
          end;
        pstPaint: if (ssCtrl in Shift) then
          begin
            if not Assigned(FModifyShape) and PasteFromClipboard then           //2007-12-07 ZswangY37 No.1
            begin
              SelectTools := pstModify;
              if Assigned(FOnDispatch) then
                FOnDispatch(Self, dtSelectTool, 0);
            end;
          end;
      end;
    VK_Z:
      if ssCtrl in Shift then
      begin
        if ssShift in Shift then
          Redo
        else Undo;
      end;
    VK_A:
      case FSelectTools of
        pstModify, pstPaint: if ssCtrl in Shift then SelectAll;
      end;
    VK_DELETE: Delete;
    VK_ESCAPE:
      case FSelectTools of
        pstLabel:
          begin
            if not FLabelList.RemoveLabel(FControlIdent) then Exit;
            if Assigned(FOnLabelChange) then
              FOnLabelChange(Self, Point(0, 0), True);
            PaintThis;
          end;
        pstPaint:
          if Assigned(FModifyShape) then
          begin
            { DONE -c2006.12.04 -oZswangY37 : 取消当前图形绘制 };
            FModifyShape.Free;
            FModifyShape := nil;
            UpdateCaret;
            DrawCurrent;
            DrawPaint;
            PaintThis;
          end;
        pstModify:
          if not FMouseDown then
          begin
            FShapeList.ClearSelect;
            DrawShape;
            DrawCurrent;
            DrawPaint;
            PaintThis;
          end else if FMouseMoving then                                         //2006-12-14 ZswangY37 No.2
          begin
            vPoint := Point(FDownPoint.X - FMovePoint.X,
              FDownPoint.Y - FMovePoint.Y);
            FShapeList.SelectOffset(vPoint);
            FMovePoint := FDownPoint;
            Mouse.CursorPos := Point(
              Mouse.CursorPos.X + vPoint.X,
              Mouse.CursorPos.Y + vPoint.Y
            );
            FMouseMoving := False;
            DrawCurrent;
            DrawPaint;
            PaintThis;
          end;
      end;
    VK_SHIFT:
      case FSelectTools of
        pstPaint:
          if Assigned(FModifyShape) then
          begin
            if GetKeyState(VK_SHIFT) = vShiftState then Exit; // 状态一致
            vShiftState := GetKeyState(VK_SHIFT);
            case FindShapeModify(FModifyShape.ClassType) of
              smLine, smRect, smVector: ;
            else Exit;
            end;
            if FMouseDown then
            begin
              vPoint := ScreenToClient(Mouse.CursorPos);
              MouseMove([ssLeft, ssShift], vPoint.X, vPoint.Y);
            end;
          end;
      end;
  end;
end;

procedure TLovelyPaint21.KeyUp(var Key: Word; Shift: TShiftState);
var
  vPoint: TPoint;
  vIdents: TIdents;
  vCommand: PCommandInfo;
begin
  inherited;
  if SelectTools = pstFollow then Exit; 
  if FMouseMoving then Exit;
  if FModifyShape is TCustomShapeText then
  begin
    if TCustomShapeText(FModifyShape).KeyUp(Key, Shift) then
    begin
      DrawCurrent;
      DrawPaint;
      UpdateCaret;
      Invalidate;
      Exit;
    end;
  end;
  case Key of
    VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN:
      case FSelectTools of
        pstModify:
          begin
            if FKeyMoving and (FShapeList.SelectCount > 0) and
              ((FMovePoint.X <> 0) or (FMovePoint.Y <> 0)) then // 移动完成
            begin
              FShapeList.SelectIdents(vIdents);
              vCommand := FCommandList.NewOffsetCommand(
                Point(FMovePoint.X, FMovePoint.Y),
                vIdents);
              FCommandRedo.Clear;
              if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
                cCommandInfoHeadSize + vCommand^.rParamSize);
              SetLength(vIdents, 0);
              vIdents := nil;
            end;
          end;
      end;
    VK_SHIFT:
      case FSelectTools of
        pstPaint:
          if Assigned(FModifyShape) then
          begin
            case FindShapeModify(FModifyShape.ClassType) of
              smLine, smRect, smVector: ;
            else Exit;
            end;
            if FMouseDown then
            begin
              vPoint := ScreenToClient(Mouse.CursorPos);
              MouseMove([ssLeft], vPoint.X, vPoint.Y);
            end;
          end;
      end;
  end;
  FKeyMoving := False;
end;

function TLovelyPaint21.LoadFromFile(AFileName: TFileName): Boolean;
var
  vFileStream: TFileStream;
  vFileHandle: THandle;
  vPaintFileHeader: TPaintFileHeader;
begin
  Result := False;
  if not FileExists(AFileName) then Exit;
  vFileHandle := _lopen(PChar(AFileName), OF_READ or OF_SHARE_DENY_NONE);
  if Integer(vFileHandle) <= 0 then Exit;
  vFileStream := TFileStream.Create(vFileHandle);
  try
    vFileStream.Read(vPaintFileHeader,
      SizeOf(TPaintFileHeader) - SizeOf(Char));
    if (vPaintFileHeader.rFlag <> 'pat') and
      (vPaintFileHeader.rVersion <> 1) then Exit; // 文件版本和类型不正确
    Result := LoadFromStream(vFileStream);
  finally
    vFileStream.Free;
  end;
end;

function TLovelyPaint21.LoadFromStream(AStream: TStream): Boolean;
var
  vCommand: PCommandInfo;
  vResourceStart: Integer;
  vShapeStart: Integer;
  vResourceInfo: PResourceInfo;
  vShapeStream: TMemoryStream;
  I: Integer;
  vBlockPostion: Integer;
begin
  vResourceStart := FResourceList.Count;
  vShapeStart := FShapeList.Count;
  Result := FResourceList.LoadFromStream(AStream) and
    FShapeList.LoadFromStream(AStream, FResourceList);                          //2011-04-03 ZswangY37 No.1
  if not Result then Exit;
  // 添加资源的命令
  for I := vResourceStart to FResourceList.Count - 1 do
  begin
    vResourceInfo := FResourceList[I];
    vBlockPostion := 0;
    vCommand := FCommandList.NewResourceCommand(vResourceInfo, vBlockPostion);
    while Assigned(vCommand) do
    begin
      if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
        cCommandInfoHeadSize + vCommand^.rParamSize);
      FreeMem(vCommand, cCommandInfoHeadSize + vCommand.rParamSize);            //2007-12-20 ZswangY37 No.1
      vCommand := FCommandList.NewResourceCommand(vResourceInfo, vBlockPostion);
    end;
  end;
  // 添加图形的命令
  vShapeStream := TMemoryStream.Create;
  try
    for I := vShapeStart to FShapeList.Count - 1 do
    begin
      FShapeList[I].StreamWrite(vShapeStream);
    end;
    vShapeStream.Position := 0;
    vCommand := FCommandList.NewPasteCommand(vShapeStream);
    FCommandRedo.Clear;
    if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
      cCommandInfoHeadSize + vCommand^.rParamSize);
  finally
    vShapeStream.Free;
  end;
  DrawShape;
  DrawCurrent;
  DrawPaint;
  PaintThis;
end;

procedure TLovelyPaint21.LPCANCOPY(var Msg: TMessage);
begin
  if FModifyShape is TCustomShapeText then
    Msg.Result := Ord(TCustomShapeText(FModifyShape).SelLength > 0)
  else Msg.Result := Ord(FShapeList.SelectCount > 0);
end;

procedure TLovelyPaint21.LPCANCUT(var Msg: TMessage);
begin
  if FModifyShape is TCustomShapeText then
    Msg.Result := Ord(TCustomShapeText(FModifyShape).SelLength > 0)
  else Msg.Result := Ord((SelectTools = pstModify) and
    (FShapeList.SelectCount > 0));
end;

procedure TLovelyPaint21.LPCANDELETE(var Msg: TMessage);
begin
  if FModifyShape is TCustomShapeText then
    Msg.Result := Ord(TCustomShapeText(FModifyShape).SelLength > 0)
  else Msg.Result := Ord((SelectTools = pstModify) and
    (FShapeList.SelectCount > 0));
end;

procedure TLovelyPaint21.LPCANPASTE(var Msg: TMessage);
begin
  if FModifyShape is TCustomShapeText then
    Msg.Result := Ord(Clipboard.HasFormat(CF_TEXT))
  else Msg.Result := Ord((SelectTools in [pstModify, pstPaint]) and
    (Clipboard.HasFormat(CF_SHAPES) or
    Clipboard.HasFormat(CF_TEXT) or
    Clipboard.HasFormat(CF_BITMAP)));
end;

procedure TLovelyPaint21.LPCANREDO(var Msg: TMessage);
begin
  if FModifyShape is TCustomShapeText then
    Msg.Result := Ord(TCustomShapeText(FModifyShape).CanRedo)
  else Msg.Result := Ord(CanRedo);
end;

procedure TLovelyPaint21.LPCANSELECTALL(var Msg: TMessage);
begin
  if FModifyShape is TCustomShapeText then
    Msg.Result := Ord(TCustomShapeText(FModifyShape).Text <> '')
  else Msg.Result := Ord((SelectTools in [pstModify, pstPaint]) and (FShapeList.Count > 0) and
    (FShapeList.Count > FShapeList.SelectCount));
end;

procedure TLovelyPaint21.LPCANUNDO(var Msg: TMessage);
begin
  if FModifyShape is TCustomShapeText then
    Msg.Result := Ord(TCustomShapeText(FModifyShape).CanUndo)
  else Msg.Result := Ord(CanUndo);
end;

procedure TLovelyPaint21.LPCOPY(var Msg: TMessage);
begin
  if FModifyShape is TCustomShapeText then
    TCustomShapeText(FModifyShape).CopyToClipboard
  else CopyToClipboard;
end;

procedure TLovelyPaint21.LPCUT(var Msg: TMessage);
begin
  if FModifyShape is TCustomShapeText then
  begin
    if TCustomShapeText(FModifyShape).CutToClipboard then
    begin
      DrawCurrent;
      DrawPaint;
      UpdateCaret;
      Invalidate;
    end;
  end else CutToClipboard;
end;

procedure TLovelyPaint21.LPDELETE(var Msg: TMessage);
begin
  if FModifyShape is TCustomShapeText then
  begin
    if TCustomShapeText(FModifyShape).Delete then
    begin
      DrawCurrent;
      DrawPaint;
      UpdateCaret;
      Invalidate;
    end;
  end else Delete;
end;

procedure TLovelyPaint21.LPPASTE(var Msg: TMessage);
begin
  if FModifyShape is TCustomShapeText then
  begin
    if TCustomShapeText(FModifyShape).PasteFromClipboard then
    begin
      DrawCurrent;
      DrawPaint;
      UpdateCaret;
      Invalidate;
    end;
  end else PasteFromClipboard;
end;

procedure TLovelyPaint21.LPREDO(var Msg: TMessage);
begin
  if FModifyShape is TCustomShapeText then
  begin
    if TCustomShapeText(FModifyShape).Redo then
    begin
      DrawCurrent;
      DrawPaint;
      UpdateCaret;
      Invalidate;
    end;
  end else Redo;
end;

procedure TLovelyPaint21.LPSELECTALL(var Msg: TMessage);
begin
  if FModifyShape is TCustomShapeText then
  begin
    if TCustomShapeText(FModifyShape).SelectAll then
    begin
      DrawCurrent;
      DrawPaint;
      UpdateCaret;
      Invalidate;
    end;
  end else SelectAll;
end;

procedure TLovelyPaint21.LPUNDO(var Msg: TMessage);
begin
  if FModifyShape is TCustomShapeText then
  begin
    if TCustomShapeText(FModifyShape).Undo then
    begin
      DrawCurrent;
      DrawPaint;
      UpdateCaret;
      Invalidate;
    end;
  end else Undo;
end;

procedure TLovelyPaint21.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
{$J+}
const
  vLastTickCount: Longword = 0;
{$J-}
var
  vPoint: TPoint; // 绝对坐标
  vFromPoint, vToPoint: TPoint;
  vHotShape: TCustomShape;
begin
  inherited;
  FMouseDown := True;
  vPoint := MouseToPoint(Point(X, Y));                                          //2007-04-03 ZswangY37 No.1
  if not Focused then Windows.SetFocus(Handle);
  if SelectTools = pstFollow then Exit;
  if Button = mbRight then
  begin
    case FSelectTools of
      pstLabel:
        begin
          FLabelStyle := Ord(FLabelStyle = 0);
//          AcceptLabel(FControlIdent,                                          //2007-06-04 ZswangY37 No.1
//            vPoint, FLabelColor, FLabelStyle, FLabelName, False);
//          if Assigned(FOnLabelChange) then
//            FOnLabelChange(Self, vPoint, False);
          UpdateCursor;
        end;
    pstLaser:
      begin
        FLaserPoint := vPoint;
        LaserActive := not FLaserActive;                                        //2007-08-28 ZswangY37 No.2
        UpdateCursor;
        DrawPaint;
        PaintThis;
        FLaserDownCount := 0;
        if Assigned(FOnLaserChange) then
          FOnLaserChange(Self, FLaserPoint, not FLaserActive);
      end;
    end;
  end;
  if Button <> mbLeft then Exit;
  if FKeyMoving then Exit;
  if (SelectTools <> pstModify) and
    not PtInRect(FBackBitmap.Canvas.ClipRect, vPoint) then Exit;
  FDownPoint := vPoint;
  FSelectRect.TopLeft := Point(X, Y);
  case SelectTools of
    pstLabel:
      begin
        AcceptLabel(FControlIdent,
          vPoint, FLabelColor, FLabelStyle, FLabelName, False);
        if Assigned(FOnLabelChange) then
          FOnLabelChange(Self, vPoint, False);
      end;
    pstLaser:
      if FLaserActive then
      begin
        FLaserDownPoint := vPoint;                                              //2007-08-28 ZswangY37 No.2
        FLaserDownCount := 50;
        FTimerLaser.Enabled := True;
        DrawPaint;
        if Assigned(FOnLaserChange) then
          FOnLaserChange(Self, Point(-vPoint.X, -vPoint.Y), not FLaserActive);
      end;
    pstModify:
      begin
        FMovePoint := vPoint;
        if Assigned(FModifyShape) and FModifyShape.HotPoint(vPoint) then
          FShapeList.HighlightShape := FModifyShape
        else FShapeList.HighlightShape := FShapeList.HotShape(vPoint);

        if FShapeList.HotAnchor(vPoint, FAnchorIndex, FAnchorShape)then
        begin
          Screen.Cursor := FAnchorShape.GetAnchorCursor(FAnchorIndex, True);
          FAnchorAngle := FAnchorShape.Angle;
          FAnchorCenter := CenterPoint(FAnchorShape.Rect);
          FAnchoring := True;
          Exit;
        end;
        FAnchoring := False;

        if Assigned(FShapeList.HighlightShape) then
        begin
          if FShapeList.HighlightShape = FModifyShape then // 点中的是同一控件
          begin
            if not TCustomShapeText(FModifyShape).MouseDown(
              Button, Shift, vPoint.X, vPoint.Y) then Exit;
            DrawCurrent;
            DrawPaint;
            UpdateCaret;
            Invalidate;
            Exit;
          end else ShapeAccept;
          if (GetTickCount - vLastTickCount <= GetDoubleClickTime) and
            (FShapeList.HighlightShape is TCustomShapeText) then // 双击修改文本
          begin
            FShapeList.ClearSelect;
            FShapeList.HighlightShape.Selected := True;
            TCustomShapeText(FShapeList.HighlightShape).OldText :=
              TCustomShapeText(FShapeList.HighlightShape).Text; 
            TCustomShapeText(FShapeList.HighlightShape).Modified := True;
            Cursor := crDefault;
            //FShapeList.ModifyShape := FShapeList.HighlightShape;
            FModifyShape := FShapeList.HighlightShape;
            if not TCustomShapeText(FModifyShape).MouseDown(
              Button, Shift, vPoint.X, vPoint.Y) then Exit;
            DrawShape;
            DrawCurrent;
            DrawPaint;
            UpdateCaret;
            Invalidate;
            Exit;
          end;
          vLastTickCount := GetTickCount;
          ClipCursor(True);
          if ssShift in Shift then
          begin
            FShapeList.HighlightShape.Selected :=
              not FShapeList.HighlightShape.Selected;
            DrawShape;                                                          //2007-05-24 ZswangY37 No.2
            DrawCurrent;
            DrawPaint;
            PaintThis;
          end else if not FShapeList.HighlightShape.Selected then
          begin
            FShapeList.ClearSelect;
            FShapeList.HighlightShape.Selected := True;
            DrawShape;
            DrawCurrent;
            DrawPaint;
            PaintThis;
          end;
        end else
        begin
          ShapeAccept;
          if ([ssShift, ssAlt, ssCtrl] * Shift = []) and
            (FShapeList.SelectCount > 0) then
          begin
            FShapeList.ClearSelect;
            DrawShape;
            DrawCurrent;
            DrawPaint;
            PaintThis;
          end;
        end;
      end;
    pstPaint:
      begin
        if (FModifyShape is TCustomShapeText) and
          FModifyShape.HotPoint(vPoint) then
        begin
          if not TCustomShapeText(FModifyShape).MouseDown(
            Button, Shift, vPoint.X, vPoint.Y) then Exit;
          DrawCurrent;
          DrawPaint;
          UpdateCaret;
          Invalidate;
          Exit;
        end;
        case SelectShape of
          stEdit, stMemo:
            begin
              vHotShape := FShapeList.HotShape(vPoint);
              if vHotShape is TCustomShapeText then // 如果按下的是文字
              begin
                ShapeAccept;
                TCustomShapeText(FShapeList.HighlightShape).OldText :=
                  TCustomShapeText(FShapeList.HighlightShape).Text;
                TCustomShapeText(FShapeList.HighlightShape).Modified := True;
                Cursor := crDefault;
                FModifyShape := FShapeList.HighlightShape;
                TCustomShapeText(FModifyShape).MouseDown(
                  Button, Shift, vPoint.X, vPoint.Y);
                DrawShape;
                DrawCurrent;
                DrawPaint;
                UpdateCaret;
                Invalidate;
                Exit;
              end else if Assigned(FModifyShape) then
              begin
                ShapeAccept;
                Exit;
              end;
            end;
        end;
        ClipCursor(True);
        FModifyShape := NewShape(SelectShape);
        if not Assigned(FModifyShape) then
        begin
          DrawCurrent;
          DrawPaint;
          PaintThis;
          Exit;
        end;
        FModifyShape.PenColor := SelectPenColor;
        FModifyShape.PenWidth := SelectPenWidth;
        FModifyShape.Translucency := SelectTranslucency;

        case FindShapeModify(FModifyShape.ClassType) of
          smPoints, smPloy:
            TCustomShapePoints(FModifyShape).Append(vPoint);
          smLine, smRect:
            begin
              TCustomShapeRect(FModifyShape).FromPoint := vPoint;
              TCustomShapeRect(FModifyShape).ToPoint := vPoint;
            end;
          smVector:
            begin
              FFirstMouse := True;
              vFromPoint := vPoint;
              vToPoint := vPoint;
              vFromPoint.X := vFromPoint.X - cMinVectorSize div 2;
              vFromPoint.Y := vFromPoint.Y - cMinVectorSize div 2;
              vToPoint.X := vToPoint.X + cMinVectorSize div 2;
              vToPoint.Y := vToPoint.Y + cMinVectorSize div 2;
              TCustomShapeRect(FModifyShape).FromPoint := vFromPoint;
              TCustomShapeRect(FModifyShape).ToPoint := vToPoint;
              TCustomShapeVector(FModifyShape).ModelText := SelectModel;
            end;
          smText:
            begin
              FModifyShape.PenColor := SelectTextColor;                         //2007-03-14 ZswangY37 No.1
              FModifyShape.PenWidth := SelectTextSize;                          //2007-03-20 ZswangY37 No.1
              TCustomShapeText(FModifyShape).Point := vPoint;
              TCustomShapeText(FModifyShape).FontName := Font.Name;             //2007-01-05 ZswangY37 No.1
            end;
          smImage:
            begin
              { TODO -c2007.01.05 -oZswangY37 : 常规图像BMP、JPG }
              // TCustomShapeImage(FModifyShape).Point := vPoint;
            end;
        end;
        FModifyShape.Modified := True;
        DrawCurrent;
        DrawPaint;
        if FModifyShape is TCustomShapeText then
        begin
          TCustomShapeText(FModifyShape).Zoom := FZoom;
          UpdateCaret;
          Invalidate;
        end else
        begin
          DrawPaint;
          PaintThis;
        end;
      end;
    pstBrowse:
      begin
      end;
  end;
end;

procedure TLovelyPaint21.MouseMove(Shift: TShiftState; X, Y: Integer);
const cBoardSpace = 20; // 边缘滚动感应区
var
  vShapeModify: TShapeModify;
  vHotShape: TCustomShape;
  vPoint: TPoint;
  vAnchorIndex: Integer;
  vAnchorShape: TCustomShape;
begin
  inherited;
  if SelectTools = pstFollow then Exit; // 如果在跟随状态
  if FKeyMoving then
  begin
    FKeyMoving := (GetKeyState(VK_LEFT) and $80 = $80) or                       //2006-12-18 ZswangY37 No.2
      (GetKeyState(VK_RIGHT) and $80 = $80) or
      (GetKeyState(VK_UP) and $80 = $80) or
      (GetKeyState(VK_DOWN) and $80 = $80); // 重新计算按钮是否按下
    if FKeyMoving then Exit;
  end;
  vPoint := MouseToPoint(Point(X, Y));
//{$IFDEF DEF_OUTPUTDEBUG}
//OutputDebugString(PChar(Format('·～%d:MouseToPoint(%d,%d)', [GetTickCount, vPoint.X, vPoint.Y])));
//{$ENDIF}
  if IsScreenPaint and (Zoom > 1) then
  begin
    FScrollOrigin := Point(0, 0);
    if X <= cBoardSpace then
      FScrollOrigin.X := -(cBoardSpace - X)
    else if X >= ClientWidth - cBoardSpace then
      FScrollOrigin.X := +(cBoardSpace - (ClientWidth - X));
    if Y <= cBoardSpace then
      FScrollOrigin.Y := -(cBoardSpace - Y)
    else if Y >= ClientHeight - cBoardSpace then
      FScrollOrigin.Y := +(cBoardSpace - (ClientHeight - Y));
    FTimerScroll.Enabled := (FScrollOrigin.X <> 0) or (FScrollOrigin.Y <> 0); 
  end;

  if PtInRect(FBackBitmap.Canvas.ClipRect, vPoint) then
  begin
    if not FMouseInBox then
    begin
      FMouseInBox := True;
      UpdateCursor;
    end;
  end else
  begin
    if FMouseInBox then
    begin
      FMouseInBox := False;
      UpdateCursor;
    end;
  end;
  case SelectTools of
    pstLaser:
      begin
        if FLaserActive then
        begin
          FLaserPoint := vPoint;
          if not FTimerLaser.Enabled then
          begin
            DrawPaint;
            PaintThis;
          end;
          if Assigned(FOnLaserChange) then
            FOnLaserChange(Self, FLaserPoint, not FLaserActive);
        end;
      end;
    pstPhoto:
      begin
        if FMouseDown then
        begin
          if not (ssLeft in Shift) then Exit;
          FPhotoRect.TopLeft := FDownPoint;
          FPhotoRect.BottomRight := vPoint;
          FPhotoRect := ReviseRect(FPhotoRect);
          PaintThis;
        end;
      end;
    pstModify:
      begin
        if FModifyShape is TCustomShapeText then
        begin
          if not (ssLeft in Shift) then Exit;
          if not TCustomShapeText(FModifyShape).MouseMove(
            Shift, vPoint.X, vPoint.Y) then Exit;
          DrawCurrent;
          DrawPaint;
          PaintThis;
          Exit;
        end;
        if FMouseDown and (ssLeft in Shift) then                                //2007-01-02 ZswangY37 No.1
        begin
          if FAnchoring then
          begin
            if FAnchorIndex = 8 then
            begin
              FShapeList.SelectAngle(FAnchorShape.CalcAngle(vPoint));
              DrawShape;
              DrawCurrent;
              DrawPaint;
              PaintThis;
            end else
            begin
              FAnchorShape.AnchorResize(FAnchorIndex, FAnchorCenter, vPoint);
              DrawShape;
              DrawCurrent;
              DrawPaint;
              PaintThis;
            end;
            Exit;
          end;

          if (FShapeList.SelectCount > 0) and
            (Assigned(FShapeList.HighlightShape) or (ssCtrl in Shift)) then
          begin
            if not FMouseMoving then // 第一次移动
            begin
              FMouseMoving := True;
              DrawShape;
            end;
            FShapeList.SelectOffset(
              Point(vPoint.X - FMovePoint.X, vPoint.Y - FMovePoint.Y));
            { DONE -c2006.11.25 -oZswangY37 : 不用实时移动更新 }
            FMovePoint := vPoint;
            DrawCurrent;
            DrawPaint;
            PaintThis;
          end else // 画线选中
          begin
            Canvas.Brush.Style := bsClear;
            Canvas.Pen.Mode := pmNotXor;
            Canvas.Pen.Color := clBlack;
            Canvas.Pen.Width := 1;
            if FHasSelectRect then Canvas.Rectangle(FSelectRect); // 清除上次绘制
            FSelectRect.BottomRight := Point(X, Y);
            Canvas.Rectangle(FSelectRect);
            FHasSelectRect := True;
          end;
        end else
        begin
          if FShapeList.HotAnchor(vPoint, vAnchorIndex, vAnchorShape)then
          begin
            if (vAnchorShape = vAnchorShape) and
              (FAnchorIndex = vAnchorIndex) then Exit; // 相同
            FAnchorIndex := vAnchorIndex;
            FAnchorShape := vAnchorShape;
            Cursor := FAnchorShape.GetAnchorCursor(FAnchorIndex, False);
            Exit;
          end;
          FAnchorIndex := -1;
          FAnchorShape := nil;
          vHotShape := FShapeList.HotShape(vPoint);
          if vHotShape <> FShapeList.HighlightShape then
          begin
            FShapeList.HighlightShape := vHotShape;
            DrawShape;
            DrawCurrent;
            DrawPaint;
            PaintThis;
          end;
        end;
        if Assigned(FShapeList.HighlightShape) and
          not FShapeList.HighlightShape.Modified then
           Cursor := crSizeAll
        else Cursor := crDefault;
      end;
    pstPaint:
      begin
        if not (ssLeft in Shift) then
        begin
          case FSelectShape of
            stEdit, stMemo:
              begin
                FAnchorIndex := -1;
                FAnchorShape := nil;
                vHotShape := FShapeList.HotShape(vPoint);
                if not (vHotShape is TCustomShapeText) then
                begin
                  vHotShape := nil;
                  if Assigned(FModifyShape) and
                    not FModifyShape.HotPoint(vPoint) then
                    Cursor := crDefault
                  else Cursor := FindShapeCursor(stMemo);                       //2007-11-24 ZswangY37 No.1
                end else Cursor := FindShapeCursor(stMemo);
                if vHotShape <> FShapeList.HighlightShape then
                begin
                  FShapeList.HighlightShape := vHotShape;
                  DrawShape;
                  DrawCurrent;
                  DrawPaint;
                  PaintThis;
                end;
              end;
          end;
          Exit;
        end;
        if not Assigned(FModifyShape) then Exit; // 没有编辑的图形
        vShapeModify := FindShapeModify(FModifyShape.ClassType);
        case vShapeModify of
          smPoints, smPloy: TCustomShapePoints(FModifyShape).Append(vPoint);
          smRect, smLine, smVector:
            with TCustomShapeRect(FModifyShape) do
            begin
              if (vShapeModify = smVector) and FFirstMouse then
              begin
                FFirstMouse := False;
                FromPoint := Point(
                  FromPoint.X + cMinVectorSize div 2,
                  FromPoint.Y + cMinVectorSize div 2
                );
              end;
              if ssShift in Shift then
                case vShapeModify of
                  smLine: vPoint := Angle8Point(FromPoint, vPoint);
                else
                  begin
                    if Abs(FromPoint.X - vPoint.X) < Abs(FromPoint.Y - vPoint.Y) then
                      vPoint.Y := FromPoint.Y - Sign(FromPoint.Y - vPoint.Y) * Abs(FromPoint.X - vPoint.X)
                    else vPoint.X := FromPoint.X - Sign(FromPoint.X - vPoint.X) * Abs(FromPoint.Y - vPoint.Y);
                  end;
                end;
              ToPoint := vPoint;
            end;
          smText: if not TCustomShapeText(FModifyShape).MouseMove(
            Shift, vPoint.X, vPoint.Y) then Exit;
          smImage: ; // TCustomShapeImage(FModifyShape).Point := vPoint;
        end;
        DrawCurrent;
        DrawPaint;
        PaintThis;
      end;
  end;
end;

function TLovelyPaint21.MouseToPoint(APoint: TPoint): TPoint;
begin
  Result := Point(
    Trunc((APoint.X + FOrigin.X - FBorder.X) / FZoom),
    Trunc((APoint.Y + FOrigin.Y - FBorder.Y) / FZoom)
  );
end;

procedure TLovelyPaint21.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  vPoint: TPoint;
  vIdents: TIdents;
  vCommand: PCommandInfo;
  vBitmap: TBitmap;
begin
  inherited;
  FMouseDown := False;
  if SelectTools = pstFollow then Exit; 
  if Button <> mbLeft then Exit;
  if FKeyMoving then Exit;
  ClipCursor(False);

  vPoint := MouseToPoint(Point(X, Y));
  case SelectTools of
    pstModify:
      begin
        if FAnchoring then
        begin
          if FAnchorIndex = 8 then
          begin
            // TODO : 发送消息
            if FAnchorShape.Angle <> FAnchorAngle then
            begin
              if FAnchorShape.Angle < FAnchorAngle then // 计算变化的角度
                FAnchorAngle := 255 + FAnchorShape.Angle - FAnchorAngle
              else FAnchorAngle := FAnchorShape.Angle - FAnchorAngle;
              FShapeList.SelectIdents(vIdents);
              vCommand := FCommandList.NewAngleCommand(FAnchorAngle, vIdents);
              FCommandRedo.Clear;
              if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
                cCommandInfoHeadSize + vCommand^.rParamSize);
              SetLength(vIdents, 0);
              vIdents := nil;
            end;
          end else
          begin
            vCommand := FCommandList.NewChangeCommand(FAnchorShape);
            FCommandRedo.Clear;
            if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
              cCommandInfoHeadSize + vCommand^.rParamSize);
          end;
          FAnchoring := False;
          FAnchorIndex := -1;
          FAnchorAngle := 0;
          FAnchorShape := nil;
        end;
        if FHasSelectRect then
        begin
          ///////Begin 清除选中框
          Canvas.Brush.Style := bsClear;
          Canvas.Pen.Mode := pmNotXor;
          Canvas.Pen.Width := 1;
          Canvas.Rectangle(FSelectRect);
          ///////End 清除选中框
          FSelectRect.TopLeft := MouseToPoint(FSelectRect.TopLeft);             //2007-08-29 ZswangY37 No.3
          FSelectRect.BottomRight := MouseToPoint(FSelectRect.BottomRight);
          { DONE -c2006.11.28 -oZswangY37 : 选中矩形中的图形 }
          if FShapeList.SelectRect(FSelectRect, not (ssAlt in Shift)) > 0 then
          begin
            DrawShape;
            DrawCurrent;
            DrawPaint;
            PaintThis;
          end;
        end else
        begin
          if FMouseMoving and (FShapeList.SelectCount > 0) and
            ((vPoint.X <> FDownPoint.X) or (vPoint.Y <> FDownPoint.Y)) then // 移动完成
          begin
            FShapeList.SelectIdents(vIdents);
            vCommand := FCommandList.NewOffsetCommand(
              Point(vPoint.X - FDownPoint.X, vPoint.Y - FDownPoint.Y), vIdents);
            FCommandRedo.Clear;
            if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
              cCommandInfoHeadSize + vCommand^.rParamSize);
            SetLength(vIdents, 0);
            vIdents := nil;
          end;
          FMouseMoving := False;
          DrawShape;                                                            //2007-05-24 ZswangY37 No.3
          DrawCurrent;
          DrawPaint;
          PaintThis;
        end;
      end;
    pstPaint:
      begin
        if not Assigned(FModifyShape) then Exit;
        if FModifyShape is TCustomShapeText then
        begin
          if TCustomShapeText(FModifyShape).MouseUp(
            Button, Shift, X, Y) then Exit;
          DrawCurrent;
          DrawPaint;
          UpdateCaret;
          Invalidate;
          Exit;
        end;
        ShapeAccept;
        PaintThis;
      end;
    pstPhoto:
      begin
        PaintThis;
        if not IsRectEmpty(FPhotoRect) then // 非空
        begin
          vBitmap := TBitmap.Create;
          try
            TakeDesktop(vBitmap, FPhotoRect);
            Clipboard.Assign(vBitmap);
          finally
            vBitmap.Free;
          end;
        end;
      end;
  end;
  FHasSelectRect := False;
end;

function TLovelyPaint21.PageHeight(mZoom: Double; mBorder: Boolean = False): Integer;
begin
  if mBorder then
    Result := Trunc(FBackBitmap.Height * mZoom) + cPageSpace + FBorderWidth * 2
  else Result := Trunc(FBackBitmap.Height * mZoom) + cPageSpace + FBorder.Y * 2;
end;

function TLovelyPaint21.PageWidth(mZoom: Double; mBorder: Boolean = False): Integer;
begin
  if mBorder then
    Result := Trunc(FBackBitmap.Width * mZoom) + cPageSpace + FBorderWidth * 2
  else Result := Trunc(FBackBitmap.Width * mZoom) + cPageSpace + FBorder.X * 2;
end;

procedure TLovelyPaint21.Paint;
begin
  inherited;
(*
  ///////Begin 绘制底图
  Canvas.Pen.Mode := pmCopy;
  Canvas.Brush.Color := Color;
  Canvas.FillRect(Canvas.ClipRect);
  ///////End 绘制底图
*)
  if FZoom = 0 then Exit;
  PaintThis;
  if FHasSelectRect then
  begin
    Canvas.Brush.Style := bsClear;
    Canvas.Pen.Mode := pmNotXor;
    Canvas.Pen.Color := clBlack;
    Canvas.Pen.Width := 1;
    Canvas.Rectangle(FSelectRect);
  end;
end;

procedure TLovelyPaint21.PaintThis;
var
  vRect: TRect;
  T: Integer;
begin
  if FUpdateing then Exit;
  if not HandleAllocated then Exit;                                             //2006-12-29 ZswangY37 No.1
  Canvas.Pen.Mode := pmCopy;                                                    //2007-08-29 ZswangY37 No.2

  if ShadowColor <> clNone then
  begin
    Canvas.Brush.Color := Color;
    vRect.TopLeft := Point(0, 0);
    vRect.BottomRight := PointToMouse(Point(0, 0));
    vRect.Right := ClientWidth;
    Canvas.FillRect(vRect);
    
    vRect.TopLeft := Point(0, 0);
    vRect.BottomRight := PointToMouse(Point(0, 0));
    vRect.Bottom := ClientHeight;
    Canvas.FillRect(vRect);

    vRect.TopLeft := PointToMouse(Point(FBackBitmap.Width, FBackBitmap.Height));
    vRect.BottomRight := Point(ClientWidth, ClientHeight);
    vRect.Top := vRect.Top + 2;
    vRect.Left := 0;
    Canvas.FillRect(vRect);

    vRect.TopLeft := PointToMouse(Point(FBackBitmap.Width, FBackBitmap.Height));
    vRect.BottomRight := Point(ClientWidth, ClientHeight);
    vRect.Top := 0;
    vRect.Left := vRect.Left + 2;
    Canvas.FillRect(vRect);

    ///////Begin 画边框
    vRect.TopLeft := PointToMouse(Point(0, 0));
    vRect.BottomRight := PointToMouse(Point(FBackBitmap.Width, FBackBitmap.Height));
    Canvas.Brush.Style := bsClear;
    Canvas.Pen.Color := clBlack;
    Canvas.Pen.Width := 1;
    vRect := ZoomRect(vRect, 1);
    Canvas.Rectangle(vRect);

    Canvas.MoveTo(vRect.Right, vRect.Top + 1);
    Canvas.LineTo(vRect.Right, vRect.Bottom + 1);
    Canvas.MoveTo(vRect.Left + 1, vRect.Bottom);
    Canvas.LineTo(vRect.Right + 1, vRect.Bottom);
    ///////End 画边框
  end;

  vRect.TopLeft := PointToMouse(Point(0, 0));
  vRect.BottomRight := PointToMouse(Point(FBackBitmap.Width, FBackBitmap.Height));
  Canvas.CopyRect(vRect, FPaintBitmap.Canvas, vRect);

  if (FSelectTools = pstPhoto) and FMouseDown then
  begin
    Canvas.Pen.Style := psDash;
    vRect.TopLeft := PointToMouse(FPhotoRect.TopLeft);
    vRect.BottomRight := PointToMouse(FPhotoRect.BottomRight);
    Canvas.Rectangle(vRect);
    Canvas.Font := Screen.MenuFont;
    if vRect.Top > 20 then
      T := vRect.Top - 20
    else T := Min(ClientHeight - 20, vRect.Top + (vRect.Bottom - vRect.Top) + 2);
    Canvas.Brush.Color := $00AAFFFF;
    Canvas.TextOut(vRect.Left, T, Format('截图到剪贴板(%dx%d)',
      [vRect.Right - vRect.Left, vRect.Bottom - vRect.Top]));
  end;
end;

function TLovelyPaint21.PasteFromClipboard: Boolean;
var
  vShapeStream: TMemoryStream;
  vResourceStream: TMemoryStream;
  vData: THandle;
  vGlobal: Pointer;
  vShape: TCustomShape;
  vShapeInfo: TShapeInfo;
  //vInfo: PShapeInfo;
  vCommand: PCommandInfo;
  vBitmap: TBitmap;
  vJpegImage: TJpegImage;
  vResourceInfo: PResourceInfo;
  vPoint: TPoint;
  vOrigin: TPoint;
  vAppend: Boolean;
  I, J: Integer;
  S: string;
begin
  Result := False;
  ShapeAccept;
  { TODO : 检查是否有资源 }
  vOrigin := PointToMouse(Point(0, 0));                                         //2007-08-28 ZswangY37 No.1
  if vOrigin.X < 0 then vOrigin.X := 0;
  if vOrigin.Y < 0 then vOrigin.Y := 0;
  vOrigin := MouseToPoint(vOrigin);

  { 粘贴图片 }
  if Clipboard.HasFormat(CF_BITMAP) then                                        //2011-04-03 ZswangY37 No.4
  begin
    FShapeList.ClearSelect;
    vBitmap := TBitmap.Create;
    vBitmap.PixelFormat := pf24bit;
    vJpegImage := TJpegImage.Create;
    try
      vBitmap.Assign(Clipboard);
      BmpToJpeg(vBitmap, vJpegImage, 75);
      Result := PasteImage(vOrigin, vJpegImage);
    finally
      vJpegImage.Free;
      vBitmap.Free;
    end;
  end;

  { 粘贴文字 }
  if Clipboard.HasFormat(CF_TEXT) then
  begin
    S := Trim(Clipboard.AsText);
    if S = '' then Exit;
    FShapeList.ClearSelect;

    vShape := NewShape(stMemo);
    vShape.Translucency := SelectTranslucency;
    vShape.PenColor := SelectPenColor;
    vShape.PenWidth := SelectTextSize;                                          //2007-06-14 ZswangY37 No.1

    TCustomShapeText(vShape).Text := Copy(WideString(S), 1, cMemoMaxLength);
    TCustomShapeText(vShape).FontName := FShapeList.FontName;
    TCustomShapeText(vShape).Zoom := FShapeList.Zoom;
    TCustomShapeText(vShape).Point := vOrigin;
    TCustomShapeText(vShape).UpdateRect;
    FModifyShape := vShape;
    ShapeAccept;
    Result := True;
    Exit;
  end;
  if not Clipboard.HasFormat(CF_SHAPES) then Exit;

  vShapeStream := TMemoryStream.Create;
  try
    Clipboard.Open;
    vData := GetClipboardData(CF_SHAPES);
    if GlobalSize(vData) >= 2000 then Exit; // 数据量太大
    try
      //TODO : 粘贴资源
      if Clipboard.HasFormat(CF_RESOURCES) then                                 //2007-11-26 ZswangY37 No.1
      begin
        vData := GetClipboardData(CF_RESOURCES);
        vGlobal := GlobalLock(vData);
        vResourceStream := TMemoryStream.Create;
        try
          vResourceStream.Write(vGlobal^, GlobalSize(vData));
          vResourceStream.Position := 0;
          J := FResourceList.ReadStream(vResourceStream, vAppend);
          while J >= 0 do
          begin
            if vAppend then // 发生了添加
            begin
              vResourceInfo := FResourceList[J];
              I := 0;
              vCommand := FCommandList.NewResourceCommand(vResourceInfo, I);
              while Assigned(vCommand) do
              begin
                if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
                  cCommandInfoHeadSize + vCommand^.rParamSize);
                FreeMem(vCommand, cCommandInfoHeadSize + vCommand.rParamSize);  //2007-12-20 ZswangY37 No.1
                vCommand := FCommandList.NewResourceCommand(vResourceInfo, I);
              end;
            end;
            J := FResourceList.ReadStream(vResourceStream, vAppend);
          end;
        finally
          GlobalUnlock(vData);
          vResourceStream.Free;
        end;
      end;
      vData := GetClipboardData(CF_SHAPES);
      vGlobal := GlobalLock(vData);
      try
        vShapeStream.Write(vGlobal^, GlobalSize(vData));
        vShapeStream.Position := 0;
        { DONE -c2006.12.11 -oZswangY37 : 从剪贴板中粘贴 }
        FShapeList.ClearSelect;
        vPoint := Point(MaxInt, MaxInt);
        while vShapeStream.Read(vShapeInfo, cShapeInfoHeadSize) > 0 do
        begin
          { TODO -c2006.12.01 -oZswangY37 : 判断DataSize是否合法 }
          vShape := NewShape(vShapeInfo.rType);
          if Assigned(vShape) then
          begin
            vShapeStream.Seek(-cShapeInfoHeadSize, soFromCurrent);
            //vInfo := Pointer(Integer(vShapeStream.Memory) + vShapeStream.Position);
            vShape.StreamRead(vShapeStream);
            vShape.Selected := True;
            if vShape is TCustomShapeText then                                  //2007-05-23 ZswangY37 No.2
            begin
              TCustomShapeText(vShape).FontName := FShapeList.FontName;
              TCustomShapeText(vShape).Zoom := FShapeList.Zoom;
            end;
            if vShape.HasResource and Assigned(FResourceList) then
            begin
              I := FResourceList.IndexFromCrc32(
                vShape.ResourceCrc32, vShape.ResourceSize);
              if I >= 0 then
              begin
                vResourceInfo := FResourceList[I];
                vShape.SetResource(@vResourceInfo^.rData[0], vResourceInfo^.rSize);
              end;
            end;
            vShape.UpdateRect;
            if vPoint.X > vShape.Rect.Left then vPoint.X := vShape.Rect.Left;
            if vPoint.Y > vShape.Rect.Top then vPoint.Y := vShape.Rect.Top;
            FShapeList.Append(vShape);
            //vInfo^.rIdent := vShape.Ident; // 更新图形标识                    //2007-05-24 ZswangY37 No.4
            Result := True;
          end else vShapeStream.Seek(vShapeInfo.rDataSize, soFromCurrent);
        end;
        if Result then
        begin
          { 位置移到左上 }
          FShapeList.SelectOffset(
            Point(vOrigin.X - vPoint.X, vOrigin.Y - vPoint.Y));                 //2007-05-24 ZswangY37 No.4
          vShapeStream.Clear;
          for I := 0 to FShapeList.Count - 1 do
            if FShapeList[I].Selected then
              FShapeList[I].StreamWrite(vShapeStream);

          vShapeStream.Position := 0;
          vCommand := FCommandList.NewPasteCommand(vShapeStream);
          FCommandRedo.Clear;
          if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
            cCommandInfoHeadSize + vCommand^.rParamSize);
          { DONE -c2006.12.11 -oZswangY37 : 考虑发送批量命令 }
          DrawShape;
          DrawCurrent;
          DrawPaint;
          PaintThis;
        end;
      finally
        GlobalUnlock(vData);
      end;
    finally
      Clipboard.Close;
    end;
  finally
    vShapeStream.Free;
  end;
end;

function TLovelyPaint21.PasteImage(APoint: TPoint;
  AGraphic: TGraphic): Boolean;
var
  vShapeImage: TShapeImage;
begin
  vShapeImage := TShapeImage(NewShape(stImage));
  vShapeImage.PenWidth := FSelectPenWidth;
  vShapeImage.PenColor := FSelectPenColor;
  Result := vShapeImage.PasteImage(APoint, AGraphic);
  if not Result then
  begin
    vShapeImage.Free;
    Exit;
  end;
  ShapeAccept;
  vShapeImage.UpdateRect;
  FModifyShape := vShapeImage;
  ShapeAccept;
  vShapeImage.Selected := True;
  DrawShape;
  DrawCurrent;
  DrawPaint;
  PaintThis;
end;

function TLovelyPaint21.PointToMouse(APoint: TPoint): TPoint;
begin
  Result := Point(
    FBorder.X + Trunc(FZoom * (APoint.X - Trunc(FOrigin.X / FZoom))),
    FBorder.Y + Trunc(FZoom * (APoint.Y - Trunc(FOrigin.Y / FZoom)))
  );
end;

function TLovelyPaint21.Redo: Boolean;
var
  vCommand: PCommandInfo;
begin
  Result := False;
  if FCommandRedo.Count > 0 then
  begin
    vCommand := FCommandRedo.GetItems(FCommandRedo.Count - 1);
    FCommandList.AppendCommand(vCommand);
    FCommandRedo.DeleteCommand(vCommand^.rIdent, False);
    if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
      cCommandInfoHeadSize + vCommand^.rParamSize);

    Result := ExecuteTo(FCommandList.Count - 1);
  end;
end;

procedure TLovelyPaint21.RemoveLabel;
var
  I: Integer;
  vLabelInfo: PLabelInfo;
begin
  I := FLabelList.FindLabel(FControlIdent);
  if I < 0 then Exit;
  vLabelInfo := FLabelList[I];
  AcceptLabel(FControlIdent,
    Point(vLabelInfo^.rPoint.x, vLabelInfo^.rPoint.y), FLabelColor,
    FLabelStyle, FLabelName, True);
  if Assigned(FOnLabelChange) then
    FOnLabelChange(Self,
      Point(vLabelInfo^.rPoint.x, vLabelInfo^.rPoint.y), True);
end;

procedure TLovelyPaint21.Replay; // 重新开始
var
  vCommandInfo: TCommandInfo;
begin
  if Assigned(FOnCommand) then
  begin
    vCommandInfo.rIdent := MakeLong(FCommandList.FLastIdent, MaxWord);
    vCommandInfo.rType := scReplay;
    vCommandInfo.rParamSize := 0;
    FOnCommand(Self, @vCommandInfo,
      cCommandInfoHeadSize + vCommandInfo.rParamSize);
  end;
  FCommandList.Clear;
  FCommandRedo.Clear;
  FShapeList.Clear;
  FLabelList.Clear;
  FCommandList.FLastIdent := 0;
  FShapeList.FLastIdent := 0;
  DrawShape;
  DrawCurrent;
  DrawPaint;
  PaintThis;
end;

procedure TLovelyPaint21.Resize;
begin
  inherited;
  case FAdaptStyle of
    asSize: AdaptToSize;
    asWidth: AdaptToWidth;
    asHeight: AdaptToHeight;
  else
    begin
      FBorder.X := Max(FBorderWidth,
        Trunc(ClientWidth - FBackBitmap.Width * FZoom - cPageSpace) div 2);
      FBorder.Y := Max(FBorderWidth,
        Trunc(ClientHeight - FBackBitmap.Height * FZoom - cPageSpace) div 2);
      UpdateCursor;
      AdjustScrollBars;                                                         //2006-12-24 ZswangY37 No.1
      UpdateCaret;
      DrawBack;
      DrawShape;
      DrawCurrent;
      DrawPaint;
      Invalidate;
    end;
  end;
end;

procedure TLovelyPaint21.ResourceAccept;
var
  vResource: Pointer;
  vSize: Integer;
  vCrc32: Longword;
  I: Integer;
  vCommand: PCommandInfo;
  vResourceInfo: PResourceInfo; 
begin
  if not Assigned(FModifyShape) then Exit;
  if not FModifyShape.GetResource(vResource, vSize) then Exit;
  try
    vCrc32 := BufferCRC32(vResource^, vSize);
    I := FResourceList.IndexFromCrc32(vCrc32, vSize);
    if I >= 0 then
    begin
      FModifyShape.ResourceCrc32 := FResourceList[I]^.rCrc32;
      FModifyShape.ResourceSize := FResourceList[I]^.rSize;
    end else
    begin
      vResourceInfo := FResourceList.NewResource(vResource, vSize);
      FModifyShape.ResourceCrc32 := vResourceInfo^.rCrc32;
      FModifyShape.ResourceSize := vResourceInfo^.rSize;
      I := 0;
      vCommand := FCommandList.NewResourceCommand(vResourceInfo, I);
      while Assigned(vCommand) do
      begin
        if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
          cCommandInfoHeadSize + vCommand^.rParamSize);
        FreeMem(vCommand, cCommandInfoHeadSize + vCommand.rParamSize);          //2007-12-20 ZswangY37 No.1
        vCommand := FCommandList.NewResourceCommand(vResourceInfo, I);
      end;
    end;
  finally
    FreeMem(vResource, vSize);
  end;
end;

function TLovelyPaint21.SaveToFile(AFileName: TFileName): Boolean;
var
  vFileStream: TFileStream;
  vPaintFileHeader: TPaintFileHeader;
begin
  vFileStream := TFileStream.Create(AFileName, fmCreate);
  try
    vPaintFileHeader.rFlag := 'pat';
    vPaintFileHeader.rVersion := 1;
    vFileStream.Write(vPaintFileHeader, SizeOf(vPaintFileHeader) - SizeOf(Char));
    Result := SaveToStream(vFileStream);
  finally
    vFileStream.Free;
  end;
end;

function TLovelyPaint21.SaveToStream(AStream: TStream): Boolean;
begin
  Result := FResourceList.SaveToStream(AStream) and FShapeList.SaveToStream(AStream);
end;

procedure TLovelyPaint21.SelectAll;
var
  I: Integer;
begin
  ShapeAccept;
  if SelectTools = pstPaint then SelectTools := pstModify;
  for I := 0 to FShapeList.Count - 1 do
    FShapeList[I].Selected := True;
  DrawShape;
  DrawCurrent;
  DrawPaint;
  PaintThis;
end;

function TLovelyPaint21.SelectVectorShape: Boolean;
begin
  Result := False;
  if SelectTools = pstFollow then Exit; // 如果在跟随状态
  if not Assigned(FFormVectorSelectBox) then
    FFormVectorSelectBox := TFormVectorSelectBox.Create(nil);
  with FFormVectorSelectBox do
  begin
    VectorShapePath := Self.VectorShapePath;
    case ShowModal of
      mrYes, mrOK: ;
    else Exit;
    end;
    SelectTools := pstPaint;
    SelectShape := stVector;
    SelectModel := ModelText;
  end;
  Result := True;
end;

procedure TLovelyPaint21.SetAdaptStyle(const Value: TAdaptStyle);
begin
  if FAdaptStyle = Value then Exit;
  FAdaptStyle := Value;
  case FAdaptStyle of
    asSize: AdaptToSize;
    asWidth: AdaptToWidth;
    asHeight: AdaptToHeight;
  end;
end;

procedure TLovelyPaint21.SetBackGraphic(AGraphic: TGraphic);
begin
  if Assigned(AGraphic) then
  begin
    FBackBitmap.Width := AGraphic.Width;
    FBackBitmap.Height := AGraphic.Height;
    FBackBitmap.Canvas.Draw(0, 0, AGraphic);
  end;
  DrawZoom;
  DrawBack;
  DrawShape;
  DrawCurrent;
  DrawPaint;
  DoChange;
end;

procedure TLovelyPaint21.SetBorderWidth(const Value: Integer);
begin
  FBorderWidth := Value;
  DrawPaint;
  DoChange;
end;

procedure TLovelyPaint21.SetCanReangle(const Value: Boolean);
var
  I: Integer;
begin
  if FCanReangle = Value then Exit;
  FCanReangle := Value;
  for I := 0 to FShapeList.Count - 1 do
    FShapeList[I].CanReangle := FCanReangle;
end;

procedure TLovelyPaint21.SetControlIdent(const Value: Word);
begin
  FControlIdent := Value;
  FCommandList.FControlIdent := Value;
  FShapeList.FControlIdent := Value;
  FResourceList.FControlIdent := Value;
end;

procedure TLovelyPaint21.SetLabelColor(const Value: TColor);
begin
  if FLabelColor = Value then Exit;
  FLabelColor := Value;
  Invalidate;
end;

procedure TLovelyPaint21.SetLabelName(const Value: WideString);
begin
  if FLabelName = Value then Exit;
  FLabelName := Value;
  Invalidate;
end;

procedure TLovelyPaint21.SetLaserActive(const Value: Boolean);
begin
  if FLaserActive = Value then Exit;
  FLaserActive := Value;
  if Assigned(FLaserBitmap) then
  begin
    FLaserBitmap.Free;
    FLaserBitmap := nil;
  end;
  DrawPaint;
  Invalidate;
end;

procedure TLovelyPaint21.SetLaserGraphic(const Value: TGraphic);
begin
  if FLaserGraphic = Value then Exit;
  FLaserGraphic := Value;
  DrawPaint;
  Invalidate;
end;

procedure TLovelyPaint21.SetLaserPoint(const Value: TPoint);
begin
  if (FLaserPoint.X = Value.X) and (FLaserPoint.Y = Value.Y) then Exit;
  FLaserPoint := Value;
  DrawPaint;
  Invalidate;
end;

procedure TLovelyPaint21.SetModelCursor(const Value: TCursor);
begin
  if FModelCursor = Value then Exit;
  FModelCursor := Value;
  DoChange;
end;

procedure TLovelyPaint21.SetOrigin(Value: TPoint);
begin
  if Value.X > PageWidth(FZoom) - ClientWidth + 1 then
    Value.X := PageWidth(FZoom) - ClientWidth + 1;
  if Value.X < 0 then Value.X := 0;
  if Value.Y > PageHeight(FZoom) - ClientHeight + 1 then
    Value.Y := PageHeight(FZoom) - ClientHeight + 1;
  if Value.Y < 0 then Value.Y := 0;
  if (FOrigin.X = Value.X) and (FOrigin.Y = Value.Y) then Exit;
  FOrigin := Value;
  AdjustScrollBars;                                                             //2007-05-24 ZswangY37 No.1
  UpdateCaret;                                                                  //2007-05-21 ZswangY37 No.1
  DrawBack;
  DrawShape;
  DrawCurrent;
  DrawPaint;
  PaintThis;
end;

procedure TLovelyPaint21.SetSelectModel(const Value: string);
begin
  if FSelectModel = Value then Exit;
  FSelectModel := Value;
  DoChange;
end;

procedure TLovelyPaint21.SetSelectPenColor(const Value: TColor);
var
  vIdents: TIdents;
  vCommand: PCommandInfo;
begin
//  if FSelectPenColor = Value then Exit;
  FSelectPenColor := Value;
  case FSelectTools of
//    pstPaint: //2007-03-14 ZswangY37 No.2
//      if FModifyShape is TCustomShapeText then
//      begin
//        FModifyShape.PenColor := FSelectPenColor;
//        DrawCurrent;
//        DrawPaint;
//        PaintThis;
//      end;
    pstModify: if FShapeList.SelectCount > 0 then
      begin
        FShapeList.SelectIdents(vIdents);
        FShapeList.SelectPenColor(FSelectPenColor);
        vCommand := FCommandList.NewPenColorCommand(FSelectPenColor, vIdents);
        FCommandRedo.Clear;
        if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
          cCommandInfoHeadSize + vCommand^.rParamSize);
        SetLength(vIdents, 0);
        vIdents := nil;
        DrawShape;
        DrawCurrent;
        DrawPaint;
        PaintThis;
      end;
  end;
end;

procedure TLovelyPaint21.SetSelectPenWidth(const Value: Integer);
var
  vIdents: TIdents;
  vCommand: PCommandInfo;
begin
//  if FSelectPenWidth = Value then Exit;
  FSelectPenWidth := Value;
  case FSelectTools of
//    pstPaint:
//      if FModifyShape is TCustomShapeText then
//      begin
//        FModifyShape.PenWidth := FSelectPenWidth;
//        DrawCurrent;
//        DrawPaint;
//        PaintThis;
//        UpdateCaret;
//      end;
    pstModify: if FShapeList.SelectCount > 0 then
      begin
        FShapeList.SelectIdents(vIdents);
        FShapeList.SelectPenWidth(FSelectPenWidth);
        vCommand := FCommandList.NewPenWidthCommand(FSelectPenWidth, vIdents);
        FCommandRedo.Clear;
        if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
          cCommandInfoHeadSize + vCommand^.rParamSize);
        SetLength(vIdents, 0);
        vIdents := nil;
        DrawShape;
        DrawCurrent;
        DrawPaint;
        PaintThis;
      end;
  end;
end;

procedure TLovelyPaint21.SetSelectShape(const Value: TShapeType);
begin
  if FSelectShape = Value then Exit;
  FSelectShape := Value;
  if Assigned(FModifyShape) then
    ShapeAccept;
  DoChange;
end;

procedure TLovelyPaint21.SetSelectTextColor(const Value: TColor);
var
  vIdents: TIdents;
  vCommand: PCommandInfo;
begin
  FSelectTextColor := Value;
  case FSelectTools of
    pstPaint:
      if FModifyShape is TCustomShapeText then
      begin
        FModifyShape.PenColor := FSelectTextColor;
        DrawCurrent;
        DrawPaint;
        PaintThis;
      end;
    pstModify: if FShapeList.SelectCount > 0 then
      begin
        FShapeList.SelectIdents(vIdents);
        FShapeList.SelectPenColor(FSelectTextColor);
        vCommand := FCommandList.NewPenColorCommand(FSelectTextColor, vIdents);
        FCommandRedo.Clear;
        if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
          cCommandInfoHeadSize + vCommand^.rParamSize);
        SetLength(vIdents, 0);
        vIdents := nil;
        DrawShape;
        DrawCurrent;
        DrawPaint;
        PaintThis;
      end;
  end;
end;

procedure TLovelyPaint21.SetSelectTextSize(const Value: Integer);
//var
//  vIdents: TIdents;
//  vCommand: PCommandInfo;
begin
  if FSelectTextSize = Value then Exit;
  FSelectTextSize := Value;
//  case FSelectTools of
//    pstPaint:
//      if FModifyShape is TCustomShapeText then
//      begin
//        FModifyShape.PenWidth := FSelectTextSize;
//        DrawCurrent;
//        DrawPaint;
//        PaintThis;
//        UpdateCaret;
//      end;
//    pstModify: if FShapeList.SelectCount > 0 then
//      begin
//        FShapeList.SelectIdents(vIdents);
//        FShapeList.SelectPenWidth(FSelectTextSize);
//        vCommand := FCommandList.NewPenWidthCommand(FSelectTextSize, vIdents);
//        FCommandRedo.Clear;
//        if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
//          cCommandInfoHeadSize + vCommand^.rParamSize);
//        SetLength(vIdents, 0);
//        vIdents := nil;
//        DrawShape;
//        DrawCurrent;
//        DrawPaint;
//        PaintThis;
//      end;
//  end;
end;

procedure TLovelyPaint21.SetSelectTools(const Value: TShapeTools);
begin
  if FSelectTools = Value then Exit;
  if Assigned(FModifyShape) then ShapeAccept; // 如果是从绘制状态改变
  FHasSelectRect := False;
  case FSelectTools of
    pstLaser: // 如果是从光笔状态改变
      if FLaserActive then
      begin
        FLaserActive := False;
        if Assigned(FOnLaserChange) then
          FOnLaserChange(Self, FLaserPoint, not FLaserActive);
        DrawPaint;
        PaintThis;
      end;
  end;
  FSelectTools := Value;
  FShapeList.HighlightShape := nil;
  if (FSelectTools <> pstModify) and (FShapeList.SelectCount > 0) then // 变化到编辑模式时不清空选择项
  begin
    FShapeList.ClearSelect;
    DrawShape;
    DrawCurrent;
    DrawPaint;
    PaintThis;
  end;
  case FSelectTools of
    pstLaser:
      begin
        FLaserPoint := Point(-100, -100);
        FLaserActive := True; { TODO -c2006.12.18 -oZswangY37 : 控制光笔的默认打开状态 }
      end;
  end;
  DoChange;
end;

procedure TLovelyPaint21.SetSelectTranslucency(const Value: Boolean);
var
  vIdents: TIdents;
  vCommand: PCommandInfo;
begin
  //if FSelectTranslucency = Value then Exit;
  FSelectTranslucency := Value;
  case FSelectTools of
    pstPaint:
      if Assigned(FModifyShape) then 
      begin
        FModifyShape.Translucency := FSelectTranslucency;
        DrawCurrent;
        DrawPaint;
        PaintThis;
        UpdateCaret;
      end;
    pstModify: if FShapeList.SelectCount > 0 then
      begin
        FShapeList.SelectIdents(vIdents);
        FShapeList.SelectTranslucency(FSelectTranslucency);
        vCommand := FCommandList.NewTranslucencyCommand(FSelectTranslucency, vIdents);
        FCommandRedo.Clear;
        if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
          cCommandInfoHeadSize + vCommand^.rParamSize);
        SetLength(vIdents, 0);
        vIdents := nil;
        DrawShape;
        DrawCurrent;
        DrawPaint;
        PaintThis;
      end;
  end;
end;

procedure TLovelyPaint21.SetShadowColor(const Value: TColor);
begin
  if FShadowColor = Value then Exit;
  FShadowColor := Value;
  Invalidate;
end;

procedure TLovelyPaint21.SetVectorShapePath(const Value: string);
begin
  FVectorShapePath := Value;
end;

procedure TLovelyPaint21.SetZoom(Value: Double);
begin
  if Value = 0 then Value := 1;
  if FZoom = Value then Exit;
  FAdaptStyle := asNone;
  FZoom := Value;
  FBorder.X := Max(FBorderWidth, Trunc(Width - FBackBitmap.Width * FZoom -
    GetSystemMetrics(SM_CYVSCROLL)) div 2);
  FBorder.Y := Max(FBorderWidth, Trunc(Height - FBackBitmap.Height * FZoom -
    GetSystemMetrics(SM_CXHSCROLL)) div 2);
  UpdateZoom;
end;

procedure TLovelyPaint21.ShapeAccept;
var
  vCommand: PCommandInfo;
  I: Integer;
begin
  if not Assigned(FModifyShape) then Exit;
  case FSelectTools of
    pstPaint, pstModify, pstPhoto:
      begin
        if FModifyShape.Accept then
        begin
          FModifyShape.Modified := False;
          I := FShapeList.IndexFromIdent(FModifyShape.Ident);
          if (I >= 0) and (FModifyShape is TCustomShapeText) then               //2007-11-23 ZswangY37 No.1
          begin
            TCustomShapeText(FModifyShape).SelLength := 0;
            if not TCustomShapeText(FModifyShape).TextChanged then
            begin
              FModifyShape := nil;
              DrawShape;
              DrawCurrent;
              DrawPaint;
              UpdateCaret;
              Invalidate;
              Exit; // 没有改变内容则不提交
            end;
            TCustomShapeText(FModifyShape).OldText :=
              TCustomShapeText(FModifyShape).Text;
          end;
          //TODO : 添加资源
          if FModifyShape.HasResource then ResourceAccept;
          
          if I >= 0 then // 修改                                                //2007-11-20 ZswangY37 No.1
            vCommand := FCommandList.NewChangeCommand(FModifyShape)
          else
          begin
            FShapeList.Append(FModifyShape);
            vCommand := FCommandList.NewPaintCommand(FModifyShape);
          end;
          FCommandRedo.Clear;
          if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
            cCommandInfoHeadSize + vCommand^.rParamSize);
        end else
        begin
          if FShapeList.IndexFromIdent(FModifyShape.Ident) >= 0 then // 修改    //2007-11-20 ZswangY37 No.1
          begin
            vCommand := FCommandList.NewDeleteCommand([FModifyShape.Ident]);
            FCommandRedo.Clear;
            if Assigned(FOnCommand) then FOnCommand(Self, vCommand,
              cCommandInfoHeadSize + vCommand^.rParamSize);
            FShapeList.Delete(FModifyShape);
          end else FModifyShape.Free;
        end;
      end;
  end;
  FModifyShape := nil;
  DrawShape;
  DrawCurrent;
  DrawPaint;
  UpdateCaret;
  Invalidate;
end;

procedure TLovelyPaint21.TimerLaserTimer(Sender: TObject);
var
  vPoint: TPoint;
  vRect: TRect;
begin
  if FLaserActive and (FLaserDownCount > 0) then // 绘制光笔
  begin
    if not Assigned(FLaserBitmap) then
    begin
      FLaserBitmap := TBitmap.Create;
      FLaserBitmap.PixelFormat := pf24bit;
    end;
    FLaserBitmap.Width := FPaintBitmap.Width;
    FLaserBitmap.Height := FPaintBitmap.Height;
    FLaserBitmap.Canvas.Draw(0, 0, FPaintBitmap);

    vPoint := PointToMouse(FLaserPoint);                                        //2007-09-17 ZswangY37 No.1
    FLaserBitmap.Canvas.Draw(
      vPoint.X - FLaserGraphic.Width div 2,
      vPoint.Y - FLaserGraphic.Height div 2,
      FLaserGraphic
    );

    vPoint := PointToMouse(FLaserDownPoint);
    FLaserBitmap.Canvas.Draw(
      vPoint.X - FLaserGraphic.Width div 2,
      vPoint.Y - FLaserGraphic.Height div 2,
      FLaserGraphic
    );

    FLaserBitmap.Canvas.Pen.Color := clWhite;
    DrawThunderEllipse(FLaserBitmap.Canvas, vPoint, 10 + FLaserDownCount, 30 + FLaserDownCount, 30 + FLaserDownCount);
    FLaserBitmap.Canvas.Pen.Color := clYellow;
    DrawThunderEllipse(FLaserBitmap.Canvas, vPoint, 10 + FLaserDownCount, 30 + FLaserDownCount, 30 + FLaserDownCount);
    FLaserBitmap.Canvas.Pen.Color := clBlack;
    DrawThunderEllipse(FLaserBitmap.Canvas, vPoint, 10 + FLaserDownCount, 30 + FLaserDownCount, 30 + FLaserDownCount);
    FLaserDownCount := FLaserDownCount - 2;
    vRect.TopLeft := PointToMouse(Point(0, 0));
    vRect.BottomRight := PointToMouse(Point(FBackBitmap.Width, FBackBitmap.Height));
    Canvas.CopyRect(vRect, FLaserBitmap.Canvas, vRect);
  end else
  begin
    if Assigned(FLaserBitmap) then
    begin
      FLaserBitmap.Free;
      FLaserBitmap := nil;
    end;
    TTimer(Sender).Enabled := False;
    DrawPaint;
    PaintThis;
  end;
end;

procedure TLovelyPaint21.TimerScrollTimer(Sender: TObject);                     //2011-04-03 ZswangY37 No.2
var
  vOrigin: TPoint;
begin
  if WindowFromPoint(Mouse.CursorPos) <> Handle then  // 鼠标停留在其他窗体上
  begin
    TTimer(Sender).Enabled := False;
    Exit;
  end;
  vOrigin := Origin;
  Inc(vOrigin.X, FScrollOrigin.X * 2);
  Inc(vOrigin.Y, FScrollOrigin.Y * 2);
  Origin := vOrigin;
end;

function TLovelyPaint21.Undo: Boolean;
var
  I: Integer;
  vCommand: PCommandInfo;
  vCommandInfo: TCommandInfo;
begin
  Result := False;
  if FCommandList.Count > 0 then
  begin
    for I := FCommandList.Count - 1 downto 0 do
    begin
      vCommand := FCommandList[I];
      if HiWord(vCommand^.rIdent) = FControlIdent then
      begin
        if Assigned(FOnCommand) then
        begin
          vCommandInfo.rIdent := vCommand^.rIdent;
          vCommandInfo.rType := scRemove;
          vCommandInfo.rParamSize := 0;
          FOnCommand(Self, @vCommandInfo, cCommandInfoHeadSize +
            vCommandInfo.rParamSize);
        end;
        FCommandRedo.AppendCommand(vCommand); // 添加到重复列表中
        FCommandList.DeleteCommand(vCommand^.rIdent, False);
        ExecuteTo(FCommandList.Count - 1);
        Break;
      end;
    end;
    Result := True;
  end;
end;

procedure TLovelyPaint21.UpdateCaret;
var
  vCaretPos: TPoint;
  vCompositionForm: TCompositionForm;
  vIMC: THandle;
begin
  if not Focused then Exit; // 如果没有获得焦点
  DestroyCaret;                                                                 //2007-10-24 ZswangY37 No.1
  if not (FModifyShape is TCustomShapeText) then Exit; // 如果不是编辑控件
  if not FModifyShape.Modified then Exit; // 如果不是编辑状态
  vCaretPos := TCustomShapeText(FModifyShape).CaretPos;

  CreateCaret(Handle, 0, Trunc((1 + Ord(FSelectPenWidth > 2)) * FZoom),
    Trunc(TCustomShapeText(FModifyShape).CaretHeight * FZoom));
  vCaretPos := PointToMouse(vCaretPos);
  SetCaretPos(vCaretPos.X, vCaretPos.Y);
  ShowCaret(Handle);

  vCompositionForm.dwStyle := CFS_POINT;
  vCompositionForm.ptCurrentPos := vCaretPos;
  vIMC := ImmGetContext(Handle);
  //ImmSetCompositionFont(vIMC, );
  ImmSetCompositionWindow(vIMC, @vCompositionForm);                             //2007-04-09 ZswangY37 No.2
  ImmReleaseContext(Handle, vIMC);
end;

procedure TLovelyPaint21.UpdateCursor;
begin
  case FSelectTools of
    pstPaint:
      if FMouseInBox then
      begin
        case FindShapeModify(FindShapeClass(FSelectShape)) of
          smVector:
            if FModelCursor <> crDefault then
              Cursor := FModelCursor
            else Cursor := FindShapeCursor(FSelectShape);
        else Cursor := FindShapeCursor(FSelectShape);
        end;
      end else Cursor := crDefault;
    pstLabel:
      if FLabelStyle = 0 then
        Cursor := crLeftLabel
      else Cursor := crRightLabel;
    pstModify: Cursor := crSelect;
    pstLaser:
      begin
        if FLaserActive then
          Cursor := crLaserOn
        else Cursor := crLaserOff;
      end;
  else Cursor := crDefault;
  end;
end;

procedure TLovelyPaint21.UpdatePage(AZoom: Double; AOrigin: TPoint;
  ABackGraphic: TGraphic; ACommandList, ACommandRedo: TList);
begin
  FOrigin := AOrigin;
  FCommandList.Parasite := ACommandList;
  FCommandRedo.Parasite := ACommandRedo;
  FLabelList.Clear;
  if Assigned(FModifyShape) then
  begin
    FModifyShape := nil;
    UpdateCaret;
  end;
//  SetBackGraphic(ABackGraphic);                                               //2007-03-31 ZswangY37 No.1
  if Assigned(ABackGraphic) then
  begin
    FBackBitmap.Free;
    FBackBitmap := TBitmap.Create; //重新创建
    FBackBitmap.PixelFormat := pf24bit;
    if ABackGraphic is TBitmap then                                             //2007-09-13 ZswangY37 No.1
      FBackBitmap.Assign(ABackGraphic)
    else
    begin
      FBackBitmap.Width := ABackGraphic.Width;
      FBackBitmap.Height := ABackGraphic.Height;
      FBackBitmap.Canvas.Draw(0, 0, ABackGraphic);
    end;
  end;

  FOldWidth := 0;
  FOldHeight := 0;
  FBorder.X := FBorderWidth;
  FBorder.Y := FBorderWidth;

  if AZoom = -3 then
    AdaptToSize
  else if AZoom = -4 then
    AdaptToHeight
  else if AZoom < 0 then
    AdaptToWidth
  else begin
    if AZoom = 0 then AZoom := 1;
    FZoom := AZoom;
    ///////Begin 校正Origin
    if FOrigin.X > PageWidth(FZoom) - ClientWidth + 1 then
      FOrigin.X := PageWidth(FZoom) - ClientWidth + 1;
    if FOrigin.X < 0 then FOrigin.X := 0;
    if FOrigin.Y > PageHeight(FZoom) - ClientHeight + 1 then
      FOrigin.Y := PageHeight(FZoom) - ClientHeight + 1;
    if FOrigin.Y < 0 then FOrigin.Y := 0;
    ///////End 校正Origin
    if Assigned(FOnZoom) then FOnZoom(Self);
    FBorder.X := Max(FBorderWidth, Trunc(Width - FBackBitmap.Width * FZoom) div 2);
    FBorder.Y := Max(FBorderWidth, Trunc(Height - FBackBitmap.Height * FZoom) div 2);
    DrawZoom;                                                                   //2007-08-13 ZswangY37 No.3
    DrawBack;
    FAdaptStyle := asNone;
  end;
  ExecuteTo(FCommandList.Count - 1);
end;

procedure TLovelyPaint21.UpdateZoom;                                            //2007-08-29 ZswangY37 No.1
begin
  FShapeList.Zoom := FZoom;
  ///////Begin 校正Origin
  if FOrigin.X > PageWidth(FZoom) - ClientWidth + 1 then
    FOrigin.X := PageWidth(FZoom) - ClientWidth + 1;
  if FOrigin.X < 0 then FOrigin.X := 0;
  if FOrigin.Y > PageHeight(FZoom) - ClientHeight + 1 then
    FOrigin.Y := PageHeight(FZoom) - ClientHeight + 1;
  if FOrigin.Y < 0 then FOrigin.Y := 0;
  ///////End 校正Origin

  if FModifyShape is TCustomShapeText then
  begin
    TCustomShapeText(FModifyShape).Zoom := FZoom;
    TCustomShapeText(FModifyShape).FontName := Font.Name;
    TCustomShapeText(FModifyShape).UpdateRect;
  end;
  AdjustScrollBars;
  DrawZoom;
  DrawBack;
  DrawShape;
  DrawCurrent;
  DrawPaint;
  UpdateCaret;
  Invalidate;
  if not FUpdateing and Assigned(FOnOriginChange) then FOnOriginChange(Self);
  if not FUpdateing and Assigned(FOnZoom) then FOnZoom(Self);
end;

procedure TLovelyPaint21.WMChar(var Msg: TWMChar);
const
{$J+}
  C: Char = #0;
{$J-}
begin
  inherited;
  if SelectTools = pstFollow then Exit;
  if not (FModifyShape is TCustomShapeText) then Exit; // 如果不是编辑控件
  if not FModifyShape.Modified then Exit; // 如果不是编辑状态
  if C <> #0 then
  begin
    try
      if not TCustomShapeText(FModifyShape).KeyPress(
        WideString(C + Char(Msg.CharCode))[1]) then Exit;
    finally
      C := #0;
    end;
  end else
  begin
    if Msg.CharCode >= 127 then // 多字节
      C := Char(Msg.CharCode)
    else if not TCustomShapeText(FModifyShape).KeyPress(
      WideChar(Msg.CharCode)) then Exit;
  end;
  DrawCurrent;
  DrawPaint;
  UpdateCaret;
  Invalidate;
end;

procedure TLovelyPaint21.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  Message.Result := Message.Result or DLGC_WANTARROWS or DLGC_WANTCHARS or      //2007-04-09 ZswangY37 No.3
    DLGC_WANTTAB or DLGC_WANTALLKEYS;
end;

procedure TLovelyPaint21.WMHScroll(var Message: TWMHScroll);
var
  XNew: Integer;
begin
  inherited;
  if FEstopScorll then Exit;
  if SelectTools = pstFollow then Exit;
  if not Focused then Windows.SetFocus(Handle);
  XNew := FOrigin.X;
  case Message.ScrollCode of
    SB_LEFT: XNew := 0;
    SB_RIGHT: XNew := MaxInt;
    SB_LINEDOWN: Inc(XNew, ClientWidth div $15);
    SB_LINEUP: Dec(XNew, ClientWidth div $15);
    SB_PAGEDOWN: Inc(XNew, ClientWidth div 5);
    SB_PAGEUP: Dec(XNew, ClientWidth div 5);
    SB_THUMBPOSITION, SB_THUMBTRACK: XNew := Message.Pos;
  end;

  if XNew >= PageWidth(FZoom) - ClientWidth + 1 then
    XNew := PageWidth(FZoom) - ClientWidth + 1;
  if XNew < 0 then XNew := 0;

  if XNew <> FOrigin.X then
  begin
    FOrigin.X := XNew;
    SetScrollPos(Handle, SB_HORZ, FOrigin.X, True);
    UpdateCaret;
    DrawBack;
    DrawShape;
    DrawCurrent;
    DrawPaint;
    PaintThis;
  end;
  if (SB_ENDSCROLL = Message.ScrollCode) and
    Assigned(OnOriginChange) then OnOriginChange(Self);
end;

//procedure TLovelyPaint21.WMImeChar(var Msg: TMessage);
//begin
//  inherited;
//  if SelectTools = pstFollow then Exit;
//  if Msg.WParam shr 8 = 0 then Exit;
//  if not (FModifyShape is TCustomShapeText) then Exit; // 如果不是编辑控件
//  if not FModifyShape.Modified then Exit; // 如果不是编辑状态
//  if not TCustomShapeText(FModifyShape).KeyPress(
//    WideString(Char(Msg.WParam shr 8) + Char(Msg.WParam and $FF))[1]) then Exit;
//  DrawCurrent;
//  DrawPaint;
//  UpdateCaret;
//  Invalidate;
//end;

procedure TLovelyPaint21.WMImeComposition(var Msg: TMessage);
const
{$J+}
  cFontHeight: Integer = 0;
{$J-}
var
  vImc: HIMC;
  vLogFont: TLogFontW;
begin
  inherited;
  if cFontHeight <> Trunc((14 + (FSelectTextSize - 1) * 2) * FZoom) then
  begin
    cFontHeight := Trunc((14 + (FSelectTextSize - 1) * 2) * FZoom);
    vImc := ImmGetContext(Handle);
    if vImc <> 0 then
    begin
      Font.Height := cFontHeight;
      Font.Color := FSelectTextColor;

      GetObjectW(Font.Handle, SizeOf(TLogFontW), @vLogFont);
      ImmSetCompositionFontW(vImc, @vLogFont);                                  //2007-04-09 ZswangY37 No.1
      ImmReleaseContext(Handle, vImc);
    end;
  end;
end;

procedure TLovelyPaint21.WMImeNotify(var Msg: TMessage);
begin
  inherited;
end;

procedure TLovelyPaint21.WMMouseWheel(var Message: TWMMouseWheel);
var
  vHandle: THandle;
  vProcessID: THandle;
begin
  vHandle := WindowFromPoint(Mouse.CursorPos);
  if vHandle <> Handle then
  begin
    GetWindowThreadProcessId(vHandle, vProcessID);
    if vProcessID = GetCurrentProcessId then
      SendMessage(vHandle, WM_MOUSEWHEEL, TMessage(Message).WParam,
        TMessage(Message).LParam);
  end;
  inherited;
end;

procedure TLovelyPaint21.WMVScroll(var Message: TWMVScroll);
var
  YNew: Integer;
begin
  inherited;
  if FEstopScorll then Exit;
  if SelectTools = pstFollow then Exit;
  if not Focused then Windows.SetFocus(Handle);
  YNew := FOrigin.Y;
  case Message.ScrollCode of
    SB_TOP: YNew := 0;
    SB_BOTTOM: YNew := MaxInt;
    SB_LINEDOWN: Inc(YNew, ClientHeight div $15);
    SB_LINEUP: Dec(YNew, ClientHeight div $15);
    SB_PAGEDOWN: Inc(YNew, ClientHeight div 5);
    SB_PAGEUP: Dec(YNew, ClientHeight div 5);
    SB_THUMBPOSITION, SB_THUMBTRACK: YNew := Message.Pos;
  end;
  if YNew >= PageHeight(FZoom) - ClientHeight + 1 then
    YNew := PageHeight(FZoom) - ClientHeight + 1;
  if YNew < 0 then YNew := 0;

  if YNew <> FOrigin.Y then
  begin
    FOrigin.Y := YNew;
    SetScrollPos(Handle, SB_VERT, FOrigin.Y, True);
    UpdateCaret;
    DrawBack;
    DrawShape;
    DrawCurrent;
    DrawPaint;
    PaintThis;
  end;
  if (SB_ENDSCROLL = Message.ScrollCode) and
    Assigned(OnOriginChange) then OnOriginChange(Self);
end;

{ TCommandList }

function TCommandList.AcceptCommand(ACommandInfo: PCommandInfo;
  AShapeList: TShapeList; AResourceList: TResourceList): PCommandInfo;
begin
  Result := nil;
  if not Assigned(AShapeList) then Exit;
  if not Assigned(ACommandInfo) then Exit;
  GetMem(Result, cCommandInfoHeadSize + ACommandInfo^.rParamSize);
  Move(ACommandInfo^, Result^,
    cCommandInfoHeadSize + ACommandInfo^.rParamSize);
  ExecuteCommand(Result, AShapeList, AResourceList);
  FCommands.Add(Result);
  if Assigned(FParasite) then FParasite.Add(Result);
end;

procedure TCommandList.AppendCommand(ACommandInfo: PCommandInfo);
begin
  FCommands.Add(ACommandInfo);
  if Assigned(FParasite) then FParasite.Add(ACommandInfo);
  Inc(FLastIdent);
end;

procedure TCommandList.Clear;
var
  I: Integer;
  vCommandInfo: PCommandInfo;
begin
  for I := FCommands.Count - 1 downto 0 do
  begin
    vCommandInfo := FCommands[I];
    FreeMem(vCommandInfo,
      cCommandInfoHeadSize + vCommandInfo.rParamSize);
  end;
  FCommands.Clear;
  if Assigned(FParasite) then FParasite.Clear;
end;

constructor TCommandList.Create;
begin
  FCommands := TList.Create; // 命令列表
end;

procedure TCommandList.DeleteCommand(AIdent: Longword; AIsFree: Boolean = True);
var
  I: Integer;
  vCommandInfo: PCommandInfo;
begin
  for I := FCommands.Count - 1 downto 0 do
  begin
    vCommandInfo := FCommands[I];
    if vCommandInfo^.rIdent = AIdent then
    begin
      if AIsFree then
        FreeMem(vCommandInfo,
          cCommandInfoHeadSize + vCommandInfo.rParamSize);
      FCommands.Delete(I);
      if Assigned(FParasite) then FParasite.Delete(I);
      Break;
    end;
  end;
end;

destructor TCommandList.Destroy;
begin
  if Assigned(FCommands) then
  begin
    if not Assigned(FParasite) then
      FreeCommands(FCommands);
    FCommands.Free;
  end;
  inherited;
end;

function TCommandList.ExecuteAngleCommand(ACommandInfo: PCommandInfo;
  AShapeList: TShapeList): Boolean;
var
  I: Integer;
  J: Integer;
begin
  Result := False;
  if not Assigned(AShapeList) then Exit;
  with PAngleCommand(@ACommandInfo^.rParam[0])^ do
    for I := 0 to rCount - 1 do
    begin
      J := AShapeList.IndexFromIdent(rIdents[I]);
      if J >= 0 then
      begin
        if AShapeList[J].Angle + rAngle <= 255 then
          AShapeList[J].Angle := AShapeList[J].Angle + rAngle
        else AShapeList[J].Angle := AShapeList[J].Angle + rAngle - 255;
        AShapeList[J].UpdateRect;
      end;
    end;
  Result := True;
end;

function TCommandList.ExecuteChangeCommand(ACommandInfo: PCommandInfo;
  AShapeList: TShapeList; AResourceList: TResourceList): Boolean;
var
  vShape: TCustomShape;
  vIndex: Integer;
  I: Integer;
  vResourceInfo: PResourceInfo;
begin
  Result := False;
  if not Assigned(AShapeList) then Exit;
  vIndex := AShapeList.IndexFromIdent(
    PPaintCommand(@ACommandInfo^.rParam[0])^.rShapeInfo.rIdent);                //2007-08-14 ZswangY37 No.1
  if vIndex < 0 then Exit;
  with PPaintCommand(@ACommandInfo^.rParam[0])^.rShapeInfo do
  begin
    vShape := AShapeList.Items[vIndex];
    if Assigned(vShape) then
    begin
      vShape.PenColor := rPenColor;
      vShape.PenWidth := rPenWidth;
      vShape.Translucency := rTranslucency;
      vShape.Angle := rAngle;
      vShape.Ident := rIdent;
      vShape.SetData(@rData[0], rDataSize);
      if vShape is TCustomShapeText then
      begin
        TCustomShapeText(vShape).FontName := AShapeList.FontName;
        TCustomShapeText(vShape).Zoom := AShapeList.Zoom;
      end;
      if vShape.HasResource and Assigned(AResourceList) then
      begin
        I := AResourceList.IndexFromCrc32(
          vShape.ResourceCrc32, vShape.ResourceSize);
        if I >= 0 then
        begin
          vResourceInfo := AResourceList[I];
          vShape.SetResource(@vResourceInfo^.rData[0], vResourceInfo^.rSize);
        end;
      end;
      vShape.UpdateRect;
    end else Exit;
  end;
  Result := Assigned(vShape);
end;

function TCommandList.ExecuteClearCommand(ACommandInfo: PCommandInfo;
  AShapeList: TShapeList): Boolean;
begin
  Result := False;
  if not Assigned(AShapeList) then Exit;
  AShapeList.Clear;
  Result := True;
end;

function TCommandList.ExecuteCommand(ACommandInfo: PCommandInfo;
  AShapeList: TShapeList; AResourceList: TResourceList): Boolean;
begin
  case ACommandInfo^.rType of
    scClear: Result := ExecuteClearCommand(ACommandInfo, AShapeList);
    scPaint: Result := ExecutePaintCommand(ACommandInfo, AShapeList, AResourceList);
    scPaste: Result := ExecutePasteCommand(ACommandInfo, AShapeList, AResourceList);
    scMove: Result := ExecuteMoveCommand(ACommandInfo, AShapeList);
    scDelete: Result := ExecuteDeleteCommand(ACommandInfo, AShapeList);
    scChange: Result := ExecuteChangeCommand(ACommandInfo, AShapeList, AResourceList);
    scPenColor: Result := ExecutePenColorCommand(ACommandInfo, AShapeList);
    scPenWidth: Result := ExecutePenWidthCommand(ACommandInfo, AShapeList);
    scTranslucency: Result := ExecuteTranslucencyCommand(ACommandInfo, AShapeList);
    scAngle: Result := ExecuteAngleCommand(ACommandInfo, AShapeList);
    scResource: Result := ExecuteResourceCommand(ACommandInfo, AResourceList);
  else Result := False;
  end;
end;

function TCommandList.ExecuteDeleteCommand(ACommandInfo: PCommandInfo;
  AShapeList: TShapeList): Boolean;
var
  I: Integer;
begin
  Result := False;
  if not Assigned(AShapeList) then Exit;
  with PDeleteCommand(@ACommandInfo^.rParam[0])^ do
    for I := 0 to rCount - 1 do
      AShapeList.Delete(AShapeList.IndexFromIdent(rIdents[I]));
  Result := True;
end;

function TCommandList.ExecuteMoveCommand(ACommandInfo: PCommandInfo;
  AShapeList: TShapeList): Boolean;
var
  I: Integer;
  J: Integer;
begin
  Result := False;
  if not Assigned(AShapeList) then Exit;
  with POffsetCommand(@ACommandInfo^.rParam[0])^ do
    for I := 0 to rCount - 1 do
    begin
      J := AShapeList.IndexFromIdent(rIdents[I]);
      if J >= 0 then AShapeList[J].Offset(Point(rPoint.x, rPoint.y));
    end;
  Result := True;
end;

function TCommandList.ExecutePaintCommand(ACommandInfo: PCommandInfo;
  AShapeList: TShapeList; AResourceList: TResourceList): Boolean;
var
  vShape: TCustomShape;
  I: Integer;
  vResourceInfo: PResourceInfo;
begin
  Result := False;
  if not Assigned(AShapeList) then Exit;
  with PPaintCommand(@ACommandInfo^.rParam[0])^.rShapeInfo do
  begin
    vShape := NewShape(rType);
    if Assigned(vShape) then
    begin
      vShape.PenColor := rPenColor;
      vShape.PenWidth := rPenWidth;
      vShape.Translucency := rTranslucency;
      vShape.Angle := rAngle;
      vShape.Ident := rIdent;
      vShape.SetData(@rData[0], rDataSize);
      if vShape is TCustomShapeText then
      begin
        TCustomShapeText(vShape).Zoom := AShapeList.Zoom;
        TCustomShapeText(vShape).FontName := AShapeList.FFontName;
      end;
      if vShape.HasResource and Assigned(AResourceList) then
      begin
        I := AResourceList.IndexFromCrc32(vShape.ResourceCrc32, vShape.ResourceSize);
        if I >= 0 then
        begin
          vResourceInfo := AResourceList[I];
          vShape.SetResource(@vResourceInfo^.rData[0], vResourceInfo^.rSize);
        end;
      end;
      vShape.UpdateRect;
      AShapeList.FShapes.Add(vShape);
    end else Exit;
  end;
  Result := Assigned(vShape);
end;

function TCommandList.ExecutePasteCommand(ACommandInfo: PCommandInfo;
  AShapeList: TShapeList; AResourceList: TResourceList): Boolean;
var
  vMemoryStream: TMemoryStream;
  vShapeInfo: TShapeInfo;
  vShape: TCustomShape;
  vResourceInfo: PResourceInfo;
  I: Integer;
begin
  Result := False;
  if not Assigned(AShapeList) then Exit;
  vMemoryStream := TMemoryStream.Create;
  try
    vMemoryStream.Write(ACommandInfo^.rParam[0], ACommandInfo^.rParamSize);
    vMemoryStream.Position := 0;
    while vMemoryStream.Read(vShapeInfo, cShapeInfoHeadSize) > 0 do
    begin
      { TODO -c2006.12.01 -oZswangY37 : 判断DataSize是否合法 }
      vShape := NewShape(vShapeInfo.rType);
      if Assigned(vShape) then
      begin
        vMemoryStream.Seek(-cShapeInfoHeadSize, soFromCurrent);
        vShape.StreamRead(vMemoryStream);
        AShapeList.FShapes.Add(vShape);
        if vShape.HasResource and Assigned(AResourceList) then
        begin
          I := AResourceList.IndexFromCrc32(vShape.ResourceCrc32, vShape.ResourceSize);
          if I >= 0 then
          begin
            vResourceInfo := AResourceList[I];
            vShape.SetResource(@vResourceInfo^.rData[0], vResourceInfo^.rSize);
          end;
        end;
        vShape.UpdateRect;
      end else vMemoryStream.Seek(vShapeInfo.rDataSize, soFromCurrent);
    end;
  finally
    vMemoryStream.Free;
  end;
  Result := True;
end;

function TCommandList.ExecutePenColorCommand(
  ACommandInfo: PCommandInfo; AShapeList: TShapeList): Boolean;
var
  I: Integer;
  J: Integer;
begin
  Result := False;
  if not Assigned(AShapeList) then Exit;
  with PPenColorCommand(@ACommandInfo^.rParam[0])^ do
    for I := 0 to rCount - 1 do
    begin
      J := AShapeList.IndexFromIdent(rIdents[I]);
      if J >= 0 then AShapeList[J].PenColor := rColor;
    end;
  Result := True;
end;

function TCommandList.ExecutePenWidthCommand(
  ACommandInfo: PCommandInfo; AShapeList: TShapeList): Boolean;
var
  I: Integer;
  J: Integer;
begin
  Result := False;
  if not Assigned(AShapeList) then Exit;
  with PPenWidthCommand(@ACommandInfo^.rParam[0])^ do
    for I := 0 to rCount - 1 do
    begin
      J := AShapeList.IndexFromIdent(rIdents[I]);
      if J >= 0 then
      begin
        AShapeList[J].PenWidth := rWidth;
        AShapeList[J].UpdateRect;
      end;
    end;
  Result := True;
end;

function TCommandList.ExecuteResourceCommand(ACommandInfo: PCommandInfo;
  AResourceList: TResourceList): Boolean;
begin
  Result := False;
  if not Assigned(AResourceList) then Exit;
  AResourceList.AcceptCommand(PResourceCommand(@ACommandInfo^.rParam[0]));
  Result := True;
end;

function TCommandList.ExecuteTo(AStepIndex: Integer;
  AShapeList: TShapeList; AResourceList: TResourceList): Boolean;
var
  I, J: Integer;
  vCommand: PCommandInfo;
  vCommandInfo: PCommandInfo;
  vIdent: Longword;
begin
  Result := False;
  if not Assigned(AShapeList) then Exit;
  AShapeList.Clear;

  ///////Begin 处理特殊命令
  I := 0;
  while (I < FCommands.Count) and (I >= 0) do                                   //2007-09-12 ZswangY37 No.1
  begin
    vCommand := FCommands[I];
    case vCommand^.rType of
      scReplay:
        begin
          for J := I downto 0 do
          begin
            vCommandInfo := FCommands[J];
            FreeMem(vCommandInfo, cCommandInfoHeadSize + vCommandInfo^.rParamSize);
            FCommands.Delete(J);
            if Assigned(FParasite) then FParasite.Delete(J);
          end;
          I := 0;
          AShapeList.Clear;
          Continue;
        end;
      scRemove: // 删除前面的命令
        begin
          J := 0;
          vIdent := vCommand^.rIdent;
          while J <= I do
          begin
            vCommandInfo := FCommands[J];
            if vCommandInfo^.rIdent = vIdent then
            begin
              FreeMem(vCommandInfo, cCommandInfoHeadSize + vCommandInfo.rParamSize);
              FCommands.Delete(J);
              if Assigned(FParasite) then FParasite.Delete(J);
              Dec(I);
              Continue;
            end;
            Inc(J);
          end;
          Continue;
        end;
      scClearLabel: ;
    end;
    Inc(I);
  end;
  ///////End 处理特殊命令

  for I := 0 to Min(FCommands.Count - 1, AStepIndex) do
    Result := ExecuteCommand(FCommands[I], AShapeList, AResourceList);
end;

function TCommandList.ExecuteTranslucencyCommand(
  ACommandInfo: PCommandInfo; AShapeList: TShapeList): Boolean;
var
  I: Integer;
  J: Integer;
begin
  Result := False;
  if not Assigned(AShapeList) then Exit;
  with PTranslucencyCommand(@ACommandInfo^.rParam[0])^ do
    for I := 0 to rCount - 1 do
    begin
      J := AShapeList.IndexFromIdent(rIdents[I]);
      if J >= 0 then
      begin
        AShapeList[J].Translucency := rTranslucency;
        AShapeList[J].UpdateRect;
      end;
    end;
  Result := True;
end;

function TCommandList.GetCount: Integer;
begin
  Result := FCommands.Count;
end;

function TCommandList.GetItems(Index: Integer): PCommandInfo;
begin
  if (Index >= 0) and (Index < FCommands.Count) then
    Result := FCommands[Index]
  else Result := nil;
end;

function TCommandList.NewAngleCommand(AAngle: Byte;
  AIdents: array of Longword): PCommandInfo;
var
  I: Integer;
  vParamSize: Integer;
begin
  vParamSize := SizeOf(TAngleCommand) - SizeOf(Longword) +
    SizeOf(Longword) * Length(AIdents);
  GetMem(Result, cCommandInfoHeadSize + vParamSize);
  PCommandInfo(Result)^.rIdent := MakeLong(FLastIdent, FControlIdent);
  PCommandInfo(Result)^.rType := scAngle;
  PCommandInfo(Result)^.rParamSize := vParamSize;
  with PAngleCommand(@PCommandInfo(Result)^.rParam[0])^ do
  begin
    rAngle := AAngle;
    rCount := Length(AIdents);
    for I := Low(AIdents) to High(AIdents) do
      rIdents[I] := AIdents[I];
  end;
  AppendCommand(Result);
end;

function TCommandList.NewChangeCommand(AShape: TCustomShape): PCommandInfo;
var
  vData: Pointer;
  vSize: Integer;
  vParamSize: Integer;
begin
  Result := nil;
  if not Assigned(AShape) then Exit;
  AShape.GetData(vData, vSize);
  try
    vParamSize := SizeOf(TPaintCommand) - SizeOf(Char) + vSize;
    GetMem(Result, cCommandInfoHeadSize + vParamSize);
    //PCommandInfo(Result)^.rIdent := AShape.Ident;                             //2007-08-13 ZswangY37 No.1
    PCommandInfo(Result)^.rIdent := MakeLong(FLastIdent, FControlIdent);
    PCommandInfo(Result)^.rType := scChange;
    PCommandInfo(Result)^.rParamSize := vParamSize;
    with PPaintCommand(@PCommandInfo(Result)^.rParam[0])^ do
    begin
      rShapeInfo.rType := FindShapeType(AShape.ClassType);
      rShapeInfo.rIdent := AShape.Ident;                                        //2007-05-23 ZswangY37 No.1
      rShapeInfo.rPenWidth := AShape.PenWidth;
      rShapeInfo.rPenColor := AShape.PenColor;
      rShapeInfo.rTranslucency := AShape.Translucency;
      rShapeInfo.rAngle := AShape.Angle;
      rShapeInfo.rDataSize := vSize;
      Move(vData^, rShapeInfo.rData[0], vSize);
    end;
  finally
    FreeMem(vData, vSize);
  end;
  AppendCommand(Result);
end;

function TCommandList.NewClearCommand: PCommandInfo;
var
  vParamSize: Integer;
begin
  vParamSize := 0;
  GetMem(Result, cCommandInfoHeadSize + vParamSize);
  PCommandInfo(Result)^.rIdent := MakeLong(FLastIdent, FControlIdent);
  PCommandInfo(Result)^.rType := scClear;
  PCommandInfo(Result)^.rParamSize := vParamSize;
  AppendCommand(Result);
end;

function TCommandList.NewDeleteCommand(
  AIdents: array of Longword): PCommandInfo;
var
  I: Integer;
  vParamSize: Integer;
begin
  vParamSize := SizeOf(TDeleteCommand) - SizeOf(Longword) +
    SizeOf(Longword) * Length(AIdents);
  GetMem(Result, cCommandInfoHeadSize + vParamSize);
  PCommandInfo(Result)^.rIdent := MakeLong(FLastIdent, FControlIdent);
  PCommandInfo(Result)^.rType := scDelete;
  PCommandInfo(Result)^.rParamSize := vParamSize;
  with PDeleteCommand(@PCommandInfo(Result)^.rParam[0])^ do
  begin
    rCount := Length(AIdents);
    for I := Low(AIdents) to High(AIdents) do
      rIdents[I] := AIdents[I];
  end;
  AppendCommand(Result);
end;

function TCommandList.NewOffsetCommand(AOffset: TPoint;
  AIdents: array of Longword): PCommandInfo;
var
  I: Integer;
  vParamSize: Integer;
begin
  vParamSize := SizeOf(TOffsetCommand) - SizeOf(Longword) +
    SizeOf(Longword) * Length(AIdents);
  GetMem(Result, cCommandInfoHeadSize + vParamSize);
  PCommandInfo(Result)^.rIdent := MakeLong(FLastIdent, FControlIdent);
  PCommandInfo(Result)^.rType := scMove;
  PCommandInfo(Result)^.rParamSize := vParamSize;
  with POffsetCommand(@PCommandInfo(Result)^.rParam[0])^ do
  begin
    rPoint.x := AOffset.X;
    rPoint.y := AOffset.Y;
    rCount := Length(AIdents);
    for I := Low(AIdents) to High(AIdents) do
      rIdents[I] := AIdents[I];
  end;
  AppendCommand(Result);
end;

function TCommandList.NewPaintCommand(
  AShape: TCustomShape): PCommandInfo;
var
  vData: Pointer;
  vSize: Integer;
  vParamSize: Integer;
begin
  Result := nil;
  if not Assigned(AShape) then Exit;
  AShape.GetData(vData, vSize);
  try
    vParamSize := SizeOf(TPaintCommand) - SizeOf(Char) + vSize;
    GetMem(Result, cCommandInfoHeadSize + vParamSize);
    PCommandInfo(Result)^.rIdent := MakeLong(FLastIdent, FControlIdent);
    PCommandInfo(Result)^.rType := scPaint;
    PCommandInfo(Result)^.rParamSize := vParamSize;
    with PPaintCommand(@PCommandInfo(Result)^.rParam[0])^ do
    begin
      rShapeInfo.rType := FindShapeType(AShape.ClassType);
      rShapeInfo.rIdent := AShape.Ident;
      rShapeInfo.rPenWidth := AShape.PenWidth;
      rShapeInfo.rPenColor := AShape.PenColor;
      rShapeInfo.rTranslucency := AShape.Translucency;
      rShapeInfo.rAngle := AShape.Angle;
      rShapeInfo.rDataSize := vSize;
      Move(vData^, rShapeInfo.rData[0], vSize);
    end;
  finally
    FreeMem(vData, vSize);
  end;
  AppendCommand(Result);
end;

function TCommandList.NewPasteCommand(AStream: TStream): PCommandInfo;
var
  vParamSize: Integer;
begin
  Result := nil;
  if not Assigned(AStream) then Exit;
  AStream.Position := 0;
  vParamSize := AStream.Size;
  GetMem(Result, cCommandInfoHeadSize + vParamSize);
  PCommandInfo(Result)^.rIdent := MakeLong(FLastIdent, FControlIdent);
  PCommandInfo(Result)^.rType := scPaste;
  PCommandInfo(Result)^.rParamSize := vParamSize;
  AStream.Read(PCommandInfo(Result)^.rParam[0], vParamSize);
  AppendCommand(Result);
end;

function TCommandList.NewPenColorCommand(APenColor: TColor;
  AIdents: array of Longword): PCommandInfo;
var
  I: Integer;
  vParamSize: Integer;
begin
  vParamSize := SizeOf(TPenColorCommand) - SizeOf(Longword) +
    SizeOf(Longword) * Length(AIdents);
  GetMem(Result, cCommandInfoHeadSize + vParamSize);
  PCommandInfo(Result)^.rIdent := MakeLong(FLastIdent, FControlIdent);
  PCommandInfo(Result)^.rType := scPenColor;
  PCommandInfo(Result)^.rParamSize := vParamSize;
  with PPenColorCommand(@PCommandInfo(Result)^.rParam[0])^ do
  begin
    rColor := APenColor;
    rCount := Length(AIdents);
    for I := Low(AIdents) to High(AIdents) do rIdents[I] := AIdents[I];
  end;
  AppendCommand(Result);
end;

function TCommandList.NewPenWidthCommand(APenWidth: Byte;
  AIdents: array of Longword): PCommandInfo;
var
  I: Integer;
  vParamSize: Integer;
begin
  vParamSize := SizeOf(TPenWidthCommand) - SizeOf(Longword) +
    SizeOf(Longword) * Length(AIdents);
  GetMem(Result, cCommandInfoHeadSize + vParamSize);
  PCommandInfo(Result)^.rIdent := MakeLong(FLastIdent, FControlIdent);
  PCommandInfo(Result)^.rType := scPenWidth;
  PCommandInfo(Result)^.rParamSize := vParamSize;
  with PPenWidthCommand(@PCommandInfo(Result)^.rParam[0])^ do
  begin
    rWidth := APenWidth;
    rCount := Length(AIdents);
    for I := Low(AIdents) to High(AIdents) do
      rIdents[I] := AIdents[I];
  end;
  AppendCommand(Result);
end;

function TCommandList.NewResourceCommand(AResourceInfo: PResourceInfo; var ABlockPostion: Integer): PCommandInfo;
var
  vBlockSize: Integer;
  vParamSize: Integer;
begin
  Result := nil;
  vBlockSize := Min(AResourceInfo.rSize - ABlockPostion, 1024);
  if vBlockSize <= 0 then Exit;
  vParamSize := SizeOf(TResourceCommand) - SizeOf(Char) + vBlockSize;
  GetMem(Result, cCommandInfoHeadSize + vParamSize);
  PCommandInfo(Result)^.rIdent := MakeLong(FLastIdent, FControlIdent);
  PCommandInfo(Result)^.rType := scResource;
  PCommandInfo(Result)^.rParamSize := vParamSize;
  with PResourceCommand(@PCommandInfo(Result)^.rParam[0])^ do
  begin
    rResourceSize := AResourceInfo^.rSize;
    rResourceCrc32 := AResourceInfo^.rCrc32;
    rBlockPostion := ABlockPostion;
    rBlockSize := vBlockSize;
    Move(AResourceInfo^.rData[ABlockPostion], rBlockBuffer[0], vBlockSize);
  end;
  ABlockPostion := ABlockPostion + vBlockSize;
end;

function TCommandList.NewTranslucencyCommand(ATranslucency: Boolean;
  AIdents: array of Longword): PCommandInfo;
var
  I: Integer;
  vParamSize: Integer;
begin
  vParamSize := SizeOf(TTranslucencyCommand) - SizeOf(Longword) +
    SizeOf(Longword) * Length(AIdents);
  GetMem(Result, cCommandInfoHeadSize + vParamSize);
  PCommandInfo(Result)^.rIdent := MakeLong(FLastIdent, FControlIdent);
  PCommandInfo(Result)^.rType := scTranslucency;
  PCommandInfo(Result)^.rParamSize := vParamSize;
  with PTranslucencyCommand(@PCommandInfo(Result)^.rParam[0])^ do
  begin
    rTranslucency := ATranslucency;
    rCount := Length(AIdents);
    for I := Low(AIdents) to High(AIdents) do
      rIdents[I] := AIdents[I];
  end;
  AppendCommand(Result);
end;

procedure TCommandList.SetParasite(const Value: TList);
begin
  FParasite := Value;
  if Assigned(FParasite) then
    FCommands.Assign(FParasite)
  else FCommands.Clear;
end;

{ TLabelList }

function TLabelList.AcceptLabel(AIdent: Word; APoint: TPoint; AColor: TColor;
  AStyle: Byte; AName: WideString; ARemove: Boolean): Boolean;
var
  vLabelInfo: PLabelInfo;
  I: Integer;
begin
  if ARemove then
    Result := RemoveLabel(AIdent)
  else
  begin
    I := FindLabel(AIdent);
    if I < 0 then
    begin
      New(vLabelInfo);
      FLabels.Add(vLabelInfo);
      if Assigned(FParasite) then FParasite.Add(vLabelInfo);
    end else vLabelInfo := FLabels[I];
    vLabelInfo^.rIdent := AIdent;
    vLabelInfo^.rColor := AColor;
    vLabelInfo^.rStyle := AStyle;
    vLabelInfo^.rPoint.x := APoint.X;
    vLabelInfo^.rPoint.y := APoint.Y;
    FillChar(vLabelInfo^.rName, SizeOf(vLabelInfo^.rName), 0);
    AName := Copy(AName, 1, 19 + 1);
    if AName <> '' then
      Move(AName[1], vLabelInfo^.rName, Length(AName) * SizeOf(WideChar));
    Result := True;
  end;
end;

procedure TLabelList.Clear;
var
  I: Integer;
  vLabelInfo: PLabelInfo;
begin
  for I := FLabels.Count - 1 downto 0 do
  begin
    vLabelInfo := FLabels[I];
    Dispose(vLabelInfo);
  end;
  FLabels.Clear;
  if Assigned(FParasite) then FParasite.Clear;
end;

constructor TLabelList.Create;
begin
  FLabels := TList.Create; // 标注列表
end;

destructor TLabelList.Destroy;
begin
  if Assigned(FLabels) then
  begin
    if not Assigned(FParasite) then Clear;
    FLabels.Free;
  end;
  inherited;
end;

function TLabelList.FindLabel(AIdent: Word): Integer;
var
  I: Integer;
  vLabelInfo: PLabelInfo;
begin
  for I := 0 to FLabels.Count - 1 do
  begin
    vLabelInfo := FLabels[I];
    if vLabelInfo^.rIdent = AIdent then
    begin
      Result := I;
      Exit;
    end;
  end;
  Result := -1;
end;

function TLabelList.GetCount: Integer;
begin
  Result := FLabels.Count;
end;

function TLabelList.GetItems(AIndex: Integer): PLabelInfo;
begin
  if (AIndex >= 0) and (AIndex < FLabels.Count) then
    Result := FLabels[AIndex]
  else Result := nil;
end;

function TLabelList.RemoveLabel(AIdent: Word): Boolean;
var
  vLabelInfo: PLabelInfo;
  I: Integer;
begin
  Result := False;
  I := FindLabel(AIdent);
  if I < 0 then Exit;
  vLabelInfo := FLabels[I];
  Dispose(vLabelInfo);
  if Assigned(FParasite) then FParasite.Delete(I);
  FLabels.Delete(I);
  Result := True;
end;

procedure TLabelList.SetParasite(const Value: TList);
begin
  if FParasite = Value then Exit;
  FParasite := Value;
  FLabels.Assign(FParasite);
end;

{ TResourceList }

function TResourceList.AcceptCommand(AResourceCommand: PResourceCommand): Boolean;
var
  vResourceInfo: PResourceInfo;
  I: Integer;
begin
  Result := False;
  if not Assigned(AResourceCommand) then Exit;
  I := IndexFromCrc32(AResourceCommand^.rResourceCrc32, AResourceCommand^.rResourceSize);
  if I < 0 then
  begin
    GetMem(vResourceInfo, cResourceInfoHeadSize + AResourceCommand.rResourceSize);
    vResourceInfo^.rReceiveSize := 0;
    vResourceInfo^.rCrc32 := AResourceCommand^.rResourceCrc32;
    vResourceInfo^.rSize := AResourceCommand^.rResourceSize;
    FResourceList.Add(vResourceInfo);
  end else vResourceInfo := FResourceList[I];
  if vResourceInfo^.rReceiveSize >= vResourceInfo^.rSize then Exit; // 已经收到足够的数据
  { TODO : 数据合法性检验 }
  Inc(vResourceInfo^.rReceiveSize, AResourceCommand^.rBlockSize);
  Move(AResourceCommand^.rBlockBuffer[0],
    vResourceInfo^.rData[AResourceCommand^.rBlockPostion],
    AResourceCommand^.rBlockSize);
  Result := True;
end;

procedure TResourceList.Clear;
var
  I: Integer;
begin
  for I := FResourceList.Count - 1 downto 0 do Delete(I);
end;

constructor TResourceList.Create;
begin
  FResourceList := TList.Create;
end;

procedure TResourceList.Delete(AIndex: Integer);
var
  vResourceInfo: PResourceInfo;
begin
  if (AIndex < 0) or (AIndex >= FResourceList.Count) then Exit;
  vResourceInfo := FResourceList[AIndex];
  FreeMem(vResourceInfo, cResourceInfoHeadSize + vResourceInfo.rSize);
  FResourceList.Delete(AIndex);
end;

destructor TResourceList.Destroy;
begin
  Clear;
  if Assigned(FResourceList) then FResourceList.Free;
  inherited;
end;

function TResourceList.GetCount: Integer;
begin
  Result := FResourceList.Count;
end;

function TResourceList.GetItems(AIndex: Integer): PResourceInfo;
begin
  Result := nil;
  if (AIndex < 0) or (AIndex >= FResourceList.Count) then Exit;
  Result := FResourceList[AIndex];
end;

function TResourceList.IndexFromCrc32(ACrc32: Longword; ASize: Integer): Integer;
var
  I: Integer;
  vResourceInfo: PResourceInfo;
begin
  for I := 0 to FResourceList.Count - 1 do
  begin
    vResourceInfo := FResourceList[I];
    if (vResourceInfo^.rCrc32 = ACrc32) and
      (vResourceInfo^.rSize = ASize) then
    begin
      Result := I;
      Exit;
    end;
  end;
  Result := -1;
end;

{
function TResourceList.IndexFromIdent(AIdent: Longword): Integer;
var
  I: Integer;
  vResourceInfo: PResourceInfo;
begin
  for I := 0 to FResourceList.Count - 1 do
  begin
    vResourceInfo := FResourceList[I];
    if vResourceInfo^.rIdent = AIdent then
    begin
      Result := I;
      Exit;
    end;
  end;
  Result := -1;
end;
}

function TResourceList.LoadFromStream(AStream: TStream): Boolean;
var
  vCount: Integer;
  I: Integer;
  vAppend: Boolean;
begin
  Result := False;
  if not Assigned(AStream) then Exit;
  AStream.Read(vCount, SizeOf(vCount));
  for I := 0 to vCount - 1 do
    ReadStream(AStream, vAppend);
  Result := True;
end;

function TResourceList.NewResource(
  AData: Pointer;
  ASize: Integer): PResourceInfo;
begin
  GetMem(Result, cResourceInfoHeadSize + ASize);
  Inc(FLastIdent);
  Result^.rCrc32 := BufferCRC32(AData^, ASize);;
  Result^.rReceiveSize := ASize;
  Result^.rSize := ASize;
  Move(AData^, Result^.rData[0], ASize);
  FResourceList.Add(Result);
end;

function TResourceList.ReadStream(AStream: TStream; var AAppend: Boolean): Integer;
var
  I: Integer;
  vResourceInfo: TResourceInfo;
  vData: Pointer;
  vSize: Integer;
begin
  Result := -1;
  AAppend := False;
  if AStream.Read(vResourceInfo, cResourceInfoHeadSize) <>
    cResourceInfoHeadSize then Exit; // 读头信息
  I := IndexFromCrc32(vResourceInfo.rCrc32, vResourceInfo.rSize);
  vSize := cResourceInfoHeadSize + vResourceInfo.rSize;
  if I < 0 then // 如果资源不存在
  begin
    // 读取内容
    GetMem(vData, vSize);
    AStream.Seek(-cResourceInfoHeadSize, soFromCurrent);
    AStream.Read(vData^, vSize);
    I := FResourceList.Add(vData);
    AAppend := True;
  end else AStream.Seek(vResourceInfo.rSize, soFromCurrent);
  Result := I;
end;

function TResourceList.SaveToStream(AStream: TStream): Boolean;
var
  I: Integer;
  vCount: Integer;
  vResourceInfo: PResourceInfo;
begin
  Result := False;
  if not Assigned(AStream) then Exit;
  vCount := FResourceList.Count;
  AStream.Write(vCount, SizeOf(vCount));
  for I := 0 to FResourceList.Count - 1 do
  begin
    vResourceInfo := FResourceList[I];
    AStream.Write(vResourceInfo^,
      SizeOf(TResourceInfo) - SizeOf(Char) + vResourceInfo.rSize);
  end;
  Result := True;
end;

initialization
  CF_SHAPES := RegisterClipboardFormat('LovelyPaint Shapes');
  CF_RESOURCES := RegisterClipboardFormat('LovelyPaint Resources');

finalization

end.

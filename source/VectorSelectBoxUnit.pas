unit VectorSelectBoxUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ImgList, LovelyPanels21, VertexButton21;

type
  TFormVectorSelectBox = class(TForm)
    ImageListShapes: TImageList;
    ListViewShapes: TListView;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ListViewShapesDblClick(Sender: TObject);
    procedure ListViewShapesChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    { Private declarations }
    FButtonSelect: TVertexButton21;
    FButtonCancel: TVertexButton21;
    FButtonRefurbish: TVertexButton21;
    FPanelButton: TVertexPanel21;
    FVectorShapePath: string;
    FModelText: string;
    procedure SetVectorShapePath(const Value: string);
    procedure ButtonClick(Sender: TObject);
  public
    { Public declarations }
    property VectorShapePath: string read FVectorShapePath write SetVectorShapePath;
    procedure ScanPath;
    function TextFromVef(AFileName: string): string;
    property ModelText: string read FModelText;
  end;

//var//
//  FormVectorSelectBox: TFormVectorSelectBox;//

implementation

{$R *.dfm}

uses ShapeUtils21, XmlDoc, XMLIntf, xmldom, msxmldom;

const
  cRectangleText =
'V,0,0,0,0,,,$00717171,$006E6E6E'#13#10 +
'R,0,1,1,25,,,$00FFFFFF,$00FFFFFF'#13#10 +
'R,0,,1,1,,30,$00E3E3E3,$00E3E3E3'#13#10 +
'';
{ TFormVectorSelectBox }

procedure TFormVectorSelectBox.ScanPath;
var
  vSearchRec: TSearchRec;
  vShapeVector: TShapeVector;
  vModelText: string;
  vBitmap: TBitmap;
begin
  if not DirectoryExists(FVectorShapePath) then Exit;
  ListViewShapes.Items.Clear;
  ImageListShapes.Clear;
  if FindFirst(FVectorShapePath + '*.vef', faAnyFile, vSearchRec) = 0 then
  begin
    repeat
      if (vSearchRec.Attr and faDirectory) <> faDirectory then
      begin
        vModelText := TextFromVef(FVectorShapePath + vSearchRec.Name);
        if vModelText = '' then Continue;
        vShapeVector := TShapeVector.Create;
        try
          vShapeVector.ModelText := vModelText;
          if vShapeVector.ModelSize <= 1000 then
          begin
            vBitmap := TBitmap.Create;
            try
              vBitmap.Canvas.Brush.Color := clWhite;
              vBitmap.Width := ImageListShapes.Width;
              vBitmap.Height := ImageListShapes.Height;
              vShapeVector.FromPoint := Point(0, 0);
              vShapeVector.ToPoint :=
                Point(ImageListShapes.Width, ImageListShapes.Height);
              vShapeVector.PenWidth := 2;
              vShapeVector.Draw(Point(0, 0), vBitmap.Canvas);
              ImageListShapes.AddMasked(vBitmap, clWhite);
              with ListViewShapes.Items.Add do
              begin
                Caption := ChangeFileExt(vSearchRec.Name, '');
                ImageIndex := ImageListShapes.Count - 1;
                SubItems.Text := vModelText;
              end;
            finally
              vBitmap.Free;
            end;
          end;
        finally
          vShapeVector.Free;
        end;
      end;
    until FindNext(vSearchRec) <> 0;
    FindClose(vSearchRec);
  end;
end;

procedure TFormVectorSelectBox.SetVectorShapePath(const Value: string);
begin
  if FVectorShapePath = IncludeTrailingPathDelimiter(Value) then Exit;
  FVectorShapePath := IncludeTrailingPathDelimiter(Value);
  ScanPath;
end;

function TFormVectorSelectBox.TextFromVef(AFileName: string): string;
var
  vXMLDocument: TXMLDocument;
  vRootNode: IXMLNode;
  vShapeNode: IXMLNode;
  vPoint: TPoint;

  vAnchorNode: IXMLNode;
  I, J, K: Integer;
begin
  Result := '';
  vXMLDocument := TXMLDocument.Create(Self);
  try
    vXMLDocument.FileName := AFileName;
    try
      vXMLDocument.Active := True;
    except
      Exit;
    end;
    vRootNode := vXMLDocument.ChildNodes.FindNode('shapes');
    if not Assigned(vRootNode) then Exit;
    for I := 0 to vRootNode.ChildNodes.Count - 1 do
    begin
      vShapeNode := vRootNode.ChildNodes.Get(I);
      if not SameText(vShapeNode.NodeName, 'shape') then Continue;
      K := Pos(vShapeNode.Attributes['Type'], cVectorShapeChar);
      if K <= 0 then Continue;
      Result := Result + vShapeNode.Attributes['Type'];
      for J := 0 to vShapeNode.ChildNodes.Count - 1 do
      begin
        vAnchorNode := vShapeNode.ChildNodes.Get(J);
        if not SameText(vAnchorNode.NodeName, 'anchor') then Continue;
        vPoint.X := Byte(vAnchorNode.Attributes['X']);
        vPoint.Y := Byte(vAnchorNode.Attributes['Y']);
        Result := Result + Format('%d,%d-', [vPoint.X, vPoint.Y]);
      end;
      Delete(Result, Length(Result), 1);
      Result := Result + ';';
    end;
    Delete(Result, Length(Result), 1);
  finally
    vXMLDocument.Free;
  end;
end;

procedure TFormVectorSelectBox.FormCreate(Sender: TObject);
begin
  Caption := '图形模板';
  FPanelButton := TVertexPanel21.Create(Self);
  FPanelButton.Align := alBottom;
  FPanelButton.Height := 30;
  FPanelButton.Strings.Text := cRectangleText;
  FPanelButton.Parent := Self;

  FButtonSelect := TVertexButton21.Create(Self);
  FButtonSelect.Parent := FPanelButton;
  FButtonSelect.Caption := '选择(&S)';
  FButtonSelect.OnClick := ButtonClick;

  FButtonCancel := TVertexButton21.Create(Self);
  FButtonCancel.Parent := FPanelButton;
  FButtonCancel.Caption := '取消(&C)';
  FButtonCancel.OnClick := ButtonClick;

  FButtonRefurbish := TVertexButton21.Create(Self);
  FButtonRefurbish.Parent := FPanelButton;
  FButtonRefurbish.Caption := '刷新(&R)';
  FButtonRefurbish.OnClick := ButtonClick;
end;

procedure TFormVectorSelectBox.FormResize(Sender: TObject);
begin
  FButtonCancel.Top := 4;
  FButtonSelect.Top := FButtonCancel.Top;
  FButtonRefurbish.Top := FButtonCancel.Top;
  FButtonRefurbish.Left := 5;

  FButtonCancel.Left := FButtonCancel.Parent.ClientWidth -
    FButtonCancel.Width - 5;
  FButtonSelect.Left := FButtonCancel.Left - FButtonSelect.Width - 5;
end;

procedure TFormVectorSelectBox.ButtonClick(Sender: TObject);
begin
  if Sender = FButtonSelect then
  begin
    if Assigned(ListViewShapes.Selected) then
    begin
      FModelText := ListViewShapes.Selected.SubItems.Text;
      ModalResult := mrOK;
    end;
  end else if Sender = FButtonCancel then
  begin
    ModalResult := mrCancel;
  end else if Sender = FButtonRefurbish then
  begin
    ScanPath;
  end;
end;

procedure TFormVectorSelectBox.ListViewShapesDblClick(Sender: TObject);
begin
  if Assigned(ListViewShapes.Selected) then
  begin
    FModelText := ListViewShapes.Selected.SubItems.Text;
    ModalResult := mrOK;
  end;
end;

procedure TFormVectorSelectBox.ListViewShapesChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  FButtonSelect.Enabled := Assigned(ListViewShapes.Selected);
end;

end.

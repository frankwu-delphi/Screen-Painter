object FormScreenPaint: TFormScreenPaint
  Left = 410
  Top = 179
  BorderStyle = bsNone
  Caption = 'FormScreenPaint'
  ClientHeight = 466
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PopupMenuJug: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 24
    Top = 8
    object MenuItemPlayA: TMenuItem
      Action = ActionPlay
      Caption = #21551#29992' '#12304'Win+P'#25110'Win+Z'#12305
    end
    object MenuItemLineG: TMenuItem
      Caption = '-'
    end
    object MenuItemCloseA: TMenuItem
      Action = ActionClose
    end
  end
  object PopupMenuPaint: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 56
    Top = 8
    object MenuItemShape: TMenuItem
      Caption = #22270#24418
      object MenuItemPen: TMenuItem
        Action = ActionPen
      end
      object MenuItemLine: TMenuItem
        Action = ActionLine
      end
      object MenuItemArrow: TMenuItem
        Action = ActionArrow
      end
      object MenuItemRectangle: TMenuItem
        Action = ActionRectangle
      end
      object MenuItemText: TMenuItem
        Action = ActionText
      end
      object MenuItemElipse: TMenuItem
        Action = ActionEllipse
      end
      object MenuItemMoreShape: TMenuItem
        Action = ActionMoreShape
      end
    end
    object MenuItemColor: TMenuItem
      Caption = #39068#33394
      object MenuItemBlack: TMenuItem
        Action = ActionBlack
      end
      object MenuItemRed: TMenuItem
        Action = ActionRed
      end
      object MenuItemGreen: TMenuItem
        Action = ActionGreen
      end
      object MenuItemWhite: TMenuItem
        Action = ActionWhite
      end
      object MenuItemSky: TMenuItem
        Action = ActionSky
      end
      object MenuItemMoreColor: TMenuItem
        Action = ActionMoreColor
      end
    end
    object MenuItemPenWidth: TMenuItem
      Caption = #31895#32454
      object MenuItem3Pixel: TMenuItem
        Action = Action3Pixel
      end
      object MenuItem4Pixel: TMenuItem
        Action = Action4Pixel
      end
      object MenuItem5Pixel: TMenuItem
        Action = Action5Pixel
      end
      object MenuItem6Pixel: TMenuItem
        Action = Action6Pixel
      end
      object MenuItem10Pixel: TMenuItem
        Action = Action10Pixel
      end
    end
    object MenuItemEdit: TMenuItem
      Caption = #32534#36753
      object MenuItemCopyB: TMenuItem
        Action = ActionCopy
      end
      object MenuItemPaste: TMenuItem
        Action = ActionPaste
      end
      object MenuItemCut: TMenuItem
        Action = ActionCut
      end
      object MenuItemLineI: TMenuItem
        Caption = '-'
      end
      object MenuItemSelectAll: TMenuItem
        Action = ActionSelectAll
      end
      object MenuItemDelete: TMenuItem
        Action = ActionDelete
      end
      object MenuItemLineJ: TMenuItem
        Caption = '-'
      end
      object MenuItemUndoB: TMenuItem
        Action = ActionUndo
      end
      object MenuItemRedo: TMenuItem
        Action = ActionRedo
      end
    end
    object MenuItemLineE: TMenuItem
      Caption = '-'
    end
    object MenuItemModify: TMenuItem
      Action = ActionModify
      AutoCheck = True
      Caption = #20462#25913
    end
    object MenuItemPhotoB: TMenuItem
      Action = ActionPhoto
    end
    object MenuItemRestore: TMenuItem
      Action = ActionStop
      Caption = #24674#22797
    end
    object MenuItemLineD: TMenuItem
      Caption = '-'
    end
    object MenuItemFile: TMenuItem
      Caption = #25991#20214
      object png1: TMenuItem
        Action = ActionSaveToPng
        Caption = #21098#36148#26495#23384'PNG'
      end
      object MenuItemSaveToFile: TMenuItem
        Action = ActionSaveToFile
      end
      object MenuItemLoadFromFIle: TMenuItem
        Action = ActionLoadFromFile
      end
      object MenuItemLineF: TMenuItem
        Caption = '-'
      end
      object MenuItemFileShellB: TMenuItem
        Action = ActionFileShell
      end
    end
    object MenuItemLineK: TMenuItem
      Caption = '-'
    end
    object MenuItemCloseB: TMenuItem
      Action = ActionClose
    end
  end
  object ActionListOne: TActionList
    OnUpdate = ActionListOneUpdate
    Left = 88
    Top = 8
    object ActionCopy: TAction
      Category = 'Edit'
      Caption = #22797#21046
      OnExecute = ActionCopyExecute
    end
    object ActionCut: TAction
      Tag = 1
      Category = 'Edit'
      Caption = #21098#20999
      OnExecute = ActionCutExecute
    end
    object ActionPlay: TAction
      Caption = #21551#29992#23631#24149#30011#26495' '#12304'Win+P'#12305
      OnExecute = ActionPlayExecute
    end
    object ActionDelete: TAction
      Tag = 2
      Category = 'Edit'
      Caption = #21024#38500
      OnExecute = ActionDeleteExecute
    end
    object ActionPhoto: TAction
      Caption = #25130#22270
      ShortCut = 32843
      OnExecute = ActionPhotoExecute
    end
    object ActionSelectAll: TAction
      Tag = 3
      Category = 'Edit'
      Caption = #20840#36873
      OnExecute = ActionSelectAllExecute
    end
    object ActionClose: TAction
      Caption = #20851#38381
      OnExecute = ActionCloseExecute
    end
    object ActionStop: TAction
      Caption = #36824#21407
      ShortCut = 27
      OnExecute = ActionStopExecute
    end
    object ActionPen: TAction
      Category = 'Shape'
      Caption = #31508#21047
      Checked = True
      GroupIndex = 3
      ShortCut = 32848
      OnExecute = ActionPenExecute
    end
    object ActionLine: TAction
      Category = 'Shape'
      Caption = #30452#32447
      GroupIndex = 3
      ShortCut = 32844
      OnExecute = ActionLineExecute
    end
    object ActionRectangle: TAction
      Category = 'Shape'
      Caption = #30697#24418
      GroupIndex = 3
      ShortCut = 32850
      OnExecute = ActionRectangleExecute
    end
    object ActionArrow: TAction
      Category = 'Shape'
      Caption = #31661#22836
      GroupIndex = 3
      ShortCut = 32833
      OnExecute = ActionArrowExecute
    end
    object ActionText: TAction
      Category = 'Shape'
      Caption = #25991#23383
      GroupIndex = 3
      ShortCut = 32852
      OnExecute = ActionTextExecute
    end
    object ActionMoreShape: TAction
      Category = 'Shape'
      Caption = #26356#22810#22270#24418
      GroupIndex = 3
      OnExecute = ActionMoreShapeExecute
    end
    object ActionEllipse: TAction
      Category = 'Shape'
      Caption = #22278#24418
      GroupIndex = 3
      ShortCut = 32837
      OnExecute = ActionEllipseExecute
    end
    object ActionBlack: TAction
      Category = 'Color'
      Caption = #40657#33394
      Checked = True
      GroupIndex = 1
      ShortCut = 16450
      OnExecute = ActionBlackExecute
    end
    object ActionRed: TAction
      Category = 'Color'
      Caption = #32418#33394
      GroupIndex = 1
      ShortCut = 16466
      OnExecute = ActionRedExecute
    end
    object ActionGreen: TAction
      Category = 'Color'
      Caption = #32511#33394
      GroupIndex = 1
      ShortCut = 16455
      OnExecute = ActionGreenExecute
    end
    object ActionSky: TAction
      Category = 'Color'
      Caption = #22825#34013#33394
      GroupIndex = 1
      ShortCut = 16467
      OnExecute = ActionSkyExecute
    end
    object ActionWhite: TAction
      Category = 'Color'
      Caption = #30333#33394
      GroupIndex = 1
      ShortCut = 16471
      OnExecute = ActionWhiteExecute
    end
    object ActionMoreColor: TAction
      Category = 'Color'
      Caption = #26356#22810#39068#33394
      GroupIndex = 1
      OnExecute = ActionMoreColorExecute
    end
    object Action3Pixel: TAction
      Category = 'Pixel'
      Caption = '3'#20687#32032
      GroupIndex = 2
      ShortCut = 51
      OnExecute = Action3PixelExecute
    end
    object Action4Pixel: TAction
      Category = 'Pixel'
      Caption = '4'#20687#32032
      GroupIndex = 2
      ShortCut = 52
      OnExecute = Action4PixelExecute
    end
    object Action5Pixel: TAction
      Category = 'Pixel'
      Caption = '5'#20687#32032
      GroupIndex = 2
      ShortCut = 53
      OnExecute = Action5PixelExecute
    end
    object Action6Pixel: TAction
      Category = 'Pixel'
      Caption = '6'#20687#32032
      GroupIndex = 2
      ShortCut = 54
      OnExecute = Action6PixelExecute
    end
    object ActionModify: TAction
      AutoCheck = True
      Caption = #20462#25913'/'#32472#21046
      ShortCut = 32845
      OnExecute = ActionModifyExecute
    end
    object ActionBlog: TAction
      Caption = #27714#20851#27880
    end
    object ActionSaveToFile: TAction
      Category = 'File'
      Caption = #20445#23384
      OnExecute = ActionSaveToFileExecute
    end
    object ActionFileShell: TAction
      Category = 'File'
      Caption = #25991#20214#20851#32852
      OnExecute = ActionFileShellExecute
    end
    object ActionPaste: TAction
      Tag = 4
      Category = 'Edit'
      Caption = #31896#36148
      OnExecute = ActionPasteExecute
    end
    object ActionUndo: TAction
      Tag = 5
      Category = 'Edit'
      Caption = #25764#38144
      OnExecute = ActionUndoExecute
    end
    object ActionRedo: TAction
      Tag = 6
      Category = 'Edit'
      Caption = #37325#22797
      OnExecute = ActionRedoExecute
    end
    object ActiveCursor: TAction
      AutoCheck = True
      Caption = #25235#21462#40736#26631#25351#38024
    end
    object ActionLoadFromFile: TAction
      Category = 'File'
      Caption = #21152#36733
      OnExecute = ActionLoadFromFileExecute
    end
    object Action10Pixel: TAction
      Category = 'Pixel'
      Caption = '10'#20687#32032
      OnExecute = Action10PixelExecute
    end
    object ActionLiveUpdate: TAction
      Caption = #22312#32447#21319#32423
    end
    object ActionSaveToPng: TAction
      Category = 'File'
      Caption = #23384#20026'png'
      OnExecute = ActionSaveToPngExecute
    end
  end
  object TimerPlay: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerPlayTimer
    Left = 120
    Top = 8
  end
  object ColorDialogOne: TColorDialog
    Left = 152
    Top = 8
  end
  object OpenDialogOne: TOpenDialog
    Filter = #23631#24149#30011#26495#25991#20214'(*.paint)|*.paint'
    Left = 184
    Top = 8
  end
  object SaveDialogOne: TSaveDialog
    Filter = #23631#24149#30011#26495#25991#20214'(*.paint)|*.paint'
    Left = 216
    Top = 8
  end
  object SavePictureDialogOne: TSavePictureDialog
    Filter = 'Png (*.png)|*.png'
    FilterIndex = 0
    Left = 248
    Top = 8
  end
end

object frmSec: TfrmSec
  Left = 32
  Top = 6
  Width = 1116
  Height = 771
  Caption = 'frmSec'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 16
    Width = 31
    Height = 13
    Caption = #1051#1086#1075#1080#1085
  end
  object Label2: TLabel
    Left = 72
    Top = 40
    Width = 38
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object lbConnectionResult: TLabel
    Left = 24
    Top = 120
    Width = 92
    Height = 13
    Caption = 'lbConnectionResult'
  end
  object Label3: TLabel
    Left = 152
    Top = 120
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Label6: TLabel
    Left = 184
    Top = 120
    Width = 32
    Height = 13
    Caption = 'Label6'
  end
  object Label4: TLabel
    Left = 72
    Top = 72
    Width = 36
    Height = 13
    Caption = #1089#1077#1088#1074#1077#1088
  end
  object edLogin: TEdit
    Left = 128
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'train17249'
  end
  object edPassword: TEdit
    Left = 128
    Top = 40
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = '133808'
  end
  object btnConnect: TButton
    Left = 24
    Top = 96
    Width = 75
    Height = 25
    Caption = #1089#1090#1072#1088#1090
    TabOrder = 2
    OnClick = btnConnectClick
  end
  object sgSecs: TStringGrid
    Left = 448
    Top = 40
    Width = 457
    Height = 217
    ColCount = 12
    RowCount = 2
    TabOrder = 3
  end
  object Button2: TButton
    Left = 368
    Top = 0
    Width = 75
    Height = 25
    Caption = #1082#1091#1087#1080#1090#1100
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 368
    Top = 24
    Width = 75
    Height = 25
    Caption = #1089#1085#1103#1090#1100
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 368
    Top = 48
    Width = 75
    Height = 25
    Caption = #1087#1088#1086#1076#1072#1090#1100
    TabOrder = 6
    OnClick = Button4Click
  end
  object PageControl1: TPageControl
    Left = 656
    Top = 280
    Width = 433
    Height = 353
    ActivePage = TabSheet3
    TabOrder = 7
    object TabSheet1: TTabSheet
      Caption = #1050#1040#1058#1045#1056#1054#1042#1050#1048
      object StringGrid1: TStringGrid
        Left = 0
        Top = 88
        Width = 425
        Height = 193
        ColCount = 6
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1087#1086#1079#1080#1094#1080#1080
      ImageIndex = 1
      object StringGrid2: TStringGrid
        Left = 24
        Top = 24
        Width = 401
        Height = 120
        ColCount = 10
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        TabOrder = 0
      end
      object StringGrid3: TStringGrid
        Left = 24
        Top = 168
        Width = 401
        Height = 120
        ColCount = 8
        FixedCols = 0
        RowCount = 2
        TabOrder = 1
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      object StringGrid4: TStringGrid
        Left = 24
        Top = 32
        Width = 393
        Height = 120
        ColCount = 2
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        TabOrder = 0
      end
      object StringGrid5: TStringGrid
        Left = 24
        Top = 168
        Width = 393
        Height = 120
        ColCount = 1
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        TabOrder = 1
      end
    end
  end
  object Button5: TButton
    Left = 144
    Top = 136
    Width = 97
    Height = 25
    Caption = #1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '
    TabOrder = 8
    OnClick = Button5Click
  end
  object time: TEdit
    Left = 24
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 9
    Text = '5'
  end
  object Edit1: TEdit
    Left = 24
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 10
    Text = '10'
  end
  object SetTime: TButton
    Left = 144
    Top = 160
    Width = 97
    Height = 17
    Caption = #1091#1089#1090#1086#1085#1086#1074#1080#1090#1100' '#1084#1080#1085
    TabOrder = 11
    OnClick = SetTimeClick
  end
  object Edit2: TEdit
    Left = 128
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 12
    Text = 'train.alor.ru'
  end
  object CheckListBox1: TCheckListBox
    Left = 24
    Top = 184
    Width = 121
    Height = 25
    ItemHeight = 13
    TabOrder = 13
  end
  object Chart1: TChart
    Left = 24
    Top = 224
    Width = 400
    Height = 250
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    View3D = False
    TabOrder = 14
    Visible = False
    object Series1: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      LinePen.Color = clRed
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series2: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      LinePen.Color = clGreen
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series3: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clYellow
      LinePen.Color = clYellow
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series4: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlue
      LinePen.Color = clBlue
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series5: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clWhite
      LinePen.Color = clWhite
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series6: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGray
      LinePen.Color = clGray
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series7: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clFuchsia
      LinePen.Color = clFuchsia
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series8: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clTeal
      LinePen.Color = clTeal
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series9: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clNavy
      LinePen.Color = clNavy
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object Chart2: TChart
    Left = 24
    Top = 472
    Width = 400
    Height = 250
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    TabOrder = 15
    Visible = False
    object Series10: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      LinePen.Color = clRed
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series11: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      LinePen.Color = clGreen
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object Slot: TSlot
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnSynchronized = SlotSynchronized
    Left = 24
    Top = 16
  end
  object SlotTable: TSlotTable
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnOpened = SlotTableOpened
    OnClear = SlotTableClear
    OnAddRow = SlotTableAddRow
    OnError = SlotTableError
    Left = 256
    Top = 88
  end
  object SlotTable1: TSlotTable
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnOpened = SlotTable1Opened
    OnClear = SlotTable1Clear
    OnAddRow = SlotTable1AddRow
    OnUpdateRow = SlotTable1UpdateRow
    OnDeleteRow = SlotTable1DeleteRow
    OnReplBegin = SlotTable1ReplBegin
    OnReplEnd = SlotTable1ReplEnd
    OnError = SlotTable1Error
    Left = 288
    Top = 88
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 272
    Top = 24
  end
  object SlotFace1: TSlotFace
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 272
    Top = 48
  end
  object zayavki: TSfxOrder
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 320
    Top = 24
  end
  object analiz: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = analizTimer
    Left = 320
    Top = 48
  end
  object POSITION: TSlotTable
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnOpened = POSITIONOpened
    OnAddRow = POSITIONAddRow
    OnError = POSITIONError
    Left = 320
    Top = 88
  end
  object HOLDING: TSlotTable
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnOpened = HOLDINGOpened
    OnClear = HOLDINGClear
    OnAddRow = HOLDINGAddRow
    OnError = HOLDINGError
    Left = 352
    Top = 88
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer2Timer
    Left = 456
  end
  object MyQuery1: TMyQuery
    Connection = MyConnection1
    Left = 400
    Top = 112
  end
  object MyConnection1: TMyConnection
    Database = 'robot'
    Username = 'root'
    Server = 'localhost'
    Left = 400
    Top = 88
  end
  object ORDERS: TSlotTable
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnClear = ORDERSClear
    OnAddRow = ORDERSAddRow
    OnError = ORDERSError
    Left = 288
    Top = 120
  end
  object kontrol: TTimer
    Enabled = False
    Interval = 18000
    OnTimer = kontrolTimer
    Left = 320
  end
end

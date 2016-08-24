object frmMain: TfrmMain
  Left = 190
  Top = 105
  BorderStyle = bsDialog
  Caption = 'Test'
  ClientHeight = 554
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 485
    Top = 0
    Width = 185
    Height = 554
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object lblDimensions: TLabel
      Left = 28
      Top = 14
      Width = 57
      Height = 13
      Caption = 'Dimensions:'
    end
    object btnThFile: TButton
      Left = 13
      Top = 101
      Width = 159
      Height = 44
      Caption = 'Make thumbnail from file'
      TabOrder = 0
      OnClick = btnThFileClick
    end
    object edtWidth: TEdit
      Left = 28
      Top = 28
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '100'
    end
    object edtHeight: TEdit
      Left = 28
      Top = 51
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '100'
    end
    object cbxCenter: TCheckBox
      Left = 28
      Top = 75
      Width = 97
      Height = 17
      Caption = 'Center'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object btnImgFile: TButton
      Left = 13
      Top = 147
      Width = 159
      Height = 44
      Caption = 'Get image from file'
      TabOrder = 4
      OnClick = btnImgFileClick
    end
    object btnThStr: TButton
      Left = 13
      Top = 193
      Width = 159
      Height = 44
      Caption = 'Make thumbnail from stream'
      TabOrder = 5
      OnClick = btnThStrClick
    end
    object btnImgStr: TButton
      Left = 13
      Top = 239
      Width = 159
      Height = 44
      Caption = 'Get image from stream'
      TabOrder = 6
      OnClick = btnImgStrClick
    end
  end
  object sbxMain: TScrollBox
    Left = 0
    Top = 0
    Width = 485
    Height = 554
    HorzScrollBar.Smooth = True
    HorzScrollBar.Tracking = True
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    Align = alClient
    Color = clAppWorkSpace
    ParentColor = False
    TabOrder = 1
    object imgMain: TImage
      Left = 0
      Top = 0
      Width = 105
      Height = 105
      AutoSize = True
    end
  end
  object dlgOpen: TOpenDialog
    DefaultExt = 'jpg'
    Filter = 'JPEG Images|*.jpg'
    Left = 8
    Top = 510
  end
end

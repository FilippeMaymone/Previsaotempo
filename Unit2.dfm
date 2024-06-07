object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 451
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object edCidade: TLabeledEdit
    Left = 8
    Top = 48
    Width = 121
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Cidade'
    TabOrder = 0
    Text = ''
  end
  object Memo1: TMemo
    Left = 183
    Top = 8
    Width = 186
    Height = 443
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 75
    Width = 121
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 556
    Top = 319
    Width = 62
    Height = 25
    Caption = '>>>>'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object Panel1: TPanel
    Left = 664
    Top = 136
    Width = 225
    Height = 201
    BevelOuter = bvNone
    TabOrder = 4
    object lbData: TLabel
      Left = 0
      Top = 188
      Width = 225
      Height = 13
      Align = alBottom
      Caption = 'lbData'
      ExplicitWidth = 31
    end
    object lbDescricao: TLabel
      Left = 0
      Top = 25
      Width = 225
      Height = 15
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 3
    end
    object pnCidade: TPanel
      Left = 0
      Top = 0
      Width = 225
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Cidade'
      Color = clYellow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      StyleName = 'Windows'
    end
    object Panel2: TPanel
      Left = 0
      Top = 40
      Width = 225
      Height = 112
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 5
      TabOrder = 1
      object lbPrevisao: TLabel
        Left = 110
        Top = 0
        Width = 115
        Height = 112
        Align = alClient
        Alignment = taCenter
        Caption = 'lbPrevisao'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 130
        ExplicitHeight = 40
      end
      object imgPrev: TImage
        Left = 5
        Top = 0
        Width = 105
        Height = 112
        Align = alLeft
        Center = True
        Stretch = True
        Transparent = True
        ExplicitLeft = 8
        ExplicitTop = 40
        ExplicitHeight = 105
      end
    end
  end
  object RESTClient1: TRESTClient
    Params = <>
    SynchronizedEvents = False
    Left = 40
    Top = 176
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 48
    Top = 240
  end
  object RESTResponse1: TRESTResponse
    Left = 40
    Top = 312
  end
end

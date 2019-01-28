object FrmPagarConta: TFrmPagarConta
  Left = 0
  Top = 0
  Caption = 'PAGAR CONTA'
  ClientHeight = 179
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PaConteudo: TPanel
    Left = 0
    Top = 0
    Width = 395
    Height = 179
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 393
    ExplicitHeight = 135
    object LblDescricao: TLabel
      Left = 16
      Top = 16
      Width = 68
      Height = 16
      Caption = 'Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblValor: TLabel
      Left = 16
      Top = 48
      Width = 39
      Height = 16
      Caption = 'Valor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblVencimentoLuz: TLabel
      Left = 15
      Top = 79
      Width = 81
      Height = 16
      Caption = 'Vencimento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblDataPagamento: TLabel
      Left = 15
      Top = 111
      Width = 78
      Height = 16
      Caption = 'Pagamento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CpoDescricao: TEdit
      Left = 104
      Top = 15
      Width = 273
      Height = 21
      TabOrder = 0
    end
    object BtnPagar: TButton
      Left = 214
      Top = 144
      Width = 75
      Height = 25
      Caption = 'PAGAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BtnPagarClick
    end
    object BtnFechar: TButton
      Left = 302
      Top = 144
      Width = 75
      Height = 25
      Caption = 'FECHAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BtnFecharClick
    end
    object CpoValor: TEdit
      Left = 104
      Top = 47
      Width = 89
      Height = 21
      TabOrder = 3
    end
    object CpoVencimento: TDateTimePicker
      Left = 104
      Top = 78
      Width = 92
      Height = 21
      Date = 43420.483108935190000000
      Time = 43420.483108935190000000
      TabOrder = 4
    end
    object CpoIdParcela: TEdit
      Left = 344
      Top = 42
      Width = 33
      Height = 21
      TabOrder = 5
      Visible = False
    end
    object CpoDataPagemento: TDateTimePicker
      Left = 104
      Top = 110
      Width = 92
      Height = 21
      Date = 43420.483108935190000000
      Time = 43420.483108935190000000
      TabOrder = 6
    end
  end
  object QrPagarConta: TFDQuery
    Connection = DataModule1.FDConn
    Left = 223
    Top = 44
  end
end

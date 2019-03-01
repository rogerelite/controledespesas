object FrmConsultaDespesas: TFrmConsultaDespesas
  Left = 0
  Top = 0
  Caption = 'CONSULTA DE DESPESAS'
  ClientHeight = 505
  ClientWidth = 742
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
    Width = 742
    Height = 505
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 8
    object LblSalario: TLabel
      Left = 17
      Top = 59
      Width = 63
      Height = 16
      Caption = 'SAL'#193'RIO:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblData: TLabel
      Left = 641
      Top = 8
      Width = 82
      Height = 16
      Caption = 'DATA ATUAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblMes: TLabel
      Left = 17
      Top = 85
      Width = 31
      Height = 16
      Caption = 'M'#202'S:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblAno: TLabel
      Left = 80
      Top = 84
      Width = 32
      Height = 16
      Caption = 'ANO:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GBFiltro: TGroupBox
      Left = 288
      Top = 26
      Width = 192
      Height = 95
      Caption = 'FILTRO'
      TabOrder = 9
      object CpoAtrasadas: TCheckBox
        Left = 11
        Top = 24
        Width = 193
        Height = 17
        Caption = 'CONTAS ATRASADAS'
        TabOrder = 0
        OnClick = CpoAtrasadasClick
      end
      object CpoEmDia: TCheckBox
        Left = 11
        Top = 47
        Width = 193
        Height = 17
        Caption = 'CONTAS EM DIA'
        TabOrder = 1
        OnClick = CpoEmDiaClick
      end
      object CpoPagas: TCheckBox
        Left = 11
        Top = 70
        Width = 193
        Height = 17
        Caption = 'CONTAS PAGAS'
        TabOrder = 2
        OnClick = CpoPagasClick
      end
    end
    object grpGbTotais: TGroupBox
      Left = 17
      Top = 157
      Width = 463
      Height = 102
      Caption = 'TOTAIS'
      TabOrder = 8
      object LblSaldo: TLabel
        Left = 15
        Top = 19
        Width = 40
        Height = 16
        Caption = 'Saldo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblValorSaldo: TLabel
        Left = 154
        Top = 19
        Width = 8
        Height = 16
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblTotalContas: TLabel
        Left = 15
        Top = 43
        Width = 50
        Height = 16
        Caption = 'Contas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblValorContas: TLabel
        Left = 154
        Top = 43
        Width = 8
        Height = 16
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblTotalAtrasadas: TLabel
        Left = 15
        Top = 67
        Width = 120
        Height = 16
        Caption = 'Contas atrasadas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblValorAtrasadas: TLabel
        Left = 154
        Top = 67
        Width = 8
        Height = 16
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblTotalEmDia: TLabel
        Left = 271
        Top = 43
        Width = 96
        Height = 16
        Caption = 'Contas em dia:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblValorEmDia: TLabel
        Left = 382
        Top = 43
        Width = 8
        Height = 16
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblTotalPagas: TLabel
        Left = 271
        Top = 67
        Width = 93
        Height = 16
        Caption = 'Contas pagas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblValorPagas: TLabel
        Left = 382
        Top = 67
        Width = 8
        Height = 16
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object BtnBuscar: TButton
      Left = 16
      Top = 24
      Width = 75
      Height = 25
      Caption = 'BUSCAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BtnBuscarClick
    end
    object CpoNome: TEdit
      Left = 91
      Top = 26
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object CpoIdPessoa: TEdit
      Left = 215
      Top = 26
      Width = 42
      Height = 21
      TabOrder = 2
      Visible = False
    end
    object GrdContas: TDBGrid
      Left = 1
      Top = 268
      Width = 479
      Height = 229
      Align = alCustom
      DataSource = DsGrade
      TabOrder = 10
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdContasDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'PARCELA'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENCIMENTO'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAGO'
          Visible = True
        end>
    end
    object BtnConsultar: TButton
      Left = 324
      Top = 127
      Width = 75
      Height = 25
      Caption = 'CONSULTAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = BtnConsultarClick
    end
    object grpGbFixas: TGroupBox
      Left = 486
      Top = 26
      Width = 239
      Height = 473
      Caption = 'CONTAS FIXAS VARI'#193'VEIS'
      TabOrder = 5
      object GbAgua: TGroupBox
        Left = 10
        Top = 130
        Width = 220
        Height = 110
        Caption = #193'GUA'
        TabOrder = 1
        object LblValorAgua: TLabel
          Left = 15
          Top = 24
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
        object LblVencimentoAgua: TLabel
          Left = 16
          Top = 50
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
        object CpoValorAgua: TEdit
          Left = 64
          Top = 22
          Width = 133
          Height = 21
          TabOrder = 0
        end
        object CpoVencimentoAgua: TDateTimePicker
          Left = 105
          Top = 49
          Width = 92
          Height = 21
          Date = 43420.483108935190000000
          Time = 43420.483108935190000000
          TabOrder = 1
        end
        object BtnSalvarAgua: TButton
          Left = 122
          Top = 75
          Width = 75
          Height = 25
          Caption = 'SALVAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = BtnSalvarAguaClick
        end
      end
      object GbLuz: TGroupBox
        Left = 10
        Top = 18
        Width = 220
        Height = 110
        Caption = 'LUZ'
        TabOrder = 0
        object LblValorLuz: TLabel
          Left = 15
          Top = 24
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
          Top = 50
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
        object CpoValorLuz: TEdit
          Left = 64
          Top = 22
          Width = 133
          Height = 21
          TabOrder = 0
        end
        object CpoVencimentoLuz: TDateTimePicker
          Left = 105
          Top = 49
          Width = 92
          Height = 21
          Date = 43420.483108935190000000
          Time = 43420.483108935190000000
          TabOrder = 1
        end
        object BtnSalvarLuz: TButton
          Left = 122
          Top = 76
          Width = 75
          Height = 25
          Caption = 'SALVAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = BtnSalvarLuzClick
        end
      end
      object GbInternet: TGroupBox
        Left = 11
        Top = 242
        Width = 220
        Height = 110
        Caption = 'INTERNET'
        TabOrder = 2
        object LblValorInternet: TLabel
          Left = 15
          Top = 24
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
        object LblVencimentoInternet: TLabel
          Left = 16
          Top = 50
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
        object CpoValorInternet: TEdit
          Left = 64
          Top = 22
          Width = 133
          Height = 21
          TabOrder = 0
        end
        object CpoVencimentoInternet: TDateTimePicker
          Left = 105
          Top = 49
          Width = 92
          Height = 21
          Date = 43420.483108935190000000
          Time = 43420.483108935190000000
          TabOrder = 1
        end
        object BtnSalvarInternet: TButton
          Left = 122
          Top = 75
          Width = 75
          Height = 25
          Caption = 'SALVAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = BtnSalvarInternetClick
        end
      end
      object GroupBox1: TGroupBox
        Left = 11
        Top = 356
        Width = 220
        Height = 110
        Caption = 'TELEFONE'
        TabOrder = 3
        object LblValorTelefone: TLabel
          Left = 15
          Top = 24
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
        object LblVencimentoTelefone: TLabel
          Left = 16
          Top = 50
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
        object CpoValorTelefone: TEdit
          Left = 64
          Top = 22
          Width = 133
          Height = 21
          TabOrder = 0
        end
        object CpoVencimentoTelefone: TDateTimePicker
          Left = 105
          Top = 49
          Width = 92
          Height = 21
          Date = 43420.483108935190000000
          Time = 43420.483108935190000000
          TabOrder = 1
        end
        object BtnSalvarTelefone: TButton
          Left = 122
          Top = 75
          Width = 75
          Height = 25
          Caption = 'SALVAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = BtnSalvarTelefoneClick
        end
      end
    end
    object BtnLimpar: TButton
      Left = 405
      Top = 127
      Width = 75
      Height = 25
      Caption = 'LIMPAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = BtnLimparClick
    end
    object CpoAno: TSpinEdit
      Left = 80
      Top = 105
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 4
      Value = 0
    end
    object CpoMes: TSpinEdit
      Left = 16
      Top = 105
      Width = 57
      Height = 22
      MaxValue = 12
      MinValue = 1
      TabOrder = 3
      Value = 1
    end
    object CpoSalario: TEdit
      Left = 91
      Top = 57
      Width = 121
      Height = 21
      TabOrder = 11
    end
  end
  object QrFixas: TFDQuery
    Connection = DataModule1.FDConn
    Left = 307
    Top = 381
  end
  object CdsGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 381
    object CdsGradeNUM_PARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object CdsGradeTIPO_CONTA: TStringField
      FieldName = 'TIPO'
      Size = 25
    end
    object CdsGradeVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object CdsGradeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 250
    end
    object CdsGradePAGO: TStringField
      FieldName = 'PAGO'
      Size = 3
    end
    object CdsGradeVENCIMENTO: TStringField
      FieldName = 'VENCIMENTO'
    end
    object CdsGradeID_PARCELA: TIntegerField
      FieldName = 'ID_PARCELA'
    end
  end
  object QrGrade: TFDQuery
    Connection = DataModule1.FDConn
    Left = 411
    Top = 381
  end
  object QrCadastra: TFDQuery
    Connection = DataModule1.FDConn
    Left = 307
    Top = 429
  end
  object DsGrade: TDataSource
    DataSet = CdsGrade
    Left = 361
    Top = 429
  end
  object QrConsulta: TFDQuery
    Connection = DataModule1.FDConn
    Left = 411
    Top = 429
  end
end

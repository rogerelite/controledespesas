object FrmConsultaDespesas: TFrmConsultaDespesas
  Left = 0
  Top = 0
  Caption = 'CONSULTA DE DESPESAS'
  ClientHeight = 505
  ClientWidth = 498
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
    Width = 498
    Height = 505
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
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
      Left = 397
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
      TabOrder = 8
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
      TabOrder = 7
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
      Caption = 'TITULAR'
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
      Left = 9
      Top = 268
      Width = 479
      Height = 229
      Align = alCustom
      DataSource = DsGrade
      TabOrder = 9
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
      TabOrder = 5
      OnClick = BtnConsultarClick
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
      TabOrder = 6
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
      TabOrder = 10
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

object FrmMenu: TFrmMenu
  Left = 0
  Top = 0
  Caption = 'CONTROLE DE DESPESAS'
  ClientHeight = 571
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PaConteudo: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 571
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 652
    ExplicitHeight = 321
    object LblSalario: TLabel
      Left = 33
      Top = 56
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
      Left = 537
      Top = 21
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
      Left = 33
      Top = 93
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
    object BtnBuscar: TButton
      Left = 32
      Top = 16
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
    object EdtNome: TEdit
      Left = 107
      Top = 18
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object EdtId: TEdit
      Left = 231
      Top = 18
      Width = 42
      Height = 21
      TabOrder = 2
      Visible = False
    end
    object EdtSalario: TEdit
      Left = 106
      Top = 55
      Width = 122
      Height = 21
      NumbersOnly = True
      TabOrder = 3
    end
    object CBMes: TComboBox
      Left = 106
      Top = 92
      Width = 122
      Height = 21
      TabOrder = 4
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object GrdContas: TDBGrid
      Left = 1
      Top = 401
      Width = 682
      Height = 169
      Align = alBottom
      DataSource = DsGrade
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NUMERO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Width = 291
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
    object GBFiltro: TGroupBox
      Left = 33
      Top = 295
      Width = 192
      Height = 105
      Caption = 'FILTRO'
      TabOrder = 6
      object ChkListarAtrasadas: TCheckBox
        Left = 11
        Top = 24
        Width = 193
        Height = 17
        Caption = 'LISTAR CONTAS ATRASADAS'
        TabOrder = 0
      end
      object ChkListarEmDia: TCheckBox
        Left = 11
        Top = 47
        Width = 193
        Height = 17
        Caption = 'LISTAR CONTAS EM DIA'
        TabOrder = 1
      end
      object ChkListarPagas: TCheckBox
        Left = 11
        Top = 70
        Width = 193
        Height = 17
        Caption = 'LISTAR CONTAS PAGAS'
        TabOrder = 2
      end
    end
    object GBTotais: TGroupBox
      Left = 33
      Top = 141
      Width = 590
      Height = 132
      Caption = 'TOTAIS'
      TabOrder = 7
      object LblSaldo: TLabel
        Left = 15
        Top = 25
        Width = 48
        Height = 16
        Caption = 'SALDO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblValorSaldo: TLabel
        Left = 162
        Top = 25
        Width = 54
        Height = 16
        Caption = '######'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblTotalContas: TLabel
        Left = 15
        Top = 57
        Width = 99
        Height = 16
        Caption = 'TOTAL CONTAS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblValorContas: TLabel
        Left = 162
        Top = 57
        Width = 54
        Height = 16
        Caption = '######'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblTotalAtrasadas: TLabel
        Left = 15
        Top = 89
        Width = 130
        Height = 16
        Caption = 'TOTAL ATRASADAS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblValorAtrasadas: TLabel
        Left = 162
        Top = 89
        Width = 54
        Height = 16
        Caption = '######'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblTotalEmDia: TLabel
        Left = 271
        Top = 57
        Width = 95
        Height = 16
        Caption = 'TOTAL EM DIA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblValorEmDia: TLabel
        Left = 382
        Top = 57
        Width = 54
        Height = 16
        Caption = '######'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblTotalPagas: TLabel
        Left = 271
        Top = 89
        Width = 93
        Height = 16
        Caption = 'TOTAL PAGAS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblValorPagas: TLabel
        Left = 382
        Top = 89
        Width = 54
        Height = 16
        Caption = '######'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 352
    Top = 56
    object Consulta: TMenuItem
      Caption = 'CONSULTA'
      OnClick = ConsultaClick
    end
    object Cadastro: TMenuItem
      Caption = 'CADASTRAR'
      object CadTipoConta: TMenuItem
        Caption = 'TIPO DE CONTA'
        OnClick = CadTipoContaClick
      end
      object CadPessoa: TMenuItem
        Caption = 'PESSOA'
        OnClick = CadPessoaClick
      end
      object CadConta: TMenuItem
        Caption = 'CONTA'
        OnClick = CadContaClick
      end
      object PROCEDENTE1: TMenuItem
        Caption = 'PROCEDENTE'
        OnClick = CadProcedenteClick
      end
    end
    object Configurar: TMenuItem
      Caption = 'CONFIGURAR'
      object ConfTipoConta: TMenuItem
        Caption = 'TIPO DE CONTA'
        OnClick = ConfTipoContaClick
      end
      object ConfPessoa: TMenuItem
        Caption = 'PESSOA'
        OnClick = ConfPessoaClick
      end
      object ConfConta: TMenuItem
        Caption = 'CONTA'
        OnClick = ConfContaClick
      end
      object ConfProcedente: TMenuItem
        Caption = 'PROCEDENTE'
        OnClick = ConfProcedenteClick
      end
    end
  end
  object DsGrade: TDataSource
    DataSet = QrGrade
    Left = 595
    Top = 280
  end
  object QrGrade: TFDQuery
    Connection = DataModule1.FDConn
    Left = 547
    Top = 280
  end
  object CdsGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 280
    object CdsGradeNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object CdsGradeTIPO_CONTA: TStringField
      FieldName = 'TIPO_CONTA'
      Size = 25
    end
    object CdsGradeVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object CdsGradeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 250
    end
    object CdsGradeVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object CdsGradePAGO: TStringField
      FieldName = 'PAGO'
      Size = 3
    end
  end
end

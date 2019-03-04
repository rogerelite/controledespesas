object FrmCadastrarConta: TFrmCadastrarConta
  Left = 0
  Top = 0
  Caption = 'CADASTRAR CONTA'
  ClientHeight = 499
  ClientWidth = 824
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
  object Label1: TLabel
    Left = 34
    Top = 88
    Width = 100
    Height = 16
    Caption = 'TIPO DE CONTA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 26
    Top = 112
    Width = 58
    Height = 16
    Caption = 'TITULAR:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PaConteudo: TPanel
    Left = 0
    Top = 0
    Width = 824
    Height = 499
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object LblTitular: TLabel
      Left = 26
      Top = 48
      Width = 58
      Height = 16
      Caption = 'TITULAR:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblDescricao: TLabel
      Left = 26
      Top = 143
      Width = 78
      Height = 16
      Caption = 'DESCRI'#199#195'O:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblValorConta: TLabel
      Left = 26
      Top = 234
      Width = 49
      Height = 16
      Caption = 'VALOR:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblVencimentoUnico: TLabel
      Left = 26
      Top = 271
      Width = 84
      Height = 16
      Caption = 'VENCIMENTO:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblDiaVencimento: TLabel
      Left = 26
      Top = 311
      Width = 112
      Height = 16
      Caption = 'DIA VENCIMENTO:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblTipoConta: TLabel
      Left = 26
      Top = 80
      Width = 100
      Height = 16
      Caption = 'TIPO DE CONTA:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object IdConta: TLabel
      Left = 26
      Top = 20
      Width = 19
      Height = 16
      Caption = 'ID:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 26
      Top = 112
      Width = 84
      Height = 16
      Caption = 'PROCEDENTE:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CpoValorConta: TEdit
      Left = 152
      Top = 233
      Width = 133
      Height = 21
      NumbersOnly = True
      TabOrder = 0
    end
    object GrpParcelas: TGroupBox
      Left = 437
      Top = 47
      Width = 357
      Height = 398
      Caption = 'PARCELAS'
      TabOrder = 1
      object LblNumero: TLabel
        Left = 16
        Top = 22
        Width = 57
        Height = 16
        Caption = 'N'#218'MERO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblValorParcelas: TLabel
        Left = 16
        Top = 56
        Width = 49
        Height = 16
        Caption = 'VALOR:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblVencimentoParcelado: TLabel
        Left = 16
        Top = 90
        Width = 84
        Height = 16
        Caption = 'VENCIMENTO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnAdicionar: TButton
        Left = 19
        Top = 128
        Width = 110
        Height = 25
        Caption = '+ ADICIONAR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BtnAdicionarClick
      end
      object GrdParcelas: TDBGrid
        Left = 2
        Top = 164
        Width = 353
        Height = 232
        Align = alBottom
        DataSource = DsGrade
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = GrdParcelasDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMERO'
            Title.Caption = 'N'#218'MERO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VENC_PARCELA'
            Title.Caption = 'VENCIMENTO'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAGO'
            Visible = True
          end>
      end
      object CpoNumeroParcela: TSpinEdit
        Left = 113
        Top = 19
        Width = 57
        Height = 22
        Enabled = False
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 1
      end
      object CpoValorParcela: TEdit
        Left = 113
        Top = 55
        Width = 133
        Height = 21
        NumbersOnly = True
        TabOrder = 3
      end
      object CpoVencimentoParcelado: TDateTimePicker
        Left = 113
        Top = 90
        Width = 186
        Height = 21
        Date = 43420.483108935190000000
        Time = 43420.483108935190000000
        TabOrder = 4
      end
      object BtnRemover: TButton
        Left = 147
        Top = 128
        Width = 110
        Height = 25
        Caption = '- REMOVER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = BtnRemoverClick
      end
      object CpoPago: TEdit
        Left = 288
        Top = 130
        Width = 41
        Height = 21
        TabOrder = 6
        Text = 'N'
        Visible = False
      end
    end
    object BtnSalvar: TButton
      Left = 557
      Top = 452
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
      OnClick = BtnSalvarClick
    end
    object BtnFechar: TButton
      Left = 717
      Top = 452
      Width = 75
      Height = 25
      Caption = 'FECHAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BtnFecharClick
    end
    object GrpModoPagamento: TRadioGroup
      Left = 26
      Top = 353
      Width = 185
      Height = 105
      Caption = 'MODO DE PAGAMENTO'
      ItemIndex = 0
      Items.Strings = (
        'PARCELADO'
        'PARCELA '#218'NICA'
        'MENSAL')
      TabOrder = 4
      OnClick = GrpModoPagamentoClick
    end
    object CpoVencimentoUnico: TDateTimePicker
      Left = 152
      Top = 271
      Width = 186
      Height = 21
      Date = 43420.483108935190000000
      Time = 43420.483108935190000000
      TabOrder = 5
    end
    object CpoDescricao: TMemo
      Left = 152
      Top = 142
      Width = 265
      Height = 82
      Lines.Strings = (
        'MemDescricao')
      ScrollBars = ssVertical
      TabOrder = 6
    end
    object CpoDiaVencimento: TSpinEdit
      Left = 152
      Top = 308
      Width = 46
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 7
      Value = 0
    end
    object BtnBuscarNome: TButton
      Left = 151
      Top = 45
      Width = 75
      Height = 25
      Caption = 'BUSCAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = BtnBuscarNomeClick
    end
    object CpoNome: TEdit
      Left = 226
      Top = 47
      Width = 191
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 9
    end
    object CpoIdTitular: TEdit
      Left = 416
      Top = 47
      Width = 15
      Height = 21
      TabOrder = 10
      Visible = False
    end
    object CpoIdTipoConta: TEdit
      Left = 416
      Top = 79
      Width = 15
      Height = 21
      TabOrder = 11
      Visible = False
    end
    object CpoIdProcedente: TEdit
      Left = 416
      Top = 111
      Width = 15
      Height = 21
      TabOrder = 12
      Visible = False
    end
    object BtnBuscarTipoConta: TButton
      Left = 151
      Top = 77
      Width = 75
      Height = 25
      Caption = 'BUSCAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      OnClick = BtnBuscarTipoContaClick
    end
    object CpoTipoConta: TEdit
      Left = 226
      Top = 79
      Width = 191
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 14
    end
    object BtnBuscarProcedente: TButton
      Left = 151
      Top = 109
      Width = 75
      Height = 25
      Caption = 'BUSCAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
      OnClick = BtnBuscarProcedenteClick
    end
    object CpoProcedente: TEdit
      Left = 226
      Top = 111
      Width = 191
      Height = 21
      Enabled = False
      TabOrder = 16
    end
    object CpoIdConta: TEdit
      Left = 152
      Top = 19
      Width = 45
      Height = 21
      TabOrder = 17
      OnExit = CpoIdContaExit
    end
    object BtnCancelar: TButton
      Left = 637
      Top = 452
      Width = 75
      Height = 25
      Caption = 'CANCELAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
      OnClick = BtnCancelarClick
    end
  end
  object QrIdConta: TFDQuery
    Connection = DataModule1.FDConn
    Left = 248
    Top = 328
  end
  object QrCadastraConta: TFDQuery
    Connection = DataModule1.FDConn
    Left = 317
    Top = 328
  end
  object QrGrade: TFDQuery
    Connection = DataModule1.FDConn
    Left = 381
    Top = 328
  end
  object CdsGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 392
    object CdsGradeNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object CdsGradeVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object CdsGradeVENC_PARCELA: TDateField
      FieldName = 'VENC_PARCELA'
    end
    object CdsGradePAGO: TStringField
      FieldName = 'PAGO'
      Size = 1
    end
  end
  object DsGrade: TDataSource
    DataSet = CdsGrade
    Left = 308
    Top = 392
  end
  object QrCadastraParcela: TFDQuery
    Connection = DataModule1.FDConn
    Left = 381
    Top = 392
  end
  object QrConsulta: TFDQuery
    Connection = DataModule1.FDConn
    Left = 373
    Top = 264
  end
end

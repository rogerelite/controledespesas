object FrmConsultaContas: TFrmConsultaContas
  Left = 0
  Top = 0
  Caption = 'CONSULTA DE CONTAS'
  ClientHeight = 290
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PaConteudo: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 290
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = -75
    ExplicitWidth = 288
    ExplicitHeight = 306
    object GrdConsultaPessoas: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 72
      Width = 497
      Height = 214
      Align = alBottom
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object CdsGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 102
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
    Left = 403
    Top = 102
  end
  object DsGrade: TDataSource
    DataSet = CdsGrade
    Left = 304
    Top = 103
  end
end

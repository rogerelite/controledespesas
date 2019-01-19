object FrmConsultaProcedente: TFrmConsultaProcedente
  Left = 0
  Top = 0
  Caption = 'CONSULTAR PROCEDENTES'
  ClientHeight = 306
  ClientWidth = 288
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
    Width = 288
    Height = 306
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object GrdConsultaProcedentes: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 88
      Width = 280
      Height = 214
      Align = alBottom
      DataSource = DsConsultaProcedentes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdConsultaProcedentesDblClick
    end
  end
  object DsConsultaProcedentes: TDataSource
    DataSet = QrConsultaProcedentes
    Left = 184
    Top = 24
  end
  object QrConsultaProcedentes: TFDQuery
    Connection = DataModule1.FDConn
    Left = 64
    Top = 24
  end
end

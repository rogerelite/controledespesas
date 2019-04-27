object FrmConsultarConta: TFrmConsultarConta
  Left = 0
  Top = 0
  Caption = 'CONSULTAR CONTA'
  ClientHeight = 352
  ClientWidth = 302
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PaConteudo: TPanel
    Left = 0
    Top = 0
    Width = 302
    Height = 352
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object GrdConsultaConta: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 104
      Width = 294
      Height = 244
      Align = alBottom
      DataSource = DsConsultaConta
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdConsultaContaDblClick
    end
  end
  object DsConsultaConta: TDataSource
    DataSet = QrConsultaConta
    Left = 136
    Top = 24
  end
  object QrConsultaConta: TFDQuery
    Connection = DataModule1.FDConn
    Left = 40
    Top = 24
  end
  object QrSelecionaConta: TFDQuery
    Connection = DataModule1.FDConn
    Left = 232
    Top = 24
  end
end

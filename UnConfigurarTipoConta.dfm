object FrmConfigurarTipoConta: TFrmConfigurarTipoConta
  Left = 0
  Top = 0
  Caption = 'CONFIGURAR TIPO DE CONTA'
  ClientHeight = 135
  ClientWidth = 338
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
    Width = 338
    Height = 135
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object BtnBuscar: TButton
      Left = 31
      Top = 13
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
    object CpoId: TEdit
      Left = 107
      Top = 14
      Width = 54
      Height = 21
      TabOrder = 1
    end
    object CpoNome: TEdit
      Left = 31
      Top = 47
      Width = 275
      Height = 21
      TabOrder = 2
    end
    object BtnSalvar: TButton
      Left = 70
      Top = 96
      Width = 75
      Height = 25
      Caption = 'SALVAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BtnSalvarClick
    end
    object BtnExcluir: TButton
      Left = 151
      Top = 96
      Width = 75
      Height = 25
      Caption = 'EXCLUIR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BtnExcluirClick
    end
    object BtnFechar: TButton
      Left = 231
      Top = 96
      Width = 75
      Height = 25
      Caption = 'FECHAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BtnFecharClick
    end
  end
  object QrTipoConta: TFDQuery
    Connection = DataModule1.FDConn
    Left = 184
    Top = 8
  end
end

object FrmCadastrarProcedente: TFrmCadastrarProcedente
  Left = 0
  Top = 0
  Caption = 'CADASTRAR PROCEDENTE'
  ClientHeight = 135
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PaConteudo: TPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 135
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object LblNome: TLabel
      Left = 32
      Top = 32
      Width = 40
      Height = 16
      Caption = 'NOME:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CpoNome: TEdit
      Left = 88
      Top = 31
      Width = 273
      Height = 21
      TabOrder = 0
    end
    object BtnSalvar: TButton
      Left = 216
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
      TabOrder = 1
      OnClick = BtnSalvarClick
    end
    object BtnFechar: TButton
      Left = 304
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
      TabOrder = 2
      OnClick = BtnFecharClick
    end
  end
  object QrProcedente: TFDQuery
    Connection = DataModule1.FDConn
    Left = 40
    Top = 64
  end
end

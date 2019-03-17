object FrmConfigurarSistema: TFrmConfigurarSistema
  Left = 0
  Top = 0
  Caption = 'CONFIGURAR SISTEMA '
  ClientHeight = 190
  ClientWidth = 132
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
    Width = 132
    Height = 190
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 213
    object BtnSalvar: TButton
      Left = 45
      Top = 159
      Width = 75
      Height = 25
      Caption = 'SALVAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BtnSalvarClick
    end
  end
  object GbContasMensais: TGroupBox
    Left = 8
    Top = 8
    Width = 112
    Height = 145
    Caption = 'Contas Mensais'
    TabOrder = 1
    object CpoLuz: TCheckBox
      Left = 8
      Top = 40
      Width = 97
      Height = 17
      Caption = 'Luz'
      TabOrder = 0
    end
    object CpoAgua: TCheckBox
      Left = 8
      Top = 63
      Width = 97
      Height = 17
      Caption = #193'gua'
      TabOrder = 1
    end
    object CpoInternet: TCheckBox
      Left = 8
      Top = 109
      Width = 97
      Height = 17
      Caption = 'Internet'
      TabOrder = 2
    end
    object CpoTelefoneMovel: TCheckBox
      Left = 8
      Top = 86
      Width = 97
      Height = 17
      Caption = 'Telefone m'#243'vel'
      TabOrder = 3
    end
    object LblConta: TStaticText
      Left = 9
      Top = 15
      Width = 33
      Height = 17
      Caption = 'Conta'
      TabOrder = 4
    end
  end
  object QrContaFixa: TFDQuery
    Connection = DataModule1.FDConn
    Left = 82
    Top = 9
  end
  object QrConsulta: TFDQuery
    Connection = DataModule1.FDConn
    Left = 82
    Top = 57
  end
end

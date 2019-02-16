object FrmMenu: TFrmMenu
  Left = 0
  Top = 0
  Caption = 'CONTROLE DE DESPESAS'
  ClientHeight = 217
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object PaConteudo: TPanel
    Left = 0
    Top = 0
    Width = 529
    Height = 217
    Align = alClient
    TabOrder = 0
  end
  object MainMenu: TMainMenu
    Left = 352
    Top = 56
    object Consulta: TMenuItem
      Caption = 'CONSULTA'
      object ConsDespesas: TMenuItem
        Caption = 'CONSULTA DE DESPESAS'
        OnClick = ConsDespesasClick
      end
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
end

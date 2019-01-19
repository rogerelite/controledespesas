object FrmConsulta: TFrmConsulta
  Left = 0
  Top = 0
  Caption = 'CONSULTA'
  ClientHeight = 590
  ClientWidth = 684
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
    Width = 684
    Height = 590
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 635
    ExplicitHeight = 299
    object LblPessoa: TLabel
      Left = 33
      Top = 21
      Width = 55
      Height = 16
      Caption = 'PESSOA:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
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
    object CBNome: TComboBox
      Left = 146
      Top = 20
      Width = 196
      Height = 21
      TabOrder = 0
    end
    object EdtSalario: TEdit
      Left = 146
      Top = 55
      Width = 133
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
    object CBMes: TComboBox
      Left = 146
      Top = 92
      Width = 133
      Height = 21
      TabOrder = 2
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
    object DBGrdContas: TDBGrid
      Left = 1
      Top = 420
      Width = 682
      Height = 169
      Align = alBottom
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PARCELA'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Width = 104
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
        end>
    end
    object GBFiltro: TGroupBox
      Left = 33
      Top = 295
      Width = 192
      Height = 105
      Caption = 'FILTRO'
      TabOrder = 4
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
      TabOrder = 5
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
end

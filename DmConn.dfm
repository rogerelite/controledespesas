object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 293
  Width = 473
  object QrConsultaTipoContas: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT * FROM contatipo')
    Left = 271
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 64
    Top = 136
  end
  object QrPessoa: TFDQuery
    Connection = FDConn
    Left = 120
    Top = 16
  end
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=controledespesas'
      'User_Name=root'
      'Password='
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\Roger\Documents\Embarcadero\Studio\Projects\ControleDes' +
      'pesas\lib\libmySQL.dll'
    Left = 192
    Top = 136
  end
  object QrTipoConta: TFDQuery
    Connection = FDConn
    Left = 180
    Top = 16
  end
  object QrConta: TFDQuery
    Connection = FDConn
    Left = 200
    Top = 72
  end
  object QrParcela: TFDQuery
    Connection = FDConn
    Left = 272
    Top = 72
  end
end

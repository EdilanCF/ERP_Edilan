object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 394
  Width = 578
  object conexaoDB: TFDConnection
    Params.Strings = (
      'Database=dbedilanteste'
      'User_Name=root'
      'Password=127611'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 88
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files (x86)\MySQL\MySQL Server 5.7\lib\libmysql.dll'
    Left = 152
    Top = 96
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 256
    Top = 104
  end
end

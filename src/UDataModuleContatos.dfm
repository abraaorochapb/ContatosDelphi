object DM: TDM
  Height = 480
  Width = 640
  object ConexaoDB: TFDConnection
    Params.Strings = (
      'Database=C:\db\DB.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 96
    Top = 224
  end
  object qrySelect: TFDQuery
    Connection = ConexaoDB
    Left = 208
    Top = 224
  end
  object qryInsert: TFDQuery
    Connection = ConexaoDB
    Left = 312
    Top = 224
  end
  object qryUpdate: TFDQuery
    Connection = ConexaoDB
    Left = 400
    Top = 224
  end
  object qryDelete: TFDQuery
    Connection = ConexaoDB
    Left = 488
    Top = 232
  end
  object qrySelectById: TFDQuery
    Connection = ConexaoDB
    Left = 104
    Top = 360
  end
end

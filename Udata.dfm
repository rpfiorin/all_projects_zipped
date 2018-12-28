object dmDBconn: TdmDBconn
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object Zconn_pg: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = ''
    Port = 5432
    Database = 'fiorin'
    User = 'postgres'
    Password = 'postgres'
    Protocol = 'postgresql'
    LibraryLocation = 'C:\Program Files (x86)\PostgreSQL\9.5\bin\libpq.dll'
    Left = 88
    Top = 56
  end
end

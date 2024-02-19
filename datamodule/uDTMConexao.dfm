object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  Height = 408
  Width = 462
  object ConexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    HostName = '.\SERVERCURSO'
    Port = 1433
    Database = 'vendas'
    User = 'sa'
    Password = 'mudar@123'
    Protocol = 'mssql'
    LibraryLocation = 'D:\Projetos\Delphi\Projeto Curso\ntwdblib.dll'
    Left = 160
    Top = 168
  end
end

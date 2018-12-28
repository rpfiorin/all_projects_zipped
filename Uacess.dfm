object frmAcess: TfrmAcess
  Left = 0
  Top = 0
  BorderIcons = [biMinimize]
  BorderStyle = bsSingle
  Caption = 'Acesso aos sistemas'
  ClientHeight = 249
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbugSistemas: TJvDBUltimGrid
    Left = 24
    Top = 32
    Width = 417
    Height = 169
    DataSource = dsSistemas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbugSistemasDblClick
    OnKeyDown = dbugSistemasKeyDown
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 16
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Cambria'
        Font.Style = []
        Title.Caption = 'Nome'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 282
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'versao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Cambria'
        Font.Style = []
        Title.Caption = 'Vers'#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end>
  end
  object pbAbrirExe: TProgressBar
    Left = 24
    Top = 216
    Width = 417
    Height = 17
    TabOrder = 1
    Visible = False
  end
  object btnSair: TBitBtn
    Left = 367
    Top = 212
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = []
    Kind = bkCancel
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 2
  end
  object qrySistemas: TZQuery
    Connection = dmDBconn.Zconn_pg
    SQL.Strings = (
      'SELECT nome,versao'
      'FROM rpfiorin.sistema'
      'ORDER BY nome DESC')
    Params = <>
    Left = 392
    Top = 8
    object qrySistemasnome: TWideMemoField
      FieldName = 'nome'
      Required = True
      BlobType = ftWideMemo
    end
    object qrySistemasversao: TWideStringField
      FieldName = 'versao'
      Required = True
      Size = 24
    end
  end
  object dsSistemas: TDataSource
    DataSet = qrySistemas
    Left = 336
    Top = 8
  end
  object tmrPbar: TTimer
    OnTimer = tmrPbarTimer
    Left = 40
    Top = 8
  end
end

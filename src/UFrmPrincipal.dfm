object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Controle de Contatos'
  ClientHeight = 900
  ClientWidth = 1129
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindow
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1129
    Height = 41
    Align = alTop
    Caption = 'CONTROLE DE CONTATOS'
    Color = clBackground
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 248
    ExplicitTop = 32
    ExplicitWidth = 185
  end
  object Panel2: TPanel
    Left = 0
    Top = 800
    Width = 1129
    Height = 100
    Align = alBottom
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 1
    object btnNovo: TButton
      Left = 704
      Top = 40
      Width = 80
      Height = 30
      Cursor = crHandPoint
      Caption = 'Adicionar'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnEditar: TButton
      Left = 864
      Top = 40
      Width = 80
      Height = 30
      Cursor = crHandPoint
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 1024
      Top = 40
      Width = 80
      Height = 30
      Cursor = crHandPoint
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
  end
  object pnlBusca: TPanel
    Left = 0
    Top = 41
    Width = 1129
    Height = 64
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 32
      Top = 6
      Width = 165
      Height = 15
      Caption = 'Insira um nome para pesquisar:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtPesquisa: TEdit
      Left = 32
      Top = 24
      Width = 281
      Height = 23
      Color = clHighlightText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edtPesquisaChange
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 105
    Width = 1129
    Height = 695
    Align = alClient
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    FixedColor = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clMenuText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = DM.qrySelect
    Left = 24
    Top = 848
  end
end

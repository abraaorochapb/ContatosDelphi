object frmInsertDados: TfrmInsertDados
  Left = 0
  Top = 0
  Caption = 'Dados Contato'
  ClientHeight = 920
  ClientWidth = 1158
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1158
    Height = 41
    Align = alTop
    Color = clBackground
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitTop = -6
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 1158
    Height = 41
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 312
    ExplicitTop = 176
    ExplicitWidth = 185
  end
  object Panel3: TPanel
    Left = 0
    Top = 832
    Width = 1158
    Height = 88
    Align = alBottom
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 2
    object btnSalvar: TButton
      Left = 888
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 1008
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 82
    Width = 1158
    Height = 750
    Align = alClient
    TabOrder = 3
    ExplicitTop = 76
    object Label1: TLabel
      Left = 401
      Top = 158
      Width = 17
      Height = 15
      Caption = 'ID :'
    end
    object Label2: TLabel
      Left = 401
      Top = 238
      Width = 39
      Height = 15
      Caption = 'Nome :'
    end
    object Label3: TLabel
      Left = 401
      Top = 318
      Width = 67
      Height = 15
      Caption = 'Sobrenome :'
    end
    object Label4: TLabel
      Left = 401
      Top = 395
      Width = 50
      Height = 15
      Caption = 'Telefone :'
    end
    object Label5: TLabel
      Left = 401
      Top = 463
      Width = 35
      Height = 15
      Caption = 'Email :'
    end
    object edtID: TEdit
      Left = 528
      Top = 155
      Width = 65
      Height = 23
      Color = clInfoBk
      Enabled = False
      CanUndoSelText = True
      ReadOnly = True
      TabOrder = 0
    end
    object edtNome: TEdit
      Left = 528
      Top = 235
      Width = 257
      Height = 23
      TabOrder = 1
      OnChange = edtNomeChange
    end
    object edtSobrenome: TEdit
      Left = 528
      Top = 315
      Width = 257
      Height = 23
      TabOrder = 2
      OnChange = edtSobrenomeChange
    end
    object edtTelefone: TEdit
      Left = 528
      Top = 392
      Width = 161
      Height = 23
      TabOrder = 3
      OnChange = edtTelefoneChange
    end
    object edtEmail: TEdit
      Left = 528
      Top = 460
      Width = 257
      Height = 23
      TabOrder = 4
    end
  end
end

unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, System.UITypes;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pnlBusca: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    DBGrid1: TDBGrid;
    edtPesquisa: TEdit;
    Label1: TLabel;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure AtualizaGrid;
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UDataModuleContatos, UFrmInsertDados;

procedure TfrmPrincipal.btnEditarClick(Sender: TObject);
begin
  frmInsertDados.Caption := 'Dados Contato - Atualizar';
  frmInsertDados.Hint := DBGrid1.Fields[0].Text;
  frmInsertDados.showmodal;
  AtualizaGrid;
end;

procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirme para apagar o contato', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with DM.qryDelete do
    begin
      active := False;
      sql.Clear;
      sql.add('DELETE FROM contatos WHERE id = ' + DBGrid1.Fields[0].Text);
      execsql;
    end;

    Showmessage('Contato deletado com sucesso');
    AtualizaGrid;
  end;

end;

procedure TfrmPrincipal.btnNovoClick(Sender: TObject);
begin
  frmInsertDados.Caption := 'Dados Contato - Adicionar';
  frmInsertDados.showmodal;
  AtualizaGrid;
end;

procedure TfrmPrincipal.edtPesquisaChange(Sender: TObject);
begin
  AtualizaGrid;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  AtualizaGrid;
end;

procedure TfrmPrincipal.AtualizaGrid;
begin
  with DM.qrySelect do
  begin
    active := False;
    sql.Clear;
    sql.Text := 'SELECT * FROM contatos where name LIKE ' + quotedstr('%' + edtPesquisa.Text + '%');
    active := True;
  end;
end;

end.

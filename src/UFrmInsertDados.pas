unit UFrmInsertDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.Character;

type
  TfrmInsertDados = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtID: TEdit;
    edtNome: TEdit;
    edtSobrenome: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    Label2: TLabel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure edtSobrenomeChange(Sender: TObject);
    procedure edtTelefoneChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInsertDados: TfrmInsertDados;
  function ValidaNome(ATexto: String): Boolean;
  function ValidaSobrenome(ATexto: String): Boolean;
  function ValidaTelefone(ATexto: String): Boolean;
  function ValidaEmail(ATexto: String): Boolean;

implementation

{$R *.dfm}

uses UDataModuleContatos;

procedure TfrmInsertDados.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInsertDados.btnSalvarClick(Sender: TObject);
begin
  if (self.Caption = 'Dados Contato - Adicionar') then
  begin
    if not ValidaNome(edtNome.Text) then
    begin
      Exit;
    end;

    if not ValidaSobrenome(edtSobrenome.Text) then
    begin
      Exit;
    end;

    if not ValidaTelefone(edtTelefone.Text) then
    begin
      Exit;
    end;

    if not ValidaEmail(edtEmail.Text) then
    begin
      Exit;
    end;

    with DM.qryInsert do
    begin
      active := False;
      sql.Clear;
      sql.Text := 'INSERT INTO contatos(name, sobrenome, telefone, email) ' +
      'VALUES ('+ quotedstr(edtNome.Text) + ',' +
                quotedstr(edtSobrenome.Text) + ',' +
                quotedstr(edtTelefone.Text) + ',' +
                quotedstr(edtEmail.Text) + ')';
      execSQL;
    end;

    Showmessage('Novo Contato salvo com sucesso!');
    Close;
    end
  else if (self.Caption = 'Dados Contato - Atualizar') then
  begin
    if not ValidaNome(edtNome.Text) then
    begin
      Exit;
    end;

    if not ValidaSobrenome(edtSobrenome.Text) then
    begin
      Exit;
    end;

    if not ValidaTelefone(edtTelefone.Text) then
    begin
      Exit;
    end;

    if not ValidaEmail(edtEmail.Text) then
    begin
      Exit;
    end;

    with DM.qryInsert do
    begin
      active := False;
      sql.Clear;
      sql.Text := 'UPDATE contatos SET name = ' + quotedstr(edtNome.Text) +
                  ', sobrenome = ' + quotedstr(edtSobrenome.Text) +
                  ', telefone = ' + quotedstr(edtTelefone.Text) +
                  ', email = ' + quotedstr(edtEmail.Text) +
                  ' WHERE id = ' + edtID.Text;
      execSQL;
    end;

    Showmessage('Contato alterado com sucesso!');
    Close;
    end
end;

procedure TfrmInsertDados.edtNomeChange(Sender: TObject);
var
  CharTyped: Char;
begin
  if Length(edtNome.Text) > 0 then
  begin
    CharTyped := edtNome.Text[Length(edtNome.Text)];

    if not CharInSet(CharTyped, ['a'..'z', 'A'..'Z', ' ']) then
    begin
      ShowMessage('Somente letras s�o permitidas.');
      edtNome.Text := Copy(edtNome.Text, 1, Length(edtNome.Text) - 1);
      edtNome.SelStart := Length(edtNome.Text);
    end;
  end;
end;

procedure TfrmInsertDados.edtSobrenomeChange(Sender: TObject);
var
  CharTyped: Char;
begin
  if Length(edtSobrenome.Text) > 0 then
  begin
    CharTyped := edtSobrenome.Text[Length(edtSobrenome.Text)];

    if not CharInSet(CharTyped, ['a'..'z', 'A'..'Z', ' ']) then
    begin
      ShowMessage('Somente letras s�o permitidas.');
      edtSobrenome.Text := Copy(edtSobrenome.Text, 1, Length(edtSobrenome.Text) - 1);
      edtSobrenome.SelStart := Length(edtSobrenome.Text);
    end;
  end;
end;

procedure TfrmInsertDados.edtTelefoneChange(Sender: TObject);
var
  CharTyped: Char;
begin
  if Length(edtTelefone.Text) > 0 then
  begin
    CharTyped := edtTelefone.Text[Length(edtTelefone.Text)];

    if not CharInSet(CharTyped, ['0'..'9']) then
    begin
      ShowMessage('Somente n�meros s�o permitidos.');
      edtTelefone.Text := Copy(edtTelefone.Text, 1, Length(edtTelefone.Text) - 1);
      edtTelefone.SelStart := Length(edtTelefone.Text);
    end;
  end;
end;

procedure TfrmInsertDados.FormShow(Sender: TObject);
begin
  if (self.Caption = 'Dados Contato - Adicionar') then
  begin
    edtID.Clear;
    edtNome.Clear;
    edtSobrenome.Clear;
    edtTelefone.Clear;
    edtEmail.Clear;
  end
  else if (self.Caption = 'Dados Contato - Atualizar') then
  begin
    with DM.qrySelectById do
    begin
      active := false;
      sql.Clear;
      sql.Text := 'SELECT * FROM contatos WHERE id = ' + self.Hint;
      active := True;
    end;

    edtID.Text := DM.qrySelectById.FieldByName('id').AsString;
    edtNome.Text := DM.qrySelectById.FieldByName('name').AsString;
    edtSobrenome.Text := DM.qrySelectById.FieldByName('sobrenome').AsString;
    edtTelefone.Text := DM.qrySelectById.FieldByName('telefone').AsString;
    edtEmail.Text := DM.qrySelectById.FieldByName('email').AsString;
  end;

end;

function ValidaNome(ATexto: String): Boolean;
begin
  if (Length(ATexto) < 3) or (Length(ATexto) > 20) then
    begin
      ShowMessage('O Nome deve ter entre 3 a 20 letras.');
      result:= False;
      Exit;
    end;

  result := True;
end;

function ValidaSobrenome(ATexto: String): Boolean;
begin
  if (Length(ATexto) < 4) or (Length(ATexto) > 30) then
    begin
      ShowMessage('O Sobrenome deve ter entre 4 a 30 letras.');
      result:= False;
      Exit;
    end;

  result := True;
end;

function ValidaTelefone(ATexto: String): Boolean;
begin
  if (Length(ATexto) < 10) or (Length(ATexto) > 11) then
    begin
      ShowMessage('O n�mero de telefone deve conter ao menos 10 caracteres e no m�ximo 11 caracteres, com DDD incluso.');
      result:= False;
      Exit;
    end;

  result := True;
end;

function ValidaEmail(ATexto: String): Boolean;
begin
  if (Length(ATexto) < 15) or (Length(ATexto) > 40) then
    begin
      ShowMessage('O email deve conter entre 15 a 40 caracteres.');
      result:= False;
      Exit;
    end;

  result := True;
end;

end.

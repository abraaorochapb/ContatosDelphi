program ControleContatos;

uses
  Vcl.Forms,
  UFrmPrincipal in 'src\UFrmPrincipal.pas' {frmPrincipal},
  UFrmInsertDados in 'src\UFrmInsertDados.pas' {frmInsertDados},
  UDataModuleContatos in 'src\UDataModuleContatos.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmInsertDados, frmInsertDados);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.

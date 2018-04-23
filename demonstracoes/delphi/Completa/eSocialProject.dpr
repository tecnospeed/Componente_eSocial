program eSocialProject;

uses
  Forms,
  eSocial in 'eSocial.pas' {Exemplo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TExemplo, Exemplo);
  Application.Run;
end.

program eSocialS;

uses
  Forms,
  UeSocial in 'UeSocial.pas' {frmeSocial};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmeSocial, frmeSocial);
  Application.Run;

end.

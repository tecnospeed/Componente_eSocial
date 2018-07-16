program eSocial;

uses
  Vcl.Forms,
  UeSocial in 'UeSocial.pas' {frmeSocial};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmeSocial, frmeSocial);
  Application.Run;
end.

program pESocial;

uses
  Forms,
  uESocial in 'uESocial.pas' {frmESocial};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmESocial, frmESocial);
  Application.Run;
end.

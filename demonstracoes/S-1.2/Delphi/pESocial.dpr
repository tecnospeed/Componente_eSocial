program pESocial;

uses
  Forms,
  uESocial in 'uESocial.pas' {frmeSocialS};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmeSocialS, frmeSocialS);
  Application.Run;
end.

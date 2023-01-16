program pESocial;
uses
  Forms,
  UeSocialS1 in 'UeSocialS1.pas' {frmeSocialS1},
  UMenu in 'UMenu.pas' {frmMenu};

{$R *.res}
begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmeSocialS1, frmeSocialS1);
  Application.Run;
end.

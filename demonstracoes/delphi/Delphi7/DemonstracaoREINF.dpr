program DemonstracaoREINF;

uses
  Forms,
  untREINFPrincipal in 'untREINFPrincipal.pas' {frmReinfPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmReinfPrincipal, frmReinfPrincipal);
  Application.Run;
end.

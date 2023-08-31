program Demonstracao_Reinf_pjt;

uses
  Forms,
  Demonstracao_Reinf in 'Demonstracao_Reinf.pas' {frmReinf};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmReinf, frmReinf);
  Application.Run;
end.

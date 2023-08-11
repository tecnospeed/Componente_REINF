program Reinf;
uses
  Vcl.Forms,
  UReinf in 'UReinf.pas' {frmReinf},
  ReinfGovX_TLB in '..\..\componentes\reinf\src\gov\ocx\TLB\ReinfGovX_TLB.pas',
  ReinfClientX_TLB in '..\..\componentes\reinf\src\ocx_client\TLB\ReinfClientX_TLB.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmReinf, frmReinf);
  Application.Run;
end.

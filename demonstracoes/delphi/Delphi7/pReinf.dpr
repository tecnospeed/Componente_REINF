program pReinf;

uses
  Forms,
  uReinf in 'uReinf.pas' {frmReinf};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmReinf, frmReinf);
  Application.Run;
end.

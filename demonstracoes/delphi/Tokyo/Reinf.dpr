program Reinf;

uses
  Vcl.Forms,
  UReinf in 'UReinf.pas' {frmReinf};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmReinf, frmReinf);
  Application.Run;
end.

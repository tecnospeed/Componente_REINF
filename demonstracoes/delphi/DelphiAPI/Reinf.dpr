program Reinf;

uses
  Vcl.Forms,
  UReinf in 'UReinf.pas' {fReinf};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfReinf, fReinf);
  Application.Run;
end.

unit UReinf;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ReinfClientX_TLB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls;
type
  TfrmReinf = class(TForm)
    edtCnpjSH: TLabeledEdit;
    edtTokenSH: TLabeledEdit;
    edtEmpregador: TLabeledEdit;
    cbAmbiente: TComboBox;
    Ambiente: TLabel;
    edtTemplates: TLabeledEdit;
    edtEsquemas: TLabeledEdit;
    cbCertificado: TComboBox;
    lbl1: TLabel;
    btnConfigurar: TButton;
    btnTx2: TButton;
    btnXml: TButton;
    btnAssinar: TButton;
    btnEnviar: TButton;
    btnConsultar: TButton;
    edtIdLote: TLabeledEdit;
    cbVersao: TComboBox;
    lbl2: TLabel;
    pgc1: TPageControl;
    tsRetorno: TTabSheet;
    tsXmlEnviad: TTabSheet;
    tsXmlRetorno: TTabSheet;
    mmoXml: TMemo;
    mmoXmlEnviado: TMemo;
    mmoXmlRetorno: TMemo;
    rg: TRadioGroup;
    chkTelemetria: TCheckBox;
    edtDiretorioLog: TLabeledEdit;
    chkSalvarLogs: TCheckBox;
    btnSincronizarXmlPendentes: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnConfigurarClick(Sender: TObject);
    procedure btnTx2Click(Sender: TObject);
    procedure btnXmlClick(Sender: TObject);
    procedure btnAssinarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSincronizarXmlPendentesClick(Sender: TObject);
  private
    { Private declarations }
    Reinf: TspdReinfClientX;
  public
    { Public declarations }
  end;
var
  frmReinf: TfrmReinf;
implementation
{$R *.dfm}
procedure TfrmReinf.FormCreate(Sender: TObject);
begin
  Reinf := TspdReinfClientX.Create(nil);
  Reinf.DiagnosticMode := False;
end;
procedure TfrmReinf.FormDestroy(Sender: TObject);
begin
  Reinf.Free;
end;

procedure TfrmReinf.FormShow(Sender: TObject);
begin
  Reinf.ConfigurarSoftwareHouse(edtCnpjSH.Text, edtTokenSH.Text);

  frmReinf.Caption := 'Reinf - TecnoSpeed - OCX ' + Reinf.Versao;


  cbAmbiente.ItemIndex := 1;
  cbCertificado.ItemIndex := cbCertificado.Items.IndexOf('CN=TECNOSPEED S/A:08187168000160, OU=Certificado PJ A1, O=ICP-Brasil, C=BR, S=PR, L=Maringa, E=, SE=6D 8C 21 04 01 48 28 66');
  cbVersao.ItemIndex := cbVersao.Items.IndexOf('2.1.02');
  btnConfigurarClick(nil);
end;

procedure TfrmReinf.btnAssinarClick(Sender: TObject);
begin
  mmoXml.Text := Reinf.AssinarEvento(mmoXml.Text);
end;
procedure TfrmReinf.btnConfigurarClick(Sender: TObject);
begin
  //Reinf.ConfigurarSoftwareHouse(edtCnpjSH.Text, edtTokenSH.Text);
  Reinf.DiagnosticMode := chkTelemetria.Checked;
  Reinf.SalvarLogsEmDisco := chkSalvarLogs.Checked;
  mmoXml.Clear;
  Reinf.ConfigurarSoftwareHouse(edtCnpjSH.Text, edtTokenSH.Text);
  cbCertificado.Items.Text := Reinf.ListarCertificados(#13#10);
  Reinf.CpfCnpjEmpregador := edtEmpregador.Text;
  Reinf.DiretorioEsquemas := edtEsquemas.Text;
  Reinf.DiretorioTemplates := edtTemplates.Text;
  Reinf.NomeCertificado := cbCertificado.Text;
  Reinf.VersaoManual := '2.1.02';
  //cbVersao.Text := '2.1.01';
  //Reinf.HttpLibs := 'sbb';
  //Reinf.DiretorioLog := '.\meulog';
//  Reinf.CaminhoCertificado := ''; Usado para passar o caminho do .pfx, funciona apenas com certificados A1
//  Reinf.SenhaCertificado := ''; Usado para passar a senha do certificado caso o Caminho certificado seja usado
//  Reinf.Pincode := ''; Usado para passar a senha do certificado A3 automaticamente.
//  Reinf.ProxyServidor := '';
//  Reinf.ProxyUsuario := '';
//  Reinf.ProxySenha := '';   Usado na existencia de Proxy na rede.
  if cbAmbiente.Text = '1 - Produção' then
    Reinf.Ambiente := 1
  else// if cbAmbiente.Text = '2 - Homologação' then
    Reinf.Ambiente := 2;
  mmoXml.Text := 'Componente Configurado!';
end;
procedure TfrmReinf.btnConsultarClick(Sender: TObject);
var
  _RetConsulta: IspdReinfRetConsultarLote;
  _RetConsultaItem: IspdReinfRetConsultarLoteItem;
  _RetConsultaOcorrencia: IspdReinfRetConsultarLoteOcorrencia;
  _RetConsultaOcorrenciaEnvio: IspdReinfRetConsultarLoteOcorrenciaEnvio;

  _RetItemRTomR9011: IspdRTomR9011;
  _RetItemRComlR9011: IspdRComlR9011;
  _RetItemRCPRBR9011: IspdRCPRBR9011;
  _RetItemRPrestR9011: IspdRPrestR9011;
  _RetItemRRecRepADR9011: IspdRRecRepADR9011;


  _RetItemRTomR9001: IspdRTomR9001;
  _RetItemRComlR9001: IspdRComlR9001;
  _RetItemRCPRBR9001: IspdRCPRBR9001;
  _RetItemRPrestR9001: IspdRPrestR9001;
  _RetItemRRecRepADR9001: IspdRRecRepADR9001;
  _RetItemInfoCRTomR9001: IspdInfoCRTomR9001;
  _RetItemRRecEspetDespR9001: IspdRRecEspetDespR9001;
  _RetItemInfoCRTomR9011: IspdInfoCRTomR9011;

  //Retornos novos 9005
  _RetItemR9005 : IspdR9005;
  _RetItemIdeContriR9005 : IspdIdeContriR9005;
  _RetItemInfoTotalR9005 : IspdInfoTotalR9005;
  _RetItemIdeEstabR9005 : IspdIdeEstabR9005;
  _RetItemTotApurSemR9005 : IspdTotApurSemR9005;
  _RetItemTotApurTribSemR9005 : IspdTotApurTribSemR9005;
  _RetItemTotApurQuiR9005 : IspdTotApurQuiR9005;
  _RetItemTotApurTribQuiR9005 : IspdTotApurTribQuiR9005;
  _RetItemTotApurMenR9005 : IspdTotApurMenR9005;
  _RetItemTotApurTribMenR9005 : IspdTotApurTribMenR9005;
  _RetItemTotApurDiaR9005 : IspdTotApurDiaR9005;
  _RetItemTotApurTribDiaR9005 : IspdTotApurTribDiaR9005;
  _RetItemTotApurDecR9005 : IspdTotApurDecR9005;
  _RetItemTotApurTribDecR9005 : IspdTotApurTribDecR9005;


  //retornos novos 9015
  _RetItemInfoCR_CNRR9015: IspdInfoCR_CNRR9015;
  _RetItemTotApurSemR9015: IspdTotApurSemR9015;
  _RetItemTotApurQuiR9015: IspdTotApurQuiR9015;
  _RetItemTotApurMenR9015: IspdTotApurMenR9015;
  _RetItemTotApurDiaR9015: IspdTotApurDiaR9015;
  _RetItemTotApurDecR9015: IspdTotApurDecR9015;
  _RetItemInfoTotalCR9015: IspdInfoTotalCRR9015;
  _RetItemInfoTotalCR_TotApurSemR9015: IspdInfoTotalCR_TotApurSemR9015;
  _RetItemInfoTotalCR_TotApurQuiR9015: IspdInfoTotalCR_TotApurQuiR9015;
  _RetItemInfoTotalCR_TotApurMenR9015: IspdInfoTotalCR_TotApurMenR9015;
  _RetItemInfoTotalCR_TotApurDiaR9015: IspdInfoTotalCR_TotApurDiaR9015;
  _RetItemInfoTotalCR_TotApurDecR9015: IspdInfoTotalCR_TotApurDecR9015;

  _i, _j, _b, _a: integer;
  xml: TStringList;
begin
  mmoXML.Clear;
  mmoXml.Text := '';
  mmoXml.Text := 'Consultando eventos';
  Application.ProcessMessages;
  if rg.ItemIndex = 0 then
    _RetConsulta := Reinf.ConsultarLoteEventos(edtIdLote.Text)
  else if rg.ItemIndex = 1 then
    _RetConsulta := Reinf.ConsultarIdEvento(edtIdLote.Text)
  else if rg.ItemIndex = 2 then
    _RetConsulta := Reinf.ConsultarEventoPorRecibo(edtIdLote.Text)
  else if rg.ItemIndex = 3 then
    _RetConsulta := Reinf.ReconsultarLoteEventos(edtIdLote.Text);
  mmoXML.Lines.Clear;
  mmoXML.Lines.Add('### CONSULTA PROTOCOLO ###');
  mmoXML.Lines.Add('Número do Protocolo: ' + _RetConsulta.NumeroProtocolo);
  mmoXML.Lines.Add('Mensagem de Retorno: ' + _RetConsulta.Mensagem);
  mmoXML.Lines.Add('Status do Lote: ' + _RetConsulta.Status);

  for _i := 0 to _RetConsulta.Count - 1 do
  begin
    _RetConsultaItem := _RetConsulta.Eventos[_i];
    mmoXML.Lines.Add('    Evento: ' + IntToStr(_i + 1));
    mmoXML.Lines.Add('    Id Evento: ' + _RetConsultaItem.IdEvento);
    mmoXML.Lines.Add('    Número Recibo: ' + _RetConsultaItem.NumeroRecibo);
    mmoXML.Lines.Add('    Código de Status: ' + _RetConsultaItem.cStat);
    mmoXML.Lines.Add('    Mensagem: ' + _RetConsultaItem.Mensagem);
    mmoXML.Lines.Add('    Status do Evento: ' + _RetConsultaItem.Status);

    // R9001
    if not _RetConsultaItem.R9001.IsEmpty then
    begin
      mmoXML.Lines.Add('     R9001');
      mmoXML.Lines.Add('      PeriodoApuracao: ' + _RetConsultaItem.R9001.PeriodoApuracao);
      mmoXML.Lines.Add('      NrInsc: ' + _RetConsultaItem.R9001.IdeContri.NrInsc);
      mmoXML.Lines.Add('      TpInsc: ' + _RetConsultaItem.R9001.IdeContri.TpInsc);
      mmoXML.Lines.Add('      NrInsc Estabelecimento: ' + _RetConsultaItem.R9001.IdeEstab.NrInsc);
      mmoXML.Lines.Add('      TpInsc Estabelecimento: ' + _RetConsultaItem.R9001.IdeEstab.TpInsc);
      mmoXML.Lines.Add('      NrRecArqBase: ' + _RetConsultaItem.R9001.InfoTotal.NrRecArqBase);
      for _j := 0 to _RetConsultaItem.R9001.CountRTom - 1 do
      begin
        _RetItemRTomR9001 := (_RetConsultaItem.R9001.RTom[_j]);
        mmoXML.Lines.Add('      RTom:  ');
        mmoXML.Lines.Add('      CnpjPrestador: ' + _RetItemRTomR9001.CnpjPrestador);
        mmoXML.Lines.Add('      VlrTotalBaseRet: ' + _RetItemRTomR9001.VlrTotalBaseRet);
        mmoXML.Lines.Add('      CNO: ' + _RetItemRTomR9001.CNO);
        for _b := 0 to _RetItemRTomR9001.CountInfoCRTom - 1 do
        begin
          _RetItemInfoCRTomR9001 := _RetItemRTomR9001.InfoCRTom[_b];
          mmoXML.Lines.Add('       InfoCRTOM: ');
          mmoXML.Lines.Add('        CRTom: ' + _RetItemInfoCRTomR9001.CRTom);
          mmoXML.Lines.Add('        VlrCRTom: ' + _RetItemInfoCRTomR9001.VlrCRTom);
          mmoXML.Lines.Add('        VlrCRTomSusp: ' + _RetItemInfoCRTomR9001.VlrCRTomSusp);
        end;
      end;

      for _j := 0 to _RetConsultaItem.R9001.CountRComl - 1 do
      begin
        _RetItemRComlR9001 := (_RetConsultaItem.R9001.RComl[_j]);
        mmoXML.Lines.Add('      RComl:  ');
        mmoXML.Lines.Add('      CRComl: ' + _RetItemRComlR9001.CRComl);
        mmoXML.Lines.Add('      VlrCRComl: ' + _RetItemRComlR9001.VlrCRComl);
        mmoXML.Lines.Add('      VlrCRComlSusp: ' + _RetItemRComlR9001.VlrCRComlSusp);
      end;
      for _j := 0 to _RetConsultaItem.R9001.CountRCPRB - 1 do
      begin
        _RetItemRCPRBR9001 := (_RetConsultaItem.R9001.RCPRB[_j]);
        mmoXML.Lines.Add('      RCPRB:  ');
        mmoXML.Lines.Add('      CRCPRB: ' + _RetItemRCPRBR9001.CRCPRB);
        mmoXML.Lines.Add('      VlrCRCPRB: ' + _RetItemRCPRBR9001.VlrCRCPRB);
        mmoXML.Lines.Add('      VlrCRCPRBSusp: ' + _RetItemRCPRBR9001.VlrCRCPRBSusp);
      end;
      for _j := 0 to _RetConsultaItem.R9001.CountRPrest - 1 do
      begin
        _RetItemRPrestR9001 := (_RetConsultaItem.R9001.RPrest[_j]);
        mmoXML.Lines.Add('      RPrest:  ');
        mmoXML.Lines.Add('      TpInscTomador: ' + _RetItemRPrestR9001.TpInscTomador);
        mmoXML.Lines.Add('      NrInscTomador: ' + _RetItemRPrestR9001.NrInscTomador);
        mmoXML.Lines.Add('      VlrTotalBaseRet: ' + _RetItemRPrestR9001.VlrTotalBaseRet);
        mmoXML.Lines.Add('      VlrTotalRetAdic: ' + _RetItemRPrestR9001.VlrTotalRetAdic);
        mmoXML.Lines.Add('      VlrTotalNRetPrinc: ' + _RetItemRPrestR9001.VlrTotalNRetPrinc);
        mmoXML.Lines.Add('      VlrTotalNRetAdic: ' + _RetItemRPrestR9001.VlrTotalNRetAdic);
        mmoXML.Lines.Add('      VlrTotalRetPrinc: ' + _RetItemRPrestR9001.VlrTotalRetPrinc);
      end;
      for _j := 0 to _RetConsultaItem.R9001.CountRRecRepAD - 1 do
      begin
        _RetItemRRecRepADR9001 := (_RetConsultaItem.R9001.RRecRepAD[_j]);
        mmoXML.Lines.Add('      RRecRepAD:  ');
        mmoXML.Lines.Add('      CnpjAssocDesp: ' + _RetItemRRecRepADR9001.CnpjAssocDesp);
        mmoXML.Lines.Add('      VlrTotalRep: ' + _RetItemRRecRepADR9001.VlrTotalRep);
        mmoXML.Lines.Add('      CRRecRepAD: ' + _RetItemRRecRepADR9001.CRRecRepAD);
        mmoXML.Lines.Add('      VlrCRRecRepAD: ' + _RetItemRRecRepADR9001.VlrCRRecRepAD);
        mmoXML.Lines.Add('      VlrCRRecRepADSusp: ' + _RetItemRRecRepADR9001.VlrCRRecRepADSusp);
      end;
      for _j := 0 to _RetConsultaItem.R9001.CountRRecEspetDesp - 1 do
      begin
        _RetItemRRecEspetDespR9001 := (_RetConsultaItem.R9001.RRecEspetDesp[_j]);
        mmoXML.Lines.Add('      RRecEspetDesp:  ');
        mmoXML.Lines.Add('      CRRecEspetDesp: ' + _RetItemRRecEspetDespR9001.CRRecEspetDesp);
        mmoXML.Lines.Add('      VlrReceitaTotal: ' + _RetItemRRecEspetDespR9001.VlrReceitaTotal);
        mmoXML.Lines.Add('      VlrCRRecEspetDesp: ' + _RetItemRRecEspetDespR9001.VlrCRRecEspetDesp);
        mmoXML.Lines.Add('      VlrCRRecEspetDespSusp: ' + _RetItemRRecEspetDespR9001.VlrCRRecEspetDespSusp);
      end;
    end;
    //ok

    //R9011
    if not _RetConsultaItem.R9011.IsEmpty then
    begin
      mmoXML.Lines.Add('  Recibo de autorização: ' + _RetConsultaItem.R9011.NrRecArqBase);
      for _j := 0 to _RetConsultaItem.R9011.CountRTom - 1 do
      begin
        _RetItemRTomR9011 := (_RetConsultaItem.R9011.RTom[_j]);
        mmoXML.Lines.Add('      R9011 ');
        mmoXML.Lines.Add('      RTom:  ');
        mmoXML.Lines.Add('      CnpjPrestador: ' + _RetItemRTomR9011.CnpjPrestador);
        mmoXML.Lines.Add('      VlrTotalBaseRet: ' + _RetItemRTomR9011.VlrTotalBaseRet);
        mmoXML.Lines.Add('      CNO: ' + _RetItemRTomR9011.CNO);
        for _b := 0 to _RetItemRTomR9011.CountInfoCRTom - 1 do
        begin
          _RetItemInfoCRTomR9011 := _RetItemRTomR9011.InfoCRTom[_b];
          mmoXML.Lines.Add('       InfoCRTOM: ');
          mmoXML.Lines.Add('        CRTom: ' + _RetItemInfoCRTomR9011.CRTom);
          mmoXML.Lines.Add('        VlrCRTom: ' + _RetItemInfoCRTomR9011.VlrCRTom);
          mmoXML.Lines.Add('        VlrCRTomSusp: ' + _RetItemInfoCRTomR9011.VlrCRTomSusp);
        end;
      end;
      //pl
      for _j := 0 to _RetConsultaItem.R9011.CountRComl - 1 do
      begin
        _RetItemRComlR9011 := (_RetConsultaItem.R9011.RComl[_j]);
        mmoXML.Lines.Add('      R9011 ');
        mmoXML.Lines.Add('      RComl:  ');
        mmoXML.Lines.Add('      CRComl: ' + _RetItemRComlR9011.CRComl);
        mmoXML.Lines.Add('      VlrCRComl: ' + _RetItemRComlR9011.VlrCRComl);
        mmoXML.Lines.Add('      VlrCRComlSusp: ' + _RetItemRComlR9011.VlrCRComlSusp);
      end;
      for _j := 0 to _RetConsultaItem.R9011.CountRCPRB - 1 do
      begin
        _RetItemRCPRBR9011 := (_RetConsultaItem.R9011.RCPRB[_j]);
        mmoXML.Lines.Add('      R9011 ');
        mmoXML.Lines.Add('      RCPRB:  ');
        mmoXML.Lines.Add('      CRCPRB: ' + _RetItemRCPRBR9011.CRCPRB);
        mmoXML.Lines.Add('      vlrCRCPRB: ' + _RetItemRCPRBR9011.vlrCRCPRB);
        mmoXML.Lines.Add('      vlrCRCPRBSusp: ' + _RetItemRCPRBR9011.vlrCRCPRBSusp);
      end;
      for _j := 0 to _RetConsultaItem.R9011.CountRPrest - 1 do
      begin
        _RetItemRPrestR9011 := (_RetConsultaItem.R9011.RPrest[_j]);
        mmoXML.Lines.Add('      R9011 ');
        mmoXML.Lines.Add('      RPrest:  ');
        mmoXML.Lines.Add('      TpInscTomador: ' + _RetItemRPrestR9011.TpInscTomador);
        mmoXML.Lines.Add('      NrInscTomador: ' + _RetItemRPrestR9011.NrInscTomador);
        mmoXML.Lines.Add('      VlrTotalBaseRet: ' + _RetItemRPrestR9011.VlrTotalBaseRet);
        mmoXML.Lines.Add('      VlrTotalRetAdic: ' + _RetItemRPrestR9011.VlrTotalRetAdic);
        mmoXML.Lines.Add('      VlrTotalNRetPrinc: ' + _RetItemRPrestR9011.VlrTotalNRetPrinc);
        mmoXML.Lines.Add('      VlrTotalNRetAdic: ' + _RetItemRPrestR9011.VlrTotalNRetAdic);
        mmoXML.Lines.Add('      VlrTotalRetPrinc: ' + _RetItemRPrestR9011.VlrTotalRetPrinc);
      end;
      for _j := 0 to _RetConsultaItem.R9011.CountRRecRepAD - 1 do
      begin
        _RetItemRRecRepADR9011 := (_RetConsultaItem.R9011.RRecRepAD[_j]);
        mmoXML.Lines.Add('      R9011 ');
        mmoXML.Lines.Add('      RRecRepAD:  ');
        mmoXML.Lines.Add('      CRRecRepAD: ' + _RetItemRRecRepADR9011.CRRecRepAD);
        mmoXML.Lines.Add('      VlrCRRecRepAD: ' + _RetItemRRecRepADR9011.VlrCRRecRepAD);
        mmoXML.Lines.Add('      VlrCRRecRepADSusp: ' + _RetItemRRecRepADR9011.VlrCRRecRepADSusp);
      end;
    end;

    //Trata retornos R9005
    if not _RetConsultaItem.R9005.IsEmpty then
    begin
      mmoXML.Lines.Add('     R9005');
      mmoXML.Lines.Add('      PeriodoApuracao: ' + _RetConsultaItem.R9005.PeriodoApuracao);
      mmoXML.Lines.Add('      NrInsc: ' + _RetConsultaItem.R9005.IdeContri.NrInsc);
      mmoXML.Lines.Add('      TpInsc: ' + _RetConsultaItem.R9005.IdeContri.TpInsc);
      mmoXML.Lines.Add('      NrInsc Estabelecimento: ' + _RetConsultaItem.R9005.IdeEstab.NrInsc);
      mmoXML.Lines.Add('      TpInsc Estabelecimento: ' + _RetConsultaItem.R9005.IdeEstab.TpInsc);
      mmoXML.Lines.Add('      ideEvtAdic Estabelecimento: ' + _RetConsultaItem.R9005.IdeEstab.ideEvtAdic);
      mmoXML.Lines.Add('      NrRecArqBase: ' + _RetConsultaItem.R9005.InfoTotal.NrRecArqBase);
      for _j := 0 to _RetConsultaItem.R9005.CountTotApurSem - 1 do
      begin
        _RetItemTotApurSemR9005 := (_RetConsultaItem.R9005.TotApurSem[_j]);
        mmoXML.Lines.Add('      totApurSem:  ');
        mmoXML.Lines.Add('          vlrBaseCRSemSusp: ' + _RetItemTotApurSemR9005.VlrBaseCRSemSusp);
        mmoXML.Lines.Add('          natRend: ' + _RetItemTotApurSemR9005.NatRend);
        mmoXML.Lines.Add('          vlrBaseCRSem: ' + _RetItemTotApurSemR9005.VlrBaseCRSem);
        mmoXML.Lines.Add('          perApurSem: ' + _RetItemTotApurSemR9005.PerApurSem);
        mmoXML.Lines.Add('          CRSem: ' + _RetItemTotApurSemR9005.CRSem);
        _RetItemTotApurTribSemR9005 := _RetItemTotApurSemR9005.TotApurTribSem;
        mmoXML.Lines.Add('        totApurTribSem:  ');
        mmoXML.Lines.Add('          vlrCRSemSuspInf: ' + _RetItemTotApurTribSemR9005.VlrCRSemSuspInf);
        mmoXML.Lines.Add('          vlrCRSemCalc: ' + _RetItemTotApurTribSemR9005.VlrCRSemCalc);
        mmoXML.Lines.Add('          vlrCRSemInf: ' + _RetItemTotApurTribSemR9005.VlrCRSemInf);
        mmoXML.Lines.Add('          vlrCRSemSuspCalc: ' + _RetItemTotApurTribSemR9005.VlrCRSemSuspCalc);
      end;

      for _j := 0 to _RetConsultaItem.R9005.CountTotApurQui - 1 do
      begin
        _RetItemTotApurQuiR9005 := (_RetConsultaItem.R9005.TotApurQui[_j]);
        mmoXML.Lines.Add('      totApurQui:  ');
        mmoXML.Lines.Add('          natRend: ' + _RetItemTotApurQuiR9005.NatRend);
        mmoXML.Lines.Add('          vlrBaseCRQuiSusp: ' + _RetItemTotApurQuiR9005.VlrBaseCRQuiSusp);
        mmoXML.Lines.Add('          vlrBaseCRQui: ' + _RetItemTotApurQuiR9005.VlrBaseCRQui);
        mmoXML.Lines.Add('          perApurQui: ' + _RetItemTotApurQuiR9005.PerApurQui);
        mmoXML.Lines.Add('          CRQui: ' + _RetItemTotApurQuiR9005.CRQui);
        _RetItemTotApurTribQuiR9005 := _RetItemTotApurQuiR9005.TotApurTribQui;
        mmoXML.Lines.Add('        totApurTribQui:  ');
        mmoXML.Lines.Add('          vlrCRQuiSuspCalc: ' + _RetItemTotApurTribQuiR9005.VlrCRQuiSuspCalc);
        mmoXML.Lines.Add('          vlrCRQuiInf: ' + _RetItemTotApurTribQuiR9005.VlrCRQuiInf);
        mmoXML.Lines.Add('          vlrCRQuiSuspInf: ' + _RetItemTotApurTribQuiR9005.VlrCRQuiSuspInf);
        mmoXML.Lines.Add('          vlrCRQuiCalc: ' + _RetItemTotApurTribQuiR9005.VlrCRQuiCalc);
      end;

      for _j := 0 to _RetConsultaItem.R9005.CountTotApurMen - 1 do
      begin
        _RetItemTotApurMenR9005 := (_RetConsultaItem.R9005.TotApurMen[_j]);
        mmoXML.Lines.Add('      totApurMen:  ');
        mmoXML.Lines.Add('          natRend: ' + _RetItemTotApurMenR9005.NatRend);
        mmoXML.Lines.Add('          vlrBaseCRMen: ' + _RetItemTotApurMenR9005.VlrBaseCRMen);
        mmoXML.Lines.Add('          vlrBaseCRMenSusp: ' + _RetItemTotApurMenR9005.VlrBaseCRMenSusp);
        mmoXML.Lines.Add('          CRMen: ' + _RetItemTotApurMenR9005.CRMen);
        _RetItemTotApurTribMenR9005 := _RetItemTotApurMenR9005.TotApurTribMen;
        mmoXML.Lines.Add('        totApurTribMen:  ');
        mmoXML.Lines.Add('          vlrCRMenCalc: ' + _RetItemTotApurTribMenR9005.VlrCRMenCalc);
        mmoXML.Lines.Add('          vlrCRMenSuspCalc: ' + _RetItemTotApurTribMenR9005.VlrCRMenSuspCalc);
        mmoXML.Lines.Add('          vlrCRMenInf: ' + _RetItemTotApurTribMenR9005.VlrCRMenInf);
        mmoXML.Lines.Add('          vlrCRMenSuspInf: ' + _RetItemTotApurTribMenR9005.VlrCRMenSuspInf);
      end;

      for _j := 0 to _RetConsultaItem.R9005.CountTotApurDia - 1 do
      begin
        _RetItemTotApurDiaR9005 := (_RetConsultaItem.R9005.TotApurDia[_j]);
        mmoXML.Lines.Add('      totApurDia:  ');
        mmoXML.Lines.Add('          natRend: ' + _RetItemTotApurDiaR9005.NatRend);
        mmoXML.Lines.Add('          vlrBaseCRDia: ' + _RetItemTotApurDiaR9005.VlrBaseCRDia);
        mmoXML.Lines.Add('          perApurDia: ' + _RetItemTotApurDiaR9005.PerApurDia);
        mmoXML.Lines.Add('          CRDia: ' + _RetItemTotApurDiaR9005.CRDia);
        mmoXML.Lines.Add('          vlrBaseCRDiaSusp: ' + _RetItemTotApurDiaR9005.vlrBaseCRDiaSusp);
        _RetItemTotApurTribDiaR9005 := _RetItemTotApurDiaR9005.TotApurTribDia;
        mmoXML.Lines.Add('        totApurTribDia:  ');
        mmoXML.Lines.Add('          vlrCRDiaInf: ' + _RetItemTotApurTribDiaR9005.VlrCRDiaInf);
        mmoXML.Lines.Add('          vlrCRDiaCalc: ' + _RetItemTotApurTribDiaR9005.VlrCRDiaCalc);
        mmoXML.Lines.Add('          vlrCRDiaSuspCalc: ' + _RetItemTotApurTribDiaR9005.VlrCRDiaSuspCalc);
        mmoXML.Lines.Add('          vlrCRDiaSuspInf: ' + _RetItemTotApurTribDiaR9005.VlrCRDiaSuspInf);
      end;

      for _j := 0 to _RetConsultaItem.R9005.CountTotApurDec - 1 do
      begin
        _RetItemTotApurDecR9005 := (_RetConsultaItem.R9005.TotApurDec[_j]);
        mmoXML.Lines.Add('      totApurDec:  ');
        mmoXML.Lines.Add('          vlrBaseCRDecSusp: ' + _RetItemTotApurDecR9005.VlrBaseCRDecSusp);
        mmoXML.Lines.Add('          natRend: ' + _RetItemTotApurDecR9005.NatRend);
        mmoXML.Lines.Add('          vlrBaseCRDec: ' + _RetItemTotApurDecR9005.VlrBaseCRDec);
        mmoXML.Lines.Add('          perApurDec: ' + _RetItemTotApurDecR9005.PerApurDec);
        mmoXML.Lines.Add('          CRDec: ' + _RetItemTotApurDecR9005.CRDec);
        _RetItemTotApurTribDecR9005 := _RetItemTotApurDecR9005.TotApurTribDec;
        mmoXML.Lines.Add('        totApurTribDec:  ');
        mmoXML.Lines.Add('          vlrCRDecSuspInf: ' + _RetItemTotApurTribDecR9005.VlrCRDecSuspInf);
        mmoXML.Lines.Add('          vlrCRDecInf: ' + _RetItemTotApurTribDecR9005.VlrCRDecInf);
        mmoXML.Lines.Add('          vlrCRDecSuspCalc: ' + _RetItemTotApurTribDecR9005.VlrCRDecSuspCalc);
        mmoXML.Lines.Add('          vlrCRDecCalc: ' + _RetItemTotApurTribDecR9005.VlrCRDecCalc);
      end;
    end;

    //Trata retornos R9005
    if not _RetConsultaItem.R9015.IsEmpty then
    begin
      mmoXML.Lines.Add('     R9015');
      mmoXML.Lines.Add('      PeriodoApuracao: ' + _RetConsultaItem.R9015.PeriodoApuracao);
      for _j := 0 to _RetConsultaItem.R9015.CountInfoCR_CNR - 1 do
      begin
        _RetItemInfoCR_CNRR9015 := (_RetConsultaItem.R9015.InfoCR_CNR[_j]);
        mmoXML.Lines.Add('      infoCR_CNR:  ');
        mmoXML.Lines.Add('        nrRecArqBase: ' + _RetItemInfoCR_CNRR9015.NrRecArqBase);
        mmoXML.Lines.Add('        indExistInfo: ' + _RetItemInfoCR_CNRR9015.IndExistInfo);
        mmoXML.Lines.Add('        IdentEscritDCTF: ' + _RetItemInfoCR_CNRR9015.IdentEscritDCTF);

        for _a := 0 to _RetItemInfoCR_CNRR9015.CountTotApurSem - 1 do
        begin
          _RetItemTotApurSemR9015 := (_RetItemInfoCR_CNRR9015.TotApurSem[_a]);
          mmoXML.Lines.Add('      totApurSem:  ');
          mmoXML.Lines.Add('          natRend: ' + _RetItemTotApurSemR9015.NatRend);
          mmoXML.Lines.Add('          vlrCRSemSuspInf: ' + _RetItemTotApurSemR9015.VlrCRSemSuspInf);
          mmoXML.Lines.Add('          vlrCRSemDCTF: ' + _RetItemTotApurSemR9015.VlrCRSemDCTF);
          mmoXML.Lines.Add('          vlrCRSemCalc: ' + _RetItemTotApurSemR9015.VlrCRSemCalc);
          mmoXML.Lines.Add('          vlrCRSemInf: ' + _RetItemTotApurSemR9015.VlrCRSemInf);
          mmoXML.Lines.Add('          vlrCRSemSuspDCTF: ' + _RetItemTotApurSemR9015.VlrCRSemSuspDCTF);
          mmoXML.Lines.Add('          vlrCRSemSuspCalc: ' + _RetItemTotApurSemR9015.VlrCRSemSuspCalc);
          mmoXML.Lines.Add('          perApurSem: ' + _RetItemTotApurSemR9015.PerApurSem);
          mmoXML.Lines.Add('          CRSem: ' + _RetItemTotApurSemR9015.CRSem);
        end;
        for _a := 0 to _RetItemInfoCR_CNRR9015.CountTotApurQui - 1 do
        begin
          _RetItemTotApurQuiR9015 := (_RetItemInfoCR_CNRR9015.TotApurQui[_a]);
          mmoXML.Lines.Add('      totApurQui:  ');
          mmoXML.Lines.Add('          vlrCRQuisSuspCalc: ' + _RetItemTotApurQuiR9015.VlrCRQuisSuspCalc);
          mmoXML.Lines.Add('          vlrCRQuiSuspDCTF: ' + _RetItemTotApurQuiR9015.VlrCRQuiSuspDCTF);
          mmoXML.Lines.Add('          vlrCRQuiInf: ' + _RetItemTotApurQuiR9015.VlrCRQuiInf);
          mmoXML.Lines.Add('          natRend: ' + _RetItemTotApurQuiR9015.NatRend);
          mmoXML.Lines.Add('          vlrCRQuiSuspInf: ' + _RetItemTotApurQuiR9015.VlrCRQuiSuspInf);
          mmoXML.Lines.Add('          vlrCRQuiDCTF: ' + _RetItemTotApurQuiR9015.VlrCRQuiDCTF);
          mmoXML.Lines.Add('          vlrCRQuiCalc: ' + _RetItemTotApurQuiR9015.VlrCRQuiCalc);
          mmoXML.Lines.Add('          perApurQui: ' + _RetItemTotApurQuiR9015.PerApurQui);
          mmoXML.Lines.Add('          CRQui: ' + _RetItemTotApurQuiR9015.CRQui);
        end;
        for _a := 0 to _RetItemInfoCR_CNRR9015.CountTotApurMen - 1 do
        begin
          _RetItemTotApurMenR9015 := (_RetItemInfoCR_CNRR9015.TotApurMen[_a]);
          mmoXML.Lines.Add('      totApurMen:  ');
          mmoXML.Lines.Add('          vlrCRMenDCTF: ' + _RetItemTotApurMenR9015.VlrCRMenDCTF);
          mmoXML.Lines.Add('          vlrCRMenCalc: ' + _RetItemTotApurMenR9015.VlrCRMenCalc);
          mmoXML.Lines.Add('          natRend: ' + _RetItemTotApurMenR9015.NatRend);
          mmoXML.Lines.Add('          vlrCRMenSuspDCTF: ' + _RetItemTotApurMenR9015.VlrCRMenSuspDCTF);
          mmoXML.Lines.Add('          vlrCRMenSuspCalc: ' + _RetItemTotApurMenR9015.VlrCRMenSuspCalc);
          mmoXML.Lines.Add('          vlrCRMenInf: ' + _RetItemTotApurMenR9015.VlrCRMenInf);
          mmoXML.Lines.Add('          vlrCRMenSuspInf: ' + _RetItemTotApurMenR9015.VlrCRMenSuspInf);
          mmoXML.Lines.Add('          CRMen: ' + _RetItemTotApurMenR9015.CRMen);
        end;
        for _a := 0 to _RetItemInfoCR_CNRR9015.CountTotApurDia - 1 do
        begin
          _RetItemTotApurDiaR9015 := (_RetItemInfoCR_CNRR9015.TotApurDia[_a]);
          mmoXML.Lines.Add('      totApurDia:  ');
          mmoXML.Lines.Add('          vlrCRDiaInf: ' + _RetItemTotApurDiaR9015.VlrCRDiaInf);
          mmoXML.Lines.Add('          natRend: ' + _RetItemTotApurDiaR9015.NatRend);
          mmoXML.Lines.Add('          vlrCRDiaDCTF: ' + _RetItemTotApurDiaR9015.VlrCRDiaDCTF);
          mmoXML.Lines.Add('          vlrCRDiaCalc: ' + _RetItemTotApurDiaR9015.VlrCRDiaCalc);
          mmoXML.Lines.Add('          vlrCRDiaSuspDCTF: ' + _RetItemTotApurDiaR9015.VlrCRDiaSuspDCTF);
          mmoXML.Lines.Add('          vlrCRDiaSuspCalc: ' + _RetItemTotApurDiaR9015.VlrCRDiaSuspCalc);
          mmoXML.Lines.Add('          perApurDia: ' + _RetItemTotApurDiaR9015.PerApurDia);
          mmoXML.Lines.Add('          CRDia: ' + _RetItemTotApurDiaR9015.CRDia);
          mmoXML.Lines.Add('          vlrCRDiaSuspInf: ' + _RetItemTotApurDiaR9015.VlrCRDiaSuspInf);
        end;
        for _a := 0 to _RetItemInfoCR_CNRR9015.CountTotApurDec - 1 do
        begin
          _RetItemTotApurDecR9015 := (_RetItemInfoCR_CNRR9015.TotApurDec[_a]);
          mmoXML.Lines.Add('      totApurDec:  ');
          mmoXML.Lines.Add('          vlrCRDecSuspInf: ' + _RetItemTotApurDecR9015.VlrCRDecSuspInf);
          mmoXML.Lines.Add('          natRend: ' + _RetItemTotApurDecR9015.NatRend);
          mmoXML.Lines.Add('          vlrCRDecInf: ' + _RetItemTotApurDecR9015.VlrCRDecInf);
          mmoXML.Lines.Add('          vlrCRDecSuspDCTF: ' + _RetItemTotApurDecR9015.VlrCRDecSuspDCTF);
          mmoXML.Lines.Add('          vlrCRDecSuspCalc: ' + _RetItemTotApurDecR9015.VlrCRDecSuspCalc);
          mmoXML.Lines.Add('          vlrCRDecDCTF: ' + _RetItemTotApurDecR9015.VlrCRDecDCTF);
          mmoXML.Lines.Add('          vlrCRDecCalc: ' + _RetItemTotApurDecR9015.VlrCRDecCalc);
          mmoXML.Lines.Add('          perApurDec: ' + _RetItemTotApurDecR9015.PerApurDec);
          mmoXML.Lines.Add('          CRDec: ' + _RetItemTotApurDecR9015.CRDec);
        end;
      end;
      for _j := 0 to _RetConsultaItem.R9015.CountInfoTotalCR - 1 do
      begin
        _RetItemInfoTotalCR9015 := (_RetConsultaItem.R9015.InfoTotalCR[_j]);
        mmoXML.Lines.Add('      infoTotalCR:  ');
        for _a := 0 to _RetItemInfoTotalCR9015.CountTotApurSem - 1 do
        begin
          _RetItemInfoTotalCR_TotApurSemR9015 := (_RetItemInfoTotalCR9015.TotApurSem[_a]);
          mmoXML.Lines.Add('      totApurSem:  ');
          mmoXML.Lines.Add('          vlrCRSemDCTF: ' + _RetItemInfoTotalCR_TotApurSemR9015.VlrCRSemDCTF);
          mmoXML.Lines.Add('          vlrCRSemSuspDCTF: ' + _RetItemInfoTotalCR_TotApurSemR9015.VlrCRSemSuspDCTF);
          mmoXML.Lines.Add('          perApurSem: ' + _RetItemInfoTotalCR_TotApurSemR9015.PerApurSem);
          mmoXML.Lines.Add('          CRSem: ' + _RetItemInfoTotalCR_TotApurSemR9015.CRSem);
        end;

        for _a := 0 to _RetItemInfoTotalCR9015.CountTotApurQui - 1 do
        begin
          _RetItemInfoTotalCR_TotApurQuiR9015 := (_RetItemInfoTotalCR9015.TotApurQui[_a]);
          mmoXML.Lines.Add('      totApurQui:  ');
          mmoXML.Lines.Add('          vlrCRQuiSuspDCTF: ' + _RetItemInfoTotalCR_TotApurQuiR9015.VlrCRQuiSuspDCTF);
          mmoXML.Lines.Add('          vlrCRQuiDCTF: ' + _RetItemInfoTotalCR_TotApurQuiR9015.VlrCRQuiDCTF);
          mmoXML.Lines.Add('          perApurQui: ' + _RetItemInfoTotalCR_TotApurQuiR9015.PerApurQui);
          mmoXML.Lines.Add('          CRQui: ' + _RetItemInfoTotalCR_TotApurQuiR9015.CRQui);
        end;

        for _a := 0 to _RetItemInfoTotalCR9015.CountTotApurMen - 1 do
        begin
          _RetItemInfoTotalCR_TotApurMenR9015 := (_RetItemInfoTotalCR9015.TotApurMen[_a]);
          mmoXML.Lines.Add('      totApurMen:  ');
          mmoXML.Lines.Add('          vlrCRMenDCTF: ' + _RetItemInfoTotalCR_TotApurMenR9015.VlrCRMenDCTF);
          mmoXML.Lines.Add('          vlrCRMenSuspDCTF: ' + _RetItemInfoTotalCR_TotApurMenR9015.VlrCRMenSuspDCTF);
          mmoXML.Lines.Add('          CRMen: ' + _RetItemInfoTotalCR_TotApurMenR9015.CRMen);
        end;

        for _a := 0 to _RetItemInfoTotalCR9015.CountTotApurDia - 1 do
        begin
          _RetItemInfoTotalCR_TotApurDiaR9015 := (_RetItemInfoTotalCR9015.TotApurDia[_a]);
          mmoXML.Lines.Add('      totApurDia:  ');
          mmoXML.Lines.Add('          perApurDia: ' + _RetItemInfoTotalCR_TotApurDiaR9015.PerApurDia);
          mmoXML.Lines.Add('          CRDia: ' + _RetItemInfoTotalCR_TotApurDiaR9015.CRDia);
          mmoXML.Lines.Add('          vlrCRDiaDCTF: ' + _RetItemInfoTotalCR_TotApurDiaR9015.VlrCRDiaDCTF);
          mmoXML.Lines.Add('          vlrCRDiaSuspDCTF: ' + _RetItemInfoTotalCR_TotApurDiaR9015.VlrCRDiaSuspDCTF);
        end;

        for _a := 0 to _RetItemInfoTotalCR9015.CountTotApurDec - 1 do
        begin
          _RetItemInfoTotalCR_TotApurDecR9015 := (_RetItemInfoTotalCR9015.TotApurDec[_a]);
          mmoXML.Lines.Add('      totApurDec:  ');
          mmoXML.Lines.Add('          vlrCRDecSuspDCTF: ' + _RetItemInfoTotalCR_TotApurDecR9015.VlrCRDecSuspDCTF);
          mmoXML.Lines.Add('          vlrCRDecDCTF: ' + _RetItemInfoTotalCR_TotApurDecR9015.VlrCRDecDCTF);
          mmoXML.Lines.Add('          perApurDec: ' + _RetItemInfoTotalCR_TotApurDecR9015.PerApurDec);
          mmoXML.Lines.Add('          CRDec: ' + _RetItemInfoTotalCR_TotApurDecR9015.CRDec);
        end;
      end;
    end;

    for _j := 0 to _RetConsultaItem.Count - 1 do
    begin
      _RetConsultaOcorrencia := _RetConsultaItem.Ocorrencias[_j];
      mmoXML.Lines.Add('        Ocorrencia: ' + IntToStr(_j + 1));
      mmoXML.Lines.Add('        Código: ' + _RetConsultaOcorrencia.Codigo);
      mmoXML.Lines.Add('        Descrição: ' + _RetConsultaOcorrencia.Descricao);
    end;
  end;

  for _i := 0 to _RetConsulta.CountOcorrencias - 1 do
  begin
    _RetConsultaOcorrenciaEnvio := _RetConsulta.Ocorrencias[_i];
    mmoXML.Lines.Add('        Ocorrencia no envio: ' + IntToStr(_i + 1));
    mmoXML.Lines.Add('        Código: ' + _RetConsultaOcorrenciaEnvio.Codigo);
    mmoXML.Lines.Add('        Descrição: ' + _RetConsultaOcorrenciaEnvio.Descricao);
  end;

  xml := TStringList.Create;
  mmoXmlRetorno.Lines.Clear;
  mmoXmlRetorno.Lines.Add(_RetConsulta.XmlRetorno);
  xml.Text := _RetConsulta.XmlRetorno;
  xml.SaveToFile('.\testeDelphi.xml', TEncoding.UTF8);
  mmoXmlEnviado.Lines.Clear;
  mmoXmlEnviado.Lines.Add(_RetConsulta.XmlEnviado);
end;
procedure TfrmReinf.btnEnviarClick(Sender: TObject);
var
  _RetEnvio: IspdReinfRetEnviarLoteEventos;
begin
  _RetEnvio := Reinf.EnviarLoteEventos(mmoXML.Text);
  mmoXML.Lines.Clear;
  mmoXML.Lines.Add('### INCLUIR EVENTO ###');
  mmoXML.Lines.Add('Identificador do Lote: ' + _RetEnvio.IdLote);
  mmoXML.Lines.Add('Mensagem de Retorno: ' + _RetEnvio.Mensagem);
  edtIdLote.Text := _RetEnvio.IdLote;
end;

procedure TfrmReinf.btnTx2Click(Sender: TObject);
begin
  mmoXml.Clear;
  mmoXML.Lines.Add('INCLUIRR1000');
  if cbAmbiente.Text = '1 - Produção' then
    mmoXML.Lines.Add('tpAmb_4=1')
  else
    mmoXML.Lines.Add('tpAmb_4=2');
  mmoXML.Lines.Add('procEmi_5=1');
  mmoXML.Lines.Add('verProc_6=1.0');
  mmoXML.Lines.Add('tpInsc_8=1');
  mmoXML.Lines.Add('nrInsc_9=08187168');
  mmoXML.Lines.Add('iniValid_13=2021-03');
  mmoXML.Lines.Add('classTrib_16=01');
  mmoXML.Lines.Add('indEscrituracao_17=0');
  mmoXML.Lines.Add('indDesoneracao_18=0');
  mmoXML.Lines.Add('indAcordoIsenMulta_19=0');
  mmoXML.Lines.Add('indSitPJ_20=0');
  mmoXML.Lines.Add('nmCtt_22=Nome do Contato');
  mmoXML.Lines.Add('cpfCtt_23=12345678909');
  mmoXML.Lines.Add('foneFixo_24=1123452345');
  mmoXML.Lines.Add('SALVARR1000');
end;
procedure TfrmReinf.btnXmlClick(Sender: TObject);
begin
  mmoXml.Text := Reinf.GerarXMLporTx2(mmoXml.Text);
end;
procedure TfrmReinf.btnSincronizarXmlPendentesClick(Sender: TObject);
begin
  Reinf.SincronizarXmlsRetorno(edtIdLote.Text);
end;
end.

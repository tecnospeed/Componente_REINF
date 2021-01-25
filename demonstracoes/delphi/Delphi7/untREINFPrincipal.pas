unit untREINFPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, ReinfClientX_TLB, StdCtrls, ExtCtrls, ComCtrls, DateUtils,
  Buttons, ShellApi;

type
  TfrmReinfPrincipal = class(TForm)
    Panel2: TPanel;
    pcProcessos: TPageControl;
    tsTX2: TTabSheet;
    GroupBox5: TGroupBox;
    tsXML: TTabSheet;
    GroupBox6: TGroupBox;
    mmXML: TMemo;
    GroupBox3: TGroupBox;
    mmXMLAssinado: TMemo;
    tsEnvio: TTabSheet;
    GroupBox7: TGroupBox;
    mmEnvio: TMemo;
    tsConsulta: TTabSheet;
    GroupBox10: TGroupBox;
    mmConsulta: TMemo;
    tsXMLEnviado: TTabSheet;
    GroupBox11: TGroupBox;
    mmXMLEnvio: TMemo;
    tsXMLRetornado: TTabSheet;
    GroupBox8: TGroupBox;
    mmXMLRetorno: TMemo;
    tsExclusao: TTabSheet;
    GroupBox12: TGroupBox;
    mmTX2Exclusao: TMemo;
    GroupBox13: TGroupBox;
    mmXMLExclusao: TMemo;
    GroupBox14: TGroupBox;
    mmRetornoExclusao: TMemo;
    mmTX2: TMemo;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox9: TGroupBox;
    GroupBox1: TGroupBox;
    lbl1: TLabel;
    sbPreencherComp: TSpeedButton;
    sbGerarXML: TSpeedButton;
    sbGerarTX2: TSpeedButton;
    sbAssinar: TSpeedButton;
    sbEnviar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbConsultaLote: TSpeedButton;
    sbConsultarEvento: TSpeedButton;
    sbConsultarRecibo: TSpeedButton;
    cbCertificado: TComboBox;
    edtCNPJ: TEdit;
    edtToken: TEdit;
    lbl2: TLabel;
    cbVersao: TComboBox;
    Ambiente: TLabel;
    cbAmbiente: TComboBox;
    Label4: TLabel;
    edtDirTemplates: TEdit;
    Label5: TLabel;
    edtDirEsquemas: TEdit;
    edtCNPJEmpregador: TEdit;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    sbLimpar: TSpeedButton;
    edtIDLote: TEdit;
    Label7: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbPreencherCompClick(Sender: TObject);
    procedure sbGerarXMLClick(Sender: TObject);
    procedure sbGerarTX2Click(Sender: TObject);
    procedure sbAssinarClick(Sender: TObject);
    procedure sbEnviarClick(Sender: TObject);
    procedure sbLimparClick(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure sbConsultaLoteClick(Sender: TObject);
    procedure sbConsultarEventoClick(Sender: TObject);
    procedure sbConsultarReciboClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure CarregarDadosReinf;
    procedure Limpar;
    procedure ExecutarConsulta(pRetConsulta: IspdReinfRetConsultarLote; pTipoConsulta: string; isExclusao: Boolean = False);
    procedure GerarTX2Exclusao;
    procedure EnviarExclusao;
    procedure GerarXMLAssinado;
    procedure PreencherTX2(verProc, ClassTrib: string);
    { Private declarations }
  public
    { Public declarations }
    vReinf      : TspdReinfClientX;
  end;

var
  frmReinfPrincipal: TfrmReinfPrincipal;

implementation

{$R *.dfm}

{
** ERROS **
===============================================================================
== Function ListaCertificados não retornar nada.
=> Verificar se o certificado foi instalado por maquina ou por usuário, ele deve ser instalado por usuário.
===============================================================================
}

procedure TfrmReinfPrincipal.CarregarDadosReinf;
begin
  cbCertificado.Items.Text := vReinf.ListarCertificados(#13#10);
{
  Quando o ListarCertificados não trouxer nada, verificar se o certificado foi instalado por maquina ou por usuário
}
  cbVersao.Items.Text      := vReinf.ListarVersaoManual(#13#10);

  cbCertificado.ItemIndex  := 0;
  cbVersao.ItemIndex       := cbVersao.Items.Count-1;
end;

procedure TfrmReinfPrincipal.Limpar;
begin
  edtIDLote.Text := '';

  mmTX2.Lines.Clear;
  mmXML.Lines.Clear;
  mmXMLAssinado.Lines.Clear;
  mmEnvio.Lines.Clear;
  mmConsulta.Lines.Clear;
  mmXMLEnvio.Lines.Clear;
  mmXMLRetorno.Lines.Clear;
  mmTX2Exclusao.Lines.Clear;
  mmXMLExclusao.Lines.Clear;
  mmRetornoExclusao.Lines.Clear;  

  pcProcessos.ActivePage := tsTX2;
end;

procedure TfrmReinfPrincipal.FormCreate(Sender: TObject);
begin
  vReinf        := TspdReinfClientX.Create(nil);

  frmReinfPrincipal.Caption := 'Demonstração Reinf v.' + vReinf.Versao + ' - TecnoSpeed';
end;

procedure TfrmReinfPrincipal.FormShow(Sender: TObject);
begin
  CarregarDadosReinf;
end;

procedure TfrmReinfPrincipal.sbPreencherCompClick(Sender: TObject);
begin
  try
    vReinf.ConfigurarSoftwareHouse(edtCNPJ.Text, edtTOKEN.Text);
    vReinf.CpfCnpjEmpregador  := Copy(edtCNPJEmpregador.Text,0,8);//BASE cnpj válido. Utilizado na geração do ID único do componente
    vReinf.DiretorioTemplates := edtDirTemplates.Text;
    vReinf.DiretorioEsquemas  := edtDirEsquemas.Text;
    vReinf.NomeCertificado    := cbCertificado.Text;
    vReinf.VersaoManual       := cbVersao.Text;
    if cbAmbiente.ItemIndex = 0 then
      vReinf.Ambiente := akProducao
    else
      vReinf.Ambiente := akPreProducaoReais;

{ Necessário apenas para certificado A1
        Reinf.CaminhoCertificado := '';
        Reinf.SenhaCertificado := '';
}
{ Senha do certificado A3, caso queira autenticação automática
        Reinf.Pincode := '';
}
{ Configurações necessárias apenas para proxy
        Reinf.ProxyServidor := '';
        Reinf.ProxyUsuario := '';
        Reinf.ProxySenha := '';
}
    ShowMessage('Configurado com sucesso.');

  except
    on e : exception do
     showmessage('Ocorreu o seguinte erro: '+ e.message);
  end;
end;

procedure TfrmReinfPrincipal.PreencherTX2(verProc, ClassTrib: string);
begin
    mmTX2.Lines.Add('INCLUIRR1000');
    mmTX2.Lines.Add('tpAmb_4='+ IntToStr(cbAmbiente.ItemIndex + 1));//1 - Produção; 2 - Produção restrita - dados reais;
    mmTX2.Lines.Add('procEmi_5=1');//1 - Aplicativo do contribuinte; 2 - Aplicativo governamental
    mmTX2.Lines.Add('verProc_6=' + verProc);//Informar a versão do aplicativo emissor do evento
    mmTX2.Lines.Add('tpInsc_8=1');//1 - CNPJ; 2 - CPF;
    mmTX2.Lines.Add('nrInsc_9=' + Copy(edtCNPJ.Text,0,8));//Se [tpInsc_8] for igual a [1], deve ser o número da BASE (8 digitos) de CNPJ válido; Se [tpInsc_8] for igual a [2], deve ser um CPF válido;
    mmTX2.Lines.Add('iniValid_13=' + FormatDateTime('yyyy-mm',Date));//Deve ser uma data válida, igual ou posterior à data inicial de implantação da EFD-Reinf, no formato AAAA-MM.
{
    mmTX2.Lines.Add('fimValid_14=' + FormatDateTime('yyyy-mm',Date));//Se informado, deve estar no formato AAAA-MM e ser um período igual ou posterior a [iniValid_13]
}
    mmTX2.Lines.Add('classTrib_16=' + ClassTrib);//Deve ser um dos códigos existentes na tabela 08. Os códigos [21] e [22] somente podem ser utilizados se [tpInsc_8] for igual a [2]. Para os demais códigos, [tpInsc_8] deve ser igual a [1].
    mmTX2.Lines.Add('indEscrituracao_17=0');//0 - Empresa Não obrigada à ECD; 1 - Empresa obrigada à ECD.
    mmTX2.Lines.Add('indDesoneracao_18=0');//0 - Não Aplicável; 1 - Empresa enquadrada nos artigos 7° a 9° da Lei 12.546/2011. Pode ser igual a [1] apenas se a classificação tributária for igual a [02, 03, 99]. Nos demais casos deve ser igual a [0].
    mmTX2.Lines.Add('indAcordoIsenMulta_19=0');//0 - Sem acordo; 1 - Com acordo. Só pode ser igual a [1] se [classTrib_16] for igual a [60].
    mmTX2.Lines.Add('indSitPJ_20=0');//0 - Situação Normal; 1 - Extinção; 2 - Fusão; 3 - Cisão; 4 - Incorporação. Preenchimento obrigatório apenas para Pessoa Jurídica.
    mmTX2.Lines.Add('nmCtt_22=Nome do Contato');
    mmTX2.Lines.Add('cpfCtt_23=12345678909');
{
    mmTX2.Lines.Add('foneFixo_24=1123452345');//Informar o número do telefone, com DDD. O preenchimento é obrigatório se o campo [foneCel_25] não for preenchido. Se preenchido, deve conter apenas números, com o mínimo de dez dígitos.
}
    mmTX2.Lines.Add('foneCel_25=44988884444');//Telefone celular, com DDD. Se preenchido, deve conter apenas números, com o mínimo de dez dígitos.
    mmTX2.Lines.Add('email_26=teste@teste.com.br');

    mmTX2.Lines.Add('INCLUIRSOFTHOUSE_27');
    mmTX2.Lines.Add('cnpjSoftHouse_28=' + edtCNPJ.Text);
    mmTX2.Lines.Add('nmRazao_29=Tecnospeed Teste');
    mmTX2.Lines.Add('nmCont_30=Contato Teste');
    mmTX2.Lines.Add('telefone_31=1234567897');
    mmTX2.Lines.Add('email_32=email.teste@gmail.com');
    mmTX2.Lines.Add('SALVARSOFTHOUSE_27');
{
    mmTX2.Lines.Add('ideEFR_34=');//S - É EFR; N - Não é EFR. Essa informação é validada no cadastro do CNPJ na RFB.
    mmTX2.Lines.Add('cnpjEFR_35=');//CNPJ do Ente Federativo Responsável - EFR Preenchimento obrigatório se [ideEFR] = [N]. Informação validada no cadastro do CNPJ da RFB.
}
    mmTX2.Lines.Add('SALVARR1000');
end;

procedure TfrmReinfPrincipal.sbGerarTX2Click(Sender: TObject);
begin
  try
    mmTX2.Clear;
    PreencherTX2('1.0', '01');

    pcProcessos.ActivePage := tsTX2;
  finally
  end;
end;

procedure TfrmReinfPrincipal.sbGerarXMLClick(Sender: TObject);
begin
  try
    mmXml.Text := vReinf.GerarXMLporTx2(mmTX2.Text);

    pcProcessos.ActivePage := tsXML;
  except
    on e : exception do
     showmessage('Ocorreu o seguinte erro: '+ e.message);
  end;

end;

procedure TfrmReinfPrincipal.sbAssinarClick(Sender: TObject);
begin
  try
    mmXMLAssinado.Text := vReinf.AssinarEvento(mmXml.Text);

    pcProcessos.ActivePage := tsXML;
  except
    on e : exception do
     showmessage('Ocorreu o seguinte erro: '+ e.message);
  end;
end;

procedure TfrmReinfPrincipal.sbEnviarClick(Sender: TObject);
var
  vRetEnvio: IspdReinfRetEnviarLoteEventos;
begin
  try
    vRetEnvio := vReinf.EnviarLoteEventos(mmXMLAssinado.Text);

    mmEnvio.Lines.Clear;
    mmEnvio.Lines.Add('Identificador do Lote: ' + vRetEnvio.IdLote);
    mmEnvio.Lines.Add('Mensagem de Retorno: ' + vRetEnvio.Mensagem);

    edtIDLote.Text := vRetEnvio.IdLote;
    pcProcessos.ActivePage := tsEnvio;

    ShowMessage('Envio feito com sucesso, favor executar a consulta!');

    pcProcessos.ActivePage := tsConsulta;
  except
    on e : exception do
     showmessage('Ocorreu o seguinte erro: '+ e.message);
  end;
end;

procedure TfrmReinfPrincipal.sbLimparClick(Sender: TObject);
begin
  Limpar;

  CarregarDadosReinf;
end;

procedure TfrmReinfPrincipal.Label6Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', PChar('http://sped.rfb.gov.br/estatico/FE/A52DB11609848FF5D567967207254F89AAFF06/Leiautes%20da%20EFD-Reinf%20v2.0%20-%20Anexo%20I%20-%20Tabelas.pdf'), nil, nil, 0);
end;

procedure TfrmReinfPrincipal.sbConsultaLoteClick(Sender: TObject);
begin
  ExecutarConsulta(vReinf.ConsultarLoteEventos(edtIdLote.Text), '### CONSULTA POR ID DO LOTE ###');
end;

procedure TfrmReinfPrincipal.sbConsultarEventoClick(Sender: TObject);
begin
  ExecutarConsulta(vReinf.ConsultarIdEvento(edtIdLote.Text), '### CONSULTA POR ID DO EVENTO ###');
end;

procedure TfrmReinfPrincipal.sbConsultarReciboClick(Sender: TObject);
begin
  ExecutarConsulta(vReinf.ConsultarEventoPorRecibo(edtIdLote.Text), '### CONSULTA POR Nº DO RECIBO ###');
end;

procedure TfrmReinfPrincipal.ExecutarConsulta(pRetConsulta: IspdReinfRetConsultarLote; pTipoConsulta: string; isExclusao: Boolean = False);
var
  vRetConsultaItem: IspdReinfRetConsultarLoteItem;
  vRetConsultaOcorrencia: IspdReinfRetConsultarLoteOcorrencia;
  vRetConsultaOcorrenciaEnvio: IspdReinfRetConsultarLoteOcorrenciaEnvio;
  vRetItemRTomR5011: IspdRTomR5011;
  vRetItemRComlR5011: IspdRComlR5011;
  vRetItemRCPRBR5011: IspdRCPRBR5011;
  vRetItemRPrestR5011: IspdRPrestR5011;
  vRetItemRRecRepADR5011: IspdRRecRepADR5011;
  vRetItemRTomR5001: IspdRTomR5001;
  vRetItemRComlR5001: IspdRComlR5001;
  vRetItemRCPRBR5001: IspdRCPRBR5001;
  vRetItemRPrestR5001: IspdRPrestR5001;
  vRetItemRRecRepADR5001: IspdRRecRepADR5001;
  vRetItemInfoCRTomR5001: IspdInfoCRTomR5001;
  vRetItemRRecEspetDespR5001: IspdRRecEspetDespR5001;
  vRetItemInfoCRTomR5011: IspdInfoCRTomR5011;
  i, j, k: integer;
  MemoAux : TMemo;
begin
  try
    if isExclusao then
      MemoAux := mmRetornoExclusao
    else
      MemoAux := mmConsulta;

    MemoAux.Lines.Clear;
    MemoAux.Lines.Add(pTipoConsulta);

    MemoAux.Lines.Add('Número do Protocolo: ' + pRetConsulta.NumeroProtocolo);
    MemoAux.Lines.Add('Mensagem de Retorno: ' + pRetConsulta.Mensagem);
    MemoAux.Lines.Add('Status do Lote: ' + pRetConsulta.Status);

    for i := 0 to pRetConsulta.Count - 1 do
    begin
      vRetConsultaItem := pRetConsulta.Eventos[i];
      MemoAux.Lines.Add('    Evento: ' + IntToStr(i + 1));
      MemoAux.Lines.Add('    Id Evento: ' + vRetConsultaItem.IdEvento);
      MemoAux.Lines.Add('    Número Recibo: ' + vRetConsultaItem.NumeroRecibo);
      MemoAux.Lines.Add('    Código de Status: ' + vRetConsultaItem.cStat);
      MemoAux.Lines.Add('    Mensagem: ' + vRetConsultaItem.Mensagem);
      MemoAux.Lines.Add('    Status do Evento: ' + vRetConsultaItem.Status);

      if vRetConsultaItem.Count > 0 then
        MemoAux.Lines.Add('####   OCORRÊNCIAS');

      for j := 0 to vRetConsultaItem.Count - 1 do
      begin
        vRetConsultaOcorrencia := vRetConsultaItem.Ocorrencias[j];
        MemoAux.Lines.Add('        Ocorrencia: ' + IntToStr(j + 1));
        MemoAux.Lines.Add('        Código: ' + vRetConsultaOcorrencia.Codigo);
        MemoAux.Lines.Add('        Descrição: ' + vRetConsultaOcorrencia.Descricao);
      end;

{     #################
      Dados de retorno 5001 referente ao envio dos eventos R-2010, R-2020, R-2030, R-2040, R-2050, R-2060 a R-2070 e o R-3010
      #################
      if not vRetConsultaItem.R5001.IsEmpty then
      begin
        MemoAux.Lines.Add('# RETORNO R5001');
        MemoAux.Lines.Add('      PeriodoApuracao: ' + vRetConsultaItem.R5001.PeriodoApuracao);

        MemoAux.Lines.Add('      NrInsc: ' + vRetConsultaItem.R5001.IdeContri.NrInsc);
        MemoAux.Lines.Add('      TpInsc: ' + vRetConsultaItem.R5001.IdeContri.TpInsc);
        MemoAux.Lines.Add('      NrInsc Estabelecimento: ' + vRetConsultaItem.R5001.IdeEstab.NrInsc);
        MemoAux.Lines.Add('      TpInsc Estabelecimento: ' + vRetConsultaItem.R5001.IdeEstab.TpInsc);
        MemoAux.Lines.Add('      NrRecArqBase: ' + vRetConsultaItem.R5001.InfoTotal.NrRecArqBase);

        for j := 0 to vRetConsultaItem.R5001.CountRTom - 1 do
        begin
          vRetItemRTomR5001 := vRetConsultaItem.R5001.RTom[j];
        
          MemoAux.Lines.Add('####  RTom:  ');
          MemoAux.Lines.Add('        CnpjPrestador: ' + vRetItemRTomR5001.CnpjPrestador);
          MemoAux.Lines.Add('        VlrTotalBaseRet: ' + vRetItemRTomR5001.VlrTotalBaseRet);
          MemoAux.Lines.Add('        CNO: ' + vRetItemRTomR5001.CNO);

          for k := 0 to vRetItemRTomR5001.CountInfoCRTom - 1 do
          begin
            vRetItemInfoCRTomR5001 := vRetItemRTomR5001.InfoCRTom[k];

            MemoAux.Lines.Add('####  InfoCRTOM: ');
            MemoAux.Lines.Add('        CRTom: ' + vRetItemInfoCRTomR5001.CRTom);
            MemoAux.Lines.Add('        VlrCRTom: ' + vRetItemInfoCRTomR5001.VlrCRTom);
            MemoAux.Lines.Add('        VlrCRTomSusp: ' + vRetItemInfoCRTomR5001.VlrCRTomSusp);
          end;
        end;

        for j := 0 to vRetConsultaItem.R5001.CountRComl - 1 do
        begin
          vRetItemRComlR5001 := vRetConsultaItem.R5001.RComl[j];
        
          MemoAux.Lines.Add('######  RComl:  ');
          MemoAux.Lines.Add('          CRComl: ' + vRetItemRComlR5001.CRComl);
          MemoAux.Lines.Add('          VlrCRComl: ' + vRetItemRComlR5001.VlrCRComl);
          MemoAux.Lines.Add('          VlrCRComlSusp: ' + vRetItemRComlR5001.VlrCRComlSusp);
        end;

        for j := 0 to vRetConsultaItem.R5001.CountRCPRB - 1 do
        begin
          vRetItemRCPRBR5001 := vRetConsultaItem.R5001.RCPRB[j];

          MemoAux.Lines.Add('####  RCPRB:  ');
          MemoAux.Lines.Add('        CRCPRB: ' + vRetItemRCPRBR5001.CRCPRB);
          MemoAux.Lines.Add('        VlrCRCPRB: ' + vRetItemRCPRBR5001.VlrCRCPRB);
          MemoAux.Lines.Add('        VlrCRCPRBSusp: ' + vRetItemRCPRBR5001.VlrCRCPRBSusp);
        end;

        for j := 0 to vRetConsultaItem.R5001.CountRPrest - 1 do
        begin
          vRetItemRPrestR5001 := vRetConsultaItem.R5001.RPrest[j];
        
          MemoAux.Lines.Add('####  RPrest:  ');
          MemoAux.Lines.Add('        TpInscTomador: ' + vRetItemRPrestR5001.TpInscTomador);
          MemoAux.Lines.Add('        NrInscTomador: ' + vRetItemRPrestR5001.NrInscTomador);
          MemoAux.Lines.Add('        VlrTotalBaseRet: ' + vRetItemRPrestR5001.VlrTotalBaseRet);
          MemoAux.Lines.Add('        VlrTotalRetAdic: ' + vRetItemRPrestR5001.VlrTotalRetAdic);
          MemoAux.Lines.Add('        VlrTotalNRetPrinc: ' + vRetItemRPrestR5001.VlrTotalNRetPrinc);
          MemoAux.Lines.Add('        VlrTotalNRetAdic: ' + vRetItemRPrestR5001.VlrTotalNRetAdic);
          MemoAux.Lines.Add('        VlrTotalRetPrinc: ' + vRetItemRPrestR5001.VlrTotalRetPrinc);

        end;
      
        for j := 0 to vRetConsultaItem.R5001.CountRRecRepAD - 1 do
        begin
          vRetItemRRecRepADR5001 := vRetConsultaItem.R5001.RRecRepAD[j];

          MemoAux.Lines.Add('####  RRecRepAD:  ');
          MemoAux.Lines.Add('        CnpjAssocDesp: ' + vRetItemRRecRepADR5001.CnpjAssocDesp);
          MemoAux.Lines.Add('        VlrTotalRep: ' + vRetItemRRecRepADR5001.VlrTotalRep);
          MemoAux.Lines.Add('        CRRecRepAD: ' + vRetItemRRecRepADR5001.CRRecRepAD);
          MemoAux.Lines.Add('        VlrCRRecRepAD: ' + vRetItemRRecRepADR5001.VlrCRRecRepAD);
          MemoAux.Lines.Add('        VlrCRRecRepADSusp: ' + vRetItemRRecRepADR5001.VlrCRRecRepADSusp);
        end;

        for j := 0 to vRetConsultaItem.R5001.CountRRecEspetDesp - 1 do
        begin
          vRetItemRRecEspetDespR5001 := vRetConsultaItem.R5001.RRecEspetDesp[j];

          MemoAux.Lines.Add('####  RRecEspetDesp:  ');
          MemoAux.Lines.Add('        CRRecEspetDesp: ' + vRetItemRRecEspetDespR5001.CRRecEspetDesp);
          MemoAux.Lines.Add('        VlrReceitaTotal: ' + vRetItemRRecEspetDespR5001.VlrReceitaTotal);
          MemoAux.Lines.Add('        VlrCRRecEspetDesp: ' + vRetItemRRecEspetDespR5001.VlrCRRecEspetDesp);
          MemoAux.Lines.Add('        VlrCRRecEspetDespSusp: ' + vRetItemRRecEspetDespR5001.VlrCRRecEspetDespSusp);
        end;
      end;
}

{     #################
      Dados de retorno 5001 referente ao envio do evento R-2099
      #################

      if not vRetConsultaItem.R5011.IsEmpty then
      begin
        for j := 0 to vRetConsultaItem.R5011.CountRTom - 1 do
        begin
          vRetItemRTomR5011 := vRetConsultaItem.R5011.RTom[j];

          MemoAux.Lines.Add('# RETORNO R5011 ');
          MemoAux.Lines.Add('####  RTom:  ');
          MemoAux.Lines.Add('        CnpjPrestador: ' + vRetItemRTomR5011.CnpjPrestador);
          MemoAux.Lines.Add('        VlrTotalBaseRet: ' + vRetItemRTomR5011.VlrTotalBaseRet);
          MemoAux.Lines.Add('        CNO: ' + vRetItemRTomR5011.CNO);

          for k := 0 to vRetItemRTomR5011.CountInfoCRTom - 1 do
          begin
            vRetItemInfoCRTomR5011 := vRetItemRTomR5011.InfoCRTom[k];

            MemoAux.Lines.Add('######  InfoCRTOM: ');
            MemoAux.Lines.Add('          CRTom: ' + vRetItemInfoCRTomR5011.CRTom);
            MemoAux.Lines.Add('          VlrCRTom: ' + vRetItemInfoCRTomR5011.VlrCRTom);
            MemoAux.Lines.Add('          VlrCRTomSusp: ' + vRetItemInfoCRTomR5011.VlrCRTomSusp);
          end;
        end;

        for j := 0 to vRetConsultaItem.R5011.CountRComl - 1 do
        begin
          vRetItemRComlR5011 := vRetConsultaItem.R5011.RComl[j];

          MemoAux.Lines.Add('####  RComl:  ');
          MemoAux.Lines.Add('        CRComl: ' + vRetItemRComlR5011.CRComl);
          MemoAux.Lines.Add('        VlrCRComl: ' + vRetItemRComlR5011.VlrCRComl);
          MemoAux.Lines.Add('        VlrCRComlSusp: ' + vRetItemRComlR5011.VlrCRComlSusp);
        end;

        for j := 0 to vRetConsultaItem.R5011.CountRCPRB - 1 do
        begin
          vRetItemRCPRBR5011 := vRetConsultaItem.R5011.RCPRB[j];

          MemoAux.Lines.Add('####  RCPRB:  ');
          MemoAux.Lines.Add('        CRCPRB: ' + vRetItemRCPRBR5011.CRCPRB);
          MemoAux.Lines.Add('        vlrCRCPRB: ' + vRetItemRCPRBR5011.vlrCRCPRB);
          MemoAux.Lines.Add('        vlrCRCPRBSusp: ' + vRetItemRCPRBR5011.vlrCRCPRBSusp);
        end;

        for j := 0 to vRetConsultaItem.R5011.CountRPrest - 1 do
        begin
          vRetItemRPrestR5011 := vRetConsultaItem.R5011.RPrest[j];

          MemoAux.Lines.Add('####  RPrest:  ');
          MemoAux.Lines.Add('        TpInscTomador: ' + vRetItemRPrestR5011.TpInscTomador);
          MemoAux.Lines.Add('        NrInscTomador: ' + vRetItemRPrestR5011.NrInscTomador);
          MemoAux.Lines.Add('        VlrTotalBaseRet: ' + vRetItemRPrestR5011.VlrTotalBaseRet);
          MemoAux.Lines.Add('        VlrTotalRetPrinc: ' + vRetItemRPrestR5011.VlrTotalRetPrinc);
          MemoAux.Lines.Add('        VlrTotalRetAdic: ' + vRetItemRPrestR5011.VlrTotalRetAdic);
          MemoAux.Lines.Add('        VlrTotalNRetPrinc: ' + vRetItemRPrestR5011.VlrTotalNRetPrinc);
          MemoAux.Lines.Add('        VlrTotalNRetAdic: ' + vRetItemRPrestR5011.VlrTotalNRetAdic);

        end;

        for j := 0 to vRetConsultaItem.R5011.CountRRecRepAD - 1 do
        begin
          vRetItemRRecRepADR5011 := vRetConsultaItem.R5011.RRecRepAD[j];

          MemoAux.Lines.Add('####  RRecRepAD:  ');
          MemoAux.Lines.Add('        CRRecRepAD: ' + vRetItemRRecRepADR5011.CRRecRepAD);
          MemoAux.Lines.Add('        VlrCRRecRepAD: ' + vRetItemRRecRepADR5011.VlrCRRecRepAD);
          MemoAux.Lines.Add('        VlrCRRecRepADSusp: ' + vRetItemRRecRepADR5011.VlrCRRecRepADSusp);
        end;
      end;
}
    end;

    if pRetConsulta.CountOcorrencias > 0 then
      MemoAux.Lines.Add('####  OCORRÊNCIAS DO ENVIO');

    for i := 0 to pRetConsulta.CountOcorrencias - 1 do
    begin
      vRetConsultaOcorrenciaEnvio := pRetConsulta.Ocorrencias[i];
    
      MemoAux.Lines.Add('        Ocorrencia no envio: ' + IntToStr(i + 1));
      MemoAux.Lines.Add('        Código: ' + vRetConsultaOcorrenciaEnvio.Codigo);
      MemoAux.Lines.Add('        Descrição: ' + vRetConsultaOcorrenciaEnvio.Descricao);
    end;

    if not isExclusao then
    begin
      mmXMLRetorno.Lines.Clear;
      mmXMLRetorno.Lines.Add(pRetConsulta.XmlRetorno);

      mmXMLEnvio.Lines.Clear;
      mmXMLEnvio.Lines.Add(pRetConsulta.XmlEnviado);

      pcProcessos.ActivePage := tsConsulta;
    end;
  except
    on e : exception do
     showmessage('Ocorreu o seguinte erro: '+ e.message);
  end;  
end;

procedure TfrmReinfPrincipal.GerarTX2Exclusao;
begin
  mmTX2Exclusao.Clear;
  mmTX2Exclusao.Lines.Add('EXCLUIRR1000');
  mmTX2Exclusao.Lines.Add('tpAmb_4='+ IntToStr(cbAmbiente.ItemIndex + 1));//1 - Produção; 2 - Produção restrita - dados reais;
  mmTX2Exclusao.Lines.Add('procEmi_5=1');//1 - Aplicativo do contribuinte; 2 - Aplicativo governamental
  mmTX2Exclusao.Lines.Add('verProc_6=1.0');//Informar a versão do aplicativo emissor do evento
  mmTX2Exclusao.Lines.Add('tpInsc_8=1');//1 - CNPJ; 2 - CPF;
  mmTX2Exclusao.Lines.Add('nrInsc_9=08187168');//Se [tpInsc_8] for igual a [1], deve ser o número BASE (8 digitos) de CNPJ válido; Se [tpInsc_8] for igual a [2], deve ser um CPF válido;
  mmTX2Exclusao.Lines.Add('iniValid_13=' + FormatDateTime('yyyy-mm',Date));//Deve ser uma data válida, igual ou posterior à data inicial de implantação da EFD-Reinf, no formato AAAA-MM.
//  mmTX2Exclusao.Lines.Add('fimValid_14=');
  mmTX2Exclusao.Lines.Add('SALVARR1000');

  pcProcessos.ActivePage := tsExclusao;
end;

procedure TfrmReinfPrincipal.GerarXMLAssinado;
begin
  try
    mmXMLExclusao.Text := vReinf.GerarXMLporTx2(mmTX2Exclusao.Text);

    mmXMLExclusao.Text := vReinf.AssinarEvento(mmXMLExclusao.Text);
  except
    on e : exception do
     showmessage('Ocorreu o seguinte erro: '+ e.message);
  end;
end;

procedure TfrmReinfPrincipal.EnviarExclusao;
var
  vRetEnvioExclusao: IspdReinfRetEnviarLoteEventos;
begin
  try
    vRetEnvioExclusao := vReinf.EnviarLoteEventos(mmXMLExclusao.Text);

    mmRetornoExclusao.Lines.Clear;
    mmRetornoExclusao.Lines.Add('Identificador do Lote: ' + vRetEnvioExclusao.IdLote);
    mmRetornoExclusao.Lines.Add('Mensagem de Retorno: ' + vRetEnvioExclusao.Mensagem);

    edtIDLote.Text := vRetEnvioExclusao.IdLote;
    
    ExecutarConsulta(vReinf.ConsultarLoteEventos(vRetEnvioExclusao.IdLote), '### CONSULTA DE EXCLUSÃO POR ID DO LOTE ###');
  except
    on e : exception do
     showmessage('Ocorreu o seguinte erro: '+ e.message);
  end;
end;

procedure TfrmReinfPrincipal.sbExcluirClick(Sender: TObject);
begin
  GerarTX2Exclusao;
  GerarXMLAssinado;
  EnviarExclusao;
end;

procedure TfrmReinfPrincipal.SpeedButton1Click(Sender: TObject);
begin
  if Application.MessageBox('Efetuar a limpeza de todo o ambiente de homologação no servidor do Reinf?','Stop',mb_yesno + mb_iconquestion) = id_yes then
  begin
    sbPreencherCompClick(Owner);
    vReinf.Ambiente := akPreProducaoReais;

    PreencherTX2('RemoverContribuinte', '00');

    sbGerarXMLClick(Owner);
    sbAssinarClick(Owner);
    sbEnviarClick(Owner);
  end;
end;

end.

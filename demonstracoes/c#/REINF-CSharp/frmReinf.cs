using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace REINF_CSharp
{
    public partial class frmReinf : Form
    {
        ReinfClientX.spdReinfClientX reinf = new ReinfClientX.spdReinfClientX();

        public frmReinf()
        {
            InitializeComponent();  
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            this.Text = "Reinf - TecnoSpeed - OCX " + reinf.Versao;
            string[] vetor, vetor2;
            tbEmpregador.Text = "08187168";
            tbTemplates.Text = @"C:\Program Files\TecnoSpeed\Reinf\Arquivos\Templates\";
            tbEsquemas.Text = @"C:\Program Files\TecnoSpeed\Reinf\Arquivos\Esquemas\";
            tbCNPJSH.Text = "86837822000147";
            tbTokenSH.Text = "Hmf3xiDgPP6nC90MO7Yy64NhEytKoOVA7AkELTZI";
            vetor = reinf.ListarCertificados("|").Split('|');
            vetor2 = reinf.ListarVersaoManual("|").Split('|');
            cbbCertificado.Items.Clear();
            for (int i = 0; i < vetor.Length; i++)
            {
                cbbCertificado.Items.Add(vetor[i]);
            }
            cbVersao.Items.Clear();
            for (int i = 0; i < vetor2.Length; i++)
            {
                cbVersao.Items.Add(vetor2[i]);
            }
            cbbCertificado.SelectedIndex = 0;
            cbVersao.SelectedIndex = 0;
            cbAmbiente.SelectedIndex = 1;
            rbIdLote.Checked = true;
        }

        private void btnConfigurarSH_Click(object sender, EventArgs e)
        {
            tbRetorno.Clear();
            reinf.ConfigurarSoftwareHouse(tbCNPJSH.Text, tbTokenSH.Text);
            reinf.CpfCnpjEmpregador = tbEmpregador.Text;
            reinf.VersaoManual = cbVersao.Text;
            reinf.DiretorioTemplates = tbTemplates.Text;
            reinf.DiretorioEsquemas = tbEsquemas.Text;
            reinf.NomeCertificado = cbbCertificado.Text;
            if (cbAmbiente.Text == "1 - Produção")
            {
                reinf.Ambiente = ReinfClientX.AmbienteKind.akProducao;
            }
            if (cbAmbiente.Text == "2 - Homologação")
            {
                reinf.Ambiente = ReinfClientX.AmbienteKind.akPreProducaoReais;
            }
            tbRetorno.Text = "Componente Configurado";
        }

        private void btnCarregaTx2_Click(object sender, EventArgs e)
        {
            tbRetorno.Text = "INCLUIRR1000\r\n";
            if (cbAmbiente.Text == "1 - Produção")
            {
                tbRetorno.Text += "tpAmb_4=1\r\n";
            }
            if (cbAmbiente.Text == "2 - Homologação")
            {
                tbRetorno.Text += "tpAmb_4=2\r\n";
            }
            tbRetorno.Text += "procEmi_5=1\r\n";
            tbRetorno.Text += "verProc_6=1.0\r\n";
            tbRetorno.Text += "tpInsc_8=1\r\n";
            tbRetorno.Text += "nrInsc_9=08187168\r\n";
            tbRetorno.Text += "iniValid_13=2017-10\r\n";
            tbRetorno.Text += "fimValid_14=\r\n";
            tbRetorno.Text += "classTrib_16=01\r\n";
            tbRetorno.Text += "indEscrituracao_17=0\r\n";
            tbRetorno.Text += "indDesoneracao_18=0\r\n";
            tbRetorno.Text += "indAcordoIsenMulta_19=0\r\n";
            tbRetorno.Text += "indSitPJ_20=0\r\n";
            tbRetorno.Text += "nmCtt_22=Nome do Contato Teste\r\n";
            tbRetorno.Text += "cpfCtt_23=12345678909\r\n";
            tbRetorno.Text += "foneFixo_24=1123452345\r\n";
            tbRetorno.Text += "foneCel_25=\r\n";
            tbRetorno.Text += "email_26=\r\n";
            tbRetorno.Text += "ideEFR_34=\r\n";
            tbRetorno.Text += "cnpjEFR_35=\r\n";
            tbRetorno.Text += "INCLUIRSOFTHOUSE_27\r\n";
            tbRetorno.Text += "cnpjSoftHouse_28=26764821000198\r\n";
            tbRetorno.Text += "nmRazao_29=Nome Razao Teste\r\n";
            tbRetorno.Text += "nmCont_30=Nome Teste\r\n";
            tbRetorno.Text += "telefone_31=1234567897\r\n";
            tbRetorno.Text += "email_32=eamil.teste@gmail.com\r\n";
            tbRetorno.Text += "SALVARSOFTHOUSE_27\r\n";
            tbRetorno.Text += "SALVARR1000\r\n";
        }

        private void btnAssinar_Click(object sender, EventArgs e)
        {
            tbRetorno.Text = reinf.AssinarEvento(tbRetorno.Text);
        }

        private void btnGerarXML_Click(object sender, EventArgs e)
        {
            tbRetorno.Text = reinf.GerarXMLporTx2(tbRetorno.Text);
        }

        private void btnEnviar_Click(object sender, EventArgs e)
        {
            ReinfClientX.IspdReinfRetEnviarLoteEventos retEnvio;
            retEnvio = reinf.EnviarLoteEventos(tbRetorno.Text);
            tbRetorno.Clear();
            tbRetorno.Text += "Identificador do Lote: " + retEnvio.IdLote + "\r\n";
            tbRetorno.Text += "Mensagem de Retorno: " + retEnvio.Mensagem + "\r\n";

            tbIDLote.Text = retEnvio.IdLote;
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            tbRetorno.Clear();
            tbRetorno.Text = "Enviando Eventos";
            ReinfClientX.IspdReinfRetConsultarLote retConsulta;
            ReinfClientX.IspdReinfRetConsultarLoteItem retConsultaItem;
            ReinfClientX.IspdReinfRetConsultarLoteOcorrencia retConsultaOcorrencia;
            ReinfClientX.IspdReinfRetConsultarLoteOcorrenciaEnvio retConsultaOcorrenciaEnvio;
            ReinfClientX.IspdRTomR5001 RetItemRTomR5001;
            ReinfClientX.IspdRComlR5001 RetItemRComlR5001;
            ReinfClientX.IspdRCPRBR5001 RetItemRCPRBR5001;
            ReinfClientX.IspdRPrestR5001 RetItemRPrestR5001;
            ReinfClientX.IspdRRecRepADR5001 RetItemRRecRepADR5001;
            ReinfClientX.IspdInfoCRTomR5001 RetItemInfoCRTomR5001;
            ReinfClientX.IspdRRecEspetDespR5001 RetItemRRecEspetDespR5001;
            ReinfClientX.IspdRTomR5011 RetItemRTomR5011;
            ReinfClientX.IspdRComlR5011 RetItemRComlR5011;
            ReinfClientX.IspdRCPRBR5011 RetItemRCPRBR5011;
            ReinfClientX.IspdRPrestR5011 RetItemRPrestR5011;
            ReinfClientX.IspdRRecRepADR5011 RetItemRRecRepADR5011;
            ReinfClientX.IspdInfoCRTomR5011 RetItemInfoCRTomR5011;
            retConsulta = null;
            if (rbIdLote.Checked)
            {
                retConsulta = reinf.ConsultarLoteEventos(tbIDLote.Text);
            }else if (rbIdEvento.Checked)
            {
                retConsulta = reinf.ConsultarIdEvento(tbIDLote.Text);
            }else if (rbNrRecibo.Checked)
            {
                retConsulta = reinf.ConsultarEventoPorRecibo(tbIDLote.Text);
            }
            

            tbRetorno.Clear();
            tbRetorno.Text += "Número do Protocolo: " + retConsulta.NumeroProtocolo + "\r\n";
            tbRetorno.Text += "Mensagem do Retorno: " + retConsulta.Mensagem + "\r\n";
            tbRetorno.Text += "Status do Lote: " + retConsulta.Status + "\r\n";

            for (int i = 0; i < retConsulta.Count() ; i++)
            {
                retConsultaItem = retConsulta.Eventos[i];
                tbRetorno.Text += "     Evento: " + i + 1 + "\r\n";
                tbRetorno.Text += "     Id Evento: " + retConsultaItem.IdEvento + "\r\n";
                tbRetorno.Text += "     Número Recibo: " + retConsultaItem.NumeroRecibo + "\r\n";
                tbRetorno.Text += "     Código Status: " + retConsultaItem.Status + "\r\n";
                tbRetorno.Text += "     Mensagem: " + retConsultaItem.Mensagem + "\r\n";
                tbRetorno.Text += "     Status do Evento: " + retConsultaItem.Status + "\r\n";

                for (int j = 0; j < retConsultaItem.Count(); j++)
                {
                    retConsultaOcorrencia = retConsultaItem.Ocorrencias[j];
                    tbRetorno.Text += "          Ocorrencia: " + j + 1 + "\r\n";
                    tbRetorno.Text += "          Código: " + retConsultaOcorrencia.Codigo + "\r\n";
                    tbRetorno.Text += "          Descrição: " + retConsultaOcorrencia.Descricao + "\r\n";
                }

                if (retConsultaItem.R5001.IsEmpty == false)
                {
                    tbRetorno.Text += "     R5001 \r\n";
                    tbRetorno.Text += "     Periodo Apuração: " + retConsultaItem.R5001.PeriodoApuracao + "\r\n";
                    tbRetorno.Text += "     NrInsc: " + retConsultaItem.R5001.IdeEmp.NrInsc + " \r\n";
                    tbRetorno.Text += "     TpInsc" + retConsultaItem.R5001.IdeEmp.TpInsc + " \r\n";
                    tbRetorno.Text += "     NrRecArqBase" + retConsultaItem.R5001.InfoTotal.NrRecArqBase + " \r\n";

                    for (int k = 0; k < retConsultaItem.R5001.CountRTom(); k++)
                    {
                        RetItemRTomR5001 = retConsultaItem.R5001.RTom[k];
                        tbRetorno.Text += "     RTom: \r\n";
                        tbRetorno.Text += "     CnpjPrestador: " + RetItemRTomR5001.CnpjPrestador + " \r\n";
                        tbRetorno.Text += "     VlrTotalBaseRet" + RetItemRTomR5001.VlrTotalBaseRet + " \r\n";
                        tbRetorno.Text += "     CNO" + RetItemRTomR5001.CNO + " \r\n";
                        for (int l = 0; l < RetItemRTomR5001.CountInfoCRTom(); l++)
                        {
                            RetItemInfoCRTomR5001 = RetItemRTomR5001.InfoCRTom[l];
                            tbRetorno.Text += "     InfoCRTom: \r\n";
                            tbRetorno.Text += "     CRTom: " + RetItemInfoCRTomR5001.CRTom + " \r\n";
                            tbRetorno.Text += "     VlrCRTom" + RetItemInfoCRTomR5001.VlrCRTom + " \r\n";
                            tbRetorno.Text += "     VlrCRTomSusp" + RetItemInfoCRTomR5001.VlrCRTomSusp + " \r\n";
                        }
                    }

                    for (int k = 0; k < retConsultaItem.R5001.CountRComl(); k++)
                    {
                        RetItemRComlR5001 = retConsultaItem.R5001.RComl[k];
                        tbRetorno.Text += "     RComl: \r\n";
                        tbRetorno.Text += "     CRComl: " + RetItemRComlR5001.CRComl + " \r\n";
                        tbRetorno.Text += "     VlrCRComl" + RetItemRComlR5001.VlrCRComl + " \r\n";
                        tbRetorno.Text += "     VlrCRComlSusp" + RetItemRComlR5001.VlrCRComlSusp + " \r\n";
                    }
                    for (int k = 0; k < retConsultaItem.R5001.CountRCPRB(); k++)
                    {
                        RetItemRCPRBR5001 = retConsultaItem.R5001.RCPRB[k];
                        tbRetorno.Text += "     RCPRB: \r\n";
                        tbRetorno.Text += "     CRCPRB: " + RetItemRCPRBR5001.CRCPRB + " \r\n";
                        tbRetorno.Text += "     VlrCRCPRB" + RetItemRCPRBR5001.vlrCRCPRB + " \r\n";
                        tbRetorno.Text += "     VlrCRCPRBSusp" + RetItemRCPRBR5001.vlrCRCPRBSusp + " \r\n";
                    }

                    for (int k = 0; k < retConsultaItem.R5001.CountRPrest(); k++)
                    {
                        RetItemRPrestR5001 = retConsultaItem.R5001.RPrest[k];
                        tbRetorno.Text += "     RPrest: \r\n";
                        tbRetorno.Text += "     TpInscTomador: " + RetItemRPrestR5001.TpInscTomador + " \r\n";
                        tbRetorno.Text += "     NrInscTomador" + RetItemRPrestR5001.NrInscTomador + " \r\n";
                        tbRetorno.Text += "     VlrTotalBaseRet" + RetItemRPrestR5001.VlrTotalBaseRet + " \r\n";
                        tbRetorno.Text += "     VlrTotalRetAdic: " + RetItemRPrestR5001.VlrTotalRetAdic + " \r\n";
                        tbRetorno.Text += "     VlrTotalNRetPrinc" + RetItemRPrestR5001.VlrTotalNRetPrinc + " \r\n";
                        tbRetorno.Text += "     VlrTotalNRetAdic" + RetItemRPrestR5001.VlrTotalNRetAdic + " \r\n";
                        tbRetorno.Text += "     VlrTotalRetPrinc" + RetItemRPrestR5001.VlrTotalRetPrinc + " \r\n";
                    }

                    for (int k = 0; k < retConsultaItem.R5001.CountRRecRepAD(); k++)
                    {
                        RetItemRRecRepADR5001 = retConsultaItem.R5001.RRecRepAD[k];
                        tbRetorno.Text += "     RRecRepAD: \r\n";
                        tbRetorno.Text += "     CnpjAssocDesp: " + RetItemRRecRepADR5001.CnpjAssocDesp + " \r\n";
                        tbRetorno.Text += "     VlrTotalRep" + RetItemRRecRepADR5001.VlrTotalRep + " \r\n";
                        tbRetorno.Text += "     CRRecRepAD" + RetItemRRecRepADR5001.CRRecRepAD + " \r\n";
                        tbRetorno.Text += "     VlrCRRecRepAD: " + RetItemRRecRepADR5001.VlrCRRecRepAD + " \r\n";
                        tbRetorno.Text += "     VlrCRRecRepADSusp" + RetItemRRecRepADR5001.VlrCRRecRepADSusp + " \r\n";

                    }

                    for (int k = 0; k < retConsultaItem.R5001.CountRRecEspetDesp(); k++)
                    {
                        RetItemRRecEspetDespR5001 = retConsultaItem.R5001.RRecEspetDesp[k];
                        tbRetorno.Text += "     RRecEspetDesp: \r\n";
                        tbRetorno.Text += "     CRRecEspetDesp: " + RetItemRRecEspetDespR5001.CRRecEspetDesp + " \r\n";
                        tbRetorno.Text += "     VlrReceitaTotal" + RetItemRRecEspetDespR5001.VlrReceitaTotal + " \r\n";
                        tbRetorno.Text += "     VlrCRRecEspetDesp" + RetItemRRecEspetDespR5001.VlrCRRecEspetDesp + " \r\n";
                        tbRetorno.Text += "     VlrCRRecEspetDespSusp: " + RetItemRRecEspetDespR5001.VlrCRRecEspetDespSusp + " \r\n";
                    }
                }

                if (retConsultaItem.R5011.IsEmpty == false)
                {
                    for (int k = 0; k < retConsultaItem.R5011.CountRTom(); k++)
                    {
                        RetItemRTomR5011 = retConsultaItem.R5011.RTom[k];
                        tbRetorno.Text += "      R5011 \r\n";
                        tbRetorno.Text += "      RTom:  \r\n";
                        tbRetorno.Text += "      CnpjPrestador: " + RetItemRTomR5011.CnpjPrestador + "\r\n";
                        tbRetorno.Text += "      VlrTotalBaseRet: " + RetItemRTomR5011.VlrTotalBaseRet + "\r\n";
                        for (int l = 0; l < RetItemRTomR5011.CountInfoCRTom(); l++)
                        {
                            RetItemInfoCRTomR5011 = RetItemRTomR5011.InfoCRTom[l];
                            tbRetorno.Text += "       InfoCRTOM: \r\n";
                            tbRetorno.Text += "        CRTom: " + RetItemInfoCRTomR5011.CRTom + "\r\n";
                            tbRetorno.Text += "        VlrCRTom: " + RetItemInfoCRTomR5011.VlrCRTom + "\r\n";
                            tbRetorno.Text += "        VlrCRTomSusp: " + RetItemInfoCRTomR5011.VlrCRTomSusp + "\r\n";
                        }

                    }
                    for (int k = 0; k < retConsultaItem.R5011.CountRComl(); k++)
                    {
                        RetItemRComlR5011 = retConsultaItem.R5011.RComl[k];
                        tbRetorno.Text += "      R5011 \r\n";
                        tbRetorno.Text += "      RComl:  \r\n";
                        tbRetorno.Text += "      CRComl: " + RetItemRComlR5011.CRComl + "\r\n";
                        tbRetorno.Text += "      VlrCRComl: " + RetItemRComlR5011.VlrCRComl + "\r\n";
                        tbRetorno.Text += "      VlrCRComlSusp: " + RetItemRComlR5011.VlrCRComlSusp + "\r\n";

                    }
                    for (int k = 0; k < retConsultaItem.R5011.CountRCPRB(); k++)
                    {
                        RetItemRCPRBR5011 = retConsultaItem.R5011.RCPRB[k];
                        tbRetorno.Text += "      R5011 \r\n";
                        tbRetorno.Text += "      RCPRB:  \r\n";
                        tbRetorno.Text += "      CRCPRB: " + RetItemRCPRBR5011.CRCPRB + "\r\n";
                        tbRetorno.Text += "      vlrCRCPRB: " + RetItemRCPRBR5011.vlrCRCPRB + "\r\n";
                        tbRetorno.Text += "      vlrCRCPRBSusp: " + RetItemRCPRBR5011.vlrCRCPRBSusp + "\r\n";
                    }
                    for (int k = 0; k < retConsultaItem.R5011.CountRPrest(); k++)
                    {
                        RetItemRPrestR5011 = retConsultaItem.R5011.RPrest[k];
                        tbRetorno.Text += "      R5011 \r\n";
                        tbRetorno.Text += "      RPrest:  \r\n";
                        tbRetorno.Text += "      TpInscTomador: " + RetItemRPrestR5011.TpInscTomador + "\r\n";
                        tbRetorno.Text += "      NrInscTomador: " + RetItemRPrestR5011.NrInscTomador + "\r\n";
                        tbRetorno.Text += "      VlrTotalBaseRet: " + RetItemRPrestR5011.VlrTotalBaseRet + "\r\n";
                        tbRetorno.Text += "      VlrTotalRetAdic: " + RetItemRPrestR5011.VlrTotalRetAdic + "\r\n";
                        tbRetorno.Text += "      VlrTotalNRetPrinc: " + RetItemRPrestR5011.VlrTotalNRetPrinc + "\r\n";
                        tbRetorno.Text += "      VlrTotalNRetAdic: " + RetItemRPrestR5011.VlrTotalNRetAdic + "\r\n";
                        tbRetorno.Text += "      VlrTotalRetPrinc: " + RetItemRPrestR5011.VlrTotalRetPrinc + "\r\n";

                    }
                    for (int k = 0; k < retConsultaItem.R5011.CountRRecRepAD(); k++)
                    {
                        RetItemRRecRepADR5011 = retConsultaItem.R5011.RRecRepAD[k];
                        tbRetorno.Text += "      R5011 \r\n";
                        tbRetorno.Text += "      RRecRepAD:  \r\n";
                        tbRetorno.Text += "      CRRecRepAD: " + RetItemRRecRepADR5011.CRRecRepAD + "\r\n";
                        tbRetorno.Text += "      VlrCRRecRepAD: " + RetItemRRecRepADR5011.VlrCRRecRepAD + "\r\n";
                        tbRetorno.Text += "      VlrCRRecRepADSusp: " + RetItemRRecRepADR5011.VlrCRRecRepADSusp + "\r\n";
                    }

                }


            }
            for (int i = 0; i < retConsulta.CountOcorrencias(); i++)
            {
                retConsultaOcorrenciaEnvio = retConsulta.Ocorrencias[i];
                tbRetorno.Text += "          Ocorrencia de envio: " + i + 1 + "\r\n";
                tbRetorno.Text += "          Código: " + retConsultaOcorrenciaEnvio.Codigo + "\r\n";
                tbRetorno.Text += "          Descrição: " + retConsultaOcorrenciaEnvio.Descricao + "\r\n";
            }
            tbXmlEnvio.Text = retConsulta.XmlEnviado;
            tbXmlRetorno.Text = retConsulta.XmlRetorno;

        }
    }
}

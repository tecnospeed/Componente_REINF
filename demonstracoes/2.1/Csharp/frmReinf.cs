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

        public void CarregarConfiguracao()
        {
            reinf.ConfigurarSoftwareHouse(tbCNPJSH.Text, tbTokenSH.Text);  
        }

        private void Form1_Load(object sender, EventArgs e)
        {
 
        }

        private void btnConfigurarSH_Click(object sender, EventArgs e)
        {
            CarregarConfiguracao();
            this.Text = "Reinf - TecnoSpeed - OCX " + reinf.Versao;

            string[] vetor, vetor2;
            vetor2 = reinf.ListarVersaoManual("|").Split('|');

            cbbCertificado.Items.Clear();
      
            cbVersao.Items.Clear();
            for (int i = 0; i < vetor2.Length; i++)
            {
                cbVersao.Items.Add(vetor2[i]);
            }
           // cbVersao.SelectedIndex = 0;
            vetor = reinf.ListarCertificados("|").Split('|');
            cbbCertificado.Items.Clear();
            for (int i = 0; i < vetor.Length; i++)
            {
                cbbCertificado.Items.Add(vetor[i]);
            }

            // cbbCertificado.SelectedIndex = 4;
            cbVersao.SelectedIndex = 3;
            cbAmbiente.SelectedIndex = 1;
            rbIdLote.Checked = true;

            CarregarConfiguracao();
            //string[] vetor;
            vetor = reinf.ListarCertificados("|").Split('|');
            cbbCertificado.Items.Clear();
            for (int i = 0; i < vetor.Length; i++)
            {
                cbbCertificado.Items.Add(vetor[i]);
            }



            reinf.DiretorioTemplates = tbTemplates.Text;
            reinf.DiretorioEsquemas = tbEsquemas.Text;
            reinf.CpfCnpjEmpregador = tbEmpregador.Text;
            reinf.NomeCertificado = cbbCertificado.Text;
            reinf.VersaoManual = cbVersao.Text;


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

            //R9001
            ReinfClientX.IspdRTomR9001 RetItemRTomR9001;
            ReinfClientX.IspdRComlR9001 RetItemRComlR9001;
            ReinfClientX.IspdRCPRBR9001 RetItemRCPRBR9001;
            ReinfClientX.IspdRPrestR9001 RetItemRPrestR9001;
            ReinfClientX.IspdRRecRepADR9001 RetItemRRecRepADR9001;
            ReinfClientX.IspdInfoCRTomR9001 RetItemInfoCRTomR9001;
            ReinfClientX.IspdRRecEspetDespR9001 RetItemRRecEspetDespR9001;

            //R9011
            ReinfClientX.IspdRTomR9011 RetItemRTomR9011;
            ReinfClientX.IspdRComlR9011 RetItemRComlR9011;
            ReinfClientX.IspdRCPRBR9011 RetItemRCPRBR9011;
            ReinfClientX.IspdRPrestR9011 RetItemRPrestR9011;
            ReinfClientX.IspdRRecRepADR9011 RetItemRRecRepADR9011;
            ReinfClientX.IspdInfoCRTomR9011 RetItemInfoCRTomR9011;

            //R9005
            ReinfClientX.IspdTotApurSemR9005 RetItemTotApurSemR9005;
            ReinfClientX.IspdTotApurTribSemR9005 RetItemTotApurTribSemR9005;
            ReinfClientX.IspdTotApurQuiR9005 RetItemTotApurQuiR9005;
            ReinfClientX.IspdTotApurTribQuiR9005 RetItemTotApurTribQuiR9005;
            ReinfClientX.IspdTotApurMenR9005 RetItemTotApurMenR9005;
            ReinfClientX.IspdTotApurTribMenR9005 RetItemTotApurTribMenR9005;
            ReinfClientX.IspdTotApurDiaR9005 RetItemTotApurDiaR9005;
            ReinfClientX.IspdTotApurTribDiaR9005 RetItemTotApurTribDiaR9005;
            ReinfClientX.IspdTotApurDecR9005 RetItemTotApurDecR9005;
           // ReinfClientX.IspdTotApurTribDecR9005 RetItemTotApurTribDecR9005;


            //R9015
            ReinfClientX.IspdInfoCR_CNRR9015 RetItemInfoCR_CNRR9015;
            ReinfClientX.IspdTotApurSemR9015 RetItemTotApurSemR9015;
            ReinfClientX.IspdTotApurQuiR9015 RetItemTotApurQuiR9015;
            ReinfClientX.IspdTotApurMenR9015 RetItemTotApurMenR9015;
            ReinfClientX.IspdTotApurDiaR9015 RetItemTotApurDiaR9015;
            ReinfClientX.IspdTotApurDecR9015 RetItemTotApurDecR9015;
            ReinfClientX.IspdInfoTotalCRR9015 RetItemInfoTotalCR9015;
            ReinfClientX.IspdInfoTotalCR_TotApurSemR9015 RetItemInfoTotalCR_TotApurSemR9015;
            ReinfClientX.IspdInfoTotalCR_TotApurQuiR9015 RetItemInfoTotalCR_TotApurQuiR9015;
            ReinfClientX.IspdInfoTotalCR_TotApurMenR9015 RetItemInfoTotalCR_TotApurMenR9015;
            ReinfClientX.IspdInfoTotalCR_TotApurDiaR9015 RetItemInfoTotalCR_TotApurDiaR9015;
            ReinfClientX.IspdInfoTotalCR_TotApurDecR9015 RetItemInfoTotalCR_TotApurDecR9015;



            retConsulta = null;
            if (rbIdLote.Checked)
            {
                retConsulta = reinf.ConsultarLoteEventos(tbIDLote.Text);
            } else if (rbIdEvento.Checked)
            {
                retConsulta = reinf.ConsultarIdEvento(tbIDLote.Text);
            } else if (rbNrRecibo.Checked)
            {
                retConsulta = reinf.ConsultarEventoPorRecibo(tbIDLote.Text);
            }


            tbRetorno.Clear();
            tbRetorno.Text += "Número do Protocolo: " + retConsulta.NumeroProtocolo + "\r\n";
            tbRetorno.Text += "Mensagem do Retorno: " + retConsulta.Mensagem + "\r\n";
            tbRetorno.Text += "Status do Lote: " + retConsulta.Status + "\r\n";
            tbRetorno.Text += "Id do Lote: " + retConsulta.Id + "\r\n";
            for (int i = 0; i < retConsulta.Count(); i++)
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

                //R9001

                if (retConsultaItem.R9001.IsEmpty == false)
                {
                    tbRetorno.Text += "     R9001 \r\n";
                    tbRetorno.Text += "     Periodo Apuração: " + retConsultaItem.R9001.PeriodoApuracao + "\r\n";
                    tbRetorno.Text += "     NrInsc: " + retConsultaItem.R9001.IdeEstab.NrInsc + " \r\n";
                    tbRetorno.Text += "     TpInsc" + retConsultaItem.R9001.IdeEstab.TpInsc + " \r\n";
                    tbRetorno.Text += "     NrRecArqBase" + retConsultaItem.R9001.InfoTotal.NrRecArqBase + " \r\n";

                    for (int k = 0; k < retConsultaItem.R9001.CountRTom(); k++)
                    {
                        RetItemRTomR9001 = retConsultaItem.R9001.RTom[k];
                        tbRetorno.Text += "     RTom: \r\n";
                        tbRetorno.Text += "     CnpjPrestador: " + RetItemRTomR9001.CnpjPrestador + " \r\n";
                        tbRetorno.Text += "     VlrTotalBaseRet" + RetItemRTomR9001.VlrTotalBaseRet + " \r\n";
                        tbRetorno.Text += "     CNO" + RetItemRTomR9001.CNO + " \r\n";
                        for (int l = 0; l < RetItemRTomR9001.CountInfoCRTom(); l++)
                        {
                            RetItemInfoCRTomR9001 = RetItemRTomR9001.InfoCRTom[l];
                            tbRetorno.Text += "     InfoCRTom: \r\n";
                            tbRetorno.Text += "     CRTom: " + RetItemInfoCRTomR9001.CRTom + " \r\n";
                            tbRetorno.Text += "     VlrCRTom" + RetItemInfoCRTomR9001.VlrCRTom + " \r\n";
                            tbRetorno.Text += "     VlrCRTomSusp" + RetItemInfoCRTomR9001.VlrCRTomSusp + " \r\n";
                        }
                    }

                    for (int k = 0; k < retConsultaItem.R9001.CountRComl(); k++)
                    {
                        RetItemRComlR9001 = retConsultaItem.R9001.RComl[k];
                        tbRetorno.Text += "     RComl: \r\n";
                        tbRetorno.Text += "     CRComl: " + RetItemRComlR9001.CRComl + " \r\n";
                        tbRetorno.Text += "     VlrCRComl" + RetItemRComlR9001.VlrCRComl + " \r\n";
                        tbRetorno.Text += "     VlrCRComlSusp" + RetItemRComlR9001.VlrCRComlSusp + " \r\n";
                    }
                    for (int k = 0; k < retConsultaItem.R9001.CountRCPRB(); k++)
                    {
                        RetItemRCPRBR9001 = retConsultaItem.R9001.RCPRB[k];
                        tbRetorno.Text += "     RCPRB: \r\n";
                        tbRetorno.Text += "     CRCPRB: " + RetItemRCPRBR9001.CRCPRB + " \r\n";
                        tbRetorno.Text += "     VlrCRCPRB" + RetItemRCPRBR9001.vlrCRCPRB + " \r\n";
                        tbRetorno.Text += "     VlrCRCPRBSusp" + RetItemRCPRBR9001.vlrCRCPRBSusp + " \r\n";
                    }

                    for (int k = 0; k < retConsultaItem.R9001.CountRPrest(); k++)
                    {
                        RetItemRPrestR9001 = retConsultaItem.R9001.RPrest[k];
                        tbRetorno.Text += "     RPrest: \r\n";
                        tbRetorno.Text += "     TpInscTomador: " + RetItemRPrestR9001.TpInscTomador + " \r\n";
                        tbRetorno.Text += "     NrInscTomador" + RetItemRPrestR9001.NrInscTomador + " \r\n";
                        tbRetorno.Text += "     VlrTotalBaseRet" + RetItemRPrestR9001.VlrTotalBaseRet + " \r\n";
                        tbRetorno.Text += "     VlrTotalRetAdic: " + RetItemRPrestR9001.VlrTotalRetAdic + " \r\n";
                        tbRetorno.Text += "     VlrTotalNRetPrinc" + RetItemRPrestR9001.VlrTotalNRetPrinc + " \r\n";
                        tbRetorno.Text += "     VlrTotalNRetAdic" + RetItemRPrestR9001.VlrTotalNRetAdic + " \r\n";
                        tbRetorno.Text += "     VlrTotalRetPrinc" + RetItemRPrestR9001.VlrTotalRetPrinc + " \r\n";
                    }

                    for (int k = 0; k < retConsultaItem.R9001.CountRRecRepAD(); k++)
                    {
                        RetItemRRecRepADR9001 = retConsultaItem.R9001.RRecRepAD[k];
                        tbRetorno.Text += "     RRecRepAD: \r\n";
                        tbRetorno.Text += "     CnpjAssocDesp: " + RetItemRRecRepADR9001.CnpjAssocDesp + " \r\n";
                        tbRetorno.Text += "     VlrTotalRep" + RetItemRRecRepADR9001.VlrTotalRep + " \r\n";
                        tbRetorno.Text += "     CRRecRepAD" + RetItemRRecRepADR9001.CRRecRepAD + " \r\n";
                        tbRetorno.Text += "     VlrCRRecRepAD: " + RetItemRRecRepADR9001.VlrCRRecRepAD + " \r\n";
                        tbRetorno.Text += "     VlrCRRecRepADSusp" + RetItemRRecRepADR9001.VlrCRRecRepADSusp + " \r\n";

                    }

                    for (int k = 0; k < retConsultaItem.R9001.CountRRecEspetDesp(); k++)
                    {
                        RetItemRRecEspetDespR9001 = retConsultaItem.R9001.RRecEspetDesp[k];
                        tbRetorno.Text += "     RRecEspetDesp: \r\n";
                        tbRetorno.Text += "     CRRecEspetDesp: " + RetItemRRecEspetDespR9001.CRRecEspetDesp + " \r\n";
                        tbRetorno.Text += "     VlrReceitaTotal" + RetItemRRecEspetDespR9001.VlrReceitaTotal + " \r\n";
                        tbRetorno.Text += "     VlrCRRecEspetDesp" + RetItemRRecEspetDespR9001.VlrCRRecEspetDesp + " \r\n";
                        tbRetorno.Text += "     VlrCRRecEspetDespSusp: " + RetItemRRecEspetDespR9001.VlrCRRecEspetDespSusp + " \r\n";
                    }
                }
                // R9011
                if (retConsultaItem.R9011.IsEmpty == false)
                {
                    for (int k = 0; k < retConsultaItem.R9011.CountRTom(); k++)
                    {
                        RetItemRTomR9011 = retConsultaItem.R9011.RTom[k];
                        tbRetorno.Text += "      R9011 \r\n";
                        tbRetorno.Text += "      RTom:  \r\n";
                        tbRetorno.Text += "      CnpjPrestador: " + RetItemRTomR9011.CnpjPrestador + "\r\n";
                        tbRetorno.Text += "      VlrTotalBaseRet: " + RetItemRTomR9011.VlrTotalBaseRet + "\r\n";
                        for (int l = 0; l < RetItemRTomR9011.CountInfoCRTom(); l++)
                        {
                            RetItemInfoCRTomR9011 = RetItemRTomR9011.InfoCRTom[l];
                            tbRetorno.Text += "       InfoCRTOM: \r\n";
                            tbRetorno.Text += "        CRTom: " + RetItemInfoCRTomR9011.CRTom + "\r\n";
                            tbRetorno.Text += "        VlrCRTom: " + RetItemInfoCRTomR9011.VlrCRTom + "\r\n";
                            tbRetorno.Text += "        VlrCRTomSusp: " + RetItemInfoCRTomR9011.VlrCRTomSusp + "\r\n";
                        }

                    }
                    for (int k = 0; k < retConsultaItem.R9011.CountRComl(); k++)
                    {
                        RetItemRComlR9011 = retConsultaItem.R9011.RComl[k];
                        tbRetorno.Text += "      R9011 \r\n";
                        tbRetorno.Text += "      RComl:  \r\n";
                        tbRetorno.Text += "      CRComl: " + RetItemRComlR9011.CRComl + "\r\n";
                        tbRetorno.Text += "      VlrCRComl: " + RetItemRComlR9011.VlrCRComl + "\r\n";
                        tbRetorno.Text += "      VlrCRComlSusp: " + RetItemRComlR9011.VlrCRComlSusp + "\r\n";

                    }
                    for (int k = 0; k < retConsultaItem.R9011.CountRCPRB(); k++)
                    {
                        RetItemRCPRBR9011 = retConsultaItem.R9011.RCPRB[k];
                        tbRetorno.Text += "      R9011 \r\n";
                        tbRetorno.Text += "      RCPRB:  \r\n";
                        tbRetorno.Text += "      CRCPRB: " + RetItemRCPRBR9011.CRCPRB + "\r\n";
                        tbRetorno.Text += "      vlrCRCPRB: " + RetItemRCPRBR9011.vlrCRCPRB + "\r\n";
                        tbRetorno.Text += "      vlrCRCPRBSusp: " + RetItemRCPRBR9011.vlrCRCPRBSusp + "\r\n";
                    }
                    for (int k = 0; k < retConsultaItem.R9011.CountRPrest(); k++)
                    {
                        RetItemRPrestR9011 = retConsultaItem.R9011.RPrest[k];
                        tbRetorno.Text += "      R9011 \r\n";
                        tbRetorno.Text += "      RPrest:  \r\n";
                        tbRetorno.Text += "      TpInscTomador: " + RetItemRPrestR9011.TpInscTomador + "\r\n";
                        tbRetorno.Text += "      NrInscTomador: " + RetItemRPrestR9011.NrInscTomador + "\r\n";
                        tbRetorno.Text += "      VlrTotalBaseRet: " + RetItemRPrestR9011.VlrTotalBaseRet + "\r\n";
                        tbRetorno.Text += "      VlrTotalRetAdic: " + RetItemRPrestR9011.VlrTotalRetAdic + "\r\n";
                        tbRetorno.Text += "      VlrTotalNRetPrinc: " + RetItemRPrestR9011.VlrTotalNRetPrinc + "\r\n";
                        tbRetorno.Text += "      VlrTotalNRetAdic: " + RetItemRPrestR9011.VlrTotalNRetAdic + "\r\n";
                        tbRetorno.Text += "      VlrTotalRetPrinc: " + RetItemRPrestR9011.VlrTotalRetPrinc + "\r\n";

                    }
                    for (int k = 0; k < retConsultaItem.R9011.CountRRecRepAD(); k++)
                    {
                        RetItemRRecRepADR9011 = retConsultaItem.R9011.RRecRepAD[k];
                        tbRetorno.Text += "      R9011 \r\n";
                        tbRetorno.Text += "      RRecRepAD:  \r\n";
                        tbRetorno.Text += "      CRRecRepAD: " + RetItemRRecRepADR9011.CRRecRepAD + "\r\n";
                        tbRetorno.Text += "      VlrCRRecRepAD: " + RetItemRRecRepADR9011.VlrCRRecRepAD + "\r\n";
                        tbRetorno.Text += "      VlrCRRecRepADSusp: " + RetItemRRecRepADR9011.VlrCRRecRepADSusp + "\r\n";
                    }

                }

                //R9005
                if (retConsultaItem.R9005.IsEmpty == false)
                {
                    tbRetorno.Text += "        R9005 \r\n";
                    tbRetorno.Text += "        PeriodoApuracao" + retConsultaItem.R9005.PeriodoApuracao + "\r\n";
                    tbRetorno.Text += "        NrInsc" + retConsultaItem.R9005.IdeContri.NrInsc + "\r\n";
                    tbRetorno.Text += "        TpInsc: " + retConsultaItem.R9005.IdeContri.TpInsc + "\r\n";
                    tbRetorno.Text += "        NrInsc Estabelecimento: " + retConsultaItem.R9005.IdeEstab.NrInsc + "\r\n";
                    tbRetorno.Text += "        TpInsc Estabelecimento: " + retConsultaItem.R9005.IdeEstab.TpInsc + "\r\n";
                    tbRetorno.Text += "        ideEvtAdic: " + retConsultaItem.R9005.IdeEstab.ideEvtAdic + "\r\n";
                    tbRetorno.Text += "        NrRecArqBase: " + retConsultaItem.R9005.InfoTotal.NrRecArqBase + "\r\n";
                }

                //TotApurSem
                for (int k = 0; k < retConsultaItem.R9005.CountTotApurSem(); k++)
                {
                    RetItemTotApurSemR9005 = retConsultaItem.R9005.TotApurSem[k];
                    tbRetorno.Text += "          totApurSem \r\n";
                    tbRetorno.Text += "          vlrBaseCRSemSusp: " + RetItemTotApurSemR9005.VlrBaseCRSemSusp + "\r\n";
                    tbRetorno.Text += "          natRend: " + RetItemTotApurSemR9005.NatRend + "\r\n";
                    tbRetorno.Text += "          vlrBaseCRSem: " + RetItemTotApurSemR9005.VlrBaseCRSem + "\r\n";
                    tbRetorno.Text += "          perApurSem: " + RetItemTotApurSemR9005.PerApurSem + "\r\n";
                    tbRetorno.Text += "          CRSem: " + RetItemTotApurSemR9005.CRSem + "\r\n";

                    RetItemTotApurTribSemR9005 = RetItemTotApurSemR9005.TotApurTribSem;
                    tbRetorno.Text += "          totApurTribSem \r\n";
                    tbRetorno.Text += "           vlrCRSemSuspInf: " + RetItemTotApurTribSemR9005.VlrCRSemSuspInf + "\r\n";
                    tbRetorno.Text += "           vlrCRSemCalc: " + RetItemTotApurTribSemR9005.VlrCRSemCalc + "\r\n";
                    tbRetorno.Text += "           vlrCRSemInf: " + RetItemTotApurTribSemR9005.VlrCRSemInf + "\r\n";
                    tbRetorno.Text += "           vlrCRSemSuspCalc: " + RetItemTotApurTribSemR9005.VlrCRSemSuspCalc + "\r\n";
                }
                //TotApurQui
                for (int k = 0; k < retConsultaItem.R9005.CountTotApurQui(); k++)
                {
                    RetItemTotApurQuiR9005 = retConsultaItem.R9005.TotApurQui[k];
                    tbRetorno.Text += "          TotApurQui \r\n";
                    tbRetorno.Text += "          NatRend: " + RetItemTotApurQuiR9005.NatRend + "\r\n";
                    tbRetorno.Text += "          vlrBaseCRQuiSusp: " + RetItemTotApurQuiR9005.VlrBaseCRQuiSusp + "\r\n";
                    tbRetorno.Text += "          vlrBaseCRQui: " + RetItemTotApurQuiR9005.VlrBaseCRQui + "\r\n";
                    tbRetorno.Text += "          perApurQui: " + RetItemTotApurQuiR9005.PerApurQui + "\r\n";
                    tbRetorno.Text += "          CRQui: " + RetItemTotApurQuiR9005.CRQui + "\r\n";

                    RetItemTotApurTribQuiR9005 = RetItemTotApurQuiR9005.TotApurTribQui;
                    tbRetorno.Text += "           totApurTribQui \r\n";
                    tbRetorno.Text += "           vlrCRQuiSuspCalc: " + RetItemTotApurTribQuiR9005.VlrCRQuiSuspCalc + "\r\n";
                    tbRetorno.Text += "           vlrCRQuiInf: " + RetItemTotApurTribQuiR9005.VlrCRQuiInf + "\r\n";
                    tbRetorno.Text += "           vlrCRQuiSuspInf: " + RetItemTotApurTribQuiR9005.VlrCRQuiSuspInf + "\r\n";
                    tbRetorno.Text += "           vlrCRQuiCalc: " + RetItemTotApurTribQuiR9005.VlrCRQuiCalc + "\r\n";

                }
                //TotApurMen
                for (int k = 0; k < retConsultaItem.R9005.CountTotApurMen(); k++)
                {
                    RetItemTotApurMenR9005 = retConsultaItem.R9005.TotApurMen[k];
                    tbRetorno.Text += "          TotApurMen \r\n";
                    tbRetorno.Text += "          NatRend: " + RetItemTotApurMenR9005.NatRend + "\r\n";
                    tbRetorno.Text += "          vlrBaseCRMen: " + RetItemTotApurMenR9005.VlrBaseCRMen + "\r\n";
                    tbRetorno.Text += "          vlrBaseCRMenSusp: " + RetItemTotApurMenR9005.VlrBaseCRMenSusp + "\r\n";
                    tbRetorno.Text += "          CRMen: " + RetItemTotApurMenR9005.CRMen + "\r\n";

                    RetItemTotApurTribMenR9005 = RetItemTotApurMenR9005.TotApurTribMen;
                    tbRetorno.Text += "           totApurTribMen \r\n";
                    tbRetorno.Text += "           vlrCRMenCalc: " + RetItemTotApurTribMenR9005.VlrCRMenCalc + "\r\n";
                    tbRetorno.Text += "           vlrCRMenSuspCalc: " + RetItemTotApurTribMenR9005.VlrCRMenSuspCalc + "\r\n";
                    tbRetorno.Text += "           vlrCRMenInf: " + RetItemTotApurTribMenR9005.VlrCRMenInf + "\r\n";
                    tbRetorno.Text += "           vlrCRMenSuspInf: " + RetItemTotApurTribMenR9005.VlrCRMenSuspInf + "\r\n";
                }

                //TotApurDia
                for (int k = 0; k < retConsultaItem.R9005.CountTotApurDia(); k++)
                {
                    RetItemTotApurDiaR9005 = retConsultaItem.R9005.TotApurDia[k];
                    tbRetorno.Text += "          totApurDia \r\n";
                    tbRetorno.Text += "          NatRend: " + RetItemTotApurDiaR9005.NatRend + "\r\n";
                    tbRetorno.Text += "          vlrBaseCRDia: " + RetItemTotApurDiaR9005.VlrBaseCRDia + "\r\n";
                    tbRetorno.Text += "          perApurDia: " + RetItemTotApurDiaR9005.PerApurDia + "\r\n";
                    tbRetorno.Text += "          CRDia: " + RetItemTotApurDiaR9005.CRDia + "\r\n";
                    tbRetorno.Text += "          vlrBaseCRDiaSusp: " + RetItemTotApurDiaR9005.VlrBaseCRDiaSusp + "\r\n";


                    RetItemTotApurTribDiaR9005 = RetItemTotApurDiaR9005.TotApurTribDia;
                    tbRetorno.Text += "           totApurTribDia \r\n";
                    tbRetorno.Text += "           vlrCRDiaInf: " + RetItemTotApurTribDiaR9005.VlrCRDiaInf + "\r\n";
                    tbRetorno.Text += "           VlrCRDiaCalc: " + RetItemTotApurTribDiaR9005.VlrCRDiaCalc + "\r\n";
                    tbRetorno.Text += "           VlrCRDiaSuspCalc: " + RetItemTotApurTribDiaR9005.VlrCRDiaSuspCalc + "\r\n";
                    tbRetorno.Text += "           vlrCRDiaSuspInf: " + RetItemTotApurTribDiaR9005.VlrCRDiaSuspInf + "\r\n";
                }
                //TotApurDec
                for (int k = 0; k < retConsultaItem.R9005.CountTotApurDec(); k++)
                {
                    RetItemTotApurDecR9005 = retConsultaItem.R9005.TotApurDec[k];
                    tbRetorno.Text += "          totApurDec \r\n";
                    tbRetorno.Text += "          vlrBaseCRDecSusp: " + RetItemTotApurDecR9005.VlrBaseCRDecSusp + "\r\n";
                    tbRetorno.Text += "          natRend: " + RetItemTotApurDecR9005.NatRend + "\r\n";
                    tbRetorno.Text += "          vlrBaseCRDec: " + RetItemTotApurDecR9005.VlrBaseCRDec + "\r\n";
                    tbRetorno.Text += "          perApurDec: " + RetItemTotApurDecR9005.PerApurDec + "\r\n";
                    tbRetorno.Text += "          CRDec: " + RetItemTotApurDecR9005.CRDec + "\r\n";

                }

                //R9015
                if (retConsultaItem.R9015.IsEmpty == false)
                {
                    tbRetorno.Text += "        R9015 \r\n";
                    tbRetorno.Text += "        PeriodoApuracao" + retConsultaItem.R9015.PeriodoApuracao + "\r\n";

                    for (int k = 0; k < retConsultaItem.R9015.CountInfoCR_CNR(); k++)
                    {
                        RetItemInfoCR_CNRR9015 = retConsultaItem.R9015.InfoCR_CNR[k];
                        tbRetorno.Text += "        infoCR_CNR \r\n";
                        tbRetorno.Text += "        NrRecArqBase" + RetItemInfoCR_CNRR9015.NrRecArqBase + "\r\n";
                        tbRetorno.Text += "        IndExistInfo" + RetItemInfoCR_CNRR9015.IndExistInfo + "\r\n";
                        tbRetorno.Text += "        IdentEscritDCTF" + RetItemInfoCR_CNRR9015.IdentEscritDCTF + "\r\n";

                        for (int l = 0; l < RetItemInfoCR_CNRR9015.CountTotApurSem(); l++)
                        {
                            RetItemTotApurSemR9015 = RetItemInfoCR_CNRR9015.TotApurSem[l];
                            tbRetorno.Text += "          totApurSem:\r\n";
                            tbRetorno.Text += "          natRend: " + RetItemTotApurSemR9015.NatRend + "\r\n";
                            tbRetorno.Text += "          vlrCRSemSuspInf: " + RetItemTotApurSemR9015.VlrCRSemSuspInf + "\r\n";
                            tbRetorno.Text += "          vlrCRSemDCTF: " + RetItemTotApurSemR9015.VlrCRSemDCTF + "\r\n";
                            tbRetorno.Text += "          vlrCRSemCalc: " + RetItemTotApurSemR9015.VlrCRSemCalc + "\r\n";
                            tbRetorno.Text += "          vlrCRSemInf: " + RetItemTotApurSemR9015.VlrCRSemInf + "\r\n";
                            tbRetorno.Text += "          vlrCRSemSuspDCTF: " + RetItemTotApurSemR9015.VlrCRSemSuspDCTF + "\r\n";
                            tbRetorno.Text += "          vlrCRSemSuspCalc: " + RetItemTotApurSemR9015.VlrCRSemSuspCalc + "\r\n";
                            tbRetorno.Text += "          perApurSem: " + RetItemTotApurSemR9015.PerApurSem + "\r\n";
                            tbRetorno.Text += "          CRSem: " + RetItemTotApurSemR9015.CRSem + "\r\n";
                        }
                        for (int l = 0; l < RetItemInfoCR_CNRR9015.CountTotApurQui(); l++)
                        {
                            RetItemTotApurQuiR9015 = RetItemInfoCR_CNRR9015.TotApurQui[l];
                            tbRetorno.Text += "         totApurQui: \r\n";
                            tbRetorno.Text += "         vlrCRQuisSuspCalc: " + RetItemTotApurQuiR9015.VlrCRQuisSuspCalc + "\r\n";
                            tbRetorno.Text += "         vlrCRQuiSuspDCTF: " + RetItemTotApurQuiR9015.VlrCRQuiSuspDCTF + "\r\n";
                            tbRetorno.Text += "         vlrCRQuiInf: " + RetItemTotApurQuiR9015.VlrCRQuiInf + "\r\n";
                            tbRetorno.Text += "         natRend: " + RetItemTotApurQuiR9015.NatRend + "\r\n";
                            tbRetorno.Text += "         vlrCRQuiSuspInf: " + RetItemTotApurQuiR9015.VlrCRQuiSuspInf + "\r\n";
                            tbRetorno.Text += "         vlrCRQuiDCTF: " + RetItemTotApurQuiR9015.VlrCRQuiDCTF + "\r\n";
                            tbRetorno.Text += "         vlrCRQuiCalc: " + RetItemTotApurQuiR9015.VlrCRQuiCalc + "\r\n";
                            tbRetorno.Text += "         perApurQui: " + RetItemTotApurQuiR9015.PerApurQui + "\r\n";
                            tbRetorno.Text += "         CRQui: " + RetItemTotApurQuiR9015.CRQui + "\r\n";
                        }
                        for (int l = 0; l < RetItemInfoCR_CNRR9015.CountTotApurMen(); l++)
                        {
                            RetItemTotApurMenR9015 = RetItemInfoCR_CNRR9015.TotApurMen[l];
                            tbRetorno.Text += "         totApurMen: \r\n";
                            tbRetorno.Text += "         vlrCRMenDCTF: " + RetItemTotApurMenR9015.VlrCRMenDCTF + "\r\n";
                            tbRetorno.Text += "         vlrCRMenCalc: " + RetItemTotApurMenR9015.VlrCRMenCalc + "\r\n";
                            tbRetorno.Text += "         natRend: " + RetItemTotApurMenR9015.NatRend + "\r\n";
                            tbRetorno.Text += "         vlrCRMenSuspDCTF: " + RetItemTotApurMenR9015.VlrCRMenSuspDCTF + "\r\n";
                            tbRetorno.Text += "         vlrCRMenSuspCalc: " + RetItemTotApurMenR9015.VlrCRMenSuspCalc + "\r\n";
                            tbRetorno.Text += "         vlrCRMenInf: " + RetItemTotApurMenR9015.VlrCRMenInf + "\r\n";
                            tbRetorno.Text += "         vlrCRMenSuspInf: " + RetItemTotApurMenR9015.VlrCRMenSuspInf + "\r\n";
                            tbRetorno.Text += "         CRMen: " + RetItemTotApurMenR9015.CRMen + "\r\n";
                        }
                        for (int l = 0; l < RetItemInfoCR_CNRR9015.CountTotApurDia(); l++)
                        {
                            RetItemTotApurDiaR9015 = RetItemInfoCR_CNRR9015.TotApurDia[l];
                            tbRetorno.Text += "          vlrCRDiaInf: " + RetItemTotApurDiaR9015.VlrCRDiaInf + "\r\n";
                            tbRetorno.Text += "          natRend: " + RetItemTotApurDiaR9015.NatRend + "\r\n";
                            tbRetorno.Text += "          vlrCRDiaDCTF: " + RetItemTotApurDiaR9015.VlrCRDiaDCTF + "\r\n";
                            tbRetorno.Text += "          vlrCRDiaCalc: " + RetItemTotApurDiaR9015.VlrCRDiaCalc + "\r\n";
                            tbRetorno.Text += "          vlrCRDiaSuspDCTF: " + RetItemTotApurDiaR9015.VlrCRDiaSuspDCTF + "\r\n";
                            tbRetorno.Text += "          vlrCRDiaSuspCalc: " + RetItemTotApurDiaR9015.VlrCRDiaSuspCalc + "\r\n";
                            tbRetorno.Text += "          perApurDia: " + RetItemTotApurDiaR9015.PerApurDia + "\r\n";
                            tbRetorno.Text += "          CRDia: " + RetItemTotApurDiaR9015.CRDia + "\r\n";
                            tbRetorno.Text += "          vlrCRDiaSuspInf: " + RetItemTotApurDiaR9015.VlrCRDiaSuspInf + "\r\n";
                        }
                        for (int l = 0; l < RetItemInfoCR_CNRR9015.CountTotApurDec(); l++)
                        {
                            RetItemTotApurDecR9015 = RetItemInfoCR_CNRR9015.TotApurDec[l];
                            tbRetorno.Text += "          totApurDec:  " + "\r\n";
                            tbRetorno.Text += "          vlrCRDecSuspInf: " + RetItemTotApurDecR9015.VlrCRDecSuspInf + "\r\n";
                            tbRetorno.Text += "          natRend: " + RetItemTotApurDecR9015.NatRend + "\r\n";
                            tbRetorno.Text += "          vlrCRDecInf: " + RetItemTotApurDecR9015.VlrCRDecInf + "\r\n";
                            tbRetorno.Text += "          vlrCRDecSuspDCTF: " + RetItemTotApurDecR9015.VlrCRDecSuspDCTF + "\r\n";
                            tbRetorno.Text += "          vlrCRDecSuspCalc: " + RetItemTotApurDecR9015.VlrCRDecSuspCalc + "\r\n";
                            tbRetorno.Text += "          vlrCRDecDCTF: " + RetItemTotApurDecR9015.VlrCRDecDCTF + "\r\n";
                            tbRetorno.Text += "          vlrCRDecCalc: " + RetItemTotApurDecR9015.VlrCRDecCalc + "\r\n";
                            tbRetorno.Text += "          perApurDec: " + RetItemTotApurDecR9015.PerApurDec + "\r\n";
                            tbRetorno.Text += "          CRDec: " + RetItemTotApurDecR9015.CRDec + "\r\n";
                        }
                    }

                    for (int k = 0; k < retConsultaItem.R9015.CountInfoTotalCR(); k++)
                    {
                        RetItemInfoTotalCR9015 = retConsultaItem.R9015.InfoTotalCR[k];
                        tbRetorno.Text += "        infoTotalCR \r\n";

                        for (int l = 0; l < RetItemInfoTotalCR9015.CountTotApurSem(); l++)
                        {
                            RetItemInfoTotalCR_TotApurSemR9015 = RetItemInfoTotalCR9015.TotApurSem[l];
                            tbRetorno.Text += "         totApurSem: \r\n";
                            tbRetorno.Text += "         vlrCRSemDCTF: " + RetItemInfoTotalCR_TotApurSemR9015.VlrCRSemDCTF + "\r\n";
                            tbRetorno.Text += "         vlrCRSemSuspDCTF: " + RetItemInfoTotalCR_TotApurSemR9015.VlrCRSemSuspDCTF + "\r\n";
                            tbRetorno.Text += "         perApurSem: " + RetItemInfoTotalCR_TotApurSemR9015.PerApurSem + "\r\n";
                            tbRetorno.Text += "         CRSem: " + RetItemInfoTotalCR_TotApurSemR9015.CRSem + "\r\n";
                        }
                        for (int l = 0; l < RetItemInfoTotalCR9015.CountTotApurQui(); l++)
                        {
                            RetItemInfoTotalCR_TotApurQuiR9015 = RetItemInfoTotalCR9015.TotApurQui[l];
                            tbRetorno.Text += "         totApurQui:  " + "\r\n";
                            tbRetorno.Text += "         vlrCRQuiSuspDCTF: " + RetItemInfoTotalCR_TotApurQuiR9015.VlrCRQuiSuspDCTF + "\r\n";
                            tbRetorno.Text += "         vlrCRQuiDCTF: " + RetItemInfoTotalCR_TotApurQuiR9015.VlrCRQuiDCTF + "\r\n";
                            tbRetorno.Text += "         perApurQui: " + RetItemInfoTotalCR_TotApurQuiR9015.PerApurQui + "\r\n";
                            tbRetorno.Text += "         CRQui: " + RetItemInfoTotalCR_TotApurQuiR9015.CRQui + "\r\n";

                        }
                        for (int l = 0; l < RetItemInfoTotalCR9015.CountTotApurMen(); l++)
                        {
                            RetItemInfoTotalCR_TotApurMenR9015 = RetItemInfoTotalCR9015.TotApurMen[l];
                            tbRetorno.Text += "         totApurMen: \r\n";
                            tbRetorno.Text += "          vlrCRMenDCTF: " + RetItemInfoTotalCR_TotApurMenR9015.VlrCRMenDCTF + "\r\n";
                            tbRetorno.Text += "          vlrCRMenSuspDCTF: " + RetItemInfoTotalCR_TotApurMenR9015.VlrCRMenSuspDCTF + "\r\n";
                            tbRetorno.Text += "          CRMen: " + RetItemInfoTotalCR_TotApurMenR9015.CRMen + "\r\n";

                        }
                        for (int l = 0; l < RetItemInfoTotalCR9015.CountTotApurDia(); l++)
                        {
                            RetItemInfoTotalCR_TotApurDiaR9015 = RetItemInfoTotalCR9015.TotApurDia[l];
                            tbRetorno.Text += "         totApurDia: \r\n";
                            tbRetorno.Text += "          PerApurDia: " + RetItemInfoTotalCR_TotApurDiaR9015.PerApurDia + "\r\n";
                            tbRetorno.Text += "          CRDia: " + RetItemInfoTotalCR_TotApurDiaR9015.CRDia + "\r\n";
                            tbRetorno.Text += "          VlrCRDiaDCTF: " + RetItemInfoTotalCR_TotApurDiaR9015.VlrCRDiaDCTF + "\r\n";
                            tbRetorno.Text += "          vlrCRDiaSuspDCTF: " + RetItemInfoTotalCR_TotApurDiaR9015.VlrCRDiaSuspDCTF + "\r\n";

                        }
                        for (int l = 0; l < RetItemInfoTotalCR9015.CountTotApurDec(); l++)
                        {
                            RetItemInfoTotalCR_TotApurDecR9015 = RetItemInfoTotalCR9015.TotApurDec[l];
                            tbRetorno.Text += "       totApurDec:  " + "\r\n";
                            tbRetorno.Text += "        vlrCRDecSuspDCTF: " + RetItemInfoTotalCR_TotApurDecR9015.VlrCRDecSuspDCTF + "\r\n";
                            tbRetorno.Text += "        vlrCRDecDCTF: " + RetItemInfoTotalCR_TotApurDecR9015.VlrCRDecDCTF + "\r\n";
                            tbRetorno.Text += "        perApurDec: " + RetItemInfoTotalCR_TotApurDecR9015.PerApurDec + "\r\n";
                            tbRetorno.Text += "        CRDec: " + RetItemInfoTotalCR_TotApurDecR9015.CRDec + "\r\n";

                        }

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

        private void cbVersao_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void tbTokenSH_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

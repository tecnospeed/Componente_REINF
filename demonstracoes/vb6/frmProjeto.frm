VERSION 5.00
Begin VB.Form frmProjeto 
   ClientHeight    =   9420
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   7665
   LinkTopic       =   "Form1"
   ScaleHeight     =   9420
   ScaleWidth      =   7665
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtTemplates 
      Height          =   285
      Left            =   120
      TabIndex        =   23
      Top             =   1560
      Width           =   7455
   End
   Begin VB.TextBox txtEsquemas 
      Height          =   285
      Left            =   120
      TabIndex        =   21
      Top             =   2160
      Width           =   7455
   End
   Begin VB.TextBox txtEmpregador 
      Height          =   285
      Left            =   120
      TabIndex        =   17
      Top             =   960
      Width           =   2415
   End
   Begin VB.ComboBox cbAmbiente 
      Height          =   315
      ItemData        =   "frmProjeto.frx":0000
      Left            =   2640
      List            =   "frmProjeto.frx":000A
      TabIndex        =   16
      Top             =   960
      Width           =   2415
   End
   Begin VB.ComboBox cbVersao 
      Height          =   315
      ItemData        =   "frmProjeto.frx":002D
      Left            =   5160
      List            =   "frmProjeto.frx":0034
      TabIndex        =   15
      Top             =   960
      Width           =   2415
   End
   Begin VB.CommandButton btnConfigSH 
      Caption         =   "Configurar SH"
      Height          =   375
      Left            =   120
      TabIndex        =   13
      Top             =   3120
      Width           =   7455
   End
   Begin VB.TextBox txtTokenSH 
      Height          =   285
      Left            =   3720
      TabIndex        =   12
      Top             =   360
      Width           =   3855
   End
   Begin VB.TextBox txtCNPJSH 
      Height          =   285
      Left            =   120
      TabIndex        =   10
      Top             =   360
      Width           =   3495
   End
   Begin VB.TextBox txtIdLote 
      Height          =   285
      Left            =   120
      TabIndex        =   7
      Top             =   4320
      Width           =   7455
   End
   Begin VB.CommandButton cmdConsultar 
      Caption         =   "Consultar"
      Height          =   375
      Left            =   6240
      TabIndex        =   6
      Top             =   3600
      Width           =   1335
   End
   Begin VB.CommandButton cmdEnviar 
      Caption         =   "Enviar"
      Height          =   375
      Left            =   4680
      TabIndex        =   5
      Top             =   3600
      Width           =   1335
   End
   Begin VB.CommandButton btnCarregaTX2 
      Caption         =   "Carrega TX2"
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   3600
      Width           =   1215
   End
   Begin VB.TextBox tbRetorno 
      Height          =   4695
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   3
      Top             =   4680
      Width           =   7455
   End
   Begin VB.CommandButton btnAssinarXML 
      Caption         =   "Assinar"
      Height          =   375
      Index           =   1
      Left            =   3120
      TabIndex        =   2
      Top             =   3600
      Width           =   1335
   End
   Begin VB.CommandButton btnGerarXML 
      Caption         =   "Gerar XML"
      Height          =   375
      Index           =   0
      Left            =   1560
      TabIndex        =   1
      Top             =   3600
      Width           =   1335
   End
   Begin VB.ComboBox cbCertificado 
      Height          =   315
      ItemData        =   "frmProjeto.frx":003E
      Left            =   120
      List            =   "frmProjeto.frx":0040
      TabIndex        =   0
      Text            =   $"frmProjeto.frx":0042
      Top             =   2760
      Width           =   7455
   End
   Begin VB.Label Label9 
      Caption         =   "Diretório Templates:"
      Height          =   255
      Left            =   120
      TabIndex        =   24
      Top             =   1320
      Width           =   2895
   End
   Begin VB.Label Label8 
      Caption         =   "Diretório Esquemas:"
      Height          =   255
      Left            =   120
      TabIndex        =   22
      Top             =   1920
      Width           =   2895
   End
   Begin VB.Label Label7 
      Caption         =   "Versão Manual:"
      Height          =   255
      Left            =   5160
      TabIndex        =   20
      Top             =   720
      Width           =   2295
   End
   Begin VB.Label Label6 
      Caption         =   "Ambiente:"
      Height          =   255
      Left            =   2640
      TabIndex        =   19
      Top             =   720
      Width           =   2295
   End
   Begin VB.Label Label5 
      Caption         =   "CPF / CNPJ Empregador:"
      Height          =   255
      Left            =   120
      TabIndex        =   18
      Top             =   720
      Width           =   2295
   End
   Begin VB.Label Label4 
      Caption         =   "Certificados:"
      Height          =   255
      Left            =   120
      TabIndex        =   14
      Top             =   2520
      Width           =   2295
   End
   Begin VB.Label Label3 
      Caption         =   "Token Software House:"
      Height          =   255
      Left            =   3720
      TabIndex        =   11
      Top             =   120
      Width           =   1815
   End
   Begin VB.Label Label2 
      Caption         =   "CPF / CNPJ da Software House:"
      Height          =   255
      Left            =   120
      TabIndex        =   9
      Top             =   120
      Width           =   2895
   End
   Begin VB.Label Label1 
      Caption         =   "Identificador Lote"
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   4080
      Width           =   2535
   End
End
Attribute VB_Name = "frmProjeto"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public REINF As ReinfClientX.spdReinfClientX



Private Sub btnAssinarXML_Click(Index As Integer)
    tbRetorno = REINF.AssinarEvento(tbRetorno.Text)
End Sub

Private Sub btnCarregaTX2_Click()
    tbRetorno.Text = "INCLUIRR1000" & vbNewLine & Chr(10)
    If cbAmbiente.Text = "1 - Produção" Then
        tbRetorno.Text = tbRetorno.Text & "tpAmb_4=1" & vbNewLine & Chr(10)
    End If
    If cbAmbiente.Text = "2 - Homologação" Then
        tbRetorno.Text = tbRetorno.Text & "tpAmb_4=2" & vbNewLine & Chr(10)
    End If
    tbRetorno.Text = tbRetorno.Text & "procEmi_5=1" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "verProc_6=1.0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "tpInsc_8=1" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "nrInsc_9=08187168" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "iniValid_13=2017-07" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "classTrib_16=99" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indEscrituracao_17=0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indDesoneracao_18=1" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indAcordoIsenMulta_19=0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indSitPJ_20=0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "nmCtt_22=Nome Do Conato" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "cpfCtt_23=12345678909" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "foneFixo_24=11234561234" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "SALVARR1000"

End Sub

Private Sub btnConfigSH_Click()
    REINF.ConfigurarSoftwareHouse txtCNPJSH.Text, txtTokenSH.Text
    REINF.DiretorioEsquemas = txtEsquemas.Text
    REINF.DiretorioTemplates = txtTemplates.Text
    REINF.NomeCertificado = cbCertificado.Text
    REINF.CpfCnpjEmpregador = txtEmpregador.Text
    If cbAmbiente.Text = "1 - Produção" Then
        REINF.Ambiente = akProducao
    End If
    If cbAmbiente.Text = "2 - Homologação" Then
        REINF.Ambiente = akPreProducaoReais
    End If
    If cbVersao.Text = "vm13" Then
        REINF.VersaoManual = vm13
    End If
End Sub

Private Sub btnGerarXML_Click(Index As Integer)
    tbRetorno.Text = REINF.GerarXMLporTx2(tbRetorno.Text)
End Sub

Private Sub cmdConsultar_Click()
    Dim RetConsulta As spdReinfRetConsultarLote
    Dim RetConsultaItem As spdReinfRetConsultarLoteItem
    Dim RetConsultaOcorrencia As spdReinfRetConsultarLoteOcorrencia
    Dim RetConsultaOcorrenciaEnvio As spdReinfRetConsultarLoteOcorrenciaEnvio
    Dim RetItemRTomR5011 As IspdRTomR5011
    Dim RetItemRComlR5011 As IspdRComlR5011
    Dim RetItemRCPRBR5011 As IspdRCPRBR5011
    Dim RetItemRPrestR5011 As IspdRPrestR5011
    Dim RetItemRRecRepADR5011 As IspdRRecRepADR5011
    Dim RetItemInfoCRTomR5011 As IspdInfoCRTomR5011
    Dim RetItemRTomR5001 As IspdRTomR5001
    Dim RetItemRComlR5001 As IspdRComlR5001
    Dim RetItemRCPRBR5001 As IspdRCPRBR5001
    Dim RetItemRPrestR5001 As IspdRPrestR5001
    Dim RetItemRRecRepADR5001 As IspdRRecRepADR5001
    Dim RetItemInfoCRTomR5001 As IspdInfoCRTomR5001
    Dim RetItemRRecEspetDespR5001 As IspdRRecEspetDespR5001
    Dim i, j, k, l As Integer
    
    Set RetConsulta = REINF.ConsultarLoteEventos(txtIdLote.Text)
    
    tbRetorno.Text = "### CONSULTAR EVENTO ###" & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Número do Protocolo: " & RetConsulta.NumeroProtocolo & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Mensagem de Retorno: " & RetConsulta.Mensagem & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Status do Lote: " & RetConsulta.Status & vbNewLine
    
    For i = 0 To RetConsulta.Count - 1
        Set RetConsultaItem = RetConsulta.Eventos(i)
        tbRetorno.Text = tbRetorno.Text & "    Id Evento: " & RetConsultaItem.IdEvento & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    Número Recibo: " & RetConsultaItem.NumeroRecibo & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    Código de Status: " & RetConsultaItem.cStat & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    Mensagem: " & RetConsultaItem.Mensagem & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    Status do Evento: " & RetConsultaItem.Status & vbNewLine
        For j = 0 To RetConsulta.CountOcorrencias - 1
            Set RetConsultaOcorrenciaEnvio = RetConsulta.Ocorrencias(j)
            tbRetorno.Text = tbRetorno.Text & "    Ocorrencia de Envio N." & CStr(j + 1) & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        Código: " & RetConsultaOcorrenciaEnvio.Codigo & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        Descrição: " & RetConsultaOcorrenciaEnvio.Descricao & vbNewLine
        Next
        If RetConsultaItem.R5001.IsEmpty = False Then
        tbRetorno.Text = tbRetorno.Text & "     R5001" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "      PeriApuracao: " & RetConsultaItem.R5001.PeriodoApuracao & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "      NrInsc: " & RetConsultaItem.R5001.NrInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "      TpInsc: " & RetConsultaItem.R5001.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "      NrRecArqBase: " & RetConsultaItem.R5001.NrRecArqBase & vbNewLine

            For k = 0 To RetConsultaItem.R5001.CountRTom - 1
            Set RetItemRTomR5001 = RetConsultaItem.R5001.RTom(k)
            tbRetorno.Text = tbRetorno.Text & "      RTom:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CnpjPrestr: " & RetItemRTomR5001.CnpjPrestador & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalBaseRet: " & RetItemRTomR5001.VlrTotalBaseRet & vbNewLine
                For l = 0 To RetItemRTomR5001.CountInfoCRTom - 1
                    Set RetItemInfoCRTomR5001 = RetItemRTomR5001.InfoCRTom(l)
                    tbRetorno.Text = tbRetorno.Text & "       InfoCRTOM: " & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        CRTom: " & RetItemInfoCRTomR5001.CRTom & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        VlrCRTom: " & RetItemInfoCRTomR5001.VlrCRTom & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        VlrCRTomSusp: " & RetItemInfoCRTomR5001.VlrCRTomSusp & vbNewLine
                Next
            Next

            For k = 0 To RetConsultaItem.R5001.CountRComl - 1
            Set RetItemRComlR5001 = RetConsultaItem.R5001.RComl(k)
            tbRetorno.Text = tbRetorno.Text & "      RComl:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRComl: " & RetItemRComlR5001.CRComl & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRComl: " & RetItemRComlR5001.VlrCRComl & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRComlSusp: " & RetItemRComlR5001.VlrCRComlSusp & vbNewLine

            Next
            For k = 0 To RetConsultaItem.R5001.CountRCPRB - 1
            Set RetItemRCPRBR5001 = RetConsultaItem.R5001.RCPRB(k)
            tbRetorno.Text = tbRetorno.Text & "      RCPRB:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRCPRB: " & RetItemRCPRBR5001.CRCPRB & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRCPRB: " & RetItemRCPRBR5001.vlrCRCPRB & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRCPRBSusp: " & RetItemRCPRBR5001.vlrCRCPRBSusp & vbNewLine
            Next

            For k = 0 To RetConsultaItem.R5001.CountRPrest - 1
            Set RetItemRPrestR5001 = RetConsultaItem.R5001.RPrest(k)
            tbRetorno.Text = tbRetorno.Text & "      RPrest:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      TpInscTomr: " & RetItemRPrestR5001.TpInscTomr & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      NrInscTomr: " & RetItemRPrestR5001.NrInscTomr & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalBaseRet: " & RetItemRPrestR5001.VlrTotalBaseRet & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalRetAdic: " & RetItemRPrestR5001.VlrTotalRetAdic & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalNRetPrinc: " & RetItemRPrestR5001.VlrTotalNRetPrinc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalNRetAdic: " & RetItemRPrestR5001.VlrTotalNRetAdic & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalRetPrinc: " & RetItemRPrestR5001.VlrTotalRetPrinc & vbNewLine

            Next
            For k = 0 To RetConsultaItem.R5001.CountRRecRepAD - 1
            Set RetItemRRecRepADR5001 = RetConsultaItem.R5001.RRecRepAD(k)
            tbRetorno.Text = tbRetorno.Text & "      RRecRepAD:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CnpjAssocDesp: " & RetItemRRecRepADR5001.CnpjAssocDesp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalRep: " & RetItemRRecRepADR5001.VlrTotalRep & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRRecRepAD: " & RetItemRRecRepADR5001.CRRecRepAD & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRRecRepAD: " & RetItemRRecRepADR5001.VlrCRRecRepAD & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRRecRepADSusp: " & RetItemRRecRepADR5001.VlrCRRecRepADSusp & vbNewLine
            Next

            For k = 0 To RetConsultaItem.R5001.CountRRecEspetDesp - 1
            Set RetItemRRecEspetDespR5001 = RetConsultaItem.R5001.RRecEspetDesp(k)
            tbRetorno.Text = tbRetorno.Text & "      RRecEspetDesp:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRRecEspetDesp: " & RetItemRRecEspetDespR5001.CRRecEspetDesp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrReceitaTotal: " & RetItemRRecEspetDespR5001.VlrReceitaTotal & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRRecEspetDesp: " & RetItemRRecEspetDespR5001.VlrCRRecEspetDesp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRRecEspetDespSusp: " & RetItemRRecEspetDespR5001.VlrCRRecEspetDespSusp & vbNewLine
                
            Next
            End If
            
            If RetConsultaItem.R5011.IsEmpty = False Then
            For k = 0 To RetConsultaItem.R5011.CountRTom - 1
            Set RetItemRTomR5011 = RetConsultaItem.R5011.RTom(k)
            tbRetorno.Text = tbRetorno.Text & "      R5011 " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      RTom:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CnpjPrestr: " & RetItemRTomR5011.CnpjPrestador & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalBaseRet: " & RetItemRTomR5011.VlrTotalBaseRet & vbNewLine
                For l = 0 To RetItemRTomR5011.CountInfoCRTom - 1
                    Set RetItemInfoCRTomR5011 = RetItemRTomR5011.InfoCRTom(l)
                    
                    tbRetorno.Text = tbRetorno.Text & "       InfoCRTOM: " & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        CRTom: " & RetItemInfoCRTomR5011.CRTom & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        VlrCRTom: " & RetItemInfoCRTomR5011.VlrCRTom & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        VlrCRTomSusp: " & RetItemInfoCRTomR5011.VlrCRTomSusp & vbNewLine
                Next
            Next
            For k = 0 To RetConsultaItem.R5011.CountRComl - 1
            Set RetItemRComlR5011 = RetConsultaItem.R5011.RComl(k)
            tbRetorno.Text = tbRetorno.Text & "      R5011 " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      RComl:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRComl: " & RetItemRComlR5011.CRComl & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRComl: " & RetItemRComlR5011.VlrCRComl & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRComlSusp: " & RetItemRComlR5011.VlrCRComlSusp & vbNewLine

            Next
            For k = 0 To RetConsultaItem.R5011.CountRCPRB - 1
            Set RetItemRCPRBR5011 = RetConsultaItem.R5011.RCPRB(k)
            tbRetorno.Text = tbRetorno.Text & "      R5011 " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      RCPRB:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CodRec: " & RetItemRCPRBR5011.CodRec & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCPApurTotal: " & RetItemRCPRBR5011.VlrCPApurTotal & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCPRBSusp: " & RetItemRCPRBR5011.VlrCPRBSusp & vbNewLine
            Next
            For k = 0 To RetConsultaItem.R5011.CountRPrest - 1
            Set RetItemRPrestR5011 = RetConsultaItem.R5011.RPrest(k)
            tbRetorno.Text = tbRetorno.Text & "      R5011 " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      RPrest:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      TpInscTomr: " & RetItemRPrestR5011.TpInscTomr & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      NrInscTomr: " & RetItemRPrestR5011.NrInscTomr & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalBaseRet: " & RetItemRPrestR5011.VlrTotalBaseRet & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalRetAdic: " & RetItemRPrestR5011.VlrTotalRetAdic & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalNRetPrinc: " & RetItemRPrestR5011.VlrTotalNRetPrinc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalNRetAdic: " & RetItemRPrestR5011.VlrTotalNRetAdic & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalRetPrinc: " & RetItemRPrestR5011.VlrTotalRetPrinc & vbNewLine

            Next
            For k = 0 To RetConsultaItem.R5011.CountRRecRepAD - 1
            Set RetItemRRecRepADR5011 = RetConsultaItem.R5011.RRecRepAD(k)
            tbRetorno.Text = tbRetorno.Text & "      R5011 " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      RRecRepAD:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CnpjAssocDesp: " & RetItemRRecRepADR5011.CnpjAssocDesp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalRep: " & RetItemRRecRepADR5011.VlrTotalRep & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalRet: " & RetItemRRecRepADR5011.VlrTotalRet & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalNRet: " & RetItemRRecRepADR5011.VlrTotalNRet & vbNewLine
            Next
            End If
        
        For j = 0 To RetConsultaItem.Count - 1
            Set RetConsultaOcorrencia = RetConsultaItem.Ocorrencias(j)
            tbRetorno.Text = tbRetorno.Text & "        Ocorrencia de Evento N." & CStr(j + 1) & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        Código: " & RetConsultaOcorrencia.Codigo & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        Descrição: " & RetConsultaOcorrencia.Descricao & vbNewLine
        Next
    Next
End Sub

Private Sub cmdEnviar_Click()
    Dim RetEnvio As spdReinfRetEnviarLoteEventos
    
    Set RetEnvio = REINF.EnviarLoteEventos(tbRetorno.Text)
    
    tbRetorno.Text = "### INCLUIR EVENTO ###" & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Identificador do Lote: " & RetEnvio.IdLote & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Mensagem de Retorno: " & RetEnvio.Mensagem
    
    txtIdLote.Text = RetEnvio.IdLote
End Sub

Private Sub Form_Load()
Set REINF = New ReinfClientX.spdReinfClientX
Dim vetor As Variant
Dim i As Integer
frmProjeto.Caption = "Reinf - TecnoSpeed - " & REINF.Versao
vetor = Split(REINF.ListarCertificados("|"), "|")
cbCertificado.Clear
For i = LBound(vetor) To UBound(vetor)
    cbCertificado.AddItem vetor(i)
Next
cbVersao.ListIndex = 0
cbAmbiente.ListIndex = 1
cbCertificado.ListIndex = 3
txtCNPJSH.Text = "86837822000147"
txtTokenSH.Text = "Hmf3xiDgPP6nC90MO7Yy64NhEytKoOVA7AkELTZI"
txtEmpregador.Text = "08187168"
txtTemplates.Text = "C:\Program Files\TecnoSpeed\Reinf\Arquivos\Templates\"
txtEsquemas.Text = "C:\Program Files\TecnoSpeed\Reinf\Arquivos\Esquemas\"

End Sub


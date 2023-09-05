VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "tabctl32.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   8760
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   16125
   LinkTopic       =   "Form1"
   ScaleHeight     =   8760
   ScaleWidth      =   16125
   StartUpPosition =   3  'Windows Default
   Begin TabDlg.SSTab SSTab1 
      Height          =   7935
      Left            =   8160
      TabIndex        =   31
      Top             =   600
      Width           =   7695
      _ExtentX        =   13573
      _ExtentY        =   13996
      _Version        =   393216
      TabHeight       =   520
      BackColor       =   16777215
      TabCaption(0)   =   "Dados"
      TabPicture(0)   =   "Form1.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "tbRetorno"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).ControlCount=   1
      TabCaption(1)   =   "XmlEnvio"
      TabPicture(1)   =   "Form1.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "tbXmlEnvio"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "XmlRetorno"
      TabPicture(2)   =   "Form1.frx":0038
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "tbXmlRetorno"
      Tab(2).ControlCount=   1
      Begin VB.TextBox tbXmlRetorno 
         Height          =   7335
         Left            =   -74880
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   34
         Top             =   480
         Width           =   7455
      End
      Begin VB.TextBox tbXmlEnvio 
         Height          =   7335
         Left            =   -74880
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   33
         Top             =   480
         Width           =   7455
      End
      Begin VB.TextBox tbRetorno 
         Height          =   7455
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   32
         Top             =   480
         Width           =   7455
      End
   End
   Begin VB.CommandButton btnConsultar 
      Caption         =   "Consultar"
      Height          =   375
      Left            =   6000
      TabIndex        =   30
      Top             =   7560
      Width           =   1695
   End
   Begin VB.Frame frmConsulta 
      Caption         =   "Tipo de Consulta"
      Height          =   855
      Left            =   360
      TabIndex        =   25
      Top             =   6600
      Width           =   7335
      Begin VB.OptionButton rbReconsulta 
         Caption         =   "Reconsultar Lote"
         Height          =   255
         Left            =   5400
         TabIndex        =   29
         Top             =   360
         Width           =   1695
      End
      Begin VB.OptionButton rbNumRecibo 
         Caption         =   "Nr de Recibo"
         Height          =   255
         Left            =   3600
         TabIndex        =   28
         Top             =   360
         Width           =   1455
      End
      Begin VB.OptionButton rbIdEvento 
         Caption         =   "Id de Evento"
         Height          =   255
         Left            =   1800
         TabIndex        =   27
         Top             =   360
         Width           =   1335
      End
      Begin VB.OptionButton rbIdLote 
         Caption         =   "Id de Lote"
         Height          =   195
         Left            =   240
         TabIndex        =   26
         Top             =   360
         Value           =   -1  'True
         Width           =   1215
      End
   End
   Begin VB.TextBox txtIdlote 
      Height          =   285
      Left            =   360
      TabIndex        =   24
      Top             =   8160
      Width           =   7335
   End
   Begin VB.CommandButton btnEnviar 
      Caption         =   "Enviar"
      Height          =   375
      Left            =   6000
      TabIndex        =   22
      Top             =   5880
      Width           =   1695
   End
   Begin VB.CommandButton btnAssinar 
      Caption         =   "Assinar"
      Height          =   375
      Left            =   4080
      TabIndex        =   21
      Top             =   5880
      Width           =   1695
   End
   Begin VB.CommandButton btnGerarXML 
      Caption         =   "Gerar XML"
      Height          =   375
      Left            =   2280
      TabIndex        =   20
      Top             =   5880
      Width           =   1695
   End
   Begin VB.TextBox txtLog 
      Height          =   285
      Left            =   360
      TabIndex        =   19
      Text            =   "\log\"
      Top             =   4200
      Width           =   7335
   End
   Begin VB.TextBox txtTemplates 
      Height          =   285
      Left            =   360
      TabIndex        =   17
      Text            =   "C:\Program Files\TecnoSpeed\Reinf\Arquivos\Templates\"
      Top             =   3500
      Width           =   7335
   End
   Begin VB.TextBox txtEsquemas 
      Height          =   285
      Left            =   360
      TabIndex        =   15
      Text            =   "C:\Program Files\TecnoSpeed\Reinf\Arquivos\Esquemas\"
      Top             =   2800
      Width           =   7335
   End
   Begin VB.ComboBox cbCertificado 
      Height          =   315
      Left            =   360
      TabIndex        =   13
      Top             =   2100
      Width           =   7335
   End
   Begin VB.ComboBox cbVersao 
      Height          =   315
      ItemData        =   "Form1.frx":0054
      Left            =   5880
      List            =   "Form1.frx":005B
      TabIndex        =   11
      Text            =   "2.1.02"
      Top             =   1400
      Width           =   1815
   End
   Begin VB.ComboBox cbAmbiente 
      Height          =   315
      ItemData        =   "Form1.frx":0067
      Left            =   3360
      List            =   "Form1.frx":0071
      TabIndex        =   8
      Text            =   "2 - Homologação"
      Top             =   1400
      Width           =   2175
   End
   Begin VB.CommandButton btnCarregaTX2 
      Caption         =   "CarregaTX2"
      Height          =   375
      Left            =   360
      TabIndex        =   7
      Top             =   5880
      Width           =   1695
   End
   Begin VB.CommandButton btnConfigSH 
      Caption         =   "Configurar Componente"
      Height          =   375
      Left            =   1800
      TabIndex        =   6
      Top             =   5160
      Width           =   4575
   End
   Begin VB.TextBox txtTokenSh 
      DataSource      =   "txtTokenSH"
      Height          =   285
      Left            =   3360
      TabIndex        =   5
      Text            =   "TOKEN SOFTWARE HOUSE"
      Top             =   700
      Width           =   4335
   End
   Begin VB.TextBox txtEmpregador 
      Height          =   285
      Left            =   360
      TabIndex        =   3
      Text            =   "CNPJ EMPREGADOR"
      Top             =   1400
      Width           =   2415
   End
   Begin VB.TextBox txtCNPJSH 
      Height          =   285
      Left            =   360
      TabIndex        =   2
      Text            =   "CNPJ SOFTWARE HOUSE"
      Top             =   700
      Width           =   2415
   End
   Begin VB.Label Label9 
      Caption         =   "Identificador do Lote"
      Height          =   255
      Left            =   360
      TabIndex        =   23
      Top             =   7680
      Width           =   1695
   End
   Begin VB.Label Label8 
      Caption         =   "Diretorio Log"
      Height          =   255
      Left            =   360
      TabIndex        =   18
      Top             =   3960
      Width           =   1215
   End
   Begin VB.Label Label7 
      Caption         =   "Diretorio Templates"
      Height          =   255
      Left            =   360
      TabIndex        =   16
      Top             =   3240
      Width           =   1815
   End
   Begin VB.Label Label6 
      Caption         =   "Diretorio Esquemas"
      Height          =   375
      Left            =   360
      TabIndex        =   14
      Top             =   2520
      Width           =   1695
   End
   Begin VB.Label certificado 
      Caption         =   "Certificado"
      Height          =   375
      Left            =   360
      TabIndex        =   12
      Top             =   1800
      Width           =   1215
   End
   Begin VB.Label Label5 
      Caption         =   "Versão Manual"
      Height          =   255
      Left            =   5880
      TabIndex        =   10
      Top             =   1080
      Width           =   1455
   End
   Begin VB.Label Label4 
      Caption         =   "Ambiente"
      Height          =   255
      Left            =   3360
      TabIndex        =   9
      Top             =   1080
      Width           =   1575
   End
   Begin VB.Label Label3 
      Caption         =   "Token Software House"
      Height          =   255
      Left            =   3360
      TabIndex        =   4
      Top             =   360
      Width           =   1935
   End
   Begin VB.Label Label2 
      Caption         =   "CPF CNPJ Empregador"
      Height          =   255
      Left            =   360
      TabIndex        =   1
      Top             =   1080
      Width           =   2655
   End
   Begin VB.Label Label1 
      Caption         =   "CPF CNPJ Software house"
      Height          =   255
      Left            =   360
      TabIndex        =   0
      Top             =   360
      Width           =   2415
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public reinf As ReinfClientX.spdReinfClientX

Private Sub btnAssinar_Click()
    tbRetorno = reinf.AssinarEvento(tbRetorno.Text)
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
    tbRetorno.Text = tbRetorno.Text & "indDesoneracao_18=0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indAcordoIsenMulta_19=0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indSitPJ_20=0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "nmCtt_22=Nome Do Conato" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "cpfCtt_23=12345678909" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "foneFixo_24=11234561234" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "SALVARR1000"

End Sub

Private Sub btnConfigSH_Click()
reinf.ConfigurarSoftwareHouse txtCNPJSH, txtTokenSh
   
tbRetorno.Text = ""
reinf.DiretorioEsquemas = txtEsquemas.Text
reinf.DiretorioTemplates = txtTemplates.Text
reinf.DiretorioLog = txtLog.Text
reinf.CpfCnpjEmpregador = txtEmpregador
reinf.NomeCertificado = cbCertificado.Text

If cbAmbiente.Text = "1 - Produção" Then
        reinf.Ambiente = akProducao
    End If
    If cbAmbiente.Text = "2 - Homologação" Then
        reinf.Ambiente = akPreProducaoReais
    End If
    reinf.VersaoManual = cbVersao.Text
    
tbRetorno.Text = "Componente Configurado"
End Sub

Private Sub btnConsultar_Click()
    Dim RetConsulta As spdReinfRetConsultarLote
    Dim RetConsultaItem As spdReinfRetConsultarLoteItem
    Dim RetConsultaOcorrencia As spdReinfRetConsultarLoteOcorrencia
    Dim RetConsultaOcorrenciaEnvio As spdReinfRetConsultarLoteOcorrenciaEnvio
    
    'R9001
    Dim RetItemRTomR9001 As spdRTomR9001
    Dim RetItemRComlR9001 As spdRComlR9001
    Dim RetItemRCPRBR9001 As spdRCPRBR9001
    Dim RetItemRPrestR9001 As spdRPrestR9001
    Dim RetItemRRecRepADR9001 As spdRRecRepADR9001
    Dim RetItemInfoCRTomR9001 As spdInfoCRTomR9001
    Dim RetItemRRecEspetDespR9001 As spdRRecEspetDespR9001

    'R9011
    Dim RetItemRTomR9011 As spdRTomR9011
    Dim RetItemRComlR9011 As spdRComlR9011
    Dim RetItemRCPRBR9011 As spdRCPRBR9011
    Dim RetItemRPrestR9011 As spdRPrestR9011
    Dim RetItemRRecRepADR9011 As spdRRecRepADR9011
    Dim RetItemInfoCRTomR9011 As spdInfoCRTomR9011
    
    'R9005
    Dim RetItemTotApurSemR9005 As spdTotApurSemR9005
    Dim RetItemTotApurTribSemR9005 As spdTotApurTribSemR9005
    Dim RetItemTotApurQuiR9005 As spdTotApurQuiR9005
    Dim RetItemTotApurTribQuiR9005 As spdTotApurTribQuiR9005
    Dim RetItemTotApurMenR9005 As spdTotApurMenR9005
    Dim RetItemTotApurTribMenR9005 As spdTotApurTribMenR9005
    Dim RetItemTotApurDiaR9005 As spdTotApurDiaR9005
    Dim RetItemTotApurTribDiaR9005 As spdTotApurTribDiaR9005
    Dim RetItemTotApurDecR9005 As spdTotApurDecR9005
    
    'R9015
    Dim RetItemInfoCR_CNRR9015 As spdInfoCR_CNRR9015
    Dim RetItemTotApurSemR9015 As spdTotApurSemR9015
    Dim RetItemTotApurQuiR9015 As spdTotApurQuiR9015
    Dim RetItemTotApurMenR9015 As spdTotApurMenR9015
    Dim RetItemTotApurDiaR9015 As spdTotApurDiaR9015
    Dim RetItemTotApurDecR9015 As spdTotApurDecR9015
    Dim RetItemInfoTotalCR9015 As spdInfoTotalCRR9015
    Dim RetItemInfoTotalCR_TotApurSemR9015 As spdInfoTotalCR_TotApurSemR9015
    Dim RetItemInfoTotalCR_TotApurQuiR9015 As spdInfoTotalCR_TotApurQuiR9015
    Dim RetItemInfoTotalCR_TotApurMenR9015 As spdInfoTotalCR_TotApurMenR9015
    Dim RetItemInfoTotalCR_TotApurDiaR9015 As spdInfoTotalCR_TotApurDiaR9015
    Dim RetItemInfoTotalCR_TotApurDecR9015 As spdInfoTotalCR_TotApurDecR9015
    
    Dim i, j, k, l As Integer
    If rbIdLote.Value Then
    Set RetConsulta = reinf.ConsultarLoteEventos(txtIdlote.Text)
    ElseIf rbIdEvento.Value Then
    Set RetConsulta = reinf.ConsultarIdEvento(txtIdlote.Text)
    ElseIf rbNumRecibo.Value Then
    Set RetConsulta = reinf.ConsultarEventoPorRecibo(txtIdlote.Text)
    End If
    
    tbRetorno.Text = "### CONSULTAR EVENTO ###" & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Número do Protocolo: " & RetConsulta.NumeroProtocolo & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Mensagem de Retorno: " & RetConsulta.Mensagem & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Status do Lote: " & RetConsulta.Status & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "Id do Lote: " & RetConsulta.Id & vbNewLine
        For j = 0 To RetConsulta.CountOcorrencias - 1
            Set RetConsultaOcorrenciaEnvio = RetConsulta.Ocorrencias(j)
            tbRetorno.Text = tbRetorno.Text & "    Ocorrencia de Envio N." & CStr(j + 1) & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        Código: " & RetConsultaOcorrenciaEnvio.Codigo & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        Descrição: " & RetConsultaOcorrenciaEnvio.Descricao & vbNewLine
        Next

        For i = 0 To RetConsulta.Count - 1
        Set RetConsultaItem = RetConsulta.Eventos(i)
        tbRetorno.Text = tbRetorno.Text & "    Id Evento: " & RetConsultaItem.IdEvento & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    Número Recibo: " & RetConsultaItem.NumeroRecibo & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    Código de Status: " & RetConsultaItem.cStat & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    Mensagem: " & RetConsultaItem.Mensagem & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    Status do Evento: " & RetConsultaItem.Status & vbNewLine
        If RetConsultaItem.R9001.IsEmpty = False Then
        tbRetorno.Text = tbRetorno.Text & "     R9001" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "      PeriApuracao: " & RetConsultaItem.R9001.PeriodoApuracao & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "      NrInsc: " & RetConsultaItem.R9001.IdeEstab.NrInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "      TpInsc: " & RetConsultaItem.R9001.IdeEstab.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "      NrRecArqBase: " & RetConsultaItem.R9001.InfoTotal.NrRecArqBase & vbNewLine

        For k = 0 To RetConsultaItem.R9001.CountRTom - 1
            Set RetItemRTomR9001 = RetConsultaItem.R9001.RTom(k)
            tbRetorno.Text = tbRetorno.Text & "      RTom:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CnpjPrestr: " & RetItemRTomR9001.CnpjPrestador & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalBaseRet: " & RetItemRTomR9001.VlrTotalBaseRet & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CNO: " & RetItemRTomR9001.CNO & vbNewLine
                For l = 0 To RetItemRTomR9001.CountInfoCRTom - 1
                    Set RetItemInfoCRTomR9001 = RetItemRTomR9001.InfoCRTom(l)
                    tbRetorno.Text = tbRetorno.Text & "       InfoCRTOM: " & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        CRTom: " & RetItemInfoCRTomR9001.CRTom & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        VlrCRTom: " & RetItemInfoCRTomR9001.VlrCRTom & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        VlrCRTomSusp: " & RetItemInfoCRTomR9001.VlrCRTomSusp & vbNewLine
                Next
            Next
            'ok até aqui
            For k = 0 To RetConsultaItem.R9001.CountRComl - 1
            Set RetItemRComlR9001 = RetConsultaItem.R9001.RComl(k)
            tbRetorno.Text = tbRetorno.Text & "      RComl:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRComl: " & RetItemRComlR9001.CRComl & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRComl: " & RetItemRComlR9001.VlrCRComl & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRComlSusp: " & RetItemRComlR9001.VlrCRComlSusp & vbNewLine
            'ok até aqui
            Next
            For k = 0 To RetConsultaItem.R9001.CountRCPRB - 1
            Set RetItemRCPRBR9001 = RetConsultaItem.R9001.RCPRB(k)
            tbRetorno.Text = tbRetorno.Text & "      RCPRB:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRCPRB: " & RetItemRCPRBR9001.CRCPRB & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRCPRB: " & RetItemRCPRBR9001.vlrCRCPRB & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRCPRBSusp: " & RetItemRCPRBR9001.vlrCRCPRBSusp & vbNewLine
            Next

            For k = 0 To RetConsultaItem.R9001.CountRPrest - 1
            Set RetItemRPrestR9001 = RetConsultaItem.R9001.RPrest(k)
            tbRetorno.Text = tbRetorno.Text & "      RPrest:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      TpInscTomador: " & RetItemRPrestR9001.TpInscTomador & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      NrInscTomador: " & RetItemRPrestR9001.NrInscTomador & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalBaseRet: " & RetItemRPrestR9001.VlrTotalBaseRet & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalRetAdic: " & RetItemRPrestR9001.VlrTotalRetAdic & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalNRetPrinc: " & RetItemRPrestR9001.VlrTotalNRetPrinc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalNRetAdic: " & RetItemRPrestR9001.VlrTotalNRetAdic & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalRetPrinc: " & RetItemRPrestR9001.VlrTotalRetPrinc & vbNewLine
            'ok até aqui
            Next
            For k = 0 To RetConsultaItem.R9001.CountRRecRepAD - 1
            Set RetItemRRecRepADR9001 = RetConsultaItem.R9001.RRecRepAD(k)
            tbRetorno.Text = tbRetorno.Text & "      RRecRepAD:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CnpjAssocDesp: " & RetItemRRecRepADR9001.CnpjAssocDesp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalRep: " & RetItemRRecRepADR9001.VlrTotalRep & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRRecRepAD: " & RetItemRRecRepADR9001.CRRecRepAD & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRRecRepAD: " & RetItemRRecRepADR9001.VlrCRRecRepAD & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRRecRepADSusp: " & RetItemRRecRepADR9001.VlrCRRecRepADSusp & vbNewLine
            Next
            'ok até aqui
            For k = 0 To RetConsultaItem.R9001.CountRRecEspetDesp - 1
            Set RetItemRRecEspetDespR9001 = RetConsultaItem.R9001.RRecEspetDesp(k)
            tbRetorno.Text = tbRetorno.Text & "      RRecEspetDesp:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRRecEspetDesp: " & RetItemRRecEspetDespR9001.CRRecEspetDesp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrReceitaTotal: " & RetItemRRecEspetDespR9001.VlrReceitaTotal & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRRecEspetDesp: " & RetItemRRecEspetDespR9001.VlrCRRecEspetDesp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRRecEspetDespSusp: " & RetItemRRecEspetDespR9001.VlrCRRecEspetDespSusp & vbNewLine
            'ok até aqui
            Next
            End If

            'R9011
            If RetConsultaItem.R9011.IsEmpty = False Then
            For k = 0 To RetConsultaItem.R9011.CountRTom - 1
            Set RetItemRTomR9011 = RetConsultaItem.R9011.RTom(k)
            tbRetorno.Text = tbRetorno.Text & "      R9011 " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      RTom:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CnpjPrestr: " & RetItemRTomR9011.CnpjPrestador & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalBaseRet: " & RetItemRTomR9011.VlrTotalBaseRet & vbNewLine
                For l = 0 To RetItemRTomR9011.CountInfoCRTom - 1
                    Set RetItemInfoCRTomR9011 = RetItemRTomR9011.InfoCRTom(l)

                    tbRetorno.Text = tbRetorno.Text & "       InfoCRTOM: " & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        CRTom: " & RetItemInfoCRTomR9011.CRTom & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        VlrCRTom: " & RetItemInfoCRTomR9011.VlrCRTom & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        VlrCRTomSusp: " & RetItemInfoCRTomR9011.VlrCRTomSusp & vbNewLine
                Next
            Next
            For k = 0 To RetConsultaItem.R9011.CountRComl - 1
            Set RetItemRComlR9011 = RetConsultaItem.R9011.RComl(k)
            tbRetorno.Text = tbRetorno.Text & "      R9011 " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      RComl:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRComl: " & RetItemRComlR9011.CRComl & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRComl: " & RetItemRComlR9011.VlrCRComl & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRComlSusp: " & RetItemRComlR9011.VlrCRComlSusp & vbNewLine

            Next
            For k = 0 To RetConsultaItem.R9011.CountRCPRB - 1
            Set RetItemRCPRBR9011 = RetConsultaItem.R9011.RCPRB(k)
            tbRetorno.Text = tbRetorno.Text & "      R9011 " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      RCPRB:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CodRec: " & RetItemRCPRBR9011.CodRec & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCPApurTotal: " & RetItemRCPRBR9011.VlrCPApurTotal & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCPRBSusp: " & RetItemRCPRBR9011.VlrCPRBSusp & vbNewLine
            Next
            For k = 0 To RetConsultaItem.R9011.CountRPrest - 1
            Set RetItemRPrestR9011 = RetConsultaItem.R9011.RPrest(k)
            tbRetorno.Text = tbRetorno.Text & "      R9011 " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      RPrest:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      TpInscTomr: " & RetItemRPrestR9011.TpInscTomador & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      NrInscTomr: " & RetItemRPrestR9011.NrInscTomador & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalBaseRet: " & RetItemRPrestR9011.VlrTotalBaseRet & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalRetAdic: " & RetItemRPrestR9011.VlrTotalRetAdic & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalNRetPrinc: " & RetItemRPrestR9011.VlrTotalNRetPrinc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalNRetAdic: " & RetItemRPrestR9011.VlrTotalNRetAdic & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrTotalRetPrinc: " & RetItemRPrestR9011.VlrTotalRetPrinc & vbNewLine

            Next
            For k = 0 To RetConsultaItem.R9011.CountRRecRepAD - 1
            Set RetItemRRecRepADR9011 = RetConsultaItem.R9011.RRecRepAD(k)
            tbRetorno.Text = tbRetorno.Text & "      R9011 " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      RRecRepAD:  " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRRecRepAD: " & RetItemRRecRepADR9011.CRRecRepAD & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRRecRepAD: " & RetItemRRecRepADR9011.VlrCRRecRepAD & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRRecRepADSusp: " & RetItemRRecRepADR9011.VlrCRRecRepADSusp & vbNewLine
            Next
            End If

            'R9005
            'TotApurSem
            If RetConsultaItem.R9005.IsEmpty = False Then
            For k = 0 To RetConsultaItem.R9005.CountTotApurSem - 1
            Set RetItemTotApurSemR9005 = RetConsultaItem.R9005.TotApurSem(k)
            tbRetorno.Text = tbRetorno.Text & "      R9005 " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      TotApurSem " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrBaseCRSemSusp " & RetItemTotApurSemR9005.VlrBaseCRSemSusp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      NatRend " & RetItemTotApurSemR9005.NatRend & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrBaseCRSem " & RetItemTotApurSemR9005.VlrBaseCRSem & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      PerApurSem " & RetItemTotApurSemR9005.PerApurSem & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRSem " & RetItemTotApurSemR9005.CRSem & vbNewLine
            'TotApurTribSem
            Set RetItemTotApurTribSemR9005 = RetItemTotApurSemR9005.TotApurTribSem
            tbRetorno.Text = tbRetorno.Text & "      TotApurTribSem " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrCRSemSuspInf " & RetItemTotApurTribSemR9005.VlrCRSemSuspInf & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrCRSemCalc " & RetItemTotApurTribSemR9005.VlrCRSemCalc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrCRSemInf " & RetItemTotApurTribSemR9005.VlrCRSemInf & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrCRSemSuspCalc " & RetItemTotApurTribSemR9005.VlrCRSemSuspCalc & vbNewLine
            Next

            'TotApurQui
            For k = 0 To RetConsultaItem.R9005.CountTotApurQui - 1
            Set RetItemTotApurQuiR9005 = RetConsultaItem.R9005.TotApurQui(k)
            tbRetorno.Text = tbRetorno.Text & "      TotApurQui " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      NatRend " & RetItemTotApurQuiR9005.NatRend & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrBaseCRQuiSusp " & RetItemTotApurQuiR9005.VlrBaseCRQuiSusp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrBaseCRQui " & RetItemTotApurQuiR9005.VlrBaseCRQui & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      perApurQui " & RetItemTotApurQuiR9005.PerApurQui & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRQui " & RetItemTotApurQuiR9005.CRQui & vbNewLine
            'TotApurTribQui
            Set RetItemTotApurTribQuiR9005 = RetItemTotApurQuiR9005.TotApurTribQui
            tbRetorno.Text = tbRetorno.Text & "      TotApurTribQui " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRQuiSuspCalc " & RetItemTotApurTribQuiR9005.VlrCRQuiSuspCalc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrCRQuiInf " & RetItemTotApurTribQuiR9005.VlrCRQuiInf & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrCRQuiSuspInf " & RetItemTotApurTribQuiR9005.VlrCRQuiSuspInf & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrCRQuiCalc " & RetItemTotApurTribQuiR9005.VlrCRQuiCalc & vbNewLine
            Next
            'TotApurMen
            For k = 0 To RetConsultaItem.R9005.CountTotApurMen - 1
            Set RetItemTotApurMenR9005 = RetConsultaItem.R9005.TotApurMen(k)
            tbRetorno.Text = tbRetorno.Text & "      TotApurMen " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      NatRend " & RetItemTotApurMenR9005.NatRend & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrBaseCRMen " & RetItemTotApurMenR9005.VlrBaseCRMen & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrBaseCRMenSusp " & RetItemTotApurMenR9005.VlrBaseCRMenSusp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRMen " & RetItemTotApurMenR9005.CRMen & vbNewLine
            'TotApurTribMen
            Set RetItemTotApurTribMenR9005 = RetItemTotApurMenR9005.TotApurTribMen
            tbRetorno.Text = tbRetorno.Text & "      TotApurTribMen " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRMenCalc " & RetItemTotApurTribMenR9005.VlrCRMenCalc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrCRMenSuspCalc " & RetItemTotApurTribMenR9005.VlrCRMenSuspCalc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrCRMenInf " & RetItemTotApurTribMenR9005.VlrCRMenInf & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrCRMenSuspInf " & RetItemTotApurTribMenR9005.VlrCRMenSuspInf & vbNewLine
            Next
            'TotApurDia
            For k = 0 To RetConsultaItem.R9005.CountTotApurDia - 1
            Set RetItemTotApurDiaR9005 = RetConsultaItem.R9005.TotApurDia(k)
            tbRetorno.Text = tbRetorno.Text & "      TotApurDia " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      NatRend " & RetItemTotApurDiaR9005.NatRend & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrBaseCRDia " & RetItemTotApurDiaR9005.VlrBaseCRDia & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      perApurDia " & RetItemTotApurDiaR9005.PerApurDia & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRDia " & RetItemTotApurDiaR9005.CRDia & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrBaseCRDiaSusp " & RetItemTotApurDiaR9005.VlrBaseCRDiaSusp & vbNewLine
            'TotApurTribDia
            Set RetItemTotApurTribDiaR9005 = RetItemTotApurDiaR9005.TotApurTribDia
            tbRetorno.Text = tbRetorno.Text & "      TotApurTribDia " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRDiaInf " & RetItemTotApurTribDiaR9005.VlrCRDiaInf & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRDiaCalc " & RetItemTotApurTribDiaR9005.VlrCRDiaCalc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrCRDiaSuspCalc " & RetItemTotApurTribDiaR9005.VlrCRDiaSuspCalc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrCRDiaSuspInf " & RetItemTotApurTribDiaR9005.VlrCRDiaSuspInf & vbNewLine
            Next
            'TotApurDec
            For k = 0 To RetConsultaItem.R9005.CountTotApurDec - 1
            Set RetItemTotApurDecR9005 = RetConsultaItem.R9005.TotApurDec(k)
            tbRetorno.Text = tbRetorno.Text & "      TotApurDec " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      VlrBaseCRDecSusp " & RetItemTotApurDecR9005.VlrBaseCRDecSusp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      natRend " & RetItemTotApurDecR9005.NatRend & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      vlrBaseCRDec " & RetItemTotApurDecR9005.VlrBaseCRDec & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      perApurDec " & RetItemTotApurDecR9005.PerApurDec & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CRDec " & RetItemTotApurDecR9005.CRDec & vbNewLine
            Next
            End If

            'R9015
            If RetConsultaItem.R9015.IsEmpty = False Then
            tbRetorno.Text = tbRetorno.Text & "      R9015 " & vbNewLine

            For k = 0 To RetConsultaItem.R9015.CountInfoCR_CNR - 1
            Set RetItemInfoCR_CNRR9015 = RetConsultaItem.R9015.InfoCR_CNR(k)
            tbRetorno.Text = tbRetorno.Text & "      infoCR_CNR " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      NrRecArqBase " & RetItemInfoCR_CNRR9015.NrRecArqBase & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      IndExistInfo " & RetItemInfoCR_CNRR9015.IndExistInfo & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      IdentEscritDCTF " & RetItemInfoCR_CNRR9015.IdentEscritDCTF & vbNewLine
                For l = 0 To RetItemInfoCR_CNRR9015.CountTotApurSem - 1
                Set RetItemTotApurSemR9015 = RetItemInfoCR_CNRR9015.TotApurSem(l)
                tbRetorno.Text = tbRetorno.Text & "      totApurSem " & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      natRend " & RetItemTotApurSemR9015.NatRend & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRSemSuspInf " & RetItemTotApurSemR9015.VlrCRSemSuspInf & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRSemDCTF " & RetItemTotApurSemR9015.VlrCRSemDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRSemCalc " & RetItemTotApurSemR9015.VlrCRSemCalc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRSemInf " & RetItemTotApurSemR9015.VlrCRSemInf & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRSemSuspDCTF " & RetItemTotApurSemR9015.VlrCRSemSuspDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRSemSuspCalc " & RetItemTotApurSemR9015.VlrCRSemSuspCalc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      perApurSem " & RetItemTotApurSemR9015.PerApurSem & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      CRSem " & RetItemTotApurSemR9015.CRSem & vbNewLine
                Next

                For l = 0 To RetItemInfoCR_CNRR9015.CountTotApurQui - 1
                Set RetItemTotApurQuiR9015 = RetItemInfoCR_CNRR9015.TotApurQui(l)
                tbRetorno.Text = tbRetorno.Text & "      totApurQui " & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRQuisSuspCalc " & RetItemTotApurQuiR9015.VlrCRQuisSuspCalc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRQuiSuspDCTF " & RetItemTotApurQuiR9015.VlrCRQuiSuspDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRQuiInf " & RetItemTotApurQuiR9015.VlrCRQuiInf & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      natRend " & RetItemTotApurQuiR9015.NatRend & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRQuiSuspInf " & RetItemTotApurQuiR9015.VlrCRQuiSuspInf & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRQuiDCTF " & RetItemTotApurQuiR9015.VlrCRQuiDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRQuiCalc " & RetItemTotApurQuiR9015.VlrCRQuiCalc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      perApurQui " & RetItemTotApurQuiR9015.PerApurQui & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      CRQui " & RetItemTotApurQuiR9015.CRQui & vbNewLine
                Next

                For l = 0 To RetItemInfoCR_CNRR9015.CountTotApurMen - 1
                Set RetItemTotApurMenR9015 = RetItemInfoCR_CNRR9015.TotApurMen(l)
                tbRetorno.Text = tbRetorno.Text & "      totApurMen " & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      VlrCRMenDCTF " & RetItemTotApurMenR9015.VlrCRMenDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRMenCalc " & RetItemTotApurMenR9015.VlrCRMenCalc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      natRend " & RetItemTotApurMenR9015.NatRend & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRMenSuspDCTF " & RetItemTotApurMenR9015.VlrCRMenSuspDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRMenSuspCalc " & RetItemTotApurMenR9015.VlrCRMenSuspCalc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRMenInf " & RetItemTotApurMenR9015.VlrCRMenInf & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRMenSuspInf " & RetItemTotApurMenR9015.VlrCRMenSuspInf & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      CRMen " & RetItemTotApurMenR9015.CRMen & vbNewLine
                Next

                For l = 0 To RetItemInfoCR_CNRR9015.CountTotApurDia - 1
                Set RetItemTotApurDiaR9015 = RetItemInfoCR_CNRR9015.TotApurDia(l)
                tbRetorno.Text = tbRetorno.Text & "      totApurDia " & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRDiaInf " & RetItemTotApurDiaR9015.VlrCRDiaInf & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      natRend " & RetItemTotApurDiaR9015.NatRend & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRDiaDCTF " & RetItemTotApurDiaR9015.VlrCRDiaDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRDiaCalc " & RetItemTotApurDiaR9015.VlrCRDiaCalc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRDiaSuspDCTF " & RetItemTotApurDiaR9015.VlrCRDiaSuspDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRDiaSuspCalc " & RetItemTotApurDiaR9015.VlrCRDiaSuspCalc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      perApurDia " & RetItemTotApurDiaR9015.PerApurDia & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      CRDia " & RetItemTotApurDiaR9015.CRDia & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRDiaSuspInf " & RetItemTotApurDiaR9015.VlrCRDiaSuspInf & vbNewLine
                Next

                For l = 0 To RetItemInfoCR_CNRR9015.CountTotApurDec - 1
                Set RetItemTotApurDecR9015 = RetItemInfoCR_CNRR9015.TotApurDec(l)
                tbRetorno.Text = tbRetorno.Text & "      totApurDec " & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      VlrCRDecSuspInf " & RetItemTotApurDecR9015.VlrCRDecSuspInf & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      natRend " & RetItemTotApurDecR9015.NatRend & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRDecInf " & RetItemTotApurDecR9015.VlrCRDecInf & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRDecSuspDCTF " & RetItemTotApurDecR9015.VlrCRDecSuspDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRDecSuspCalc " & RetItemTotApurDecR9015.VlrCRDecSuspCalc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRDecDCTF " & RetItemTotApurDecR9015.VlrCRDecDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRDecCalc " & RetItemTotApurDecR9015.VlrCRDecCalc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      perApurDec " & RetItemTotApurDecR9015.PerApurDec & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      CRDec " & RetItemTotApurDecR9015.CRDec & vbNewLine
                Next
                Next

            For k = 0 To RetConsultaItem.R9015.CountInfoTotalCR - 1
            Set RetItemInfoTotalCR9015 = RetConsultaItem.R9015.InfoTotalCR(k)
            tbRetorno.Text = tbRetorno.Text & "      infoTotalCR " & vbNewLine
                For l = 0 To RetItemInfoTotalCR9015.CountTotApurSem - 1
                Set RetItemInfoTotalCR_TotApurSemR9015 = RetItemInfoTotalCR9015.TotApurSem(l)
                tbRetorno.Text = tbRetorno.Text & "      totApurSem " & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRSemDCTF " & RetItemInfoTotalCR_TotApurSemR9015.VlrCRSemDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRSemSuspDCTF " & RetItemInfoTotalCR_TotApurSemR9015.VlrCRSemSuspDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      perApurSem " & RetItemInfoTotalCR_TotApurSemR9015.PerApurSem & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      CRSem " & RetItemInfoTotalCR_TotApurSemR9015.CRSem & vbNewLine
                Next

                For l = 0 To RetItemInfoTotalCR9015.CountTotApurQui - 1
                Set RetItemInfoTotalCR_TotApurQuiR9015 = RetItemInfoTotalCR9015.TotApurQui(l)
                tbRetorno.Text = tbRetorno.Text & "      totApurQui " & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRQuiSuspDCTF " & RetItemInfoTotalCR_TotApurQuiR9015.VlrCRQuiSuspDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRQuiDCTF " & RetItemInfoTotalCR_TotApurQuiR9015.VlrCRQuiDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      perApurQui " & RetItemInfoTotalCR_TotApurQuiR9015.PerApurQui & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      CRQui " & RetItemInfoTotalCR_TotApurQuiR9015.CRQui & vbNewLine
                Next

                For l = 0 To RetItemInfoTotalCR9015.CountTotApurMen - 1
                Set RetItemInfoTotalCR_TotApurMenR9015 = RetItemInfoTotalCR9015.TotApurMen(l)
                tbRetorno.Text = tbRetorno.Text & "      totApurMen " & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRMenDCTF " & RetItemInfoTotalCR_TotApurMenR9015.VlrCRMenDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRMenSuspDCTF " & RetItemInfoTotalCR_TotApurMenR9015.VlrCRMenSuspDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      CRMen " & RetItemInfoTotalCR_TotApurMenR9015.CRMen & vbNewLine
                Next

                For l = 0 To RetItemInfoTotalCR9015.CountTotApurDia - 1
                Set RetItemInfoTotalCR_TotApurDiaR9015 = RetItemInfoTotalCR9015.TotApurDia(l)
                tbRetorno.Text = tbRetorno.Text & "      totApurDia " & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      PerApurDia " & RetItemInfoTotalCR_TotApurDiaR9015.PerApurDia & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      CRDia " & RetItemInfoTotalCR_TotApurDiaR9015.CRDia & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      VlrCRDiaDCTF " & RetItemInfoTotalCR_TotApurDiaR9015.VlrCRDiaDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRDiaSuspDCTF " & RetItemInfoTotalCR_TotApurDiaR9015.VlrCRDiaSuspDCTF & vbNewLine
                Next

                For l = 0 To RetItemInfoTotalCR9015.CountTotApurDec - 1
                Set RetItemInfoTotalCR_TotApurDecR9015 = RetItemInfoTotalCR9015.TotApurDec(l)
                tbRetorno.Text = tbRetorno.Text & "      totApurDec " & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRDecSuspDCTF " & RetItemInfoTotalCR_TotApurDecR9015.VlrCRDecSuspDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      vlrCRDecDCTF " & RetItemInfoTotalCR_TotApurDecR9015.VlrCRDecDCTF & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      perApurDec " & RetItemInfoTotalCR_TotApurDecR9015.PerApurDec & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "      CRDec " & RetItemInfoTotalCR_TotApurDecR9015.CRDec & vbNewLine
                Next
            Next
        End If

            For j = 0 To RetConsultaItem.Count - 1
            Set RetConsultaOcorrencia = RetConsultaItem.Ocorrencias(j)
            tbRetorno.Text = tbRetorno.Text & "        Ocorrencia de Evento N." & CStr(j + 1) & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        Código: " & RetConsultaOcorrencia.Codigo & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        Descrição: " & RetConsultaOcorrencia.Descricao & vbNewLine
        Next
         Next
        
    tbXmlEnvio.Text = RetConsulta.XmlEnviado
    tbXmlRetorno.Text = RetConsulta.XmlRetorno
            
            
End Sub

Private Sub btnEnviar_Click()
    Dim RetEnvio As spdReinfRetEnviarLoteEventos
    
    Set RetEnvio = reinf.EnviarLoteEventos(tbRetorno.Text)
    
    tbRetorno.Text = "### INCLUIR EVENTO ###" & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Identificador do Lote: " & RetEnvio.IdLote & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Mensagem de Retorno: " & RetEnvio.Mensagem
    
    txtIdlote.Text = RetEnvio.IdLote
End Sub

Private Sub btnGerarXML_Click()
    tbRetorno.Text = reinf.GerarXMLporTx2(tbRetorno.Text)
End Sub

Private Sub Form_Load()
Set reinf = New ReinfClientX.spdReinfClientX

'informar o CNPJ e token da software house para correto comportamento

reinf.ConfigurarSoftwareHouse txtCNPJSH.Text, txtTokenSh.Text

Dim vetor As Variant
Dim vetor2 As Variant
Dim i As Integer
Dim versao As Variant
Dim j As Integer

Form1.Caption = "Reinf - Tecnospeed " & reinf.versao
vetor = Split(reinf.ListarCertificados("|"), "|")
cbCertificado.Clear
For i = LBound(vetor) To UBound(vetor)
cbCertificado.AddItem vetor(i)
Next
    
    vetor2 = Split(reinf.ListarVersaoManual("|"), "|")
    cbVersao.Clear
    For i = LBound(vetor) To UBound(vetor)
    cbVersao.AddItem vetor2(i)
    Next


End Sub


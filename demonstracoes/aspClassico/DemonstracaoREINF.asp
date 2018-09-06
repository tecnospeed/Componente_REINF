<%
	'Instanciando o componente no projeto: 
	Set REINF = Server.CreateObject("ReinfClientX.spdReinfClientX")

	Versao = REINF.Versao
	
	response.Write("Componente REINF Tecnospeed TI - " + Versao) %> <br> <br>  <%
	
	
	
	'------------------------------------------------------------------------------------------------------------
	
	
	'>> 1- Configurando os CNPJs:
	
	REINF.CpfCnpjEmpregador = "08187168"
	REINF.DiretorioTemplates = "C:\Program Files\TecnoSpeed\Reinf\Arquivos\Templates\"
	REINF.DiretorioEsquemas = "C:\Program Files\TecnoSpeed\Reinf\Arquivos\Esquemas\"
	REINF.Ambiente = "2"
	REINF.VersaoManual = "1.3.02"
	REINF.ConfigurarSoftwareHouse "CNP SH", "Token SH"   'Criar conta no link: conta.tecnospeed.com.br
	REINF.NomeCertificado = "Nome do Certificado"
	
	response.Write("Componente  configurado") %> <br> <br>  <%
	
	
	
	
	'------------------------------------------------------------------------------------------------------------
	
	'2 - Gerando o XML:
	Response.Buffer = True
	Dim ArquivoTx2
	'-- Cria o Objeto de leitura:
	Set ArquivoTx2 = Server.CreateObject("Microsoft.XMLHTTP")
	' Abre a URL indicada no metodo GET:
	ArquivoTx2.Open "GET", "C:\IIS\DemoIis\ExR1000.tx2", False
		
	'-- faz o Envio das Informações Requisitadas para o Servidor:
	ArquivoTx2.Send

	'-- Pega o Conteudo do TXT e coloca na Variável:
	ConteudoTX2 = ArquivoTx2.responseText
	
	'-- Limpa o 'cache' da Operação:
	Set xml = Nothing

	response.Write(">> 1- Gerar Xml: ") %> <br> <%
	XmlEvento = REINF.GerarXMLporTx2(ConteudoTX2)
	'Salva em um arquivo Texto
	Dim objeto, gravaArquivo, sArquivo
	Set objeto = CreateObject("Scripting.FileSystemObject")
	sArquivo = Server.MapPath ("XmlEnvioReinf.xml")
	Set gravaArquivo = objeto.CreateTextFile(sArquivo ,True)
	gravaArquivo.WriteLine(XmlEvento)
	gravaArquivo.close
	set objeto =nothing
	set gravaArquivo =nothing
	response.Write("XML gerado com sucesso!") %> <br> <br> <br> <%


	'------------------------------------------------------------------------------------------------------------

	' 3 - Assinando o XML
	response.Write(">> 2- Assinar XMl: ") %> <br> <%
	XmlAssinado = REINF.AssinarEvento(XmlEvento)

	'Salva em um arquivo Texto
	Dim objeto2, gravaArquivo2, sArquivo2
	Set objeto2 = CreateObject("Scripting.FileSystemObject")
	sArquivo2 = Server.MapPath ("XmlAssinadoReinf.xml")
	Set gravaArquivo2 = objeto2.CreateTextFile(sArquivo2 ,True)
	gravaArquivo2.WriteLine(XmlAssinado)
	gravaArquivo2.close
	set objeto2 =nothing
	set gravaArquivo2 =nothing
	response.Write("XML Assinado com sucesso!") %> <br> <br> <br> <%

	'------------------------------------------------------------------------------------------------------------

	'4 - Enviando o Evento;
	response.Write(">> 3- Enviar o XMl: ") %> <br> <%
	Set Enviar = REINF.EnviarLoteEventos(XmlAssinado)
	response.Write("Id lote: " & Enviar.Idlote) %> <br> <%
	response.Write("Mensagem: " & Enviar.Mensagem) %> <br> <br> <br> <%


	'------------------------------------------------------------------------------------------------------------

	' 5 - Consultando o Evento;
	
	Set Consultar = REINF.ConsultarLoteEventos(Enviar.Idlote) 
	response.Write("Numero do Protocolo: " & Consultar.NumeroProtocolo) %> <br> <%
  	response.Write("Mensagem de Retorno: " & Consultar.Mensagem) %> <br> <%
  	response.Write("Status do Lote: " & Consultar.Status) %> <br> <%
	XmlRetorno = Consultar.XmlRetorno

	Dim objeto3, gravaArquivo3, sArquivo3
	Set objeto3 = CreateObject("Scripting.FileSystemObject")
	sArquivo3 = Server.MapPath ("XmlRetornoReinf.xml")
	Set gravaArquivo3 = objeto3.CreateTextFile(sArquivo3 ,True)
	gravaArquivo3.WriteLine(XmlRetorno)
	gravaArquivo3.close
	set objeto3 =nothing
	set gravaArquivo3 =nothing	
	For i = 0 To (Consultar.Count - 1)
	Set Eventos = Consultar.Eventos(i)
    response.Write("    Evento: " & Cstr(i) & ":") %> <br> <%
    response.Write("    Id Evento: " & Eventos.IdEvento) %> <br> <%
    response.Write("    Numero Recibo: " & Eventos.NumeroRecibo) %> <br> <%
    response.Write("    Codigo de Status: " & Eventos.cStat) %> <br> <%
    response.Write("    Mensagem: " & Eventos.Mensagem) %> <br> <%
    response.Write("    Status  Evento: " & Eventos.Status) %> <br> <%
    	For j = 0 To (Eventos.Count -1)
		  Set OcorrenciasEnvio = Eventos.Ocorrencias(j)
    	  response.Write("        Ocorrencia: " & Cstr(j) & ":") %> <br> <%
    	  response.Write("        Codigo: " & OcorrenciasEnvio.Codigo) %> <br> <%
    	  response.Write("        Descricao: " & OcorrenciasEnvio.Descricao) %> <br> <%
    	Next


		'Inicio da consulta do R5001
		Set R5001 = Eventos.R5001 
		if R5001.IsEmpty = false then
        response.Write("     R5001") %> <br> <%
        response.Write("      PeriodoApuracao: " & R5001.PeriodoApuracao) %> <br> <%
        response.Write("      NrInsc: " & R5001.NrInsc) %> <br> <%
        response.Write("      TpInsc: " & R5001.TpInsc) %> <br> <%
        response.Write("      NrRecArqBase: " & R5001.NrRecArqBase) %> <br> <%
        For a = 0 To (R5001.CountRTom - 1)
			Set RTom5001 = R5001.RTom(a)
            response.Write("      RTom:  ") %> <br> <%
            response.Write("      CnpjPrestador: " & RTom5001.CnpjPrestador) %> <br> <%
            response.Write("      VlrTotalBaseRet: " & RTom5001.VlrTotalBaseRet) %> <br> <%
                For b = 0 To (RTom5001.CountInfoCRTom - 1)
				Set CRTom5001 = RTom5001.InfoCRTom(b)
                    response.Write("       InfoCRTOM: ") %> <br> <%				
                    response.Write("        CRTom: " & CRTom5001.CRTom) %> <br> <%
                    response.Write("        VlrCRTom: " & CRTom5001.VlrCRTom) %> <br> <%
                    response.Write("        VlrCRTomSusp: " & CRTom5001.VlrCRTomSusp) %> <br> <%
                Next
        Next
        For a = 0 To (R5001.CountRComl - 1)
			Set RComl5001 = R5001.RComl(a)
            response.Write("      RComl:  ") %> <br> <%
            response.Write("      CRComl: " & RComl5001.CRComl) %> <br> <%
            response.Write("      VlrCRComl: " & RComl5001.VlrCRComl) %> <br> <%
            response.Write("      VlrCRComlSusp: " & RComl5001.VlrCRComlSusp) %> <br> <%
        Next
        For a = 0 To (R5001.CountRCPRB - 1)
			Set RCPRB5001 = R5001.RCPRB(a)
            response.Write("      RCPRB:  ") %> <br> <%
            response.Write("      CRCPRB: " & RCPRB5001.CRCPRB) %> <br> <%
            response.Write("      VlrCRCPRB: " & RCPRB5001.VlrCRCPRB) %> <br> <%
            response.Write("      VlrCRCPRBSusp: " & RCPRB5001.VlrCRCPRBSusp) %> <br> <%
        Next
        For a = 0 To (R5001.CountRPrest - 1)
			Set RPrest5001 = R5001.RPrest(a)
            response.Write("      RPrest:  ") %> <br> <%
            response.Write("      TpInscTomador: " & RPrest5001.TpInscTomador) %> <br> <%
            response.Write("      NrInscTomador: " & RPrest5001.NrInscTomador) %> <br> <%
            response.Write("      VlrTotalBaseRet: " & RPrest5001.VlrTotalBaseRet) %> <br> <%
            response.Write("      VlrTotalRetAdic: " & RPrest5001.VlrTotalRetAdic) %> <br> <%
            response.Write("      VlrTotalNRetPrinc: " & RPrest5001.VlrTotalNRetPrinc) %> <br> <%
            response.Write("      VlrTotalNRetAdic: " & RPrest5001.VlrTotalNRetAdic) %> <br> <%
            response.Write("      VlrTotalRetPrinc: " & RPrest5001.VlrTotalRetPrinc) %> <br> <%
        Next
        For a = 0 To (R5001.CountRRecRepAD - 1)
			Set RRecRepAD5001 = R5001.RRecRepAD(a)
            response.Write("      RRecRepAD:  ") %> <br> <%
            response.Write("      CnpjAssocDesp: " & RRecRepAD5001.CnpjAssocDesp) %> <br> <%
            response.Write("      VlrTotalRep: " & RRecRepAD5001.VlrTotalRep) %> <br> <%
            response.Write("      CRRecRepAD: " & RRecRepAD5001.CRRecRepAD) %> <br> <%
            response.Write("      VlrCRRecRepAD: " & RRecRepAD5001.VlrCRRecRepAD) %> <br> <%
            response.Write("      VlrCRRecRepADSusp: " & RRecRepAD5001.VlrCRRecRepADSusp) %> <br> <%
        Next
        For a = 0 To (R5001.CountRRecEspetDesp - 1)
			Set RRecEspetDesp5001 = R5001.RRecEspetDesp(a)
            response.Write("      RRecEspetDesp:  ") %> <br> <%
            response.Write("      CRRecEspetDesp: " & RRecEspetDesp5001.CRRecEspetDesp) %> <br> <%
            response.Write("      VlrReceitaTotal: " & RRecEspetDesp5001.VlrReceitaTotal) %> <br> <%
            response.Write("      VlrCRRecEspetDesp: " & RRecEspetDesp5001.VlrCRRecEspetDesp) %> <br> <%
            response.Write("      VlrCRRecEspetDespSusp: " & RRecEspetDesp5001.VlrCRRecEspetDespSusp) %> <br> <%
        Next
		end if
		'Fim da consulta do R5001


		'Inicio da Consulta do R5011
		Set R5011 = Eventos.R5011
		if R5011.IsEmpty = false then
        For a = 0 To (R5011.CountRTom - 1)
			Set RTom5011 = R5011.RTom(a)
			response.Write("      R5011 ") %> <br> <%
            response.Write("      RTom:  ") %> <br> <%
            response.Write("      CnpjPrestador: " & RTom5011.CnpjPrestador) %> <br> <%
            response.Write("      VlrTotalBaseRet: " & RTom5011.VlrTotalBaseRet) %> <br> <%
            For b = 0 To (RTom5011.CountInfoCRTom - 1)
				Set CRTom5011 = RTom5011.InfoCRTom(b)
                response.Write("       InfoCRTOM: ") %> <br> <%
                response.Write("        CRTom: " & CRTom5011.CRTom) %> <br> <%
                response.Write("        VlrCRTom: " & CRTom5011.VlrCRTom) %> <br> <%
                response.Write("        VlrCRTomSusp: " & CRTom5011.VlrCRTomSusp) %> <br> <%
            Next                   
        Next
        For a = 0 To (R5011.CountRComl - 1)
			Set Rcoml5011 = R5011.RComl(a)
            response.Write("      R5011 ") %> <br> <%
            response.Write("      RComl:  ") %> <br> <%
            response.Write("      CRComl: " & Rcoml5011.CRComl) %> <br> <%
            response.Write("      vlrCRComl: " & Rcoml5011.vlrCRComl) %> <br> <%
            response.Write("      vlrCRComlSusp: " & Rcoml5011.vlrCRComlSusp) %> <br> <%

        Next
        For a = 0 To (R5011.CountRCPRB - 1)
			Set RCPRB5011 = R5011.RCPRB(a)
            response.Write("      R5011 ") %> <br> <%
            response.Write("      RCPRB:  ") %> <br> <%
            response.Write("      CodRec: " & RCPRB5011.CodRec) %> <br> <%
            response.Write("      VlrCPApurTotal: " & RCPRB5011.VlrCPApurTotal) %> <br> <%
            response.Write("      VlrCPRBSusp: " & RCPRB5011.VlrCPRBSusp) %> <br> <%
        Next
        For a = 0 To (R5011.CountRPrest - 1)
			Set RPrest5011 = R5011.RPrest(a)
            response.Write("      R5011 ") %> <br> <%
            response.Write("      RPrest:  ") %> <br> <%
            response.Write("      TpInscTomador: " & RPrest5011.TpInscTomador) %> <br> <%
            response.Write("      NrInscTomador: " & RPrest5011.NrInscTomador) %> <br> <%
            response.Write("      VlrTotalBaseRet: " & RPrest5011.VlrTotalBaseRet) %> <br> <%
            response.Write("      VlrTotalRetAdic: " & RPrest5011.VlrTotalRetAdic) %> <br> <%
            response.Write("      VlrTotalNRetPrinc: " & RPrest5011.VlrTotalNRetPrinc) %> <br> <%
            response.Write("      VlrTotalNRetAdic: " & RPrest5011.VlrTotalNRetAdic) %> <br> <%
            response.Write("      VlrTotalRetPrinc: " & RPrest5011.VlrTotalRetPrinc) %> <br> <%
        Next
        For a = 0 To (R5011.CountRRecRepAD - 1)
			Set RRecRepAD5011 = R5011.RRecRepAD(a)
            response.Write("      R5011 ") %> <br> <%
            response.Write("      RRecRepAD:  ") %> <br> <%
            response.Write("      CnpjAssocDesp: " & RRecRepAD5011.CnpjAssocDesp) %> <br> <%
            response.Write("      VlrTotalRep: " & RRecRepAD5011.vlrTotalRep) %> <br> <%
            response.Write("      VlrTotalRet: " & RRecRepAD5011.CRRecRepAD) %> <br> <%
            response.Write("      VlrTotalNRet: " & RRecRepAD5011.vlrCRRecRepAD) %> <br> <%
			response.Write("      vlrCRRecRepADSusp: " & RRecRepAD5011.vlrCRRecRepADSusp) %> <br> <%
        Next
		end if
		'Fim da consulta do R5011		
  	Next %> <br> <%
	For k = 0 To (Consultar.CountOcorrencias - 1)
	    response.Write("    Codigo: " & Consultar.Ocorrencias(k).Codigo) %> <br> <%
	    response.Write("    Tipo: " & Consultar.Ocorrencias(k).Tipo) %> <br> <%
	    response.Write("    Descrição: " & Consultar.Ocorrencias(k).Descricao) %> <br> <%
	Next %> <br> <%

	'Fim da consulta
	%>
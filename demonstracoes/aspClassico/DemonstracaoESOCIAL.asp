<%
	'Instanciando o componente no projeto: 
	Set eSocial = Server.CreateObject("ESocialClientX.spdESocialClientX")

	Versao = eSocial.Versao
	
	response.Write("Componente eSocial Tecnospeed TI - " + Versao) %> <br> <br>  <%
	
	
	
	'------------------------------------------------------------------------------------------------------------
	
	
	'>> 1- Configurando os CNPJs:
	
	eSocial.CpfCnpjEmpregador = "08187168000160"
  eSocial.CpfCnpjTransmissor = "08187168000160"
	eSocial.DiretorioTemplates = "C:\Program Files\TecnoSpeed\eSocial\Arquivos\Templates\"
	eSocial.DiretorioEsquemas = "C:\Program Files\TecnoSpeed\eSocial\Arquivos\Esquemas\"
	eSocial.Ambiente = "2"
	eSocial.VersaoManual = "2.4.02"
	eSocial.ConfigurarSoftwareHouse "CNPJ SH", "Token SH"   'Criar conta no link: conta.tecnospeed.com.br
	eSocial.NomeCertificado = "Nome do Certificado"
	
	response.Write("Componente  configurado") %> <br> <br>  <%
	
	
	
	
	'------------------------------------------------------------------------------------------------------------
	
	'2 - Gerando o XML:
	Response.Buffer = True
	Dim ArquivoTx2
	'-- Cria o Objeto de leitura:
	Set ArquivoTx2 = Server.CreateObject("Microsoft.XMLHTTP")
	' Abre a URL indicada no metodo GET:
	ArquivoTx2.Open "GET", "C:\IIS\DemoIis\ExS1000.tx2", False
		
	'-- faz o Envio das Informações Requisitadas para o Servidor:
	ArquivoTx2.Send

	'-- Pega o Conteudo do TXT e coloca na Variável:
	ConteudoTX2 = ArquivoTx2.responseText
	
	'-- Limpa o 'cache' da Operação:
	Set xml = Nothing

	response.Write(">> 1- Gerar Xml: ") %> <br> <%
	XmlEvento = eSocial.GerarXMLporTx2(ConteudoTX2)
	'Salva em um arquivo Texto
	Dim objeto, gravaArquivo, sArquivo
	Set objeto = CreateObject("Scripting.FileSystemObject")
	sArquivo = Server.MapPath ("XmlEnvioESocial.xml")
	Set gravaArquivo = objeto.CreateTextFile(sArquivo ,True)
	gravaArquivo.WriteLine(XmlEvento)
	gravaArquivo.close
	set objeto =nothing
	set gravaArquivo =nothing
	response.Write("XML gerado com sucesso!") %> <br> <br> <br> <%


	'------------------------------------------------------------------------------------------------------------

	' 3 - Assinando o XML
	response.Write(">> 2- Assinar XMl: ") %> <br> <%
	XmlAssinado = eSocial.AssinarEvento(XmlEvento)

	'Salva em um arquivo Texto
	Dim objeto2, gravaArquivo2, sArquivo2
	Set objeto2 = CreateObject("Scripting.FileSystemObject")
	sArquivo2 = Server.MapPath ("XmlAssinadoESocial.xml")
	Set gravaArquivo2 = objeto2.CreateTextFile(sArquivo2 ,True)
	gravaArquivo2.WriteLine(XmlAssinado)
	gravaArquivo2.close
	set objeto2 =nothing
	set gravaArquivo2 =nothing
	response.Write("XML Assinado com sucesso!") %> <br> <br> <br> <%

	'------------------------------------------------------------------------------------------------------------

	'4 - Enviando o Evento %> <br> <%
	response.Write(">> 3- Enviar o XMl: ") %> <br> <%
	Set Enviar = eSocial.EnviarLoteEventos(XmlAssinado, 1)
	response.Write("Id lote: " & Enviar.Idlote) %> <br> <%
	response.Write("Mensagem: " & Enviar.Mensagem) %> <br> <br> <br> <%


	'------------------------------------------------------------------------------------------------------------

	' 5 - Consultando o Evento %> <br> <%
	
	Set Consultar = eSocial.ConsultarLoteEventos(Enviar.Idlote) 
	response.Write("Numero do Protocolo: " & Consultar.NumeroProtocolo) %> <br> <%
  	response.Write("Mensagem de Retorno: " & Consultar.Mensagem) %> <br> <%
  	response.Write("Status do Lote: " & Consultar.Status) %> <br> <%
	XmlRetorno = Consultar.XmlRetorno

	Dim objeto3, gravaArquivo3, sArquivo3
	Set objeto3 = CreateObject("Scripting.FileSystemObject")
	sArquivo3 = Server.MapPath ("XmlRetornoESocial.xml")
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
    	Next %> <br> <%
        'Inicio da consulta do S5001
        Set S5001 = Eventos.S5001
        if S5001.IsEmpty = false then
            response.Write("        ### S5001 ###") %> <br> <%
            response.Write("        Id: " + S5001.Id) %> <br> <%
            'IdeEvento
            response.Write("        nrRecArqBase: " + S5001.IdeEvento.NrRecArqBase) %> <br> <%
            response.Write("        indApuracao: " + S5001.IdeEvento.indApuracao) %> <br> <%
            response.Write("        perApur: " + S5001.IdeEvento.perApur) %> <br> <%
            'IdeEmpregador
            response.Write("        tpInsc: " + S5001.IdeEmpregador.tpInsc) %> <br> <%
            response.Write("        nrInsc: " + S5001.IdeEmpregador.nrInsc) %> <br> <%
            'IdeTrabalhador
            response.Write("        cpfTrab: " + S5001.IdeTrabalhador.cpfTrab) %> <br> <%
            'ProcJudTrab
            for a = 0 to (S5001.IdeTrabalhador.CountProcJudTrab - 1) 
              response.Write("        NrProcJud: " + S5001.IdeTrabalhador.ProcJudTrab(a).NrProcJud) %> <br> <%
              response.Write("        codSusp: " + S5001.IdeTrabalhador.ProcJudTrab(a).codSusp) %> <br> <%
            Next %> <br> <%
            'InfoCpCalc
            for a = 0 to (S5001.CountInfoCpCalc - 1)
              response.Write("        tpCR: " + S5001.InfoCpCalc(a).tpCR) %> <br> <%
              response.Write("        vrCpSeg: " + S5001.InfoCpCalc(a).vrCpSeg) %> <br> <%
              response.Write("        vrDescSeg: " + S5001.InfoCpCalc(a).vrDescSeg) %> <br> <%
            Next %> <br> <%
            'IdeEstabLot
            for a = 0 to (S5001.InfoCp.CountIdeEstabLot - 1)
              response.Write("        vrDescSeg: " + S5001.InfoCp.IdeEstabLot(a).TpInsc) %> <br> <%
              response.Write("        nrInsc: " + S5001.InfoCp.IdeEstabLot(a).nrInsc) %> <br> <%
              response.Write("        codLotacao: " + S5001.InfoCp.IdeEstabLot(a).codLotacao) %> <br> <%
              'InfoCategIncid
              for b = 0 to (S5001.InfoCp.IdeEstabLot(a).CountInfoCategIncid - 1)
                response.Write("        vrDescSeg: " + S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).Matricula) %> <br> <%
                response.Write("        codCateg: " + S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).codCateg) %> <br> <%
                response.Write("        indSimples: " + S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).indSimples) %> <br> <%
                'InfoBaseCS
                for c = 0 to (S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CountInfoBaseCS - 1)
                  response.Write("        Ind13: " + S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoBaseCS(c).Ind13) %> <br> <%
                  response.Write("        tpValor: " + S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoBaseCS(c).tpValor) %> <br> <%
                  response.Write("        valor: " + S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoBaseCS(c).valor) %> <br> <%
                Next %> <br> <%
                'CalcTerc
                for c = 0 to (S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CountCalcTerc - 1)
                  response.Write("        tpCR: " + S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CalcTerc(c).tpCR) %> <br> <%
                  response.Write("        vrCsSegTerc: " + S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CalcTerc(c).vrCsSegTerc) %> <br> <%
                  response.Write("        vrDescTerc: " + S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CalcTerc(c).vrDescTerc) %> <br> <%
                Next %> <br> <%
              Next %> <br> <%
            Next %> <br> <%
        end if
        'Fim da consulta do S5001
        Set S5002 = Eventos.S5002
        if S5002.IsEmpty = false then
            response.Write("        ### S5002 ###") %> <br> <%
            response.Write("        Id: " + S5002.Id) %> <br> <%
            'IdeEvento
            response.Write("        nrRecArqBase: " + S5002.IdeEvento.nrRecArqBase) %> <br> <%
            response.Write("        perApur: " + S5002.IdeEvento.perApur) %> <br> <%
            'IdeEmpregador
            response.Write("        tpInsc: " + S5002.IdeEmpregador.tpInsc) %> <br> <%
            response.Write("        nrInsc: " + S5002.IdeEmpregador.nrInsc) %> <br> <%
            'IdeTrabalhador
            response.Write("        cpfTrab: " + S5002.IdeTrabalhador.cpfTrab) %> <br> <%
            'InfoDep
            response.Write("        vrDedDep: " + S5002.InfoDep.vrDedDep) %> <br> <%
            'InfoIrrf
            for a = 0 to (S5002.CountInfoIrrf - 1)
                response.Write("        codCateg: " + S5002.InfoIrrf(a).codCateg) %> <br> <%
                response.Write("        indResBr: " + S5002.InfoIrrf(a).indResBr) %> <br> <%
                'BasesIrrf
                for b = 0 to (S5002.InfoIrrf(a).CountBasesIrrf - 1)
                 response.Write("        tpValor: " + S5002.InfoIrrf(a).BasesIrrf(b).tpValor) %> <br> <%
                 response.Write("        Valor: " + S5002.InfoIrrf(a).BasesIrrf(b).Valor) %> <br> <%
                Next %> <br> <%
                'Irrf
                for b = 0 to (S5002.InfoIrrf(a).CountIrrf - 1)
                 response.Write("        tpCR: " + S5002.InfoIrrf(a).Irrf(b).tpCR) %> <br> <%
                 response.Write("        vrIrrfDesc: " + S5002.InfoIrrf(a).Irrf(b).vrIrrfDesc) %> <br> <%
                Next %> <br> <%
                'IdePais
                response.Write("        codPais: " + S5002.InfoIrrf(a).IdePgtoExt.IdePais.codPais) %> <br> <%
                response.Write("        indNIF: " + S5002.InfoIrrf(a).IdePgtoExt.IdePais.indNIF) %> <br> <%
                response.Write("        nifBenef: " + S5002.InfoIrrf(a).IdePgtoExt.IdePais.nifBenef) %> <br> <%
                'EndExt
                response.Write("        dscLograd: " + S5002.InfoIrrf(a).IdePgtoExt.EndExt.dscLograd) %> <br> <%
                response.Write("        nrLograd: " + S5002.InfoIrrf(a).IdePgtoExt.EndExt.nrLograd) %> <br> <%
                response.Write("        complem: " + S5002.InfoIrrf(a).IdePgtoExt.EndExt.complem) %> <br> <%
                response.Write("        bairro: " + S5002.InfoIrrf(a).IdePgtoExt.EndExt.bairro) %> <br> <%
                response.Write("        nmCid: " + S5002.InfoIrrf(a).IdePgtoExt.EndExt.nmCid) %> <br> <%
                response.Write("        codPostal: " + S5002.InfoIrrf(a).IdePgtoExt.EndExt.codPostal) %> <br> <%
            Next %> <br> <%
        end if
		'Inicio da Consulta do S5011
        if S5011.IsEmpty = false then
            response.Write("        ### S5011 ###") %> <br> <%
            response.Write("        Id: " + S5011.Id) %> <br> <%
            'IdeEvento
            response.Write("        indApuracao: " + S5011.IdeEvento.indApuracao) %> <br> <%
            response.Write("        perApur: " + S5011.IdeEvento.perApur) %> <br> <%
            'IdeEmpregador
            response.Write("        tpInsc: " + S5011.IdeEmpregador.tpInsc) %> <br> <%
            response.Write("        nrInsc: " + S5011.IdeEmpregador.nrInsc) %> <br> <%
            'InfoCS
            response.Write("        nrRecArqBase: " + S5011.InfoCS.nrRecArqBase) %> <br> <%
            response.Write("        indExistInfo: " + S5011.InfoCS.indExistInfo) %> <br> <%
            'InfoCPSeg
            response.Write("        vrDescCP: " + S5011.InfoCS.InfoCPSeg.vrDescCP) %> <br> <%
            response.Write("        vrCpSeg: " + S5011.InfoCS.InfoCPSeg.vrCpSeg) %> <br> <%
            'InfoContrib
            response.Write("        classTrib: " + S5011.InfoCS.InfoContrib.classTrib) %> <br> <%
            'InfoPJ
            response.Write("        indCoop: " + S5011.InfoCS.InfoContrib.InfoPJ.indCoop) %> <br> <%
            response.Write("        indConstr: " + S5011.InfoCS.InfoContrib.InfoPJ.indConstr) %> <br> <%
            response.Write("        indSubstPatr: " + S5011.InfoCS.InfoContrib.InfoPJ.indSubstPatr) %> <br> <%
            response.Write("        percRedContrib: " + S5011.InfoCS.InfoContrib.InfoPJ.percRedContrib) %> <br> <%
            'InfoAtConc
            response.Write("        fatorMes: " + S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.fatorMes) %> <br> <%
            response.Write("        fator13: " + S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.fator13) %> <br> <%
            'IdeEstab
            for a = 0 to (S5011.InfoCS.CountIdeEstab - 1)
              response.Write("        tpInsc: " + S5011.InfoCS.IdeEstab(a).tpInsc) %> <br> <%
              response.Write("        nrInsc: " + S5011.InfoCS.IdeEstab(a).nrInsc) %> <br> <%
              'InfoEstab
              response.Write("        cnaePrep: " + S5011.InfoCS.IdeEstab(a).InfoEstab.cnaePrep) %> <br> <%
              response.Write("        aliqRat: " + S5011.InfoCS.IdeEstab(a).InfoEstab.aliqRat) %> <br> <%
              response.Write("        fap: " + S5011.InfoCS.IdeEstab(a).InfoEstab.fap) %> <br> <%
              response.Write("        aliqRatAjust: " + S5011.InfoCS.IdeEstab(a).InfoEstab.aliqRatAjust) %> <br> <%
              'InfoComplObra
              response.Write("        indSubstPatrObra: " + S5011.InfoCS.IdeEstab(a).InfoEstab.InfoComplObra.indSubstPatrObra) %> <br> <%
              'IdeLotacao
              for b = 0 to (S5011.InfoCS.IdeEstab(a).CountIdeLotacao - 1)
                response.Write("        codLotacao: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).codLotacao) %> <br> <%
                response.Write("        fpas: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).fpas) %> <br> <%
                response.Write("        codTercs: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).codTercs) %> <br> <%
                response.Write("        codTercsSusp: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).codTercsSusp) %> <br> <%
                'InfoTercSusp
                for c = 0 to (S5011.InfoCS.IdeEstab(a).IdeLotacao(b).CountInfoTercSusp - 1)
                  response.Write("        codTerc: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoTercSusp(c).codTerc) %> <br> <%
                Next
                'InfoEmprParcial
                response.Write("        tpInscContrat: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoEmprParcial.tpInscContrat) %> <br> <%
                response.Write("        nrInscContrat: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoEmprParcial.nrInscContrat) %> <br> <%
                response.Write("        tpInscProp: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoEmprParcial.tpInscProp) %> <br> <%
                response.Write("        nrInscProp: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoEmprParcial.nrInscProp) %> <br> <%
                'DadosOpPort
                response.Write("        cnpjOpPortuario: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).DadosOpPort.cnpjOpPortuario) %> <br> <%
                response.Write("        aliqRat: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).DadosOpPort.aliqRat) %> <br> <%
                response.Write("        fap: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).DadosOpPort.fap) %> <br> <%
                response.Write("        aliqRatAjust: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).DadosOpPort.aliqRatAjust) %> <br> <%
                'BasesRemun
                for c = 0 to (S5011.InfoCS.IdeEstab(a).IdeLotacao(b).CountBasesRemun - 1)
                  response.Write("        indIncid: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).indIncid) %> <br> <%
                  response.Write("        codCateg: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).codCateg) %> <br> <%
                  'BasesCp
                  response.Write("        vrBcCp00: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrBcCp00) %> <br> <%
                  response.Write("        vrBcCp15: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrBcCp15) %> <br> <%
                  response.Write("        vrBcCp20: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrBcCp20) %> <br> <%
                  response.Write("        vrBcCp25: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrBcCp25) %> <br> <%
                  response.Write("        vrSuspBcCp00: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrSuspBcCp00) %> <br> <%
                  response.Write("        vrSuspBcCp15: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrSuspBcCp15) %> <br> <%
                  response.Write("        vrSuspBcCp20: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrSuspBcCp20) %> <br> <%
                  response.Write("        vrSuspBcCp25: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrSuspBcCp25) %> <br> <%
                  response.Write("        vrDescSest: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrDescSest) %> <br> <%
                  response.Write("        vrCalcSest: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrCalcSest) %> <br> <%
                  response.Write("        vrDescSenat: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrDescSenat) %> <br> <%
                  response.Write("        vrCalcSenat: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrCalcSenat) %> <br> <%
                  response.Write("        vrSalFam: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrSalFam) %> <br> <%
                  response.Write("        vrSalMat: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrSalMat) %> <br> <%
                Next
                'BasesAvNPort
                response.Write("        vrBcCp00: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.vrBcCp00) %> <br> <%
                response.Write("        vrBcCp15: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.vrBcCp15) %> <br> <%
                response.Write("        vrBcCp20: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.vrBcCp20) %> <br> <%
                response.Write("        vrBcCp25: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.vrBcCp25) %> <br> <%
                response.Write("        vrBcCp13: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.vrBcCp13) %> <br> <%
                response.Write("        vrBcFgts: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.vrBcFgts) %> <br> <%
                response.Write("        vrDescCP: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.vrDescCP) %> <br> <%
                'InfoSubstPatrOpPort
                for c = 0 to (S5011.InfoCS.IdeEstab(a).IdeLotacao(b).CountInfoSubstPatrOpOrt - 1)
                  response.Write("        cnpjOpPortuario: " + S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoSubstPatrOpPort(c).cnpjOpPortuario) %> <br> <%
                Next
              Next
              'BasesAquis
              for b = 0 to (S5011.InfoCS.IdeEstab(a).CountBasesAquis - 1)
                response.Write("        indAquis: " + S5011.InfoCS.IdeEstab(a).BasesAquis(b).indAquis) %> <br> <%
                response.Write("        vlrAquis: " + S5011.InfoCS.IdeEstab(a).BasesAquis(b).vlrAquis) %> <br> <%
                response.Write("        vrCPDescPR: " + S5011.InfoCS.IdeEstab(a).BasesAquis(b).vrCPDescPR) %> <br> <%
                response.Write("        vrCPNRet: " + S5011.InfoCS.IdeEstab(a).BasesAquis(b).vrCPNRet) %> <br> <%
                response.Write("        vrRatNRet: " + S5011.InfoCS.IdeEstab(a).BasesAquis(b).vrRatNRet) %> <br> <%
                response.Write("        vrSenarNRet: " + S5011.InfoCS.IdeEstab(a).BasesAquis(b).vrSenarNRet) %> <br> <%
                response.Write("        vrCPCalcPR: " + S5011.InfoCS.IdeEstab(a).BasesAquis(b).vrCPCalcPR) %> <br> <%
                response.Write("        vrRatDescPR: " + S5011.InfoCS.IdeEstab(a).BasesAquis(b).vrRatDescPR) %> <br> <%
                response.Write("        vrRatCalcPR: " + S5011.InfoCS.IdeEstab(a).BasesAquis(b).vrRatCalcPR) %> <br> <%
                response.Write("        vrSenarDesc: " + S5011.InfoCS.IdeEstab(a).BasesAquis(b).vrSenarDesc) %> <br> <%
                response.Write("        vrSenarCalc: " + S5011.InfoCS.IdeEstab(a).BasesAquis(b).vrSenarCalc) %> <br> <%
              Next
              'BasesComerc
              for b = 0 to (S5011.InfoCS.IdeEstab(a).CountBasesComerc - 1)
                response.Write("        indComerc: " + S5011.InfoCS.IdeEstab(a).BasesComerc(b).indComerc) %> <br> <%
                response.Write("        vrBcComPR: " + S5011.InfoCS.IdeEstab(a).BasesComerc(b).vrBcComPR) %> <br> <%
                response.Write("        vrCPSusp: " + S5011.InfoCS.IdeEstab(a).BasesComerc(b).vrCPSusp) %> <br> <%
                response.Write("        vrRatSusp: " + S5011.InfoCS.IdeEstab(a).BasesComerc(b).vrRatSusp) %> <br> <%
                response.Write("        vrSenarSusp: " + S5011.InfoCS.IdeEstab(a).BasesComerc(b).vrSenarSusp) %> <br> <%
              Next
              'InfoCREstab
              for b = 0 to (S5011.InfoCS.IdeEstab(a).CountInfoCREstab - 1)
                response.Write("        tpCR: " + S5011.InfoCS.IdeEstab(a).InfoCREstab(b).tpCR) %> <br> <%
                response.Write("        vrCR: " + S5011.InfoCS.IdeEstab(a).InfoCREstab(b).vrCR) %> <br> <%
                response.Write("        vrSuspCR: " + S5011.InfoCS.IdeEstab(a).InfoCREstab(b).vrSuspCR) %> <br> <%
              Next
            Next
            'infoCRContrib
            for a = 0 to (S5011.InfoCS.CountInfoCRContrib - 1)
              response.Write("        tpCR: " + S5011.InfoCS.infoCRContrib(a).tpCR) %> <br> <%
              response.Write("        vrCR: " + S5011.InfoCS.infoCRContrib(a).vrCR) %> <br> <%
              response.Write("        vrCRSusp: " + S5011.InfoCS.infoCRContrib(a).vrCRSusp) %> <br> <%
            Next
        end if	
        if not S5012.IsEmpty then
          response.Write("        ### S5012 ###") %> <br> <%
          response.Write("        Id: " + S5012.Id) %> <br> <%
          'IdeEvento
          response.Write("        perApur: " + S5012.IdeEvento.perApur) %> <br> <%
          'IdeEmpregador
          response.Write("        tpInsc: " + S5012.IdeEmpregador.tpInsc) %> <br> <%
          response.Write("        nrInsc: " + S5012.IdeEmpregador.nrInsc) %> <br> <%
          'InfoIrrf
          response.Write("        nrRecArqBase: " + S5012.InfoIrrf.nrRecArqBase) %> <br> <%
          response.Write("        indExistInfo: " + S5012.InfoIrrf.indExistInfo) %> <br> <%
          'InfoCRContrib
          for a = 0 to (S5012.InfoIrrf.CountInfoCRContrib - 1)
            response.Write("        tpCR: " + S5012.InfoIrrf.InfoCRContrib(a).tpCR) %> <br> <%
            response.Write("        vrCR: " + S5012.InfoIrrf.InfoCRContrib(a).vrCR) %> <br> <%
          Next
        end if        
  	Next %> <br> <%
	For k = 0 To (Consultar.CountOcorrencias - 1)
	    response.Write("    Codigo: " & Consultar.Ocorrencias(k).Codigo) %> <br> <%
	    response.Write("    Tipo: " & Consultar.Ocorrencias(k).Tipo) %> <br> <%
	    response.Write("    Descrição: " & Consultar.Ocorrencias(k).Descricao) %> <br> <%
	Next %> <br> <%

	'Fim da consulta
%>


VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "tabctl32.ocx"
Begin VB.Form frmProjeto 
   Caption         =   "Demo eSocial"
   ClientHeight    =   6645
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   16860
   LinkTopic       =   "Form1"
   ScaleHeight     =   6645
   ScaleWidth      =   16860
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtPin 
      Height          =   285
      IMEMode         =   3  'DISABLE
      Left            =   120
      PasswordChar    =   "*"
      TabIndex        =   37
      Top             =   3240
      Width           =   7695
   End
   Begin VB.CommandButton btnReconsulta 
      Caption         =   "Forçar consulta Sefaz"
      Height          =   375
      Left            =   4200
      TabIndex        =   36
      Top             =   5520
      Width           =   3615
   End
   Begin VB.Frame Frame1 
      Caption         =   "Tipo de Consulta:"
      Height          =   735
      Left            =   120
      TabIndex        =   32
      Top             =   4680
      Width           =   7695
      Begin VB.OptionButton opEvento 
         Caption         =   "Id do Evento"
         Height          =   255
         Left            =   3120
         TabIndex        =   35
         Top             =   360
         Width           =   1695
      End
      Begin VB.OptionButton opNrRecibo 
         Caption         =   "Nr. Recibo"
         Height          =   255
         Left            =   5640
         TabIndex        =   34
         Top             =   360
         Width           =   1695
      End
      Begin VB.OptionButton opIdLote 
         Caption         =   "Id de Lote"
         Height          =   255
         Left            =   360
         TabIndex        =   33
         Top             =   360
         Width           =   1695
      End
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   6495
      Left            =   7920
      TabIndex        =   28
      Top             =   120
      Width           =   8775
      _ExtentX        =   15478
      _ExtentY        =   11456
      _Version        =   393216
      TabHeight       =   520
      TabCaption(0)   =   "Retorno"
      TabPicture(0)   =   "frmProjeto.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "tbRetorno"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).ControlCount=   1
      TabCaption(1)   =   "Xml de Envio"
      TabPicture(1)   =   "frmProjeto.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "tbXmlEnvio"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "Xml de Retorno"
      TabPicture(2)   =   "frmProjeto.frx":0038
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "tbXmlRetorno"
      Tab(2).ControlCount=   1
      Begin VB.TextBox tbXmlRetorno 
         Height          =   5295
         Left            =   -74880
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   31
         Top             =   360
         Width           =   8535
      End
      Begin VB.TextBox tbXmlEnvio 
         Height          =   5295
         Left            =   -74880
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   30
         Top             =   360
         Width           =   8535
      End
      Begin VB.TextBox tbRetorno 
         Height          =   6015
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   29
         Top             =   360
         Width           =   8535
      End
   End
   Begin VB.TextBox txtEmpregador 
      Height          =   285
      Left            =   2880
      TabIndex        =   26
      Top             =   840
      Width           =   2535
   End
   Begin VB.TextBox txtTransmissor 
      Height          =   285
      Left            =   120
      TabIndex        =   24
      Top             =   840
      Width           =   2655
   End
   Begin VB.ComboBox cbAmbiente 
      Height          =   315
      ItemData        =   "frmProjeto.frx":0054
      Left            =   5520
      List            =   "frmProjeto.frx":005E
      TabIndex        =   22
      Top             =   240
      Width           =   2295
   End
   Begin VB.TextBox txtTokenSh 
      Height          =   285
      Left            =   2880
      TabIndex        =   20
      Top             =   240
      Width           =   2535
   End
   Begin VB.TextBox txtCnpjSH 
      Height          =   285
      Left            =   120
      TabIndex        =   18
      Top             =   240
      Width           =   2655
   End
   Begin VB.ComboBox cbGrupo 
      Height          =   315
      ItemData        =   "frmProjeto.frx":0081
      Left            =   5400
      List            =   "frmProjeto.frx":008E
      TabIndex        =   16
      Top             =   6240
      Width           =   2415
   End
   Begin VB.TextBox txtTemplates 
      Height          =   285
      Left            =   120
      TabIndex        =   14
      Top             =   2040
      Width           =   7695
   End
   Begin VB.TextBox txtEsquemas 
      Height          =   285
      Left            =   120
      TabIndex        =   12
      Top             =   2640
      Width           =   7695
   End
   Begin VB.CommandButton btnConfigurar 
      Caption         =   "Configurar"
      Height          =   375
      Left            =   120
      TabIndex        =   10
      Top             =   3720
      Width           =   7695
   End
   Begin VB.ComboBox cbVersao 
      Height          =   315
      Left            =   5520
      TabIndex        =   8
      Top             =   840
      Width           =   2295
   End
   Begin VB.TextBox txtIdLote 
      Height          =   285
      Left            =   120
      TabIndex        =   6
      Top             =   6240
      Width           =   5055
   End
   Begin VB.CommandButton cmdConsultar 
      Caption         =   "Consultar"
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   5520
      Width           =   3975
   End
   Begin VB.CommandButton cmdEnviar 
      Caption         =   "Enviar"
      Height          =   375
      Left            =   5880
      TabIndex        =   4
      Top             =   4200
      Width           =   1935
   End
   Begin VB.CommandButton btnCarregaTX2 
      Caption         =   "Carrega TX2"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   4200
      Width           =   1815
   End
   Begin VB.CommandButton btnAssinarXML 
      Caption         =   "Assinar"
      Height          =   375
      Index           =   1
      Left            =   3960
      TabIndex        =   2
      Top             =   4200
      Width           =   1815
   End
   Begin VB.CommandButton btnGerarXML 
      Caption         =   "Gerar XML"
      Height          =   375
      Index           =   0
      Left            =   2040
      TabIndex        =   1
      Top             =   4200
      Width           =   1815
   End
   Begin VB.ComboBox cbCertificado 
      Height          =   315
      ItemData        =   "frmProjeto.frx":009B
      Left            =   120
      List            =   "frmProjeto.frx":009D
      TabIndex        =   0
      Text            =   $"frmProjeto.frx":009F
      Top             =   1440
      Width           =   7695
   End
   Begin VB.Label Label3 
      Caption         =   "Pin Code (Utilizado para A3)"
      Height          =   255
      Left            =   120
      TabIndex        =   38
      Top             =   3000
      Width           =   2415
   End
   Begin VB.Label Label1 
      Caption         =   "CNPJ Empregador:"
      Height          =   255
      Index           =   9
      Left            =   2880
      TabIndex        =   27
      Top             =   600
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   "CNPJ Transmissor:"
      Height          =   255
      Index           =   8
      Left            =   120
      TabIndex        =   25
      Top             =   600
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   "Ambiente:"
      Height          =   255
      Index           =   7
      Left            =   5520
      TabIndex        =   23
      Top             =   0
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   "Token SoftWare House:"
      Height          =   255
      Index           =   6
      Left            =   2880
      TabIndex        =   21
      Top             =   0
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   "CPF / CNPJ SoftWare House:"
      Height          =   255
      Index           =   5
      Left            =   120
      TabIndex        =   19
      Top             =   0
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   "Grupo:"
      Height          =   255
      Index           =   4
      Left            =   5400
      TabIndex        =   17
      Top             =   6000
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   "Caminho Templates:"
      Height          =   255
      Index           =   3
      Left            =   120
      TabIndex        =   15
      Top             =   1800
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   "Caminho Esquemas:"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   13
      Top             =   2400
      Width           =   2535
   End
   Begin VB.Label Label2 
      Caption         =   "Certificado:"
      Height          =   255
      Left            =   120
      TabIndex        =   11
      Top             =   1200
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Versão Manual:"
      Height          =   255
      Index           =   2
      Left            =   5520
      TabIndex        =   9
      Top             =   600
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   "Identificador Lote"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   7
      Top             =   6000
      Width           =   2535
   End
End
Attribute VB_Name = "frmProjeto"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public eSocial As ESocialClientX.spdESocialClientX



Private Sub btnAssinarXML_Click(Index As Integer)
    tbRetorno.Text = eSocial.AssinarEvento(tbRetorno.Text)
End Sub

Private Sub btnCarregaTX2_Click()
    tbRetorno.Text = "INCLUIRS1000" & vbNewLine & Chr(10)
    If cbAmbiente.Text = "1 - Produção" Then
        tbRetorno.Text = tbRetorno.Text & "tpAmb_4=1" & vbNewLine & Chr(10)
    End If
    If cbAmbiente.Text = "2 - Homologação" Then
        tbRetorno.Text = tbRetorno.Text & "tpAmb_4=2" & vbNewLine & Chr(10)
    End If
    tbRetorno.Text = tbRetorno.Text & "procEmi_5=1" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "verProc_6=1.0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "tpInsc_8=1" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "nrInsc_9=13930441" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "iniValid_13=2017-07" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "nmRazao_15=TECNOSPEED TECNOLOGIA DA INFORMACAO" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "classTrib_16=99" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "natJurid_17=2054" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indCoop_18=8" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indConstr_19=0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indDesFolha_20=0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indOptRegEletron_21=0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indEntEd_23=N" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indEtt_24=N" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "nmCtt_36=Joï¿½o da Silva" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "cpfCtt_37=52406715167" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "foneCel_39=7867834687" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "foneFixo_38=4430379500" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indSitPJ_63=0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "INCLUIRSOFTWAREHOUSE_55" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "cnpjSoftHouse_56=13930441000134" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "nmRazao_57=Empresa de Teste" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "nmCont_58=Nome do Contato" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "telefone_59=4430303030" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "SALVARSOFTWAREHOUSE_55" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "SALVARS1000"
End Sub

Private Sub btnConfigurar_Click()

If txtPin <> "" Then
    eSocial.Pincode = txtPin.Text
    eSocial.TipoCertificado = ckSmartCard
Else
    eSocial.Pincode = ""
    eSocial.TipoCertificado = ckLocalMachine
End If

eSocial.NomeCertificado = cbCertificado.Text
eSocial.VersaoManual = cbVersao.Text
eSocial.DiretorioTemplates = txtTemplates.Text
eSocial.DiretorioEsquemas = txtEsquemas.Text
eSocial.ConfigurarSoftwareHouse txtCnpjSH.Text, txtTokenSh.Text
eSocial.CpfCnpjEmpregador = txtEmpregador.Text
eSocial.CpfCnpjTransmissor = txtTransmissor.Text
If cbAmbiente.Text = "1 - Produção" Then
    eSocial.Ambiente = akProducao
End If
If cbAmbiente.Text = "2 - Homologação" Then
    eSocial.Ambiente = akPreProducaoReais
End If

End Sub

Private Sub btnGerarXML_Click(Index As Integer)
    tbRetorno.Text = eSocial.GerarXMLporTx2(tbRetorno.Text)
End Sub


Private Sub btnReconsulta_Click()
    eSocial.ReconsultarLoteSefaz (txtIdLote.Text)
     tbRetorno.Text = "Consulta realizada com sucesse! Realize a consulta normal para verificar o retorno da receita"
End Sub

Private Sub cmdConsultar_Click()
    Dim RetConsulta As spdRetConsultarLote
    Dim RetConsultaItem As spdRetConsultarLoteItem
    Dim RetConsultaOcorrencia As spdRetConsultarLoteOcorrencia
    Dim RetConsultaOcorrenciaEnvio As spdRetConsultarLoteOcorrenciaEnvio
    Dim RetS5001 As spdS5001
    Dim i, j, k, a, b, c, d, e, resposta As Integer
    
    If opIdLote.Value Then
    Set RetConsulta = eSocial.ConsultarLoteEventos(txtIdLote.Text)
    ElseIf opEvento.Value Then
    Set RetConsulta = eSocial.ConsultarIdEvento(txtIdLote.Text)
    ElseIf opNrRecibo.Value Then
    Set RetConsulta = eSocial.ConsultarEventoPorRecibo(txtIdLote.Text)
    End If
        
    tbRetorno.Text = "### CONSULTAR EVENTO ###" & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Numero do Protocolo: " & RetConsulta.NumeroProtocolo & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Mensagem de Retorno: " & RetConsulta.Mensagem & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Status do Lote: " & RetConsulta.Status & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Id do Lote: " & RetConsulta.IdLote & vbNewLine
    
    For k = 0 To RetConsulta.CountOcorrencias - 1
        Set RetConsultaOcorrenciaEnvio = RetConsulta.Ocorrencias(k)
        tbRetorno.Text = tbRetorno.Text & "    Codigo: " & RetConsultaOcorrenciaEnvio.Codigo & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    Tipo: " & RetConsultaOcorrenciaEnvio.Tipo & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    Localizacao: " & RetConsultaOcorrenciaEnvio.Localizacao & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    Descricao: " & RetConsultaOcorrenciaEnvio.Descricao & vbNewLine
    Next
        
    For i = 0 To RetConsulta.Count - 1
        Set RetConsultaItem = RetConsulta.Eventos(i)
        tbRetorno.Text = tbRetorno.Text & "    Id Evento: " & RetConsultaItem.IdEvento & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    Numero Recibo: " & RetConsultaItem.NumeroRecibo & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    Codigo de Status: " & RetConsultaItem.cStat & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    Mensagem: " & RetConsultaItem.Mensagem & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    Status do Evento: " & RetConsultaItem.Status & vbNewLine
        
        If (RetConsultaItem.S5001.IsEmpty = False) Then
        '--------------------S5001--------------------
        tbRetorno.Text = tbRetorno.Text & "        ### S5001 ### " & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        Id: " & RetConsultaItem.S5001.Id & vbNewLine
        
        'IdeEvento
        tbRetorno.Text = tbRetorno.Text & "        nrRecArqBase: " & RetConsultaItem.S5001.IdeEvento.NrRecArqBase & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        indApuracao: " & RetConsultaItem.S5001.IdeEvento.IndApuracao & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        perApur: " & RetConsultaItem.S5001.IdeEvento.PerApur & vbNewLine
        
        'IdeEmpregador
        tbRetorno.Text = tbRetorno.Text & "        tpInsc: " & RetConsultaItem.S5001.IdeEmpregador.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        nrInsc: " & RetConsultaItem.S5001.IdeEmpregador.NrInsc & vbNewLine
        
        'IdeTrabalhador
        tbRetorno.Text = tbRetorno.Text & "        cpfTrab: " & RetConsultaItem.S5001.IdeTrabalhador.CpfTrab & vbNewLine
        
        'InfoCpCalc
        For a = 0 To RetConsultaItem.S5001.CountInfoCpCalc - 1
            tbRetorno.Text = tbRetorno.Text & "        tpCR: " & RetConsultaItem.S5001.InfoCpCalc(a).TpCR & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrCpSeg: " & RetConsultaItem.S5001.InfoCpCalc(a).VrCpSeg & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrDescSeg: " & RetConsultaItem.S5001.InfoCpCalc(a).VrDescSeg & vbNewLine
        Next a
        
        'IdeEstabLot
        For a = 0 To RetConsultaItem.S5001.InfoCp.CountIdeEstabLot - 1
            tbRetorno.Text = tbRetorno.Text & "        vrDescSeg: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).TpInsc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        nrInsc: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).NrInsc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        codLotacao: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).CodLotacao & vbNewLine
          
            'InfoCategIncid
            For b = 0 To RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).CountInfoCategIncid - 1
                tbRetorno.Text = tbRetorno.Text & "        vrDescSeg: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).Matricula & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "        codCateg: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CodCateg & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "        indSimples: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).IndSimples & vbNewLine
            
                'InfoBaseCS
                For c = 0 To RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CountInfoBaseCS - 1
                    tbRetorno.Text = tbRetorno.Text & "        Ind13: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoBaseCS(c).Ind13 & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        tpValor: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoBaseCS(c).TpValor & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        valor: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoBaseCS(c).Valor & vbNewLine
                Next c
            
                'CalcTerc
                For c = 0 To RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CountCalcTerc - 1
                    tbRetorno.Text = tbRetorno.Text & "        tpCR: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CalcTerc(c).TpCR & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        vrCsSegTerc: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CalcTerc(c).VrCsSegTerc & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        vrDescTerc: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CalcTerc(c).VrDescTerc & vbNewLine
                Next c
            
            Next b 'Fim do InfoCategIncid
          
        Next a 'Fim do IdeEstabLot
    End If 'Fim do IF do S5001


    If (RetConsultaItem.S5002.IsEmpty = False) Then
    '--------------------S5002--------------------
        tbRetorno.Text = tbRetorno.Text & "        ### S5002 ###" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        Id: " & RetConsultaItem.S5002.Id & vbNewLine
        
        'IdeEvento
        tbRetorno.Text = tbRetorno.Text & "        nrRecArqBase: " & RetConsultaItem.S5002.IdeEvento.NrRecArqBase & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        perApur: " & RetConsultaItem.S5002.IdeEvento.PerApur & vbNewLine
        
        'IdeEmpregador
        tbRetorno.Text = tbRetorno.Text & "        tpInsc: " & RetConsultaItem.S5002.IdeEmpregador.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        nrInsc: " & RetConsultaItem.S5002.IdeEmpregador.NrInsc & vbNewLine
        
        'IdeTrabalhador
        tbRetorno.Text = tbRetorno.Text & "        cpfTrab: " & RetConsultaItem.S5002.IdeTrabalhador.CpfTrab & vbNewLine
        
        'InfoDep
        tbRetorno.Text = tbRetorno.Text & "        vrDedDep: " & RetConsultaItem.S5002.InfoDep.VrDedDep & vbNewLine
        
        'InfoIrrf
        For a = 0 To RetConsultaItem.S5002.CountInfoIrrf - 1
            tbRetorno.Text = tbRetorno.Text & "        codCateg: " & RetConsultaItem.S5002.InfoIrrf(a).CodCateg & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        indResBr: " & RetConsultaItem.S5002.InfoIrrf(a).IndResBr & vbNewLine
            
            'BasesIrrf
            For b = 0 To RetConsultaItem.S5002.InfoIrrf(a).CountBasesIrrf - 1
                tbRetorno.Text = tbRetorno.Text & "        tpValor: " & RetConsultaItem.S5002.InfoIrrf(a).BasesIrrf(b).TpValor & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "        Valor: " & RetConsultaItem.S5002.InfoIrrf(a).BasesIrrf(b).Valor & vbNewLine
            Next b 'Fim do BasesIrrf
            
            'Irrf
            For b = 0 To RetConsultaItem.S5002.InfoIrrf(a).CountIrrf - 1
                tbRetorno.Text = tbRetorno.Text & "        tpCR: " & RetConsultaItem.S5002.InfoIrrf(a).Irrf(b).TpCR & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "        vrIrrfDesc: " & RetConsultaItem.S5002.InfoIrrf(a).Irrf(b).VrIrrfDesc & vbNewLine
            Next b 'Fim do Irrf
            
            'IdePais
            tbRetorno.Text = tbRetorno.Text & "        codPais: " & RetConsultaItem.S5002.InfoIrrf(a).IdePgtoExt.IdePais.CodPais & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        indNIF: " & RetConsultaItem.S5002.InfoIrrf(a).IdePgtoExt.IdePais.IndNIF & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        nifBenef: " & RetConsultaItem.S5002.InfoIrrf(a).IdePgtoExt.IdePais.NifBenef & vbNewLine
            
            'EndExt
            tbRetorno.Text = tbRetorno.Text & "        dscLograd: " & RetConsultaItem.S5002.InfoIrrf(a).IdePgtoExt.EndExt.DscLograd & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        nrLograd: " & RetConsultaItem.S5002.InfoIrrf(a).IdePgtoExt.EndExt.NrLograd & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        complem: " & RetConsultaItem.S5002.InfoIrrf(a).IdePgtoExt.EndExt.Complem & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        bairro: " & RetConsultaItem.S5002.InfoIrrf(a).IdePgtoExt.EndExt.Bairro & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        nmCid: " & RetConsultaItem.S5002.InfoIrrf(a).IdePgtoExt.EndExt.NmCid & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        codPostal: " & RetConsultaItem.S5002.InfoIrrf(a).IdePgtoExt.EndExt.CodPostal & vbNewLine
        
        Next a 'Fim do InfoIrrf
    End If 'Fim do IF do S5002
    
    '--------------------S5003--------------------
    If (RetConsultaItem.S5003.IsEmpty = False) Then
        tbRetorno.Text = tbRetorno.Text & "         ### S5003 ###" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "         Id: " & RetConsultaItem.S5003.Id & vbNewLine
        ' IdeEvento
        tbRetorno.Text = tbRetorno.Text & "         NrRecArqBase: " & RetConsultaItem.S5003.IdeEvento.NrRecArqBase & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "         perApur: " & RetConsultaItem.S5003.IdeEvento.PerApur & vbNewLine
        ' IdeEmpregador
        tbRetorno.Text = tbRetorno.Text & "         tpInsc: " & RetConsultaItem.S5003.IdeEmpregador.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "         nrInsc: " & RetConsultaItem.S5003.IdeEmpregador.NrInsc & vbNewLine
        ' ideTrabalhador
        tbRetorno.Text = tbRetorno.Text & "         CpfTrab: " & RetConsultaItem.S5003.IdeTrabalador.CpfTrab & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "         NisTrab: " & RetConsultaItem.S5003.IdeTrabalador.NisTrab & vbNewLine
        ' InfoFGTS
        tbRetorno.Text = tbRetorno.Text & "         InfoFGTS: " & RetConsultaItem.S5003.InfoFGTS.DtVenc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "            CpfTrab: " & RetConsultaItem.S5003.InfoFGTS.DtVenc & vbNewLine
        For a = 0 To RetConsultaItem.S5003.InfoFGTS.CountIdeEstabLot - 1
            tbRetorno.Text = tbRetorno.Text & "            IdeEstabLot: " & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "             TpInsc: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).TpInsc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "             NrInsc: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).NrInsc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "             CodLotacao: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).CodLotacao & vbNewLine
            For b = 0 To RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).CountInfoTrabFGTS - 1
                tbRetorno.Text = tbRetorno.Text & "             IdeEstabLot: " & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "               Matricula: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).Matricula & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "               CodCateg: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).CodCateg & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "               DtAdm: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).DtAdm & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "               DtDeslig: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).DtDeslig & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "               DtInicio: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).DtInicio & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "               MtvDeslig: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).MtvDeslig & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "               DtTerm: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).DtTerm & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "               MtvDesligTSV: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).MtvDesligTSV & vbNewLine
                For c = 0 To RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).CountInfoBaseFGTS - 1
                    tbRetorno.Text = tbRetorno.Text & "                InfoBaseFGTS: " & vbNewLine
                    For d = 0 To RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).InfoBaseFGTS(c).CountBasePerApur - 1
                        tbRetorno.Text = tbRetorno.Text & "                 BasePerApur: " & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & "                  tpValor: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).InfoBaseFGTS(c).BasePerApur(d).TpValor & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & "                  RemFGTS: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).InfoBaseFGTS(c).BasePerApur(d).RemFGTS & vbNewLine
                    Next d
                    For d = 0 To RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).InfoBaseFGTS(c).CountInfoBasePerAntE - 1
                        tbRetorno.Text = tbRetorno.Text & "                 InfoBasePerAntE: " & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & "                  PerRef: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).InfoBaseFGTS(c).InfoBasePerAntE(d).PerRef & vbNewLine
                        For e = 0 To RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).InfoBaseFGTS(c).InfoBasePerAntE(d).CountBasePerAntE - 1
                            tbRetorno.Text = tbRetorno.Text & "                  BasePerAntE: " & vbNewLine
                            tbRetorno.Text = tbRetorno.Text & "                   TpValorE: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).InfoBaseFGTS(c).InfoBasePerAntE(d).BasePerAntE(e).TpValorE & vbNewLine
                            tbRetorno.Text = tbRetorno.Text & "                   RemFGTSE: " & RetConsultaItem.S5003.InfoFGTS.IdeEstabLot(a).InfoTrabFGTS(b).InfoBaseFGTS(c).InfoBasePerAntE(d).BasePerAntE(e).RemFGTSE & vbNewLine
                        Next e
                    Next d
                Next c
            Next b
        Next a
        For a = 0 To RetConsultaItem.S5003.InfoFGTS.CountInfoDpsFGTS - 1
            tbRetorno.Text = tbRetorno.Text & "            InfoDpsFGTS: " & vbNewLine
            For b = 0 To RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS(a).CountInfoTrabDps - 1
                tbRetorno.Text = tbRetorno.Text & "             InfoTrabDps: " & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "              Matricula: " & RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS(a).InfoTrabDps(b).Matricula & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "              codCateg: " & RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS(a).InfoTrabDps(b).CodCateg & vbNewLine
                For c = 0 To RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS(a).InfoTrabDps(b).CountDpsPerApur - 1
                    tbRetorno.Text = tbRetorno.Text & "             DpsPerApur: " & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "              TpDps: " & RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS(a).InfoTrabDps(b).DpsPerApur(c).TpDps & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "              DpsFGTS: " & RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS(a).InfoTrabDps(b).DpsPerApur(c).DpsFGTS & vbNewLine
                Next c
                For c = 0 To RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS(a).InfoTrabDps(b).CountInfoDpsPerAntE - 1
                    tbRetorno.Text = tbRetorno.Text & "             InfoDpsPerAntE: " & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "              PerRef: " & RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS(a).InfoTrabDps(b).InfoDpsPerAntE(c).PerRef & vbNewLine
                    For d = 0 To RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS(a).InfoTrabDps(b).InfoDpsPerAntE(c).CountDpsPerAntE - 1
                        tbRetorno.Text = tbRetorno.Text & "              DpsPerAntE: " & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & "               TpDpsE: " & RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS(a).InfoTrabDps(b).InfoDpsPerAntE(c).DpsPerAntE(d).TpDpsE & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & "               DpsFGTSE: " & RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS(a).InfoTrabDps(b).InfoDpsPerAntE(c).DpsPerAntE(d).DpsFGTSE & vbNewLine
                    Next d
                Next c
            Next b
        Next a
    End If

    If (RetConsultaItem.S5011.IsEmpty = False) Then
    '--------------------S5011--------------------
        tbRetorno.Text = tbRetorno.Text & "        ### S5011 ###" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        Id: " & RetConsultaItem.S5011.Id & vbNewLine
    
        'IdeEvento
        tbRetorno.Text = tbRetorno.Text & "        indApuracao: " & RetConsultaItem.S5011.IdeEvento.IndApuracao & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        perApur: " & RetConsultaItem.S5011.IdeEvento.PerApur & vbNewLine
    
        'IdeEmpregador
        tbRetorno.Text = tbRetorno.Text & "        tpInsc: " & RetConsultaItem.S5011.IdeEmpregador.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        nrInsc: " & RetConsultaItem.S5011.IdeEmpregador.NrInsc & vbNewLine
    
        'InfoCS
        tbRetorno.Text = tbRetorno.Text & "        nrRecArqBase: " & RetConsultaItem.S5011.InfoCS.NrRecArqBase & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        indExistInfo: " & RetConsultaItem.S5011.InfoCS.IndExistInfo & vbNewLine
    
        'InfoCPSeg
        tbRetorno.Text = tbRetorno.Text & "        vrDescCP: " & RetConsultaItem.S5011.InfoCS.InfoCPSeg.VrDescCP & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        vrCpSeg: " & RetConsultaItem.S5011.InfoCS.InfoCPSeg.VrCpSeg & vbNewLine
    
        'InfoContrib
        tbRetorno.Text = tbRetorno.Text & "        classTrib: " & RetConsultaItem.S5011.InfoCS.InfoContrib.ClassTrib & vbNewLine
    
        'InfoPJ
        tbRetorno.Text = tbRetorno.Text & "        indCoop: " & RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.IndCoop & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        indConstr: " & RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.IndConstr & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        indSubstPatr: " & RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.IndSubstPatr & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        percRedContrib: " & RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.PercRedContrib & vbNewLine
    
        'InfoAtConc
        tbRetorno.Text = tbRetorno.Text & "        fatorMes: " & RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.FatorMes & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        fator13: " & RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.Fator13 & vbNewLine
        
        'IdeEstab
        For a = 0 To RetConsultaItem.S5011.InfoCS.CountIdeEstab - 1
        
          tbRetorno.Text = tbRetorno.Text & "        tpInsc: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).TpInsc & vbNewLine
          tbRetorno.Text = tbRetorno.Text & "        nrInsc: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).NrInsc & vbNewLine
    
          'InfoEstab
          tbRetorno.Text = tbRetorno.Text & "        cnaePrep: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoEstab.CnaePrep & vbNewLine
          tbRetorno.Text = tbRetorno.Text & "        aliqRat: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoEstab.AliqRat & vbNewLine
          tbRetorno.Text = tbRetorno.Text & "        fap: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoEstab.Fap & vbNewLine
          tbRetorno.Text = tbRetorno.Text & "        aliqRatAjust: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoEstab.AliqRatAjust & vbNewLine
    
          'InfoComplObra
          tbRetorno.Text = tbRetorno.Text & "        indSubstPatrObra: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoEstab.InfoComplObra.IndSubstPatrObra & vbNewLine
    
          'IdeLotacao
          For b = 0 To RetConsultaItem.S5011.InfoCS.IdeEstab(a).CountIdeLotacao - 1
          
            tbRetorno.Text = tbRetorno.Text & "        codLotacao: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).CodLotacao & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        fpas: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).Fpas & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        codTercs: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).CodTercs & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        codTercsSusp: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).CodTercsSusp & vbNewLine
    
            'InfoTercSusp
            For c = 0 To RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).CountInfoTercSusp - 1
              tbRetorno.Text = tbRetorno.Text & "        codTerc: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoTercSusp(c).CodTerc & vbNewLine
            Next c 'Fim do InfoTercSusp
    
            'InfoEmprParcial
            tbRetorno.Text = tbRetorno.Text & "        tpInscContrat: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoEmprParcial.TpInscContrat & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        nrInscContrat: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoEmprParcial.NrInscContrat & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        tpInscProp: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoEmprParcial.TpInscProp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        nrInscProp: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoEmprParcial.NrInscProp & vbNewLine
    
            'DadosOpPort
            tbRetorno.Text = tbRetorno.Text & "        cnpjOpPortuario: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).DadosOpPort.CnpjOpPortuario & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        aliqRat: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).DadosOpPort.AliqRat & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        fap: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).DadosOpPort.Fap & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        aliqRatAjust: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).DadosOpPort.AliqRatAjust & vbNewLine
    
            'BasesRemun
            For c = 0 To RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).CountBasesRemun - 1
              tbRetorno.Text = tbRetorno.Text & "        indIncid: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).IndIncid & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        codCateg: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).CodCateg & vbNewLine
    
              'BasesCp
              tbRetorno.Text = tbRetorno.Text & "        vrBcCp00: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrBcCp00 & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrBcCp15: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrBcCp15 & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrBcCp20: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrBcCp20 & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrBcCp25: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrBcCp25 & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrSuspBcCp00: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSuspBcCp00 & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrSuspBcCp15: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSuspBcCp15 & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrSuspBcCp20: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSuspBcCp20 & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrSuspBcCp25: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSuspBcCp25 & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrDescSest: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrDescSest & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrCalcSest: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrCalcSest & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrDescSenat: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrDescSenat & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrCalcSenat: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrCalcSenat & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrSalFam: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSalFam & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrSalMat: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSalMat & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrBcCp00VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrBcCp00VA & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrBcCp15VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrBcCp15VA & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrBcCp20VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrBcCp20VA & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrBcCp25VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrBcCp25VA & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrSuspBcCp00VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrSuspBcCp00VA & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrSuspBcCp15VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrSuspBcCp15VA & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrSuspBcCp20VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrSuspBcCp20VA & vbNewLine
              tbRetorno.Text = tbRetorno.Text & "        vrSuspBcCp25VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.vrSuspBcCp25VA & vbNewLine
            Next c ' Fim do BasesRemun
    
            'BasesAvNPort
            tbRetorno.Text = tbRetorno.Text & "        vrBcCp00: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.VrBcCp00 & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrBcCp15: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.VrBcCp15 & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrBcCp20: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.VrBcCp20 & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrBcCp25: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.VrBcCp25 & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrBcCp13: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.VrBcCp13 & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrBcFgts: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.VrBcFgts & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrDescCP: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.VrDescCP & vbNewLine
    
            'InfoSubstPatrOpPort
            For c = 0 To RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).CountInfoSubstPatrOpOrt - 1
              tbRetorno.Text = tbRetorno.Text & "        cnpjOpPortuario: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoSubstPatrOpPort(c).CnpjOpPortuario & vbNewLine
            Next c 'Fim do InfoSubstPatrOpPort
          Next b 'Fim do IdeLotacao
    
          'BasesAquis
          For b = 0 To RetConsultaItem.S5011.InfoCS.IdeEstab(a).CountBasesAquis - 1
            tbRetorno.Text = tbRetorno.Text & "        indAquis: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).IndAquis & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vlrAquis: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VlrAquis & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrCPDescPR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrCPDescPR & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrCPNRet: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrCPNRet & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrRatNRet: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrRatNRet & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrSenarNRet: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrSenarNRet & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrCPCalcPR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrCPCalcPR & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrRatDescPR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrRatDescPR & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrRatCalcPR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrRatCalcPR & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrSenarDesc: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrSenarDesc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrSenarCalc: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrSenarCalc & vbNewLine
          Next b 'Fim do BasesAquis
    
          'BasesComerc
          For b = 0 To RetConsultaItem.S5011.InfoCS.IdeEstab(a).CountBasesComerc - 1
            tbRetorno.Text = tbRetorno.Text & "        indComerc: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesComerc(b).IndComerc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrBcComPR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesComerc(b).VrBcComPR & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrCPSusp: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesComerc(b).VrCPSusp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrRatSusp: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesComerc(b).VrRatSusp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrSenarSusp: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesComerc(b).VrSenarSusp & vbNewLine
          Next b 'Fim do BasesComerc
    
          'InfoCREstab
          For b = 0 To RetConsultaItem.S5011.InfoCS.IdeEstab(a).CountInfoCREstab - 1
            tbRetorno.Text = tbRetorno.Text & "        tpCR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoCREstab(b).TpCR & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrCR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoCREstab(b).VrCR & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrSuspCR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoCREstab(b).VrSuspCR & vbNewLine
          Next b 'Fim do InfoCREstab
        Next a 'Fim do IdeEstab
        
        'infoCRContrib
        For a = 0 To RetConsultaItem.S5011.InfoCS.CountInfoCRContrib - 1
            tbRetorno.Text = tbRetorno.Text & "        tpCR: " + RetConsultaItem.S5011.InfoCS.InfoCRContrib(a).TpCR & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrCR: " + RetConsultaItem.S5011.InfoCS.InfoCRContrib(a).VrCR & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrCRSusp: " + RetConsultaItem.S5011.InfoCS.InfoCRContrib(a).VrCRSusp & vbNewLine
        Next a ' Fim do infoCRContrib
        
    End If 'Fim do IF do S5011

    If (RetConsultaItem.S5012.IsEmpty = False) Then
    '--------------------S5012--------------------
        tbRetorno.Text = tbRetorno.Text & "        ### S5012 ###" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        Id: " & RetConsultaItem.S5012.Id & vbNewLine
    
        'IdeEvento
        tbRetorno.Text = tbRetorno.Text & "        perApur: " & RetConsultaItem.S5012.IdeEvento.PerApur & vbNewLine
    
        'IdeEmpregador
        tbRetorno.Text = tbRetorno.Text & "        tpInsc: " & RetConsultaItem.S5012.IdeEmpregador.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        tpInsc: " & RetConsultaItem.S5012.IdeEmpregador.TpInsc & vbNewLine
    
        'InfoIrrf
        tbRetorno.Text = tbRetorno.Text & "        nrRecArqBase: " & RetConsultaItem.S5012.InfoIrrf.NrRecArqBase & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        indExistInfo: " & RetConsultaItem.S5012.InfoIrrf.IndExistInfo & vbNewLine
        
        'InfoCRContrib
        For a = 0 To RetConsultaItem.S5012.InfoIrrf.CountInfoCRContrib - 1
          tbRetorno.Text = tbRetorno.Text & "        tpCR: " + RetConsultaItem.S5012.InfoIrrf.InfoCRContrib(a).TpCR & vbNewLine
          tbRetorno.Text = tbRetorno.Text & "        vrCR: " + RetConsultaItem.S5012.InfoIrrf.InfoCRContrib(a).VrCR & vbNewLine
        Next a 'Fim do if do InfoCRContrib
        
    End If 'Fim do IF do S5012
    
    
    '--------------------S5013--------------------
    If (RetConsultaItem.S5013.IsEmpty = False) Then
        tbRetorno.Text = tbRetorno.Text & "        ### S5013 ###" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        Id: " & RetConsultaItem.S5013.Id & vbNewLine
        ' IdeEvento
        tbRetorno.Text = tbRetorno.Text & "        perApur: " & RetConsultaItem.S5013.IdeEvento.PerApur & vbNewLine
        ' IdeEmpregador
        tbRetorno.Text = tbRetorno.Text & "        tpInsc: " & RetConsultaItem.S5013.IdeEmpregador.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        nrInsc: " & RetConsultaItem.S5013.IdeEmpregador.NrInsc & vbNewLine
        ' infoFGTS
        tbRetorno.Text = tbRetorno.Text & "        nrRecArqBase: " & RetConsultaItem.S5013.InfoFGTS.NrRecArqBase & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        indExistInfo: " & RetConsultaItem.S5013.InfoFGTS.IndExistInfo & vbNewLine
        ' infoBaseFGTS
        tbRetorno.Text = tbRetorno.Text & "        infoBaseFGTS: " & vbNewLine
        ' basePerApur
        tbRetorno.Text = tbRetorno.Text & "          basePerApur: <List>" & vbNewLine
        For a = 0 To RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.CountBasePerApur - 1
            tbRetorno.Text = tbRetorno.Text & "            tpValor: " & RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.BasePerApur(a).TpValor & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "            baseFGTS: " & RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.BasePerApur(a).BaseFGTS & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "            --" & vbNewLine
        Next a
        ' infoBaseFGTS
        tbRetorno.Text = tbRetorno.Text & "          infoBaseFGTS: <List>" & vbNewLine
        For a = 0 To RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.CountInfoBasePerAntE - 1
            ' InfoBasePerAntE
            tbRetorno.Text = tbRetorno.Text & "            perRef: " & RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.InfoBasePerAntE(a).PerRef & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "            basePerAntE: <List>" & vbNewLine
            For b = 0 To RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.InfoBasePerAntE(a).CountBasePerAntE - 1
                tbRetorno.Text = tbRetorno.Text & "              tpValorE: " & RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.InfoBasePerAntE(a).BasePerAntE(b).TpValorE & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "              baseFGTSE: " & RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.InfoBasePerAntE(a).BasePerAntE(b).BaseFGTSE & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "              --" & vbNewLine
            Next b
        Next a
        ' infoDpsFGTS
        tbRetorno.Text = tbRetorno.Text & "          infoDpsFGTS:" & vbNewLine
        ' dpsPerApur
        For a = 0 To RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.CountDpsPerApur - 1
            tbRetorno.Text = tbRetorno.Text & "            TpDps: " & RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.DpsPerApur(a).TpDps & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "            VrFGTS: " & RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.DpsPerApur(a).VrFGTS & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "            --" & vbNewLine
        Next a
        ' infoDpsPerAntE
        tbRetorno.Text = tbRetorno.Text & "          infoDpsPerAntE: <List>" & vbNewLine
        For a = 0 To RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.CountInfoDpsPerAntE - 1
            tbRetorno.Text = tbRetorno.Text & "            perRef: " & RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.InfoDpsPerAntE(a).PerRef & vbNewLine
            ' basePerAntE
            tbRetorno.Text = tbRetorno.Text & "            basePerAntE: <List>" & vbNewLine
            For b = 0 To RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.InfoDpsPerAntE(a).CountDpsPerAntE - 1
                tbRetorno.Text = tbRetorno.Text & "              TpDpsE: " & RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.InfoDpsPerAntE(a).DpsPerAntE(b).TpDpsE & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "              vrFGTSE: " & RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.InfoDpsPerAntE(a).DpsPerAntE(b).VrFGTSE & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "              --" & vbNewLine
            Next b
        Next a
    End If

        
        For j = 0 To RetConsultaItem.Count - 1
            Set RetConsultaOcorrencia = RetConsultaItem.Ocorrencias(j)
            tbRetorno.Text = tbRetorno.Text & "        Codigo: " & RetConsultaOcorrencia.Codigo & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        Descricao: " & RetConsultaOcorrencia.Descricao & vbNewLine
        Next
    Next
    tbXmlEnvio.Text = RetConsulta.XmlEnviado
    tbXmlRetorno.Text = RetConsulta.XmlRetorno
End Sub


Private Sub cmdEnviar_Click()
    Dim RetEnvio As spdRetEnviarLoteEventos
    
    Set RetEnvio = eSocial.EnviarLoteEventos(tbRetorno.Text, CInt(cbGrupo.Text))
    
    tbRetorno.Text = "### INCLUIR EVENTO ###" & vbNewLine
    tbRetorno.Text = "Identificador do Lote: " & RetEnvio.IdLote & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Mensagem de Retorno: " & RetEnvio.Mensagem
    
    txtIdLote.Text = RetEnvio.IdLote
End Sub

Private Sub Form_Load()
Set eSocial = New ESocialClientX.spdESocialClientX
Dim vetor As Variant
Dim i As Integer
Dim versao As Variant
Dim j As Integer

versao = Split(eSocial.ListarVersaoManual("|"), "|")
cbVersao.Clear

For i = LBound(versao) To UBound(versao)
    cbVersao.AddItem versao(i)
Next

vetor = Split(eSocial.ListarCertificados("|"), "|")
cbCertificado.Clear

For i = LBound(vetor) To UBound(vetor)
    cbCertificado.AddItem vetor(i)
Next
txtEsquemas.Text = "C:\Program Files\TecnoSpeed\eSocial\Arquivos\Esquemas\"
txtTemplates.Text = "C:\Program Files\TecnoSpeed\eSocial\Arquivos\Templates\"


eSocial.Ambiente = akPreProducaoReais
'eSocial.ProxyServidor =
'eSocial.ProxySenha =
'eSocial.ProxyUsuario =
cbCertificado.ListIndex = 0
cbVersao.ListIndex = 1
cbAmbiente.ListIndex = 1
cbGrupo.ListIndex = 0
opIdLote.Value = True
txtCnpjSH.Text = "00614027000174"
txtTokenSh.Text = "qZDdoL2nx4XzvCqeLCi14iTDrgO21sW2N11yFSRc"
txtEmpregador.Text = "08187168000160"
txtTransmissor.Text = "08187168000160"
txtIdLote.Text = "f0fc5719-8b95-4291-9544-b14bf87216d0"

End Sub


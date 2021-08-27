VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmProjetoSimplificado 
   Caption         =   "Demo eSocial"
   ClientHeight    =   11655
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   8445
   LinkTopic       =   "Form1"
   ScaleHeight     =   11655
   ScaleWidth      =   8445
   StartUpPosition =   3  'Windows Default
   Begin TabDlg.SSTab SSTab2 
      Height          =   5535
      Left            =   0
      TabIndex        =   4
      Top             =   120
      Width           =   8415
      _ExtentX        =   14843
      _ExtentY        =   9763
      _Version        =   393216
      TabHeight       =   520
      TabCaption(0)   =   "1- Dados"
      TabPicture(0)   =   "frmProjetoSimplificado.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Label1(9)"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "Label1(8)"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "Label1(7)"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "Label1(6)"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "Label1(5)"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "Label1(3)"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "Label1(1)"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).Control(7)=   "Label2"
      Tab(0).Control(7).Enabled=   0   'False
      Tab(0).Control(8)=   "Label1(2)"
      Tab(0).Control(8).Enabled=   0   'False
      Tab(0).Control(9)=   "Label1(4)"
      Tab(0).Control(9).Enabled=   0   'False
      Tab(0).Control(10)=   "Label3"
      Tab(0).Control(10).Enabled=   0   'False
      Tab(0).Control(11)=   "txtEmpregador"
      Tab(0).Control(11).Enabled=   0   'False
      Tab(0).Control(12)=   "txtTransmissor"
      Tab(0).Control(12).Enabled=   0   'False
      Tab(0).Control(13)=   "cbAmbiente"
      Tab(0).Control(13).Enabled=   0   'False
      Tab(0).Control(14)=   "txtTokenSh"
      Tab(0).Control(14).Enabled=   0   'False
      Tab(0).Control(15)=   "txtCnpjSH"
      Tab(0).Control(15).Enabled=   0   'False
      Tab(0).Control(16)=   "txtTemplates"
      Tab(0).Control(16).Enabled=   0   'False
      Tab(0).Control(17)=   "txtEsquemas"
      Tab(0).Control(17).Enabled=   0   'False
      Tab(0).Control(18)=   "btnConfigurar"
      Tab(0).Control(18).Enabled=   0   'False
      Tab(0).Control(19)=   "cbVersao"
      Tab(0).Control(19).Enabled=   0   'False
      Tab(0).Control(20)=   "cbCertificado"
      Tab(0).Control(20).Enabled=   0   'False
      Tab(0).Control(21)=   "cbGrupo"
      Tab(0).Control(21).Enabled=   0   'False
      Tab(0).Control(22)=   "txtPincode"
      Tab(0).Control(22).Enabled=   0   'False
      Tab(0).ControlCount=   23
      TabCaption(1)   =   "2 - Envio"
      TabPicture(1)   =   "frmProjetoSimplificado.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "Label1(0)"
      Tab(1).Control(1)=   "Frame1"
      Tab(1).Control(2)=   "txtIdLote"
      Tab(1).Control(3)=   "cmdConsultar"
      Tab(1).Control(4)=   "cmdEnviar"
      Tab(1).Control(5)=   "btnCarregaTX2"
      Tab(1).Control(6)=   "btnAssinarXML(1)"
      Tab(1).Control(7)=   "btnGerarXML(0)"
      Tab(1).ControlCount=   8
      TabCaption(2)   =   "3 - Ajuda"
      TabPicture(2)   =   "frmProjetoSimplificado.frx":0038
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "Command4"
      Tab(2).Control(1)=   "Command3"
      Tab(2).Control(2)=   "Command2"
      Tab(2).Control(3)=   "Command1"
      Tab(2).ControlCount=   4
      Begin VB.CommandButton Command4 
         Caption         =   "Dicionário Tx2"
         Height          =   375
         Left            =   -73200
         TabIndex        =   42
         Top             =   3120
         Width           =   5055
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Métodos Componente"
         Height          =   375
         Left            =   -73200
         TabIndex        =   41
         Top             =   2520
         Width           =   5055
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Propriedades Componente"
         Height          =   375
         Left            =   -73200
         TabIndex        =   40
         Top             =   1920
         Width           =   5055
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Primeiros Passos"
         Height          =   375
         Left            =   -73200
         TabIndex        =   39
         Top             =   1320
         Width           =   5055
      End
      Begin VB.TextBox txtPincode 
         Height          =   285
         Left            =   240
         TabIndex        =   37
         Top             =   3840
         Width           =   7695
      End
      Begin VB.ComboBox cbGrupo 
         Height          =   315
         ItemData        =   "frmProjetoSimplificado.frx":0054
         Left            =   5640
         List            =   "frmProjetoSimplificado.frx":0061
         TabIndex        =   35
         Top             =   2040
         Width           =   2295
      End
      Begin VB.CommandButton btnGerarXML 
         Caption         =   "Gerar XML"
         Height          =   375
         Index           =   0
         Left            =   -72840
         TabIndex        =   33
         Top             =   600
         Width           =   1815
      End
      Begin VB.CommandButton btnAssinarXML 
         Caption         =   "Assinar"
         Height          =   375
         Index           =   1
         Left            =   -70920
         TabIndex        =   32
         Top             =   600
         Width           =   1815
      End
      Begin VB.CommandButton btnCarregaTX2 
         Caption         =   "Carrega TX2"
         Height          =   375
         Left            =   -74760
         TabIndex        =   31
         Top             =   600
         Width           =   1815
      End
      Begin VB.CommandButton cmdEnviar 
         Caption         =   "Enviar"
         Height          =   375
         Left            =   -69000
         TabIndex        =   30
         Top             =   600
         Width           =   1935
      End
      Begin VB.CommandButton cmdConsultar 
         Caption         =   "Consultar"
         Height          =   375
         Left            =   -74760
         TabIndex        =   29
         Top             =   1920
         Width           =   7695
      End
      Begin VB.TextBox txtIdLote 
         Height          =   285
         Left            =   -74760
         TabIndex        =   28
         Top             =   2640
         Width           =   7695
      End
      Begin VB.Frame Frame1 
         Caption         =   "Tipo de Consulta:"
         Height          =   735
         Left            =   -74760
         TabIndex        =   24
         Top             =   1080
         Width           =   7695
         Begin VB.OptionButton opEvento 
            Caption         =   "Id do Evento"
            Height          =   255
            Left            =   3120
            TabIndex        =   27
            Top             =   360
            Width           =   1695
         End
         Begin VB.OptionButton opNrRecibo 
            Caption         =   "Nr. Recibo"
            Height          =   255
            Left            =   5640
            TabIndex        =   26
            Top             =   360
            Width           =   1695
         End
         Begin VB.OptionButton opIdLote 
            Caption         =   "Id de Lote"
            Height          =   255
            Left            =   360
            TabIndex        =   25
            Top             =   360
            Width           =   1695
         End
      End
      Begin VB.ComboBox cbCertificado 
         Height          =   315
         ItemData        =   "frmProjetoSimplificado.frx":0071
         Left            =   240
         List            =   "frmProjetoSimplificado.frx":0073
         TabIndex        =   14
         Text            =   $"frmProjetoSimplificado.frx":0075
         Top             =   2040
         Width           =   5295
      End
      Begin VB.ComboBox cbVersao 
         Height          =   315
         Left            =   5640
         TabIndex        =   13
         Top             =   1440
         Width           =   2295
      End
      Begin VB.CommandButton btnConfigurar 
         Caption         =   "Configurar"
         Height          =   375
         Left            =   5640
         TabIndex        =   12
         Top             =   4320
         Width           =   2295
      End
      Begin VB.TextBox txtEsquemas 
         Height          =   285
         Left            =   240
         TabIndex        =   11
         Top             =   3240
         Width           =   7695
      End
      Begin VB.TextBox txtTemplates 
         Height          =   285
         Left            =   240
         TabIndex        =   10
         Top             =   2640
         Width           =   7695
      End
      Begin VB.TextBox txtCnpjSH 
         Height          =   285
         Left            =   240
         TabIndex        =   9
         Top             =   840
         Width           =   2655
      End
      Begin VB.TextBox txtTokenSh 
         Height          =   285
         Left            =   3000
         TabIndex        =   8
         Top             =   840
         Width           =   2535
      End
      Begin VB.ComboBox cbAmbiente 
         Height          =   315
         ItemData        =   "frmProjetoSimplificado.frx":0116
         Left            =   5640
         List            =   "frmProjetoSimplificado.frx":0120
         TabIndex        =   7
         Top             =   840
         Width           =   2295
      End
      Begin VB.TextBox txtTransmissor 
         Height          =   285
         Left            =   240
         TabIndex        =   6
         Top             =   1440
         Width           =   2655
      End
      Begin VB.TextBox txtEmpregador 
         Height          =   285
         Left            =   3000
         TabIndex        =   5
         Top             =   1440
         Width           =   2535
      End
      Begin VB.Label Label3 
         Caption         =   "Pincode (Para certificado A3)"
         Height          =   255
         Left            =   240
         TabIndex        =   38
         Top             =   3600
         Width           =   2295
      End
      Begin VB.Label Label1 
         Caption         =   "Grupo:"
         Height          =   255
         Index           =   4
         Left            =   5640
         TabIndex        =   36
         Top             =   1800
         Width           =   2535
      End
      Begin VB.Label Label1 
         Caption         =   "Identificador Lote"
         Height          =   255
         Index           =   0
         Left            =   -74760
         TabIndex        =   34
         Top             =   2400
         Width           =   2535
      End
      Begin VB.Label Label1 
         Caption         =   "Versão Manual:"
         Height          =   255
         Index           =   2
         Left            =   5640
         TabIndex        =   23
         Top             =   1200
         Width           =   2535
      End
      Begin VB.Label Label2 
         Caption         =   "Certificado:"
         Height          =   255
         Left            =   240
         TabIndex        =   22
         Top             =   1800
         Width           =   975
      End
      Begin VB.Label Label1 
         Caption         =   "Caminho Esquemas:"
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   21
         Top             =   3000
         Width           =   2535
      End
      Begin VB.Label Label1 
         Caption         =   "Caminho Templates:"
         Height          =   255
         Index           =   3
         Left            =   240
         TabIndex        =   20
         Top             =   2400
         Width           =   2535
      End
      Begin VB.Label Label1 
         Caption         =   "CPF / CNPJ SoftWare House:"
         Height          =   255
         Index           =   5
         Left            =   240
         TabIndex        =   19
         Top             =   600
         Width           =   2535
      End
      Begin VB.Label Label1 
         Caption         =   "Token SoftWare House:"
         Height          =   255
         Index           =   6
         Left            =   3000
         TabIndex        =   18
         Top             =   600
         Width           =   2535
      End
      Begin VB.Label Label1 
         Caption         =   "Ambiente:"
         Height          =   255
         Index           =   7
         Left            =   5640
         TabIndex        =   17
         Top             =   600
         Width           =   2535
      End
      Begin VB.Label Label1 
         Caption         =   "CNPJ Transmissor:"
         Height          =   255
         Index           =   8
         Left            =   240
         TabIndex        =   16
         Top             =   1200
         Width           =   2535
      End
      Begin VB.Label Label1 
         Caption         =   "CNPJ Empregador:"
         Height          =   255
         Index           =   9
         Left            =   3000
         TabIndex        =   15
         Top             =   1200
         Width           =   2535
      End
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   5895
      Left            =   0
      TabIndex        =   0
      Top             =   5760
      Width           =   8415
      _ExtentX        =   14843
      _ExtentY        =   10398
      _Version        =   393216
      TabHeight       =   520
      TabCaption(0)   =   "Retorno"
      TabPicture(0)   =   "frmProjetoSimplificado.frx":0143
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "tbRetorno"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).ControlCount=   1
      TabCaption(1)   =   "Xml de Envio"
      TabPicture(1)   =   "frmProjetoSimplificado.frx":015F
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "tbXmlEnvio"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "Xml de Retorno"
      TabPicture(2)   =   "frmProjetoSimplificado.frx":017B
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "tbXmlRetorno"
      Tab(2).ControlCount=   1
      Begin VB.TextBox tbXmlRetorno 
         Height          =   5295
         Left            =   -74880
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   3
         Top             =   480
         Width           =   8175
      End
      Begin VB.TextBox tbXmlEnvio 
         Height          =   5295
         Left            =   -74880
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   2
         Top             =   480
         Width           =   8175
      End
      Begin VB.TextBox tbRetorno 
         Height          =   5295
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   1
         Top             =   480
         Width           =   8175
      End
   End
End
Attribute VB_Name = "frmProjetoSimplificado"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public eSocial As ESocialSClientX.spdESocialSClientX





Private Sub btnAssinarXML_Click(Index As Integer)
    tbRetorno = eSocial.AssinarEvento(tbRetorno.Text)
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
    tbRetorno.Text = tbRetorno.Text & "nrInsc_9=08187168" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "iniValid_13=2021-08" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "classTrib_16=99" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indCoop_18=0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indConstr_19=0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indDesFolha_20=0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "indOptRegEletron_21=0" & vbNewLine & Chr(10)
    tbRetorno.Text = tbRetorno.Text & "SALVARS1000"
End Sub

Private Sub btnConfigurar_Click()
eSocial.NomeCertificado = cbCertificado.Text

If cbVersao.Text <> "" Then
eSocial.VersaoManual = cbVersao.Text
Else
MsgBox "Por favor, selecione uma Versao Manual"
End If


eSocial.DiretorioTemplates = txtTemplates.Text
eSocial.DiretorioEsquemas = txtEsquemas.Text
eSocial.CpfCnpjEmpregador = txtEmpregador.Text
eSocial.CpfCnpjTransmissor = txtTransmissor.Text

If txtTokenSh.Text <> "" Then
eSocial.ConfigurarSoftwareHouse txtCnpjSH.Text, txtTokenSh.Text
Else
MsgBox "Por favor, preencher o campo Token SoftwareHouse"
txtTokenSh.SetFocus
End If

eSocial.Pincode = txtPincode.Text




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


Private Sub cmdConsultar_Click()
    Dim RetConsulta As spdSRetConsultarLote
    Dim RetConsultaItem As spdSRetConsultarLoteItem
    Dim RetConsultaOcorrencia As spdSRetConsultarLoteOcorrencia
    Dim RetConsultaOcorrenciaEnvio As spdSRetConsultarLoteOcorrenciaEnvio
    Dim RetS5001 As spdSS5001
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
    If (True) Then
        tbRetorno.Text = tbRetorno.Text & "         ### S5003 ###" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "         Id: " & RetConsultaItem.S5003.Id & vbNewLine
        ' IdeEvento
        tbRetorno.Text = tbRetorno.Text & "         NrRecArqBase: " & RetConsultaItem.S5003.IdeEvento.NrRecArqBase & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "         perApur: " & RetConsultaItem.S5003.IdeEvento.PerApur & vbNewLine
        ' IdeEmpregador
        tbRetorno.Text = tbRetorno.Text & "         tpInsc: " & RetConsultaItem.S5003.IdeEmpregador.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "         nrInsc: " & RetConsultaItem.S5003.IdeEmpregador.NrInsc & vbNewLine

    
        For a = 0 To RetConsultaItem.S5003.InfoFGTS.CountIdeEstab - 1
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
    Dim RetEnvio As spdSRetEnviarLoteEventos
    
    
    Set RetEnvio = eSocial.EnviarLoteEventos(tbRetorno.Text, CInt(cbGrupo.Text))
    
    tbRetorno.Text = "### INCLUIR EVENTO ###" & vbNewLine
    tbRetorno.Text = "Identificador do Lote: " & RetEnvio.IdLote & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "Mensagem de Retorno: " & RetEnvio.Mensagem
    
    txtIdLote.Text = RetEnvio.IdLote
End Sub

Private Sub Command1_Click()
Dim ret&
ret = ShellExecute(Me.hwnd, "OPen", "https://atendimento.tecnospeed.com.br/hc/pt-br/articles/4404184018839-Guia-Geral-Componente-eSocial", "", "", 1)
End Sub

Private Sub Command2_Click()
Dim ret&
ret = ShellExecute(Me.hwnd, "OPen", "https://atendimento.tecnospeed.com.br/hc/pt-br/articles/360005419193-Propriedades-do-componente", "", "", 1)
End Sub

Private Sub Command3_Click()
ret = ShellExecute(Me.hwnd, "OPen", "https://atendimento.tecnospeed.com.br/hc/pt-br/articles/4405767728279-Componente-eSocial-Lista-de-M%C3%A9todos", "", "", 1)
End Sub

Private Sub Command4_Click()
ret = ShellExecute(Me.hwnd, "OPen", "https://atendimento.tecnospeed.com.br/hc/pt-br/sections/360002625094-Dicion%C3%A1rio-de-dados-2-5", "", "", 1)
End Sub

Private Sub Form_Load()
Set eSocial = New ESocialSClientX.spdESocialSClientX
eSocial.ConfigurarSoftwareHouse "08187168000160", "00000000000000000000000000"
frmProjetoSimplificado.Caption = "eSocial - TecnoSpeed - " + eSocial.versao

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
cbCertificado.ListIndex = 0
cbVersao.ListIndex = 0
cbAmbiente.ListIndex = 1
cbGrupo.ListIndex = 0
opIdLote.Value = True
txtCnpjSH.Text = "08187168000160"
txtEmpregador.Text = "08187168000160"
txtTransmissor.Text = "08187168000160"
' txtIdLote.Text = "f0fc5719-8b95-4291-9544-b14bf87216d0"

End Sub


VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmProjetoSimplificado 
   Caption         =   "Demo eSocial"
   ClientHeight    =   10335
   ClientLeft      =   165
   ClientTop       =   510
   ClientWidth     =   8445
   LinkTopic       =   "Form1"
   ScaleHeight     =   10335
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
      Tab(0).Control(11)=   "lbAvisoSimp"
      Tab(0).Control(11).Enabled=   0   'False
      Tab(0).Control(12)=   "txtEmpregador"
      Tab(0).Control(12).Enabled=   0   'False
      Tab(0).Control(13)=   "txtTransmissor"
      Tab(0).Control(13).Enabled=   0   'False
      Tab(0).Control(14)=   "cbAmbiente"
      Tab(0).Control(14).Enabled=   0   'False
      Tab(0).Control(15)=   "txtTokenSh"
      Tab(0).Control(15).Enabled=   0   'False
      Tab(0).Control(16)=   "txtCnpjSH"
      Tab(0).Control(16).Enabled=   0   'False
      Tab(0).Control(17)=   "txtTemplates"
      Tab(0).Control(17).Enabled=   0   'False
      Tab(0).Control(18)=   "txtEsquemas"
      Tab(0).Control(18).Enabled=   0   'False
      Tab(0).Control(19)=   "btnConfigurar"
      Tab(0).Control(19).Enabled=   0   'False
      Tab(0).Control(20)=   "cbVersao"
      Tab(0).Control(20).Enabled=   0   'False
      Tab(0).Control(21)=   "cbCertificado"
      Tab(0).Control(21).Enabled=   0   'False
      Tab(0).Control(22)=   "cbGrupo"
      Tab(0).Control(22).Enabled=   0   'False
      Tab(0).Control(23)=   "txtPincode"
      Tab(0).Control(23).Enabled=   0   'False
      Tab(0).ControlCount=   24
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
      Tab(2).Control(0)=   "Command1"
      Tab(2).Control(1)=   "Command2"
      Tab(2).Control(2)=   "Command3"
      Tab(2).Control(3)=   "Command4"
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
      Begin VB.Label lbAvisoSimp 
         Caption         =   $"frmProjetoSimplificado.frx":0143
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   495
         Left            =   120
         TabIndex        =   43
         Top             =   4920
         Width           =   7935
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
      TabPicture(0)   =   "frmProjetoSimplificado.frx":01CB
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "tbRetorno"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).ControlCount=   1
      TabCaption(1)   =   "Xml de Envio"
      TabPicture(1)   =   "frmProjetoSimplificado.frx":01E7
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "tbXmlEnvio"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "Xml de Retorno"
      TabPicture(2)   =   "frmProjetoSimplificado.frx":0203
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
Public eSocial As ESocialS12ClientX.spdESocialS12ClientX

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
    Dim RetConsulta As spdS12RetConsultarLote
    Dim RetConsultaItem As spdS12RetConsultarLoteItem
    Dim RetConsultaOcorrencia As spdS12RetConsultarLoteOcorrencia
    Dim RetConsultaOcorrenciaEnvio As spdS12RetConsultarLoteOcorrenciaEnvio
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
    tbRetorno.Text = tbRetorno.Text & " NumeroProtocolo: " & RetConsulta.NumeroProtocolo & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "        Mensagem: " & RetConsulta.Mensagem & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "          Status: " & RetConsulta.Status & vbNewLine
    tbRetorno.Text = tbRetorno.Text & "          IdLote: " & RetConsulta.IdLote & vbNewLine
    
    For k = 0 To RetConsulta.CountOcorrencias - 1
        Set RetConsultaOcorrenciaEnvio = RetConsulta.Ocorrencias(k)
        tbRetorno.Text = tbRetorno.Text & "      Codigo: " & RetConsultaOcorrenciaEnvio.Codigo & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        Tipo: " & RetConsultaOcorrenciaEnvio.Tipo & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " Localizacao: " & RetConsultaOcorrenciaEnvio.Localizacao & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "   Descricao: " & RetConsultaOcorrenciaEnvio.Descricao & vbNewLine
    Next
        
    For i = 0 To RetConsulta.Count - 1
        Set RetConsultaItem = RetConsulta.Eventos(i)
        tbRetorno.Text = tbRetorno.Text & "     IdEvento: " & RetConsultaItem.IdEvento & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NumeroRecibo: " & RetConsultaItem.NumeroRecibo & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        cStat: " & RetConsultaItem.cStat & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "     Mensagem: " & RetConsultaItem.Mensagem & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "       Status: " & RetConsultaItem.Status & vbNewLine
        
        
    If (RetConsultaItem.S5001.IsEmpty = False) Then
    '--------------------S5001--------------------
        tbRetorno.Text = tbRetorno.Text & "### S5001 ###" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " Id: " & RetConsultaItem.S5001.Id & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Identificação do evento de retorno.
        tbRetorno.Text = tbRetorno.Text & "IdeEvento" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrRecArqBase: " & RetConsultaItem.S5001.IdeEvento.NrRecArqBase & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "  IndApuracao: " & RetConsultaItem.S5001.IdeEvento.IndApuracao & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "      PerApur: " & RetConsultaItem.S5001.IdeEvento.PerApur & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Informações de identificação do empregador.
        tbRetorno.Text = tbRetorno.Text & "IdeEmpregador" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " TpInsc: " & RetConsultaItem.S5001.IdeEmpregador.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrInsc: " & RetConsultaItem.S5001.IdeEmpregador.NrInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Identificação do trabalhador.
        tbRetorno.Text = tbRetorno.Text & "IdeTrabalhador" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " CpfTrab: " & RetConsultaItem.S5001.IdeTrabalhador.CpfTrab & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Grupo de informações da sucessão de vínculo trabalhista.
        tbRetorno.Text = tbRetorno.Text & "sucessaoVinc" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    TpInsc: " & RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    NrInsc: " & RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.NrInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " MatricAnt: " & RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.MatricAnt & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "     DtAdm: " & RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.DtAdm & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Informações relativas ao trabalho intermitente.
        For a = 0 To RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.CountInfoInterm - 1
            tbRetorno.Text = tbRetorno.Text & "infoInterm" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " Dia: " & RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoInterm(a).Dia & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        Next a
        
        'Informações complementares contratuais do trabalhador.
        For a = 0 To RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.CountInfoComplCont - 1
            tbRetorno.Text = tbRetorno.Text & "infoComplCont" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "       CodCBO: " & RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoComplCont(a).CodCBO & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " NatAtividade: " & RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoComplCont(a).NatAtividade & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "  QtdDiasTrab: " & RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoComplCont(a).QtdDiasTrab & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        Next a
        
        'Informações sobre processos judiciais do trabalhador com decisão favorável quanto à não incidência ou alterações na incidência de contribuição previdenciária.
        For a = 0 To RetConsultaItem.S5001.IdeTrabalhador.CountProcJudTrab - 1
            tbRetorno.Text = tbRetorno.Text & "ProcJudTrab" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " NrProcJud: " & RetConsultaItem.S5001.IdeTrabalhador.ProcJudTrab(a).NrProcJud & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "   CodSusp: " & RetConsultaItem.S5001.IdeTrabalhador.ProcJudTrab(a).CodSusp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        Next a

        'Cálculo da contribuição previdenciária do segurado, incidente sobre a remuneração do período de apuração e de períodos anteriores informada nos eventos S-1200, S-2299 e S-2399.
        For a = 0 To RetConsultaItem.S5001.CountInfoCpCalc - 1
            tbRetorno.Text = tbRetorno.Text & "InfoCpCalc" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      tpCR: " & RetConsultaItem.S5001.InfoCpCalc(a).TpCR & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "   vrCpSeg: " & RetConsultaItem.S5001.InfoCpCalc(a).VrCpSeg & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " vrDescSeg: " & RetConsultaItem.S5001.InfoCpCalc(a).VrDescSeg & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        Next a
        
        'Informações sobre bases de cálculo, descontos e deduções de contribuições sociais devidas à Previdência Social e a Outras Entidades e Fundos, referentes à remuneração do período de apuração e de períodos anteriores informada nos eventos S-1200, S-2299 e S-2399.
        tbRetorno.Text = tbRetorno.Text & "infoCp" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " ClassTrib: " & RetConsultaItem.S5001.InfoCp.ClassTrib & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Identificação do estabelecimento ou obra de construção civil e da lotação tributária.
        For a = 0 To RetConsultaItem.S5001.InfoCp.CountIdeEstabLot - 1
            tbRetorno.Text = tbRetorno.Text & "ideEstabLot" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "     TpInsc: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).TpInsc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "     NrInsc: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).NrInsc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " CodLotacao: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).CodLotacao & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
          
            'Informações relativas à matrícula e categoria do trabalhador e tipos de incidências.
            For b = 0 To RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).CountInfoCategIncid - 1
                tbRetorno.Text = tbRetorno.Text & "InfoCategIncid" & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "  Matricula: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).Matricula & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "   codCateg: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CodCateg & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " IndSimples: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).IndSimples & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
            
                'Informações sobre bases de cálculo, descontos e deduções de contribuições sociais devidas à Previdência Social e a Outras Entidades e Fundos.
                For c = 0 To RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CountInfoBaseCS - 1
                    tbRetorno.Text = tbRetorno.Text & "InfoBaseCS" & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "   Ind13: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoBaseCS(c).Ind13 & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " TpValor: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoBaseCS(c).TpValor & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "   Valor: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoBaseCS(c).Valor & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                Next c
            
                'Cálculo das contribuições sociais devidas a Outras Entidades e Fundos.
                For c = 0 To RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CountCalcTerc - 1
                    tbRetorno.Text = tbRetorno.Text & "CalcTerc" & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "        TpCR: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CalcTerc(c).TpCR & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " VrCsSegTerc: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CalcTerc(c).VrCsSegTerc & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "  VrDescTerc: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CalcTerc(c).VrDescTerc & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                Next c
                
                'Informações de remuneração por período de referência.
                For c = 0 To RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).CountInfoPerRef - 1
                    tbRetorno.Text = tbRetorno.Text & "infoPerRef" & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " PerRef: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoPerRef(c).PerRef & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                
                    'Identificação do instrumento ou situação ensejadora da remuneração relativa a períodos de apuração anteriores.
                    For d = 0 To RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoPerRef(c).CountIdeADC - 1
                        tbRetorno.Text = tbRetorno.Text & "ideADC" & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & " DtAcConv: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoPerRef(c).IdeADC(d).DtAcConv & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & " TpAcConv: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoPerRef(c).IdeADC(d).TpAcConv & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & "      Dsc: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoPerRef(c).IdeADC(d).Dsc & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & " RemunSuc: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoPerRef(c).IdeADC(d).RemunSuc & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                    Next d
                    
                    For d = 0 To RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoPerRef(c).CountDetInfoPerRef - 1
                        tbRetorno.Text = tbRetorno.Text & "DetInfoPerRef" & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & "      Ind13: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoPerRef(c).DetInfoPerRef(d).Ind13 & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & " TpVrPerRef: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoPerRef(c).DetInfoPerRef(d).TpVrPerRef & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & "   VrPerRef: " & RetConsultaItem.S5001.InfoCp.IdeEstabLot(a).InfoCategIncid(b).InfoPerRef(c).DetInfoPerRef(d).VrPerRef & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                    Next d
                Next c
            Next b
        Next a
    End If 'Fim do IF do S5001
    

    If (RetConsultaItem.S5002.IsEmpty = False) Then
    '--------------------S5002--------------------
        tbRetorno.Text = tbRetorno.Text & "### S5002 ###" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " Id: " & RetConsultaItem.S5002.Id & vbNewLine
        
        'Identificação única do evento.
        tbRetorno.Text = tbRetorno.Text & "IdeEvento" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrRecArqBase: " & RetConsultaItem.S5002.IdeEvento.NrRecArqBase & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "      PerApur: " & RetConsultaItem.S5002.IdeEvento.PerApur & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Informações de identificação do empregador.
        tbRetorno.Text = tbRetorno.Text & "IdeEmpregador" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " TpInsc: " & RetConsultaItem.S5002.IdeEmpregador.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrInsc: " & RetConsultaItem.S5002.IdeEmpregador.NrInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Identificação do beneficiário do pagamento.
        tbRetorno.Text = tbRetorno.Text & "IdeTrabalhador" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " CpfBenef: " & RetConsultaItem.S5002.IdeTrabalhador.CpfBenef & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                
        'Informações do demonstrativo de valores devidos.
        For a = 0 To RetConsultaItem.S5002.IdeTrabalhador.CountDmDev - 1
            tbRetorno.Text = tbRetorno.Text & "DmDev" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "   PerRef: " & RetConsultaItem.S5002.IdeTrabalhador.DmDev(a).PerRef & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " IdeDmDev: " & RetConsultaItem.S5002.IdeTrabalhador.DmDev(a).IdeDmDev & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "   TpPgto: " & RetConsultaItem.S5002.IdeTrabalhador.DmDev(a).TpPgto & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "   DtPgto: " & RetConsultaItem.S5002.IdeTrabalhador.DmDev(a).DtPgto & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " CodCateg: " & RetConsultaItem.S5002.IdeTrabalhador.DmDev(a).CodCateg & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
            
            'Rendimentos tributáveis, deduções, isenções e retenções do IRRF.
            For b = 0 To RetConsultaItem.S5002.IdeTrabalhador.DmDev(a).CountInfoIR - 1
                tbRetorno.Text = tbRetorno.Text & "InfoIR" & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " TpInfoIR: " & RetConsultaItem.S5002.IdeTrabalhador.DmDev(a).InfoIR(b).TpInfoIR & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "    Valor: " & RetConsultaItem.S5002.IdeTrabalhador.DmDev(a).InfoIR(b).Valor & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
            Next b
            
            'Totalizador de tributos com período de apuração mensal.
            For b = 0 To RetConsultaItem.S5002.IdeTrabalhador.DmDev(a).CountTotApurMen - 1
                tbRetorno.Text = tbRetorno.Text & "totApurMen" & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "        CRMen: " & RetConsultaItem.S5002.IdeTrabalhador.DmDev(a).TotApurMen(b).CRMen & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "     VlrCRMen: " & RetConsultaItem.S5002.IdeTrabalhador.DmDev(a).TotApurMen(b).VlrCRMen & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
            Next b
            
            'Totalizador de tributos com período de apuração diário.
            For b = 0 To RetConsultaItem.S5002.IdeTrabalhador.DmDev(a).CountTotApurDia - 1
                tbRetorno.Text = tbRetorno.Text & "totApurDia" & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "   PerApurDia: " & RetConsultaItem.S5002.IdeTrabalhador.DmDev(a).TotApurDia(b).PerApurDia & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "        CRDia: " & RetConsultaItem.S5002.IdeTrabalhador.DmDev(a).TotApurDia(b).CRDia & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "     VlrCRDia: " & RetConsultaItem.S5002.IdeTrabalhador.DmDev(a).TotApurDia(b).VlrCRDia & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
            Next b
        Next a 'Fim do InfoIrrf
    End If 'Fim do IF do S5002
  
    If (RetConsultaItem.S5003.IsEmpty = False) Then
    '--------------------S5003--------------------
        tbRetorno.Text = tbRetorno.Text & "### S5003 ###" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " Id: " & RetConsultaItem.S5003.Id & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Identificação do evento de retorno.
        tbRetorno.Text = tbRetorno.Text & "IdeEvento" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrRecArqBase: " & RetConsultaItem.S5003.IdeEvento.NrRecArqBase & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "  IndApuracao: " & RetConsultaItem.S5003.IdeEvento.IndApuracao & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "      perApur: " & RetConsultaItem.S5003.IdeEvento.PerApur & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Informações de identificação do empregador.
        tbRetorno.Text = tbRetorno.Text & "ideEmpregador" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " TpInsc: " & RetConsultaItem.S5003.IdeEmpregador.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrInsc: " & RetConsultaItem.S5003.IdeEmpregador.NrInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Grupo que apresenta a identificação básica do trabalhador ao qual se refere o evento de retorno.
        tbRetorno.Text = tbRetorno.Text & "ideTrabalhador" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " CpfTrab: " & RetConsultaItem.S5003.IdeTrabalhador.CpfTrab & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Informações relativas ao Fundo de Garantia do Tempo de Serviço - FGTS.
        tbRetorno.Text = tbRetorno.Text & "InfoFGTS" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    DtVenc: " & RetConsultaItem.S5003.InfoFGTS.DtVenc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " ClassTrib: " & RetConsultaItem.S5003.InfoFGTS.ClassTrib & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
    
        'Identificação do estabelecimento ou obra de construção civil.
        For a = 0 To RetConsultaItem.S5003.InfoFGTS.CountIdeEstab - 1
            tbRetorno.Text = tbRetorno.Text & "IdeEstab" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " TpInsc: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).TpInsc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " NrInsc: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).NrInsc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
            
            'Identificação da lotação tributária.
            For b = 0 To RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).CountIdeLotacao - 1
                tbRetorno.Text = tbRetorno.Text & "IdeLotacao" & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " CodLotacao: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).CodLotacao & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "  TpLotacao: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).TpLotacao & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "     TpInsc: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).TpInsc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "     NrInsc: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).NrInsc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                
                'Informações relativas à matrícula e categoria do trabalhador.
                For c = 0 To RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).CountInfoTrabFGTS - 1
                    tbRetorno.Text = tbRetorno.Text & "InfoTrabFGTS" & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "    Matricula: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).Matricula & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "     CodCateg: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).CodCateg & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "    CategOrig: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).CategOrig & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "    TpRegTrab: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).TpRegTrab & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "     RemunSuc: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).RemunSuc & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "     DtDeslig: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).DtDeslig & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "    MtvDeslig: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).MtvDeslig & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "       DtTerm: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).DtTerm & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " MtvDesligTSV: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).MtvDesligTSV & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                
                'Grupo de informações da sucessão de vínculo trabalhista.
                tbRetorno.Text = tbRetorno.Text & "SucessaoVinc" & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "    TpInsc: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).SucessaoVinc.TpInsc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "    NrInsc: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).SucessaoVinc.NrInsc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " MatricAnt: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).SucessaoVinc.MatricAnt & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "     DtAdm: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).SucessaoVinc.DtAdm & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                        
                    'Informações referentes a bases de cálculo e valores do FGTS.
                    For d = 0 To RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).CountInfoBaseFGTS - 1
                        
                        'Informações sobre bases de cálculo e valores do FGTS referentes à remuneração do período de apuração e de períodos anteriores, exceto se {tpAcConv} = [E, H].
                        For e = 0 To RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).CountBasePerApur - 1
                            tbRetorno.Text = tbRetorno.Text & "InfoBaseFGTS.BasePerApur" & vbNewLine
                            tbRetorno.Text = tbRetorno.Text & "  TpValor: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).BasePerApur(e).TpValor & vbNewLine
                            tbRetorno.Text = tbRetorno.Text & " IndIncid: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).BasePerApur(e).IndIncid & vbNewLine
                            tbRetorno.Text = tbRetorno.Text & "  RemFGTS: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).BasePerApur(e).RemFGTS & vbNewLine
                            tbRetorno.Text = tbRetorno.Text & "  DpsFGTS: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).BasePerApur(e).DpsFGTS & vbNewLine
                            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                            
                            'Detalhamento da(s) rubrica(s) com incidência de FGTS suspensa em decorrência de decisão judicial.
                            For f = 0 To RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).BasePerApur(e).CountDetRubrSusp - 1
                                tbRetorno.Text = tbRetorno.Text & "DetRubrSusp" & vbNewLine
                                tbRetorno.Text = tbRetorno.Text & "    CodRubr: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).BasePerApur(e).DetRubrSusp(f).CodRubr & vbNewLine
                                tbRetorno.Text = tbRetorno.Text & " IdeTabRubr: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).BasePerApur(e).DetRubrSusp(f).IdeTabRubr & vbNewLine
                                tbRetorno.Text = tbRetorno.Text & "     VrRubr: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).BasePerApur(e).DetRubrSusp(f).VrRubr & vbNewLine
                                tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                                
                                'Processo(s) judicial(is) com decisão/sentença favorável, determinando a não incidência de FGTS.
                                For g = 0 To RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).BasePerApur(e).DetRubrSusp(f).CountIdeProcessoFGTS - 1
                                    tbRetorno.Text = tbRetorno.Text & "IdeProcessoFGTS" & vbNewLine
                                    tbRetorno.Text = tbRetorno.Text & " NrProc: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).BasePerApur(e).DetRubrSusp(f).IdeProcessoFGTS(g).NrProc & vbNewLine
                                    tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                                Next g
                            Next f
                        Next e
                        
                        'Informações referentes a bases de cálculo e valores do FGTS de períodos anteriores quando tpAcConv = [E, H].
                        For e = 0 To RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).CountInfoBasePerAntE - 1
                            tbRetorno.Text = tbRetorno.Text & "InfoBasePerAntE" & vbNewLine
                            tbRetorno.Text = tbRetorno.Text & "   PerRef: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).InfoBasePerAntE(e).PerRef & vbNewLine
                            tbRetorno.Text = tbRetorno.Text & " TpAcConv: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).InfoBasePerAntE(e).TpAcConv & vbNewLine
                            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                            
                            'Informações sobre bases de cálculo e valores do FGTS referentes à remuneração de períodos anteriores quando tpAcConv = [E, H].
                            For f = 0 To RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).InfoBasePerAntE(e).CountBasePerAntE - 1
                                tbRetorno.Text = tbRetorno.Text & "BasePerAntE" & vbNewLine
                                tbRetorno.Text = tbRetorno.Text & "  TpValorE: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).InfoBasePerAntE(e).BasePerAntE(f).TpValorE & vbNewLine
                                tbRetorno.Text = tbRetorno.Text & " IndIncidE: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).InfoBasePerAntE(e).BasePerAntE(f).IndIncidE & vbNewLine
                                tbRetorno.Text = tbRetorno.Text & "  RemFGTSE: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).InfoBasePerAntE(e).BasePerAntE(f).RemFGTSE & vbNewLine
                                tbRetorno.Text = tbRetorno.Text & "  DpsFGTSE: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).InfoBasePerAntE(e).BasePerAntE(f).DpsFGTSE & vbNewLine
                                tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                                
                                'Detalhamento da(s) rubrica(s) com incidência de FGTS suspensa em decorrência de decisão judicial.
                                For g = 0 To RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).InfoBasePerAntE(e).BasePerAntE(f).CountDetRubrSuspPerAntE - 1
                                    tbRetorno.Text = tbRetorno.Text & "detRubrSusp" & vbNewLine
                                    tbRetorno.Text = tbRetorno.Text & "    CodRubr: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).InfoBasePerAntE(e).BasePerAntE(f).DetRubrSuspPerAntE(g).CodRubr & vbNewLine
                                    tbRetorno.Text = tbRetorno.Text & " IdeTabRubr: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).InfoBasePerAntE(e).BasePerAntE(f).DetRubrSuspPerAntE(g).IdeTabRubr & vbNewLine
                                    tbRetorno.Text = tbRetorno.Text & "     VrRubr: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).InfoBasePerAntE(e).BasePerAntE(f).DetRubrSuspPerAntE(g).VrRubr & vbNewLine
                                    tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                                    
                                    'Processo(s) judicial(is) com decisão/sentença favorável, determinando a não incidência de FGTS.
                                    For h = 0 To RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).InfoBasePerAntE(e).BasePerAntE(f).DetRubrSuspPerAntE(g).CountIdeProcessoFGTS - 1
                                        tbRetorno.Text = tbRetorno.Text & "ideProcessoFGTS" & vbNewLine
                                        tbRetorno.Text = tbRetorno.Text & " NrProc: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).InfoBaseFGTS(d).InfoBasePerAntE(e).BasePerAntE(f).DetRubrSuspPerAntE(g).IdeProcessoFGTS(h).NrProc & vbNewLine
                                        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                                    Next h
                                Next g
                            Next f
                        Next e
                    Next d
                    'Informação sobre processo judicial que suspende a exigibilidade da Contribuição Social Rescisória.
                    tbRetorno.Text = tbRetorno.Text & "ProcCS" & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " NrProcJud: " & RetConsultaItem.S5003.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoTrabFGTS(c).ProcCS.NrProcJud & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                Next c
            Next b
        Next a
    End If

    If (RetConsultaItem.S5011.IsEmpty = False) Then
    '--------------------S5011--------------------
        tbRetorno.Text = tbRetorno.Text & " ### S5011 ###" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " Id: " & RetConsultaItem.S5011.Id & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
    
        'Identificação do evento de retorno.
        tbRetorno.Text = tbRetorno.Text & "ideEvento" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " IndApuracao: " & RetConsultaItem.S5011.IdeEvento.IndApuracao & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "     PerApur: " & RetConsultaItem.S5011.IdeEvento.PerApur & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Informações de identificação do empregador.
        tbRetorno.Text = tbRetorno.Text & "ideEmpregador" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " TpInsc: " & RetConsultaItem.S5011.IdeEmpregador.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrInsc: " & RetConsultaItem.S5011.IdeEmpregador.NrInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
    
        'Informações relativas às contribuições sociais devidas à Previdência Social e a Outras Entidades e Fundos.
        tbRetorno.Text = tbRetorno.Text & "InfoCS" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrRecArqBase: " & RetConsultaItem.S5011.InfoCS.NrRecArqBase & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " IndExistInfo: " & RetConsultaItem.S5011.InfoCS.IndExistInfo & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
    
        'Informações de contribuição previdenciária do segurado.
        tbRetorno.Text = tbRetorno.Text & "InfoCPSeg" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " VrDescCP: " & RetConsultaItem.S5011.InfoCS.InfoCPSeg.VrDescCP & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "  VrCpSeg: " & RetConsultaItem.S5011.InfoCS.InfoCPSeg.VrCpSeg & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
    
        'Informações gerais do contribuinte necessárias à apuração das contribuições sociais.
        tbRetorno.Text = tbRetorno.Text & "infoContrib" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " ClassTrib: " & RetConsultaItem.S5011.InfoCS.InfoContrib.ClassTrib & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Informações complementares, exclusivas da Pessoa Jurídica.
        tbRetorno.Text = tbRetorno.Text & "infoPJ" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "               indCoop: " & RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.IndCoop & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "             indConstr: " & RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.IndConstr & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "          indSubstPatr: " & RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.IndSubstPatr & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "        percRedContrib: " & RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.PercRedContrib & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "            PercTransf: " & RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.PercTransf & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " IndTribFolhaPisCofins: " & RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.IndTribFolhaPisCofins & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
    
        'Informações prestadas por empresa enquadrada no regime de tributação Simples Nacional com tributação previdenciária substituída e não substituída.
        tbRetorno.Text = tbRetorno.Text & "InfoAtConc" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " FatorMes: " & RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.FatorMes & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " Fator13: " & RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.Fator13 & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Informações de identificação do estabelecimento ou obra de construção civil.
        For a = 0 To RetConsultaItem.S5011.InfoCS.CountIdeEstab - 1
            tbRetorno.Text = tbRetorno.Text & "IdeEstab" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " TpInsc: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).TpInsc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " NrInsc: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).NrInsc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
    
            'Informações relativas a cada estabelecimento, necessárias à apuração das contribuições sociais.
            tbRetorno.Text = tbRetorno.Text & "InfoEstab" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CnaePrep: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoEstab.CnaePrep & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      CnpjResp: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoEstab.CnpjResp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "       AliqRat: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoEstab.AliqRat & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "           Fap: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoEstab.Fap & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "  AliqRatAjust: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoEstab.AliqRatAjust & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
            
            'Informações de RAT e FAP de referência, nos casos de processo administrativo ou judicial que altere a(s) alíquota(s).
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "      AliqRat: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoEstab.InfoEstabRef.AliqRat & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "          Fap: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoEstab.InfoEstabRef.Fap & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " AliqRatAjust: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoEstab.InfoEstabRef.AliqRatAjust & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
    
            'Informações complementares relativas a obras de construção civil.
            tbRetorno.Text = tbRetorno.Text & "InfoComplObra" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " IndSubstPatrObra: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoEstab.InfoComplObra.IndSubstPatrObra & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
    
            'Identificação da lotação tributária.
            For b = 0 To RetConsultaItem.S5011.InfoCS.IdeEstab(a).CountIdeLotacao - 1
                tbRetorno.Text = tbRetorno.Text & "IdeLotacao" & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "   CodLotacao: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).CodLotacao & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "         Fpas: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).Fpas & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "     CodTercs: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).CodTercs & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " CodTercsSusp: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).CodTercsSusp & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
    
                'Informações de suspensão de contribuições destinadas a Outras Entidades e Fundos (Terceiros).
                For c = 0 To RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).CountInfoTercSusp - 1
                    tbRetorno.Text = tbRetorno.Text & "InfoTercSusp" & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " CodTerc: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoTercSusp(c).CodTerc & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                Next c
                
            'Informação complementar que apresenta identificação do contratante e do proprietário de obra de construção civil contratada sob regime de empreitada parcial ou subempreitada.
            tbRetorno.Text = tbRetorno.Text & "InfoEmprParcial" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " tpInscContrat: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoEmprParcial.TpInscContrat & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " nrInscContrat: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoEmprParcial.NrInscContrat & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "    tpInscProp: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoEmprParcial.TpInscProp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "    nrInscProp: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoEmprParcial.NrInscProp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "       CnoObra: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoEmprParcial.CnoObra & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
            
            'Informações relativas ao operador portuário.
            tbRetorno.Text = tbRetorno.Text & "DadosOpPort" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " CnpjOpPortuario: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).DadosOpPort.CnpjOpPortuario & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "         AliqRat: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).DadosOpPort.AliqRat & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "             Fap: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).DadosOpPort.Fap & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "    AliqRatAjust: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).DadosOpPort.AliqRatAjust & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
    
                'Bases de cálculo da contribuição previdenciária incidente sobre remunerações, por categoria.
                For c = 0 To RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).CountBasesRemun - 1
                    tbRetorno.Text = tbRetorno.Text & "BasesRemun" & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " IndIncid: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).IndIncid & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " CodCateg: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).CodCateg & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
              
                    'Valores correspondentes às bases, contribuições do segurado e deduções da contribuição previdenciária.
                    tbRetorno.Text = tbRetorno.Text & "BasesCp" & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "       vrBcCp00: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrBcCp00 & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "       vrBcCp15: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrBcCp15 & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "       vrBcCp20: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrBcCp20 & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "       vrBcCp25: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrBcCp25 & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "   vrSuspBcCp00: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSuspBcCp00 & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "   vrSuspBcCp15: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSuspBcCp15 & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "   vrSuspBcCp20: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSuspBcCp20 & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "   vrSuspBcCp25: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSuspBcCp25 & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "     VrBcCp00VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrBcCp00VA & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "     VrBcCp15VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrBcCp15VA & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "     VrBcCp15VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrBcCp20VA & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "     VrBcCp25VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrBcCp25VA & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " VrSuspBcCp00VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSuspBcCp00VA & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " VrSuspBcCp15VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSuspBcCp15VA & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " VrSuspBcCp15VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSuspBcCp20VA & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " VrSuspBcCp25VA: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSuspBcCp25VA & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "     vrDescSest: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrDescSest & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "     vrCalcSest: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrCalcSest & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "    vrDescSenat: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrDescSenat & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "    vrCalcSenat: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrCalcSenat & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "       vrSalFam: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSalFam & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "       vrSalMat: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesRemun(c).BasesCp.VrSalMat & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                Next c
    
            'Informações de bases de cálculo relativas à contratação de trabalhadores avulsos não portuários.
            tbRetorno.Text = tbRetorno.Text & "BasesAvNPort" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " vrBcCp00: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.VrBcCp00 & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " vrBcCp15: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.VrBcCp15 & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " vrBcCp20: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.VrBcCp20 & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " vrBcCp25: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.VrBcCp25 & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " vrBcCp13: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.VrBcCp13 & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " vrDescCP: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).BasesAvNPort.VrDescCP & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                    
                'Grupo preenchido exclusivamente pelo Órgão Gestor de Mão de Obra - OGMO (classTrib = [09]), relativamente a operador portuário enquadrado nos arts. 7º a 9º da Lei 12.546/2011.
                For c = 0 To RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).CountInfoSubstPatrOpOrt - 1
                    tbRetorno.Text = tbRetorno.Text & "InfoSubstPatrOpPort" & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " CnpjOpPortuario: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).IdeLotacao(b).InfoSubstPatrOpPort(c).CnpjOpPortuario & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                Next c
            Next b
    
            'Informações de bases de cálculo relativas à aquisição de produção rural.
            For b = 0 To RetConsultaItem.S5011.InfoCS.IdeEstab(a).CountBasesAquis - 1
                tbRetorno.Text = tbRetorno.Text & "BasesAquis" & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "    indAquis: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).IndAquis & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "    vlrAquis: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VlrAquis & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "  vrCPDescPR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrCPDescPR & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "    vrCPNRet: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrCPNRet & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "   vrRatNRet: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrRatNRet & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " vrSenarNRet: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrSenarNRet & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "  vrCPCalcPR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrCPCalcPR & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " vrRatDescPR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrRatDescPR & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " vrRatCalcPR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrRatCalcPR & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " vrSenarDesc: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrSenarDesc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " vrSenarCalc: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesAquis(b).VrSenarCalc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
            Next b
    
            'Informações de bases de cálculo relativas à comercialização da produção rural da Pessoa Física.
            For b = 0 To RetConsultaItem.S5011.InfoCS.IdeEstab(a).CountBasesComerc - 1
                tbRetorno.Text = tbRetorno.Text & "BasesComerc" & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "   indComerc: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesComerc(b).IndComerc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "   vrBcComPR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesComerc(b).VrBcComPR & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "    vrCPSusp: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesComerc(b).VrCPSusp & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "   vrRatSusp: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesComerc(b).VrRatSusp & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " vrSenarSusp: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).BasesComerc(b).VrSenarSusp & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
            Next b
    
            'Informações das contribuições sociais devidas à Previdência Social e Outras Entidades e Fundos, consolidadas por estabelecimento e por Código de Receita - CR.
            For b = 0 To RetConsultaItem.S5011.InfoCS.IdeEstab(a).CountInfoCREstab - 1
                tbRetorno.Text = tbRetorno.Text & "InfoCREstab" & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "     tpCR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoCREstab(b).TpCR & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "     vrCR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoCREstab(b).VrCR & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " vrSuspCR: " + RetConsultaItem.S5011.InfoCS.IdeEstab(a).InfoCREstab(b).VrSuspCR & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
            Next b
        Next a
        
        'Informações consolidadas das contribuições sociais devidas à Previdência Social e Outras Entidades e Fundos, por Código de Receita - CR.
        For a = 0 To RetConsultaItem.S5011.InfoCS.CountInfoCRContrib - 1
            tbRetorno.Text = tbRetorno.Text & "infoCRContrib" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        tpCR: " + RetConsultaItem.S5011.InfoCS.InfoCRContrib(a).TpCR & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrCR: " + RetConsultaItem.S5011.InfoCS.InfoCRContrib(a).VrCR & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "        vrCRSusp: " + RetConsultaItem.S5011.InfoCS.InfoCRContrib(a).VrCRSusp & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        Next a
    End If
    
    If (RetConsultaItem.S5012.IsEmpty = False) Then
    '--------------------S5012--------------------
        tbRetorno.Text = tbRetorno.Text & "### S5012 ###" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " Id: " & RetConsultaItem.S5012.Id & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Identificação do evento de retorno.
        tbRetorno.Text = tbRetorno.Text & "IdeEvento" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " PerApur: " & RetConsultaItem.S5012.IdeEvento.PerApur & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Informações de identificação do empregador.
        tbRetorno.Text = tbRetorno.Text & "IdeEmpregador" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " TpInsc: " & RetConsultaItem.S5012.IdeEmpregador.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrInsc: " & RetConsultaItem.S5012.IdeEmpregador.NrInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Informações relativas ao Imposto de Renda.
        tbRetorno.Text = tbRetorno.Text & "infoIRRF" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrRecArqBase: " & RetConsultaItem.S5012.InfoIRRF.NrRecArqBase & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " IndExistInfo: " & RetConsultaItem.S5012.InfoIRRF.IndExistInfo & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Informações consolidadas do IRRF, por Código de Receita - CR mensal.
        For a = 0 To RetConsultaItem.S5012.InfoIRRF.CountInfoCRMen - 1
            tbRetorno.Text = tbRetorno.Text & "infoCRMen" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "       CRMen: " & RetConsultaItem.S5012.InfoIRRF.InfoCRMen(a).CRMen & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "     VrCRMen: " & RetConsultaItem.S5012.InfoIRRF.InfoCRMen(a).VrCRMen & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        Next a
        
        'Informações consolidadas do IRRF, por Código de Receita - CR diário.
        For a = 0 To RetConsultaItem.S5012.InfoIRRF.CountInfoCRDia - 1
            tbRetorno.Text = tbRetorno.Text & "infoCRDia" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "  PerApurDia: " & RetConsultaItem.S5012.InfoIRRF.InfoCRDia(a).PerApurDia & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "       CRDia: " & RetConsultaItem.S5012.InfoIRRF.InfoCRDia(a).CRDia & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "     VrCRDia: " & RetConsultaItem.S5012.InfoIRRF.InfoCRDia(a).VrCRDia & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        Next a
    End If
    
    
    If (RetConsultaItem.S5013.IsEmpty = False) Then
    '--------------------S5013--------------------
        tbRetorno.Text = tbRetorno.Text & "### S5013 ###" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " Id: " & RetConsultaItem.S5013.Id & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Identificação do evento de retorno.
        tbRetorno.Text = tbRetorno.Text & "IdeEvento" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " IndApuracao: " & RetConsultaItem.S5013.IdeEvento.IndApuracao & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "     perApur: " & RetConsultaItem.S5013.IdeEvento.PerApur & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Informações de identificação do empregador.
        tbRetorno.Text = tbRetorno.Text & "IdeEmpregador" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrInsc: " & RetConsultaItem.S5013.IdeEmpregador.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrInsc: " & RetConsultaItem.S5013.IdeEmpregador.NrInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Informações relativas ao Fundo de Garantia do Tempo de Serviço - FGTS.
        tbRetorno.Text = tbRetorno.Text & "infoFGTS" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrRecArqBase: " & RetConsultaItem.S5013.InfoFGTS.NrRecArqBase & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " IndExistInfo: " & RetConsultaItem.S5013.InfoFGTS.IndExistInfo & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Identificação do estabelecimento ou obra de construção civil.
        For a = 0 To RetConsultaItem.S5013.InfoFGTS.CountIdeEstab - 1
            tbRetorno.Text = tbRetorno.Text & "ideEstab" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " TpInsc: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).TpInsc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " NrInsc: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).NrInsc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
            
            'Identificação da lotação tributária.
            For b = 0 To RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).CountIdeLotacao - 1
                tbRetorno.Text = tbRetorno.Text & "IdeLotacao" & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " CodLotacao: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).CodLotacao & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "  TpLotacao: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).TpLotacao & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "     TpInsc: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).TpInsc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "     NrInsc: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).NrInsc & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                
                'Informações consolidadas das bases de cálculo e valores do FGTS do período de apuração e de períodos anteriores, exceto se {tpAcConv} = [E, H].
                For c = 0 To RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoBaseFGTS.CountBasePerApur - 1
                    tbRetorno.Text = tbRetorno.Text & "basePerApur" & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "   TpInsc: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoBaseFGTS.BasePerApur(c).TpValor & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " IndIncid: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoBaseFGTS.BasePerApur(c).IndIncid & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " BaseFGTS: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoBaseFGTS.BasePerApur(c).BaseFGTS & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "   VrFGTS: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoBaseFGTS.BasePerApur(c).VrFGTS & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                Next c
                
                'Informações referentes a bases de cálculo e valores do FGTS de períodos anteriores quando tpAcConv = [E, H].
                For c = 0 To RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoBaseFGTS.CountInfoBasePerAntE - 1
                    tbRetorno.Text = tbRetorno.Text & "InfoBasePerAntE" & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "   PerRef: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoBaseFGTS.InfoBasePerAntE(c).PerRef & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & " TpAcConv: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoBaseFGTS.InfoBasePerAntE(c).TpAcConv & vbNewLine
                    tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                    
                    '
                    For d = 0 To RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoBaseFGTS.InfoBasePerAntE(c).CountBasePerAntE - 1
                        tbRetorno.Text = tbRetorno.Text & "BasePerAntE" & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & "  TpValorE: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoBaseFGTS.InfoBasePerAntE(c).BasePerAntE(d).TpValorE & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & " IndIncidE: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoBaseFGTS.InfoBasePerAntE(c).BasePerAntE(d).IndIncidE & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & " BaseFGTSE: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoBaseFGTS.InfoBasePerAntE(c).BasePerAntE(d).BaseFGTSE & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & "   VrFGTSE: " & RetConsultaItem.S5013.InfoFGTS.IdeEstab(a).IdeLotacao(b).InfoBaseFGTS.InfoBasePerAntE(c).BasePerAntE(d).VrFGTSE & vbNewLine
                        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
                    Next d
                Next c
            Next b
        Next a
    End If
        
    If (RetConsultaItem.S5501.IsEmpty = False) Then
    '--------------------S5501--------------------
        tbRetorno.Text = tbRetorno.Text & "### S5501 ###" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " Id: " & RetConsultaItem.S5501.Id & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine

        'Informações de identificação do evento.
        tbRetorno.Text = tbRetorno.Text & "IdeEvento" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrRecArqBase: " & RetConsultaItem.S5501.IdeEvento.NrRecArqBase & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
 
        'Informações de identificação do empregador ou do contribuinte que prestou a informação.
        tbRetorno.Text = tbRetorno.Text & "ideEmpregador" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " TpInsc: " & RetConsultaItem.S5501.IdeEmpregador.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrInsc: " & RetConsultaItem.S5501.IdeEmpregador.NrInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Identificação do processo.
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrProcTrab: " & RetConsultaItem.S5501.IdeProc.NrProcTrab & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "    PerApur: " & RetConsultaItem.S5501.IdeProc.PerApur & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Identificação do período e da base de cálculo dos tributos referentes ao processo trabalhista.
        For a = 0 To RetConsultaItem.S5501.IdeProc.CountInfoTributos - 1
            tbRetorno.Text = tbRetorno.Text & "infoTributos" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " PerRef: " & RetConsultaItem.S5501.IdeProc.InfoTributos(a).PerRef & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
            
            'Informações das contribuições sociais devidas à Previdência Social e Outras Entidades e Fundos, consolidadas por perRef e por Código de Receita - CR.
            For b = 0 To RetConsultaItem.S5501.IdeProc.InfoTributos(a).CountInfoCRContrib - 1
                tbRetorno.Text = tbRetorno.Text & "infoCRContrib" & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " TpCR: " & RetConsultaItem.S5501.IdeProc.InfoTributos(a).InfoCRContrib(b).TpCR & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " VrCR: " & RetConsultaItem.S5501.IdeProc.InfoTributos(a).InfoCRContrib(b).VrCR & vbNewLine
                tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
            Next b
        Next a
           
        'Informações de Imposto de Renda Retido na Fonte, consolidadas por Código de Receita - CR.
        For a = 0 To RetConsultaItem.S5501.IdeProc.CountInfoCRIRRF - 1
            tbRetorno.Text = tbRetorno.Text & "infoCRIRRF" & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " TpCR: " & RetConsultaItem.S5501.IdeProc.InfoCRIRRF(a).TpCR & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " VrCR: " & RetConsultaItem.S5501.IdeProc.InfoCRIRRF(a).VrCR & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        Next a
    End If
    
            
    If (RetConsultaItem.S5503.IsEmpty = False) Then
    '--------------------S5503--------------------
        tbRetorno.Text = tbRetorno.Text & "### S5503 ###" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " Id: " & RetConsultaItem.S5503.Id & vbNewLine
        tbRetorno.Text = tbRetorno.Text & ""

        'Informacoes de identificao do evento.
        tbRetorno.Text = tbRetorno.Text & "ideEvento" & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrRecArqBase: " & RetConsultaItem.S5503.IdeEvento.NrRecArqBase & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "      PerApur: " & RetConsultaItem.S5503.IdeEvento.PerApur & vbNewLine
        tbRetorno.Text = tbRetorno.Text & "" & vbNewLine
        
        'Informacoes de identificacao do empregador ou do contribuinte que prestou a informacao.
        tbRetorno.Text = tbRetorno.Text & "ideEmpregador')"
        tbRetorno.Text = tbRetorno.Text & " TpInsc: " & RetConsultaItem.S5503.IdeEmpregador.TpInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrInsc: " & RetConsultaItem.S5503.IdeEmpregador.NrInsc & vbNewLine
        tbRetorno.Text = tbRetorno.Text & ""
        
        'Identificacao do processo.
        tbRetorno.Text = tbRetorno.Text & "ideProc"
        tbRetorno.Text = tbRetorno.Text & "     Origem: " & RetConsultaItem.S5503.IdeProc.Origem & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " NrProcTrab: " & RetConsultaItem.S5503.IdeProc.NrProcTrab & vbNewLine
        tbRetorno.Text = tbRetorno.Text & ""
        
        'Grupo que apresenta a identificacao basica do trabalhador ao qual se refere o evento de retorno.
        tbRetorno.Text = tbRetorno.Text & "ideTrabalhador "
        tbRetorno.Text = tbRetorno.Text & " CpfTrab: " & RetConsultaItem.S5503.IdeTrabalhador.CpfTrab & vbNewLine
        tbRetorno.Text = tbRetorno.Text & " "
        
        'Informacoes relativas matricula e categoria do trabalhador.
            For a = 0 To RetConsultaItem.S5503.CountInfoTrabFGTS - 1
            tbRetorno.Text = tbRetorno.Text & "infoTrabFGTS"
            tbRetorno.Text = tbRetorno.Text & " Matricula: " & RetConsultaItem.S5503.InfoTrabFGTS(a).Matricula & vbNewLine
            tbRetorno.Text = tbRetorno.Text & "  CodCateg: " & RetConsultaItem.S5503.InfoTrabFGTS(a).CodCateg & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " CategOrig: " & RetConsultaItem.S5503.InfoTrabFGTS(a).CategOrig & vbNewLine
            tbRetorno.Text = tbRetorno.Text & ""
            
            'Informacoes relativas ao FGTS do processo trabalhista.
            tbRetorno.Text = tbRetorno.Text & "infoTrabFGTS"
            tbRetorno.Text = tbRetorno.Text & " TotalFGTS: " & RetConsultaItem.S5503.InfoTrabFGTS(a).InfoFGTSProcTrab.TotalFGTS & vbNewLine
            tbRetorno.Text = tbRetorno.Text & ""
            
            'Identificacao do estabelecimento responsavel pelo pagamento ao trabalhador dos valores informados.
            tbRetorno.Text = tbRetorno.Text & "ideEstab"
            tbRetorno.Text = tbRetorno.Text & " TpInsc: " & RetConsultaItem.S5503.InfoTrabFGTS(a).InfoFGTSProcTrab.IdeEstab.TpInsc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & " NrInsc: " & RetConsultaItem.S5503.InfoTrabFGTS(a).InfoFGTSProcTrab.IdeEstab.NrInsc & vbNewLine
            tbRetorno.Text = tbRetorno.Text & ""
            
            'Informacoes sobre bases de calculo e valores do FGTS por periodo de referencia.
                For b = 0 To RetConsultaItem.S5503.InfoTrabFGTS(a).InfoFGTSProcTrab.IdeEstab.CountBasePerRef - 1
                tbRetorno.Text = tbRetorno.Text & "basePerRef"
                tbRetorno.Text = tbRetorno.Text & " CategOrig: " & RetConsultaItem.S5503.InfoTrabFGTS(a).InfoFGTSProcTrab.IdeEstab.BasePerRef(b).PerRef & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " CategOrig: " & RetConsultaItem.S5503.InfoTrabFGTS(a).InfoFGTSProcTrab.IdeEstab.BasePerRef(b).CodCateg & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " CategOrig: " & RetConsultaItem.S5503.InfoTrabFGTS(a).InfoFGTSProcTrab.IdeEstab.BasePerRef(b).TpValorProcTrab & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " CategOrig: " & RetConsultaItem.S5503.InfoTrabFGTS(a).InfoFGTSProcTrab.IdeEstab.BasePerRef(b).RemFGTSProcTrab & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " CategOrig: " & RetConsultaItem.S5503.InfoTrabFGTS(a).InfoFGTSProcTrab.IdeEstab.BasePerRef(b).DpsFGTSProcTrab & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " CategOrig: " & RetConsultaItem.S5503.InfoTrabFGTS(a).InfoFGTSProcTrab.IdeEstab.BasePerRef(b).RemFGTSSefip & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " CategOrig: " & RetConsultaItem.S5503.InfoTrabFGTS(a).InfoFGTSProcTrab.IdeEstab.BasePerRef(b).DpsFGTSSefip & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " CategOrig: " & RetConsultaItem.S5503.InfoTrabFGTS(a).InfoFGTSProcTrab.IdeEstab.BasePerRef(b).RemFGTSDecAnt & vbNewLine
                tbRetorno.Text = tbRetorno.Text & " CategOrig: " & RetConsultaItem.S5503.InfoTrabFGTS(a).InfoFGTSProcTrab.IdeEstab.BasePerRef(b).DpsFGTSDecAnt & vbNewLine
                tbRetorno.Text = tbRetorno.Text & ""
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
    Dim RetEnvio As spdS12RetEnviarLoteEventos
    
    
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
ret = ShellExecute(Me.hwnd, "OPen", "https://atendimento.tecnospeed.com.br/hc/pt-br/articles/18393505330455--Dicionário-de-dados-S-1-2-eSocial", "", "", 1)
End Sub

Private Sub Form_Load()
Set eSocial = New ESocialS12ClientX.spdESocialS12ClientX
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

End Sub


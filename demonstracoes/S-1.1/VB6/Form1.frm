VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Menu eSocial"
   ClientHeight    =   3135
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3135
   ScaleWidth      =   4680
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton btnEsocialSimplificado 
      Caption         =   "eSocial Simplificado"
      Height          =   615
      Left            =   720
      TabIndex        =   1
      Top             =   1920
      Width           =   3135
   End
   Begin VB.CommandButton btnEsocial 
      Caption         =   "eSocial 2.5"
      Height          =   615
      Left            =   720
      TabIndex        =   0
      Top             =   600
      Width           =   3135
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnEsocial_Click()
    frmProjeto.Show
    Form1.Cls
End Sub

Private Sub btnEsocialSimplificado_Click()
    frmProjetoSimplificado.Show
    Form1.Cls
End Sub

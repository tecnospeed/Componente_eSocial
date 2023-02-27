object frmeSocialS: TfrmeSocialS
  Left = 274
  Top = 166
  Width = 1184
  Height = 580
  Caption = 'eSocial Simplificado 1.0'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 376
    Top = 0
    Width = 49
    Height = 13
    Caption = 'Ambiente:'
  end
  object Label2: TLabel
    Left = 376
    Top = 40
    Width = 74
    Height = 13
    Caption = 'Vers'#227'o Manual:'
  end
  object Label3: TLabel
    Left = 8
    Top = 83
    Width = 56
    Height = 13
    Caption = 'Certificado:'
  end
  object lbl1: TLabel
    Left = 376
    Top = 78
    Width = 33
    Height = 13
    Caption = 'Grupo:'
  end
  object Label4: TLabel
    Left = 8
    Top = 204
    Width = 144
    Height = 13
    Caption = 'Pin Code (Para certificado A3)'
  end
  object edtCnpjSH: TLabeledEdit
    Left = 8
    Top = 16
    Width = 162
    Height = 21
    EditLabel.Width = 140
    EditLabel.Height = 13
    EditLabel.Caption = 'CPF / CNPJ SoftWare House:'
    TabOrder = 0
    Text = '08187168000160'
  end
  object edtTokenSH: TLabeledEdit
    Left = 176
    Top = 16
    Width = 194
    Height = 21
    EditLabel.Width = 115
    EditLabel.Height = 13
    EditLabel.Caption = 'Token SoftWare House:'
    TabOrder = 1
    Text = '08187168000160'
  end
  object cbAmbiente: TComboBox
    Left = 376
    Top = 16
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = '2 - Homologa'#231#227'o'
    Items.Strings = (
      '1 - Produ'#231#227'o'
      '2 - Homologa'#231#227'o')
  end
  object cbVersaoManual: TComboBox
    Left = 376
    Top = 56
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object edtCnpjTransmissor: TLabeledEdit
    Left = 8
    Top = 56
    Width = 162
    Height = 21
    EditLabel.Width = 89
    EditLabel.Height = 13
    EditLabel.Caption = 'CNPJ Transmissor:'
    TabOrder = 4
    Text = '08187168000160'
  end
  object edtCnpjEmpregador: TLabeledEdit
    Left = 176
    Top = 56
    Width = 194
    Height = 21
    EditLabel.Width = 90
    EditLabel.Height = 13
    EditLabel.Caption = 'CNPJ Empregador:'
    TabOrder = 5
    Text = '08187168000160'
  end
  object cbCertificado: TComboBox
    Left = 8
    Top = 96
    Width = 362
    Height = 21
    ItemHeight = 13
    TabOrder = 6
  end
  object edtTemplates: TLabeledEdit
    Left = 8
    Top = 136
    Width = 513
    Height = 21
    EditLabel.Width = 97
    EditLabel.Height = 13
    EditLabel.Caption = 'Caminho Templates:'
    TabOrder = 7
    Text = 'C:\Program Files\TecnoSpeed\eSocial\Arquivos\Templates\'
  end
  object edtEsquemas: TLabeledEdit
    Left = 8
    Top = 177
    Width = 513
    Height = 21
    EditLabel.Width = 96
    EditLabel.Height = 13
    EditLabel.Caption = 'Caminho Esquemas:'
    TabOrder = 8
    Text = 'C:\Program Files\TecnoSpeed\eSocial\Arquivos\Esquemas\'
  end
  object btnConfigurar: TButton
    Left = 116
    Top = 252
    Width = 233
    Height = 25
    Caption = 'Configurar Componente'
    TabOrder = 9
    OnClick = btnConfigurarClick
  end
  object btnTx2: TButton
    Left = 8
    Top = 288
    Width = 113
    Height = 25
    Caption = 'Carregar Tx2'
    TabOrder = 10
    OnClick = btnTx2Click
  end
  object btnXML: TButton
    Left = 127
    Top = 288
    Width = 122
    Height = 25
    Caption = 'Gerar XML'
    TabOrder = 11
    OnClick = btnXMLClick
  end
  object btnAssinar: TButton
    Left = 255
    Top = 288
    Width = 131
    Height = 25
    Caption = 'Assinar'
    TabOrder = 12
    OnClick = btnAssinarClick
  end
  object btnEnviar: TButton
    Left = 392
    Top = 288
    Width = 129
    Height = 25
    Caption = 'Enviar'
    TabOrder = 13
    OnClick = btnEnviarClick
  end
  object btnConsultar: TButton
    Left = 8
    Top = 384
    Width = 258
    Height = 25
    Caption = 'Consultar'
    TabOrder = 14
    OnClick = btnConsultarClick
  end
  object edtIdLote: TLabeledEdit
    Left = 8
    Top = 470
    Width = 513
    Height = 21
    EditLabel.Width = 104
    EditLabel.Height = 13
    EditLabel.Caption = 'Identificador do Lote:'
    TabOrder = 15
  end
  object cbGrupo: TComboBox
    Left = 376
    Top = 96
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 16
    Text = '1'
    Items.Strings = (
      '1'
      '2'
      '3')
  end
  object rgTpConsulta: TRadioGroup
    Left = 8
    Top = 319
    Width = 513
    Height = 51
    Caption = 'Tipo de Consulta:'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Id de Lote'
      'Id de Evento'
      'Nr de Recibo')
    TabOrder = 17
  end
  object pgc1: TPageControl
    Left = 527
    Top = 8
    Width = 632
    Height = 525
    ActivePage = tsRetorno
    TabOrder = 18
    object tsRetorno: TTabSheet
      Caption = 'Retorno'
      object mmoRetorno: TMemo
        Left = 2
        Top = 3
        Width = 620
        Height = 492
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object tsXmlEnvio: TTabSheet
      Caption = 'Xml de Envio'
      ImageIndex = 1
      object mmoXmlEnvio: TMemo
        Left = 6
        Top = 6
        Width = 585
        Height = 371
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object tsXmlRetorno: TTabSheet
      Caption = 'Xml de Retorno'
      ImageIndex = 2
      object mmoXmlRetorno: TMemo
        Left = 6
        Top = 6
        Width = 585
        Height = 371
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object txtPincode: TEdit
    Left = 8
    Top = 223
    Width = 513
    Height = 21
    PasswordChar = '*'
    TabOrder = 19
  end
  object Button1: TButton
    Left = 272
    Top = 384
    Width = 249
    Height = 25
    Caption = 'For'#231'ar consulta no eSocial'
    TabOrder = 20
    OnClick = Button1Click
  end
  object btnBaixarXmlEventoLote: TButton
    Left = 272
    Top = 416
    Width = 249
    Height = 25
    Caption = 'Baixar Xml Evento Lote'
    TabOrder = 21
    OnClick = btnBaixarXmlEventoLoteClick
  end
  object edtIdEvento: TLabeledEdit
    Left = 8
    Top = 512
    Width = 513
    Height = 21
    EditLabel.Width = 117
    EditLabel.Height = 13
    EditLabel.Caption = 'Identificador do Evento:'
    TabOrder = 22
  end
  object chkTelemetria: TCheckBox
    Left = 8
    Top = 254
    Width = 102
    Height = 17
    Caption = 'Enviar Telemetria'
    TabOrder = 23
  end
  object btnConsultarIdsEventoLote: TButton
    Left = 8
    Top = 416
    Width = 258
    Height = 25
    Caption = 'Consultar Ids Evento Lote'
    TabOrder = 24
    OnClick = btnConsultarIdsEventoLoteClick
  end
end

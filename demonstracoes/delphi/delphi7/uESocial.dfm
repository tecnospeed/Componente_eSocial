object frmESocial: TfrmESocial
  Left = 383
  Top = 191
  Width = 1081
  Height = 565
  Caption = 'frmESocial'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 376
    Top = 0
    Width = 47
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
    Top = 77
    Width = 53
    Height = 13
    Caption = 'Certificado:'
  end
  object lbl1: TLabel
    Left = 376
    Top = 441
    Width = 32
    Height = 13
    Caption = 'Grupo:'
  end
  object edtCnpjSH: TLabeledEdit
    Left = 8
    Top = 16
    Width = 162
    Height = 21
    EditLabel.Width = 143
    EditLabel.Height = 13
    EditLabel.Caption = 'CPF / CNPJ SoftWare House:'
    TabOrder = 0
  end
  object edtTokenSH: TLabeledEdit
    Left = 176
    Top = 16
    Width = 194
    Height = 21
    EditLabel.Width = 116
    EditLabel.Height = 13
    EditLabel.Caption = 'Token SoftWare House:'
    TabOrder = 1
  end
  object cbAmbiente: TComboBox
    Left = 376
    Top = 16
    Width = 145
    Height = 21
    ItemHeight = 13
    ItemIndex = 1
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
  end
  object cbCertificado: TComboBox
    Left = 8
    Top = 90
    Width = 513
    Height = 21
    ItemHeight = 13
    TabOrder = 6
  end
  object edtTemplates: TLabeledEdit
    Left = 8
    Top = 130
    Width = 513
    Height = 21
    EditLabel.Width = 96
    EditLabel.Height = 13
    EditLabel.Caption = 'Caminho Templates:'
    TabOrder = 7
    Text = 'C:\Program Files\TecnoSpeed\eSocial\Arquivos\Templates\'
  end
  object edtEsquemas: TLabeledEdit
    Left = 8
    Top = 170
    Width = 513
    Height = 21
    EditLabel.Width = 96
    EditLabel.Height = 13
    EditLabel.Caption = 'Caminho Esquemas:'
    TabOrder = 8
    Text = 'C:\Program Files\TecnoSpeed\eSocial\Arquivos\Esquemas\'
  end
  object btnConfigurar: TButton
    Left = 8
    Top = 194
    Width = 513
    Height = 25
    Caption = 'Configurar Componente'
    TabOrder = 9
    OnClick = btnConfigurarClick
  end
  object btnTx2: TButton
    Left = 8
    Top = 296
    Width = 123
    Height = 25
    Caption = 'Carregar Tx2'
    TabOrder = 10
    OnClick = btnTx2Click
  end
  object btnXML: TButton
    Left = 141
    Top = 296
    Width = 115
    Height = 25
    Caption = 'Gerar XML'
    TabOrder = 11
    OnClick = btnXMLClick
  end
  object btnAssinar: TButton
    Left = 263
    Top = 296
    Width = 122
    Height = 25
    Caption = 'Assinar'
    TabOrder = 12
    OnClick = btnAssinarClick
  end
  object btnEnviar: TButton
    Left = 394
    Top = 296
    Width = 127
    Height = 25
    Caption = 'Enviar'
    TabOrder = 13
    OnClick = btnEnviarClick
  end
  object btnConsultar: TButton
    Left = 7
    Top = 378
    Width = 290
    Height = 25
    Caption = 'Consultar'
    TabOrder = 14
    OnClick = btnConsultarClick
  end
  object edtIdLote: TLabeledEdit
    Left = 8
    Top = 457
    Width = 362
    Height = 21
    EditLabel.Width = 100
    EditLabel.Height = 13
    EditLabel.Caption = 'Identificador do Lote:'
    TabOrder = 15
  end
  object cbGrupo: TComboBox
    Left = 376
    Top = 457
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
  object pcPages: TPageControl
    Left = 528
    Top = 6
    Width = 537
    Height = 507
    ActivePage = TabSheet4
    TabOrder = 17
    object TabSheet4: TTabSheet
      Caption = 'TX2'
      ImageIndex = 3
      object mmTX2: TMemo
        Left = 8
        Top = 6
        Width = 513
        Height = 467
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Xml de Envio'
      ImageIndex = 1
      object mmoXmlEnvio: TMemo
        Left = 8
        Top = 6
        Width = 513
        Height = 467
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'XML Assinado'
      ImageIndex = 4
      object mmXMLAssinado: TMemo
        Left = 8
        Top = 6
        Width = 513
        Height = 467
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Retorno'
      object mmoXML: TMemo
        Left = 8
        Top = 6
        Width = 513
        Height = 467
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Enviado'
      ImageIndex = 5
      object mmEnviado: TMemo
        Left = 8
        Top = 6
        Width = 513
        Height = 467
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object Retornado: TTabSheet
      Caption = 'Retornado'
      ImageIndex = 6
      object mmRetornado: TMemo
        Left = 8
        Top = 6
        Width = 513
        Height = 467
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object rgTipoEnvio: TRadioGroup
    Left = 8
    Top = 321
    Width = 505
    Height = 57
    Caption = 'Tipo de Consulta:'
    Columns = 3
    Items.Strings = (
      'Id de Lote'
      'Id de Evento'
      'Nr. Recibo')
    TabOrder = 18
  end
  object rgTipoTX2: TRadioGroup
    Left = 8
    Top = 223
    Width = 505
    Height = 70
    Caption = 'Tipo TX2:'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'S1000'
      'S1005'
      'S1010'
      'S1020'
      'S1030'
      'S1035'
      'S1040'
      'S1050'
      'S1060'
      'S1070'
      'S1080'
      'Carregar Arquivo')
    TabOrder = 19
  end
  object Button1: TButton
    Left = 296
    Top = 378
    Width = 225
    Height = 25
    Caption = 'For'#231'ar Consulta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 20
    OnClick = Button1Click
  end
  object edtIdEvento: TLabeledEdit
    Left = 8
    Top = 499
    Width = 362
    Height = 21
    EditLabel.Width = 113
    EditLabel.Height = 13
    EditLabel.Caption = 'Identificador do Evento:'
    TabOrder = 21
  end
  object btnConsultarIdsEventoLote: TButton
    Left = 7
    Top = 410
    Width = 290
    Height = 25
    Caption = 'Consultar Ids Evento Lote'
    TabOrder = 22
    OnClick = btnConsultarIdsEventoLoteClick
  end
  object btnBaixarXmlEvento: TButton
    Left = 296
    Top = 410
    Width = 225
    Height = 25
    Caption = 'Baixar XML Evento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 23
    OnClick = btnBaixarXmlEventoClick
  end
  object openDlg: TOpenDialog
    Left = 520
    Top = 88
  end
end

object frmeSocial: TfrmeSocial
  Left = 686
  Top = 231
  Caption = 'frmeSocial'
  ClientHeight = 421
  ClientWidth = 1134
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
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
  object edtCnpjSH: TLabeledEdit
    Left = 8
    Top = 16
    Width = 162
    Height = 21
    EditLabel.Width = 140
    EditLabel.Height = 13
    EditLabel.Caption = 'CPF / CNPJ SoftWare House:'
    TabOrder = 0
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
  end
  object cbAmbiente: TComboBox
    Left = 376
    Top = 16
    Width = 145
    Height = 21
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
    Top = 96
    Width = 362
    Height = 21
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
    Top = 176
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
    Top = 210
    Width = 513
    Height = 25
    Caption = 'Configurar Componente'
    TabOrder = 9
    OnClick = btnConfigurarClick
  end
  object btnTx2: TButton
    Left = 8
    Top = 248
    Width = 113
    Height = 25
    Caption = 'Carregar Tx2'
    TabOrder = 10
    OnClick = btnTx2Click
  end
  object btnXML: TButton
    Left = 127
    Top = 248
    Width = 122
    Height = 25
    Caption = 'Gerar XML'
    TabOrder = 11
    OnClick = btnXMLClick
  end
  object btnAssinar: TButton
    Left = 255
    Top = 248
    Width = 131
    Height = 25
    Caption = 'Assinar'
    TabOrder = 12
    OnClick = btnAssinarClick
  end
  object btnEnviar: TButton
    Left = 392
    Top = 248
    Width = 129
    Height = 25
    Caption = 'Enviar'
    TabOrder = 13
    OnClick = btnEnviarClick
  end
  object btnConsultar: TButton
    Left = 8
    Top = 336
    Width = 513
    Height = 25
    Caption = 'Consultar'
    TabOrder = 14
    OnClick = btnConsultarClick
  end
  object edtIdLote: TLabeledEdit
    Left = 8
    Top = 380
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
    TabOrder = 16
    Text = '1'
    Items.Strings = (
      '1'
      '2'
      '3')
  end
  object rg: TRadioGroup
    Left = 8
    Top = 279
    Width = 513
    Height = 51
    Caption = 'Tipo de Consulta:'
    Columns = 3
    Items.Strings = (
      'Id de Lote'
      'Id de Evento'
      'Nr de Recibo')
    TabOrder = 17
  end
  object pgc1: TPageControl
    Left = 527
    Top = 8
    Width = 599
    Height = 405
    ActivePage = tsRetorno
    TabOrder = 18
    object tsRetorno: TTabSheet
      Caption = 'Retorno'
      object mmoRetorno: TMemo
        Left = 3
        Top = 3
        Width = 585
        Height = 371
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
end

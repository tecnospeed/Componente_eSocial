object frmeSocialS1: TfrmeSocialS1
  Left = 673
  Top = 143
  BorderStyle = bsSingle
  Caption = 'eSocial Simplificado 1.0'
  ClientHeight = 668
  ClientWidth = 543
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
  DesignSize = (
    543
    668)
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 1
    Top = 328
    Width = 536
    Height = 335
    ActivePage = tsRetorno
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object tsRetorno: TTabSheet
      Caption = 'Retorno'
      object mmoRetorno: TMemo
        Left = 4
        Top = 4
        Width = 537
        Height = 297
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object tsXmlEnvio: TTabSheet
      Caption = 'Xml de Envio'
      ImageIndex = 1
      object mmoXmlEnvio: TMemo
        Left = 4
        Top = 4
        Width = 536
        Height = 295
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object tsXmlRetorno: TTabSheet
      Caption = 'Xml de Retorno'
      ImageIndex = 2
      object mmoXmlRetorno: TMemo
        Left = 4
        Top = 4
        Width = 534
        Height = 294
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object PageControl1: TPageControl
    Left = 1
    Top = 1
    Width = 536
    Height = 324
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = '1 - Dados'
      object Label1: TLabel
        Left = 371
        Top = 2
        Width = 49
        Height = 13
        Caption = 'Ambiente:'
      end
      object Label2: TLabel
        Left = 371
        Top = 43
        Width = 74
        Height = 13
        Caption = 'Vers'#227'o Manual:'
      end
      object Label3: TLabel
        Left = 3
        Top = 86
        Width = 56
        Height = 13
        Caption = 'Certificado:'
      end
      object lbl1: TLabel
        Left = 371
        Top = 81
        Width = 33
        Height = 13
        Caption = 'Grupo:'
      end
      object Label4: TLabel
        Left = 3
        Top = 208
        Width = 144
        Height = 13
        Caption = 'Pin Code (Para certificado A3)'
      end
      object edtCnpjSH: TLabeledEdit
        Left = 3
        Top = 19
        Width = 162
        Height = 21
        EditLabel.Width = 140
        EditLabel.Height = 13
        EditLabel.Caption = 'CPF / CNPJ SoftWare House:'
        TabOrder = 0
        Text = '08187168000160'
      end
      object edtTokenSH: TLabeledEdit
        Left = 171
        Top = 19
        Width = 194
        Height = 21
        EditLabel.Width = 115
        EditLabel.Height = 13
        EditLabel.Caption = 'Token SoftWare House:'
        TabOrder = 1
        Text = '00000000000000'
      end
      object cbAmbiente: TComboBox
        Left = 371
        Top = 19
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
        Left = 371
        Top = 59
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 3
      end
      object edtCnpjTransmissor: TLabeledEdit
        Left = 3
        Top = 59
        Width = 162
        Height = 21
        EditLabel.Width = 89
        EditLabel.Height = 13
        EditLabel.Caption = 'CNPJ Transmissor:'
        TabOrder = 4
        Text = '08187168000160'
      end
      object edtCnpjEmpregador: TLabeledEdit
        Left = 171
        Top = 59
        Width = 194
        Height = 21
        EditLabel.Width = 90
        EditLabel.Height = 13
        EditLabel.Caption = 'CNPJ Empregador:'
        TabOrder = 5
        Text = '08187168000160'
      end
      object cbCertificado: TComboBox
        Left = 3
        Top = 99
        Width = 362
        Height = 21
        ItemHeight = 13
        TabOrder = 6
      end
      object edtTemplates: TLabeledEdit
        Left = 3
        Top = 139
        Width = 513
        Height = 21
        EditLabel.Width = 97
        EditLabel.Height = 13
        EditLabel.Caption = 'Caminho Templates:'
        TabOrder = 7
        Text = 'C:\Program Files\TecnoSpeed\eSocial\Arquivos\Templates'
      end
      object edtEsquemas: TLabeledEdit
        Left = 3
        Top = 180
        Width = 513
        Height = 21
        EditLabel.Width = 96
        EditLabel.Height = 13
        EditLabel.Caption = 'Caminho Esquemas:'
        TabOrder = 8
        Text = 'C:\Program Files\TecnoSpeed\eSocial\Arquivos\Esquemas'
      end
      object btnConfigurar: TButton
        Left = 134
        Top = 253
        Width = 233
        Height = 25
        Caption = 'Configurar Componente'
        TabOrder = 9
        OnClick = btnConfigurarClick
      end
      object cbGrupo: TComboBox
        Left = 371
        Top = 99
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 10
        Text = '1'
        Items.Strings = (
          '1'
          '2'
          '3')
      end
      object txtPincode: TEdit
        Left = 3
        Top = 226
        Width = 513
        Height = 21
        PasswordChar = '*'
        TabOrder = 11
      end
      object chkTelemetria: TCheckBox
        Left = 3
        Top = 257
        Width = 102
        Height = 17
        Caption = 'Enviar Telemetria'
        TabOrder = 12
      end
    end
    object TabSheet2: TTabSheet
      Caption = '2 - Envio'
      ImageIndex = 1
      object btnTx2: TButton
        Left = 8
        Top = 14
        Width = 113
        Height = 25
        Caption = 'Carregar Tx2'
        TabOrder = 0
        OnClick = btnTx2Click
      end
      object btnXML: TButton
        Left = 127
        Top = 14
        Width = 122
        Height = 25
        Caption = 'Gerar XML'
        TabOrder = 1
        OnClick = btnXMLClick
      end
      object btnAssinar: TButton
        Left = 255
        Top = 14
        Width = 131
        Height = 25
        Caption = 'Assinar'
        TabOrder = 2
        OnClick = btnAssinarClick
      end
      object btnEnviar: TButton
        Left = 392
        Top = 14
        Width = 129
        Height = 25
        Caption = 'Enviar'
        TabOrder = 3
        OnClick = btnEnviarClick
      end
      object edtIdLote: TLabeledEdit
        Left = 8
        Top = 176
        Width = 513
        Height = 21
        EditLabel.Width = 104
        EditLabel.Height = 13
        EditLabel.Caption = 'Identificador do Lote:'
        TabOrder = 4
      end
      object rg: TRadioGroup
        Left = 8
        Top = 51
        Width = 513
        Height = 51
        Caption = 'Tipo de Consulta:'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Id de Lote'
          'Id de Evento'
          'Nr de Recibo')
        TabOrder = 5
      end
      object Button1: TButton
        Left = 272
        Top = 105
        Width = 249
        Height = 25
        Caption = 'For'#231'ar consulta no eSocial'
        TabOrder = 6
        OnClick = Button1Click
      end
      object btnBaixarXmlEventoLote: TButton
        Left = 272
        Top = 132
        Width = 249
        Height = 25
        Caption = 'Baixar Xml Evento Lote'
        TabOrder = 7
        OnClick = btnBaixarXmlEventoLoteClick
      end
      object edtIdEvento: TLabeledEdit
        Left = 8
        Top = 218
        Width = 513
        Height = 21
        EditLabel.Width = 117
        EditLabel.Height = 13
        EditLabel.Caption = 'Identificador do Evento:'
        TabOrder = 8
      end
      object edtIdRecibo: TLabeledEdit
        Left = 8
        Top = 258
        Width = 513
        Height = 21
        EditLabel.Width = 111
        EditLabel.Height = 13
        EditLabel.Caption = 'Identificador do Recibo'
        TabOrder = 9
      end
      object btnConsultar: TButton
        Left = 40
        Top = 120
        Width = 177
        Height = 33
        Caption = 'Consultar'
        TabOrder = 10
        OnClick = btnConsultarClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = '3 - Ajuda'
      ImageIndex = 2
      object btnAbrirComponente: TButton
        Left = 152
        Top = 62
        Width = 220
        Height = 25
        Caption = 'Primeiros Passos'
        TabOrder = 0
        OnClick = btnAbrirComponenteClick
      end
      object btnAbrirPropriedades: TButton
        Left = 152
        Top = 102
        Width = 220
        Height = 25
        Caption = 'Propriedades Componente'
        TabOrder = 1
        OnClick = btnAbrirPropriedadesClick
      end
      object btnAbrirMetodos: TButton
        Left = 152
        Top = 142
        Width = 220
        Height = 25
        Caption = 'M'#233'todos Componente'
        TabOrder = 2
        OnClick = btnAbrirMetodosClick
      end
      object btnAbrirDicionario: TButton
        Left = 152
        Top = 182
        Width = 220
        Height = 25
        Caption = 'Dicion'#225'rio do Tx2'
        TabOrder = 3
        OnClick = btnAbrirDicionarioClick
      end
    end
  end
end

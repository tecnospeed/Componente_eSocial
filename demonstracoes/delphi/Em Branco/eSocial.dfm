object Exemplo: TExemplo
  Left = 0
  Top = 0
  Caption = 'Exemplo'
  ClientHeight = 580
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnConfigurar: TButton
    Left = 16
    Top = 86
    Width = 200
    Height = 69
    Caption = 'Configurar'
    TabOrder = 0
  end
  object btnGerarXML: TButton
    Left = 16
    Top = 251
    Width = 200
    Height = 69
    Caption = 'Gerar XML'
    TabOrder = 1
  end
  object btnAssinar: TButton
    Left = 16
    Top = 334
    Width = 200
    Height = 69
    Caption = 'Assinar'
    TabOrder = 2
  end
  object btnEnviar: TButton
    Left = 16
    Top = 417
    Width = 200
    Height = 69
    Caption = 'Enviar'
    TabOrder = 3
  end
  object btnConsultar: TButton
    Left = 16
    Top = 500
    Width = 200
    Height = 69
    Caption = 'Consultar'
    TabOrder = 4
  end
  object cbbCertificados: TComboBox
    Left = 16
    Top = 16
    Width = 769
    Height = 21
    TabOrder = 5
    Text = 'Selecione o certificado digital'
  end
  object edtIDLote: TEdit
    Left = 16
    Top = 51
    Width = 769
    Height = 21
    TabOrder = 6
    Text = 'ID do lote'
  end
  object mmXML: TMemo
    Left = 230
    Top = 86
    Width = 555
    Height = 483
    ScrollBars = ssVertical
    TabOrder = 7
  end
  object btnIncluir: TButton
    Left = 16
    Top = 168
    Width = 92
    Height = 69
    Caption = 'Incluir'
    TabOrder = 8
  end
  object btnExcluir: TButton
    Left = 124
    Top = 168
    Width = 92
    Height = 69
    Caption = 'Excuir'
    TabOrder = 9
  end
end

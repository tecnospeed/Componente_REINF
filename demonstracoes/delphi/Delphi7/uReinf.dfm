object frmReinf: TfrmReinf
  Left = 253
  Top = 132
  Width = 1116
  Height = 419
  Caption = 'frmReinf'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Ambiente: TLabel
    Left = 189
    Top = 39
    Width = 47
    Height = 13
    Caption = 'Ambiente:'
  end
  object lbl1: TLabel
    Left = 8
    Top = 161
    Width = 55
    Height = 13
    Caption = 'Certificados'
  end
  object lbl2: TLabel
    Left = 367
    Top = 39
    Width = 74
    Height = 13
    Caption = 'Vers'#227'o Manual:'
  end
  object edtCnpjSH: TLabeledEdit
    Left = 8
    Top = 16
    Width = 257
    Height = 21
    EditLabel.Width = 143
    EditLabel.Height = 13
    EditLabel.Caption = 'CPF / CNPJ SoftWare House:'
    TabOrder = 0
  end
  object edtTokenSH: TLabeledEdit
    Left = 271
    Top = 16
    Width = 266
    Height = 21
    EditLabel.Width = 116
    EditLabel.Height = 13
    EditLabel.Caption = 'Token SoftWare House:'
    TabOrder = 1
  end
  object edtEmpregador: TLabeledEdit
    Left = 8
    Top = 56
    Width = 171
    Height = 21
    EditLabel.Width = 121
    EditLabel.Height = 13
    EditLabel.Caption = 'CPF / CNPJ Empregador:'
    TabOrder = 2
  end
  object cbAmbiente: TComboBox
    Left = 189
    Top = 56
    Width = 170
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      '1 - Produ'#231#227'o'
      '2 - Homologa'#231#227'o')
  end
  object edtTemplates: TLabeledEdit
    Left = 8
    Top = 96
    Width = 529
    Height = 21
    EditLabel.Width = 96
    EditLabel.Height = 13
    EditLabel.Caption = 'Caminho Templates:'
    TabOrder = 4
    Text = 'C:\Program Files\TecnoSpeed\Reinf\Arquivos\Templates\'
  end
  object edtEsquemas: TLabeledEdit
    Left = 8
    Top = 136
    Width = 529
    Height = 21
    EditLabel.Width = 96
    EditLabel.Height = 13
    EditLabel.Caption = 'Caminho Esquemas:'
    TabOrder = 5
    Text = 'C:\Program Files\TecnoSpeed\Reinf\Arquivos\Esquemas\'
  end
  object cbCertificado: TComboBox
    Left = 8
    Top = 176
    Width = 529
    Height = 21
    ItemHeight = 13
    TabOrder = 6
  end
  object btnConfigurar: TButton
    Left = 8
    Top = 203
    Width = 529
    Height = 26
    Caption = 'Configurar Componente'
    TabOrder = 7
    OnClick = btnConfigurarClick
  end
  object btnTx2: TButton
    Left = 9
    Top = 235
    Width = 118
    Height = 25
    Caption = 'Gerar Tx2'
    TabOrder = 8
    OnClick = btnTx2Click
  end
  object btnXml: TButton
    Left = 141
    Top = 235
    Width = 121
    Height = 25
    Caption = 'Gerar Xml'
    TabOrder = 9
    OnClick = btnXmlClick
  end
  object btnAssinar: TButton
    Left = 276
    Top = 235
    Width = 124
    Height = 25
    Caption = 'Assinar'
    TabOrder = 10
    OnClick = btnAssinarClick
  end
  object btnEnviar: TButton
    Left = 410
    Top = 235
    Width = 127
    Height = 25
    Caption = 'Enviar'
    TabOrder = 11
    OnClick = btnEnviarClick
  end
  object btnConsultar: TButton
    Left = 7
    Top = 315
    Width = 530
    Height = 25
    Caption = 'Consultar'
    TabOrder = 12
    OnClick = btnConsultarClick
  end
  object edtIdLote: TLabeledEdit
    Left = 8
    Top = 360
    Width = 529
    Height = 21
    EditLabel.Width = 94
    EditLabel.Height = 13
    EditLabel.Caption = 'Identifiador do Lote:'
    TabOrder = 13
  end
  object cbVersao: TComboBox
    Left = 367
    Top = 56
    Width = 170
    Height = 21
    ItemHeight = 13
    TabOrder = 14
  end
  object PageControl1: TPageControl
    Left = 544
    Top = 0
    Width = 561
    Height = 385
    ActivePage = TabSheet2
    TabOrder = 15
    object tsRetorno: TTabSheet
      Caption = 'Retorno'
      object mmoXml: TMemo
        Left = 0
        Top = 4
        Width = 553
        Height = 349
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Xml de Envio'
      ImageIndex = 1
      object mmoXmlEnvio: TMemo
        Left = 0
        Top = 4
        Width = 553
        Height = 349
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Xml de Retorno'
      ImageIndex = 2
      object mmoXmlRetorno: TMemo
        Left = 0
        Top = 4
        Width = 553
        Height = 349
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object rgTipoConsulta: TRadioGroup
    Left = 8
    Top = 264
    Width = 529
    Height = 41
    Caption = 'Tipo de Consulta:'
    Columns = 3
    Items.Strings = (
      'Id do Lote'
      'Id de Evento'
      'Nr. Recibo')
    TabOrder = 16
  end
end

object frmReinf: TfrmReinf
  Left = 496
  Top = 199
  Width = 1129
  Height = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Ambiente: TLabel
    Left = 189
    Top = 39
    Width = 49
    Height = 13
    Caption = 'Ambiente:'
  end
  object lbl1: TLabel
    Left = 8
    Top = 161
    Width = 57
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
    EditLabel.Width = 140
    EditLabel.Height = 13
    EditLabel.Caption = 'CPF / CNPJ SoftWare House:'
    TabOrder = 0
    Text = '00000000000000'
  end
  object edtTokenSH: TLabeledEdit
    Left = 271
    Top = 16
    Width = 266
    Height = 21
    EditLabel.Width = 115
    EditLabel.Height = 13
    EditLabel.Caption = 'Token SoftWare House:'
    TabOrder = 1
    Text = 'aB1CwzugCB3h37Hd2mas23'
  end
  object edtEmpregador: TLabeledEdit
    Left = 8
    Top = 56
    Width = 171
    Height = 21
    EditLabel.Width = 119
    EditLabel.Height = 13
    EditLabel.Caption = 'CPF / CNPJ Empregador:'
    TabOrder = 2
    Text = '00000000000000'
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
    EditLabel.Width = 97
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
    Width = 122
    Height = 25
    Caption = 'Gerar Tx2'
    TabOrder = 8
    OnClick = btnTx2Click
  end
  object btnXml: TButton
    Left = 137
    Top = 235
    Width = 128
    Height = 25
    Caption = 'Gerar Xml'
    TabOrder = 9
    OnClick = btnXmlClick
  end
  object btnAssinar: TButton
    Left = 271
    Top = 235
    Width = 125
    Height = 25
    Caption = 'Assinar'
    TabOrder = 10
    OnClick = btnAssinarClick
  end
  object btnEnviar: TButton
    Left = 403
    Top = 235
    Width = 134
    Height = 25
    Caption = 'Enviar'
    TabOrder = 11
    OnClick = btnEnviarClick
  end
  object btnConsultar: TButton
    Left = 8
    Top = 323
    Width = 530
    Height = 25
    Caption = 'Consultar'
    TabOrder = 12
    OnClick = btnConsultarClick
  end
  object edtIdLote: TLabeledEdit
    Left = 9
    Top = 368
    Width = 529
    Height = 21
    EditLabel.Width = 99
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
  object pgc1: TPageControl
    Left = 544
    Top = 8
    Width = 561
    Height = 381
    ActivePage = tsRetorno
    TabOrder = 15
    object tsRetorno: TTabSheet
      Caption = 'Retorno'
      object mmoXml: TMemo
        Left = 3
        Top = 3
        Width = 547
        Height = 347
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object tsXmlEnviad: TTabSheet
      Caption = 'Xml Enviado'
      ImageIndex = 1
      object mmoXmlEnviado: TMemo
        Left = 3
        Top = 3
        Width = 547
        Height = 347
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object tsXmlRetorno: TTabSheet
      Caption = 'Xml Retorno'
      ImageIndex = 2
      object mmoXmlRetorno: TMemo
        Left = 3
        Top = 3
        Width = 547
        Height = 347
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object rg: TRadioGroup
    Left = 8
    Top = 266
    Width = 530
    Height = 51
    Caption = 'Tipo de Consulta:'
    Columns = 3
    Items.Strings = (
      'Id de Lote'
      'Id de Evento'
      'Nr de Recibo')
    TabOrder = 16
  end
end

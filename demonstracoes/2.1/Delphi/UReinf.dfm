object frmReinf: TfrmReinf
  Left = 617
  Top = 154
  ClientHeight = 472
  ClientWidth = 1113
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Ambiente: TLabel
    Left = 189
    Top = 44
    Width = 49
    Height = 13
    Caption = 'Ambiente:'
  end
  object lbl1: TLabel
    Left = 8
    Top = 212
    Width = 57
    Height = 13
    Caption = 'Certificados'
  end
  object lbl2: TLabel
    Left = 367
    Top = 44
    Width = 74
    Height = 13
    Caption = 'Vers'#227'o Manual:'
  end
  object edtCnpjSH: TLabeledEdit
    Left = 8
    Top = 21
    Width = 257
    Height = 21
    EditLabel.Width = 140
    EditLabel.Height = 13
    EditLabel.Caption = 'CPF / CNPJ SoftWare House:'
    TabOrder = 0
    Text = '08187168000160'
  end
  object edtTokenSH: TLabeledEdit
    Left = 271
    Top = 21
    Width = 266
    Height = 21
    EditLabel.Width = 115
    EditLabel.Height = 13
    EditLabel.Caption = 'Token SoftWare House:'
    TabOrder = 1
    Text = 'informarToken'
  end
  object edtEmpregador: TLabeledEdit
    Left = 8
    Top = 61
    Width = 171
    Height = 21
    EditLabel.Width = 119
    EditLabel.Height = 13
    EditLabel.Caption = 'CPF / CNPJ Empregador:'
    TabOrder = 2
    Text = '08187168000160'
  end
  object cbAmbiente: TComboBox
    Left = 189
    Top = 61
    Width = 170
    Height = 21
    TabOrder = 3
    Items.Strings = (
      '1 - Produ'#231#227'o'
      '2 - Homologa'#231#227'o')
  end
  object edtTemplates: TLabeledEdit
    Left = 8
    Top = 147
    Width = 529
    Height = 21
    EditLabel.Width = 97
    EditLabel.Height = 13
    EditLabel.Caption = 'Caminho Templates:'
    TabOrder = 6
    Text = 'C:\Program Files\TecnoSpeed\Reinf\Arquivos\Templates\'
  end
  object edtEsquemas: TLabeledEdit
    Left = 8
    Top = 187
    Width = 529
    Height = 21
    EditLabel.Width = 96
    EditLabel.Height = 13
    EditLabel.Caption = 'Caminho Esquemas:'
    TabOrder = 7
    Text = 'C:\Program Files\TecnoSpeed\Reinf\Arquivos\Esquemas\'
  end
  object cbCertificado: TComboBox
    Left = 8
    Top = 227
    Width = 529
    Height = 21
    TabOrder = 8
  end
  object btnConfigurar: TButton
    Left = 271
    Top = 265
    Width = 266
    Height = 26
    Caption = 'Configurar Componente'
    TabOrder = 11
    OnClick = btnConfigurarClick
  end
  object btnTx2: TButton
    Left = 9
    Top = 303
    Width = 122
    Height = 25
    Caption = 'Gerar Tx2'
    TabOrder = 12
    OnClick = btnTx2Click
  end
  object btnXml: TButton
    Left = 137
    Top = 303
    Width = 128
    Height = 25
    Caption = 'Gerar Xml'
    TabOrder = 13
    OnClick = btnXmlClick
  end
  object btnAssinar: TButton
    Left = 271
    Top = 303
    Width = 125
    Height = 25
    Caption = 'Assinar'
    TabOrder = 14
    OnClick = btnAssinarClick
  end
  object btnEnviar: TButton
    Left = 403
    Top = 303
    Width = 134
    Height = 25
    Caption = 'Enviar'
    TabOrder = 15
    OnClick = btnEnviarClick
  end
  object btnConsultar: TButton
    Left = 8
    Top = 391
    Width = 351
    Height = 25
    Caption = 'Consultar'
    TabOrder = 17
    OnClick = btnConsultarClick
  end
  object edtIdLote: TLabeledEdit
    Left = 9
    Top = 436
    Width = 529
    Height = 21
    EditLabel.Width = 99
    EditLabel.Height = 13
    EditLabel.Caption = 'Identifiador do Lote:'
    TabOrder = 18
  end
  object cbVersao: TComboBox
    Left = 368
    Top = 63
    Width = 170
    Height = 21
    TabOrder = 4
    Text = '2.1.02'
  end
  object pgc1: TPageControl
    Left = 544
    Top = 8
    Width = 561
    Height = 449
    ActivePage = tsRetorno
    TabOrder = 19
    object tsRetorno: TTabSheet
      Caption = 'Retorno'
      object mmoXml: TMemo
        Left = 3
        Top = 3
        Width = 547
        Height = 415
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
        Height = 415
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
        Height = 415
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object rg: TRadioGroup
    Left = 8
    Top = 334
    Width = 530
    Height = 51
    Caption = 'Tipo de Consulta:'
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'Id de Lote'
      'Id de Evento'
      'Nr de Recibo'
      'Reconsultar Lote')
    TabOrder = 16
  end
  object chkTelemetria: TCheckBox
    Left = 8
    Top = 265
    Width = 102
    Height = 17
    Caption = 'Enviar Telemetria'
    TabOrder = 9
  end
  object edtDiretorioLog: TLabeledEdit
    Left = 8
    Top = 104
    Width = 529
    Height = 21
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'Diret'#243'rio Log:'
    TabOrder = 5
    Text = 'C:\Dev\_Demos\Reinf_DXE3\Log\'
  end
  object chkSalvarLogs: TCheckBox
    Left = 116
    Top = 265
    Width = 122
    Height = 17
    Caption = 'Salvar Logs em Disco'
    Checked = True
    State = cbChecked
    TabOrder = 10
  end
  object btnSincronizarXmlPendentes: TButton
    Left = 365
    Top = 391
    Width = 173
    Height = 25
    Caption = 'Sincronizar Xmls Pendentes'
    TabOrder = 20
    OnClick = btnSincronizarXmlPendentesClick
  end
end

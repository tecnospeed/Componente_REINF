object frmReinfPrincipal: TfrmReinfPrincipal
  Left = 429
  Top = 289
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Demonstra'#231#227'o REINF'
  ClientHeight = 468
  ClientWidth = 958
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 50
    Width = 457
    Height = 418
    Align = alLeft
    Color = clGradientInactiveCaption
    TabOrder = 0
    object Label6: TLabel
      Left = 100
      Top = 396
      Width = 208
      Height = 20
      Cursor = crHandPoint
      Caption = 'Site das Tabelas do Reinf'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnClick = Label6Click
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 138
      Width = 455
      Height = 139
      Align = alTop
      Caption = 'Diret'#243'rios'
      TabOrder = 0
      object Label4: TLabel
        Left = 10
        Top = 29
        Width = 49
        Height = 13
        Caption = 'Templates'
      end
      object Label5: TLabel
        Left = 9
        Top = 81
        Width = 49
        Height = 13
        Caption = 'Esquemas'
      end
      object edtDirTemplates: TEdit
        Left = 9
        Top = 45
        Width = 436
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtDirEsquemas: TEdit
        Left = 9
        Top = 97
        Width = 436
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 277
      Width = 455
      Height = 116
      Align = alTop
      Caption = 'Software House'
      TabOrder = 1
      object Label1: TLabel
        Left = 10
        Top = 22
        Width = 27
        Height = 13
        Caption = 'CNPJ'
      end
      object Label2: TLabel
        Left = 10
        Top = 72
        Width = 31
        Height = 13
        Caption = 'Token'
      end
      object edtCNPJ: TEdit
        Left = 10
        Top = 38
        Width = 185
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtToken: TEdit
        Left = 10
        Top = 88
        Width = 433
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 455
      Height = 137
      Align = alTop
      BevelOuter = bvNone
      Color = clGradientInactiveCaption
      TabOrder = 2
      object GroupBox9: TGroupBox
        Left = 0
        Top = 0
        Width = 455
        Height = 137
        Align = alClient
        TabOrder = 0
        object lbl1: TLabel
          Left = 8
          Top = 28
          Width = 50
          Height = 13
          Caption = 'Certificado'
        end
        object Ambiente: TLabel
          Left = 10
          Top = 79
          Width = 44
          Height = 13
          Caption = 'Ambiente'
        end
        object lbl2: TLabel
          Left = 277
          Top = 79
          Width = 71
          Height = 13
          Caption = 'Vers'#227'o Manual'
        end
        object cbCertificado: TComboBox
          Left = 10
          Top = 44
          Width = 436
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = '/'
        end
        object cbAmbiente: TComboBox
          Left = 10
          Top = 96
          Width = 170
          Height = 21
          Hint = 'Ambiente produ'#231#227'o n'#227'o liberado na demonstra'#231#227'o'
          Enabled = False
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 1
          Text = '2 - Homologa'#231#227'o'
          Items.Strings = (
            '1 - Produ'#231#227'o'
            '2 - Homologa'#231#227'o')
        end
        object cbVersao: TComboBox
          Left = 275
          Top = 96
          Width = 170
          Height = 21
          ItemHeight = 13
          TabOrder = 2
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 958
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = clGradientInactiveCaption
    TabOrder = 1
    object Label3: TLabel
      Left = 12
      Top = 7
      Width = 87
      Height = 13
      Caption = 'CNPJ Empregador'
    end
    object sbLimpar: TSpeedButton
      Left = 202
      Top = 23
      Width = 79
      Height = 21
      Caption = 'Reset Envio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = sbLimparClick
    end
    object SpeedButton1: TSpeedButton
      Left = 304
      Top = 23
      Width = 149
      Height = 21
      Caption = 'Limpar Ambiente Reinf'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object GroupBox4: TGroupBox
      Left = 456
      Top = 0
      Width = 502
      Height = 50
      Align = alRight
      Caption = 
        'ID do Lote (Para Consulta digitar: ID do Lote, ID do Evento ou N' +
        #186' do Recibo)'
      TabOrder = 0
      object edtIDLote: TEdit
        Left = 17
        Top = 19
        Width = 464
        Height = 21
        TabOrder = 0
      end
    end
    object edtCNPJEmpregador: TEdit
      Left = 10
      Top = 23
      Width = 185
      Height = 21
      TabOrder = 1
    end
  end
  object Panel4: TPanel
    Left = 455
    Top = 50
    Width = 503
    Height = 418
    Align = alRight
    Color = clGradientInactiveCaption
    TabOrder = 2
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 501
      Height = 55
      Align = alTop
      BevelOuter = bvLowered
      Color = clGradientInactiveCaption
      TabOrder = 0
      object sbPreencherComp: TSpeedButton
        Left = 6
        Top = 3
        Width = 164
        Height = 21
        Caption = '1 - Preencher Componente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sbPreencherCompClick
      end
      object sbGerarXML: TSpeedButton
        Left = 338
        Top = 3
        Width = 160
        Height = 21
        Caption = '3 - Gerar XML'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sbGerarXMLClick
      end
      object sbGerarTX2: TSpeedButton
        Left = 174
        Top = 3
        Width = 160
        Height = 21
        Caption = '2 - Gerar TX2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sbGerarTX2Click
      end
      object sbAssinar: TSpeedButton
        Left = 6
        Top = 27
        Width = 164
        Height = 21
        Caption = '4 - Assinar XML'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sbAssinarClick
      end
      object sbEnviar: TSpeedButton
        Left = 174
        Top = 27
        Width = 160
        Height = 21
        Caption = '5 - Enviar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sbEnviarClick
      end
      object sbExcluir: TSpeedButton
        Left = 338
        Top = 27
        Width = 160
        Height = 21
        Caption = 'Excluir Envio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sbExcluirClick
      end
    end
    object pcProcessos: TPageControl
      Left = 1
      Top = 56
      Width = 501
      Height = 361
      ActivePage = tsXMLRetornado
      Align = alClient
      TabOrder = 1
      object tsTX2: TTabSheet
        Caption = 'TX2'
        ImageIndex = 1
        object GroupBox5: TGroupBox
          Left = 0
          Top = 0
          Width = 493
          Height = 333
          Align = alClient
          Caption = 'Dados b'#225'sicos TX2'
          TabOrder = 0
          object mmTX2: TMemo
            Left = 2
            Top = 15
            Width = 489
            Height = 316
            Align = alClient
            TabOrder = 0
          end
        end
      end
      object tsXML: TTabSheet
        Caption = 'XML'
        object GroupBox6: TGroupBox
          Left = 0
          Top = 0
          Width = 493
          Height = 169
          Align = alTop
          Caption = 'XML gerado'
          TabOrder = 0
          object mmXML: TMemo
            Left = 2
            Top = 15
            Width = 489
            Height = 152
            Align = alClient
            TabOrder = 0
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 169
          Width = 493
          Height = 164
          Align = alClient
          Caption = 'XML Assinado'
          TabOrder = 1
          object mmXMLAssinado: TMemo
            Left = 2
            Top = 15
            Width = 489
            Height = 147
            Align = alClient
            TabOrder = 0
          end
        end
      end
      object tsEnvio: TTabSheet
        Caption = 'Envio'
        ImageIndex = 2
        object GroupBox7: TGroupBox
          Left = 0
          Top = 0
          Width = 493
          Height = 333
          Align = alClient
          Caption = 'Retorno do envio do lote'
          TabOrder = 0
          object mmEnvio: TMemo
            Left = 2
            Top = 15
            Width = 489
            Height = 316
            Align = alClient
            TabOrder = 0
          end
        end
      end
      object tsConsulta: TTabSheet
        Caption = 'Consulta'
        ImageIndex = 3
        object GroupBox10: TGroupBox
          Left = 0
          Top = 0
          Width = 493
          Height = 333
          Align = alClient
          Caption = 'Consulta'
          TabOrder = 0
          object sbConsultaLote: TSpeedButton
            Left = 10
            Top = 16
            Width = 138
            Height = 21
            Caption = '6 - Por ID do Lote'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = sbConsultaLoteClick
          end
          object sbConsultarEvento: TSpeedButton
            Left = 177
            Top = 16
            Width = 138
            Height = 21
            Caption = '6 - Por ID do Evento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = sbConsultarEventoClick
          end
          object sbConsultarRecibo: TSpeedButton
            Left = 344
            Top = 16
            Width = 138
            Height = 21
            Caption = '6 - Por N'#186' do Recibo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = sbConsultarReciboClick
          end
          object mmConsulta: TMemo
            Left = 2
            Top = 44
            Width = 489
            Height = 287
            Align = alBottom
            TabOrder = 0
          end
        end
      end
      object tsXMLEnviado: TTabSheet
        Caption = 'XML Enviado'
        ImageIndex = 4
        object GroupBox11: TGroupBox
          Left = 0
          Top = 0
          Width = 493
          Height = 333
          Align = alClient
          Caption = 'XML de Envio da Consulta'
          TabOrder = 0
          object mmXMLEnvio: TMemo
            Left = 2
            Top = 15
            Width = 489
            Height = 316
            Align = alClient
            TabOrder = 0
          end
        end
      end
      object tsXMLRetornado: TTabSheet
        Caption = 'XML Retornado'
        ImageIndex = 5
        object GroupBox8: TGroupBox
          Left = 0
          Top = 0
          Width = 493
          Height = 333
          Align = alClient
          Caption = 'XML de Retorno da Consulta'
          TabOrder = 0
          object mmXMLRetorno: TMemo
            Left = 2
            Top = 15
            Width = 489
            Height = 316
            Align = alClient
            TabOrder = 0
          end
        end
      end
      object tsExclusao: TTabSheet
        Caption = 'Exclus'#227'o'
        ImageIndex = 6
        object GroupBox12: TGroupBox
          Left = 0
          Top = 0
          Width = 493
          Height = 118
          Align = alTop
          Caption = 'TX2 da Exclus'#227'o'
          TabOrder = 0
          object mmTX2Exclusao: TMemo
            Left = 2
            Top = 15
            Width = 489
            Height = 101
            Align = alClient
            TabOrder = 0
          end
        end
        object GroupBox13: TGroupBox
          Left = 0
          Top = 118
          Width = 493
          Height = 118
          Align = alTop
          Caption = 'XML da Exclus'#227'o'
          TabOrder = 1
          object mmXMLExclusao: TMemo
            Left = 2
            Top = 15
            Width = 489
            Height = 101
            Align = alClient
            TabOrder = 0
          end
        end
        object GroupBox14: TGroupBox
          Left = 0
          Top = 236
          Width = 493
          Height = 97
          Align = alTop
          Caption = 'Envio/Retorno da Exclus'#227'o'
          TabOrder = 2
          object mmRetornoExclusao: TMemo
            Left = 2
            Top = 15
            Width = 489
            Height = 80
            Align = alClient
            TabOrder = 0
          end
        end
      end
    end
  end
end

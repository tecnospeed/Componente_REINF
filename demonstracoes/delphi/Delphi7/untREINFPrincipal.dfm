object frmReinfPrincipal: TfrmReinfPrincipal
  Left = 524
  Top = 47
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Demonstra'#231#227'o REINF'
  ClientHeight = 949
  ClientWidth = 666
  Color = clMenu
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
    Top = 0
    Width = 665
    Height = 949
    Align = alLeft
    Color = clMenu
    TabOrder = 0
    object pcProcessos: TPageControl
      Left = 1
      Top = 433
      Width = 663
      Height = 515
      ActivePage = tsTX2
      Align = alBottom
      TabOrder = 0
      object tsTX2: TTabSheet
        Caption = 'TX2'
        ImageIndex = 1
        object GroupBox5: TGroupBox
          Left = 0
          Top = 0
          Width = 807
          Height = 554
          Align = alCustom
          Caption = 'Dados b'#225'sicos TX2'
          Color = clMenu
          ParentColor = False
          TabOrder = 0
          object mmTX2: TMemo
            Left = 2
            Top = 15
            Width = 647
            Height = 466
            Align = alCustom
            TabOrder = 0
          end
        end
      end
      object tsXML: TTabSheet
        Caption = 'XML'
        object GroupBox6: TGroupBox
          Left = 0
          Top = 0
          Width = 655
          Height = 169
          Align = alTop
          Caption = 'XML gerado'
          Color = clMenu
          ParentColor = False
          TabOrder = 0
          object mmXML: TMemo
            Left = 2
            Top = 15
            Width = 651
            Height = 152
            Align = alClient
            TabOrder = 0
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 169
          Width = 655
          Height = 318
          Align = alClient
          Caption = 'XML Assinado'
          Color = clMenu
          ParentColor = False
          TabOrder = 1
          object mmXMLAssinado: TMemo
            Left = 2
            Top = 15
            Width = 651
            Height = 301
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
          Width = 655
          Height = 487
          Align = alClient
          Caption = 'Retorno do envio do lote'
          Color = clMenu
          ParentColor = False
          TabOrder = 0
          object mmEnvio: TMemo
            Left = 2
            Top = 15
            Width = 651
            Height = 470
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
          Width = 655
          Height = 487
          Align = alClient
          Caption = 'Consulta'
          Color = clMenu
          ParentColor = False
          TabOrder = 0
          object mmConsulta: TMemo
            Left = 2
            Top = 15
            Width = 651
            Height = 470
            Align = alClient
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
          Width = 655
          Height = 487
          Align = alClient
          Caption = 'XML de Envio da Consulta'
          Color = clMenu
          ParentColor = False
          TabOrder = 0
          object mmXMLEnvio: TMemo
            Left = 2
            Top = 15
            Width = 651
            Height = 470
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
          Width = 655
          Height = 487
          Align = alClient
          Caption = 'XML de Retorno da Consulta'
          Color = clMenu
          ParentColor = False
          TabOrder = 0
          object mmXMLRetorno: TMemo
            Left = 2
            Top = 15
            Width = 651
            Height = 470
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
          Width = 655
          Height = 0
          Align = alTop
          Caption = 'TX2 da Exclus'#227'o'
          Color = clMenu
          ParentColor = False
          TabOrder = 0
          Visible = False
          object mmTX2Exclusao: TMemo
            Left = 2
            Top = 15
            Width = 651
            Height = 0
            Align = alClient
            TabOrder = 0
            Visible = False
          end
        end
        object GroupBox13: TGroupBox
          Left = 0
          Top = 0
          Width = 655
          Height = 118
          Align = alTop
          Caption = 'XML da Exclus'#227'o'
          Color = clMenu
          ParentColor = False
          TabOrder = 1
          object mmXMLExclusao: TMemo
            Left = 2
            Top = 15
            Width = 651
            Height = 101
            Align = alClient
            TabOrder = 0
          end
        end
        object GroupBox14: TGroupBox
          Left = 0
          Top = 118
          Width = 655
          Height = 97
          Align = alTop
          Caption = 'Envio/Retorno da Exclus'#227'o'
          TabOrder = 2
          object mmRetornoExclusao: TMemo
            Left = 2
            Top = 15
            Width = 651
            Height = 80
            Align = alClient
            TabOrder = 0
          end
        end
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 2
      Width = 648
      Height = 425
      Align = alCustom
      Anchors = []
      BevelOuter = bvNone
      Color = clMenu
      TabOrder = 1
      DesignSize = (
        648
        425)
      object Label1: TLabel
        Left = 232
        Top = 11
        Width = 100
        Height = 13
        Caption = 'CNPJ SofwareHouse'
      end
      object Label2: TLabel
        Left = 449
        Top = 12
        Width = 107
        Height = 13
        Caption = 'Token SoftwareHouse'
      end
      object GroupBox9: TGroupBox
        Left = 1
        Top = 8
        Width = 224
        Height = 417
        Anchors = []
        TabOrder = 0
        object lbl2: TLabel
          Left = 4
          Top = 148
          Width = 215
          Height = 21
          Caption = 'Vers'#227'o Manual'
        end
        object Ambiente: TLabel
          Left = 4
          Top = 99
          Width = 215
          Height = 21
          Caption = 'Ambiente'
        end
        object Label3: TLabel
          Left = 4
          Top = 60
          Width = 215
          Height = 21
          Caption = 'CNPJ Empregador'
        end
        object SpeedButton1: TSpeedButton
          Left = 35
          Top = 211
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
        object sbLimpar: TSpeedButton
          Left = 70
          Top = 243
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
        object Label6: TLabel
          Left = 8
          Top = 353
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
        object cbVersao: TComboBox
          Left = 4
          Top = 165
          Width = 215
          Height = 21
          ItemHeight = 13
          TabOrder = 0
        end
        object cbAmbiente: TComboBox
          Left = 4
          Top = 116
          Width = 215
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
        object edtCNPJEmpregador: TEdit
          Left = 4
          Top = 76
          Width = 215
          Height = 21
          TabOrder = 2
          Text = '00000000000000'
        end
      end
      object GroupBox1: TGroupBox
        Left = 229
        Top = 56
        Width = 420
        Height = 369
        Anchors = []
        TabOrder = 1
        object lbl1: TLabel
          Left = 5
          Top = 12
          Width = 50
          Height = 13
          Caption = 'Certificado'
        end
        object sbPreencherComp: TSpeedButton
          Left = 29
          Top = 197
          Width = 164
          Height = 28
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
          Left = 29
          Top = 261
          Width = 164
          Height = 28
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
          Left = 29
          Top = 229
          Width = 164
          Height = 28
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
          Left = 29
          Top = 293
          Width = 164
          Height = 28
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
          Left = 29
          Top = 325
          Width = 164
          Height = 28
          Caption = '5 - Enviar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = sbEnviarClick
        end
        object sbExcluir: TSpeedButton
          Left = 213
          Top = 325
          Width = 164
          Height = 28
          Caption = 'Excluir Envio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = sbExcluirClick
        end
        object sbConsultaLote: TSpeedButton
          Left = 213
          Top = 197
          Width = 164
          Height = 28
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
          Left = 213
          Top = 229
          Width = 164
          Height = 28
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
          Left = 213
          Top = 261
          Width = 164
          Height = 28
          Caption = '6 - Por N'#186' do Recibo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = sbConsultarReciboClick
        end
        object Label4: TLabel
          Left = 4
          Top = 100
          Width = 91
          Height = 13
          Caption = 'Diret'#243'rio Templates'
        end
        object Label5: TLabel
          Left = 4
          Top = 52
          Width = 91
          Height = 13
          Caption = 'Diretorio Esquemas'
        end
        object Label7: TLabel
          Left = 5
          Top = 148
          Width = 363
          Height = 13
          Caption = 
            'ID do Lote (Para Consulta digitar: ID do Lote, ID do Evento ou N' +
            #186' do Recibo)'
        end
        object cbCertificado: TComboBox
          Left = 5
          Top = 28
          Width = 404
          Height = 21
          ItemHeight = 13
          TabOrder = 0
        end
        object edtDirTemplates: TEdit
          Left = 4
          Top = 116
          Width = 404
          Height = 21
          TabOrder = 1
          Text = 'C:\Program Files\TecnoSpeed\Reinf\Arquivos\Templates\'
        end
        object edtDirEsquemas: TEdit
          Left = 4
          Top = 68
          Width = 404
          Height = 21
          TabOrder = 2
          Text = 'C:\Program Files\TecnoSpeed\Reinf\Arquivos\Esquemas\'
        end
        object edtIDLote: TEdit
          Left = 5
          Top = 163
          Width = 404
          Height = 21
          TabOrder = 3
        end
      end
      object edtCNPJ: TEdit
        Left = 232
        Top = 28
        Width = 189
        Height = 21
        TabOrder = 2
        Text = '00000000000000'
      end
      object edtToken: TEdit
        Left = 449
        Top = 28
        Width = 189
        Height = 21
        ReadOnly = True
        TabOrder = 3
        Text = 'aaaaaaaaaaaaaa'
      end
    end
  end
end

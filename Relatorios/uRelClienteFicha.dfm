object FrmRelClienteFicha: TFrmRelClienteFicha
  Left = 0
  Top = 0
  Caption = 'FrmRelClienteFicha'
  ClientHeight = 484
  ClientWidth = 851
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 8
    Top = 0
    Width = 794
    Height = 1123
    Borders.Sides = sdCustom
    Borders.DrawLeft = False
    Borders.DrawTop = False
    Borders.DrawRight = False
    Borders.DrawBottom = False
    Borders.Style = bsVertical
    DataSource = DtsClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Transparent = False
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedTop = True
      Borders.FixedBottom = True
      Transparent = False
      object RLLabel1: TRLLabel
        Left = 240
        Top = 5
        Width = 237
        Height = 33
        Align = faCenter
        Alignment = taJustify
        Caption = 'Ficha de Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
    end
    object Rodape: TRLBand
      Left = 38
      Top = 206
      Width = 718
      Height = 56
      BandType = btFooter
      Transparent = False
      object RLPanel2: TRLPanel
        Left = 0
        Top = 27
        Width = 718
        Height = 17
        Align = faCenter
        Color = 13092783
        ParentColor = False
        Transparent = False
      end
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 16
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
        Transparent = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 0
        Top = 10
        Width = 72
        Height = 18
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Info = itFullDate
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 682
        Top = 9
        Width = 137
        Height = 18
        Info = itLastPageNumber
        Text = ''
        Transparent = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 555
        Top = 9
        Width = 107
        Height = 18
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
        Transparent = False
      end
      object RLLabel2: TRLLabel
        Left = 668
        Top = 9
        Width = 8
        Height = 19
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel3: TRLLabel
        Left = 573
        Top = 9
        Width = 63
        Height = 19
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 81
      Width = 718
      Height = 125
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Transparent = False
      object RLDBText6: TRLDBText
        Left = 48
        Top = 19
        Width = 30
        Height = 16
        Alignment = taRightJustify
        DataField = 'clienteID'
        DataSource = DtsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 201
        Top = 18
        Width = 51
        Height = 16
        DataField = 'nome'
        DataSource = DtsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText8: TRLDBText
        Left = 469
        Top = 63
        Width = 42
        Height = 16
        DataField = 'cidade'
        DataSource = DtsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText9: TRLDBText
        Left = 649
        Top = 63
        Width = 43
        Height = 16
        DataField = 'estado'
        DataSource = DtsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText10: TRLDBText
        Left = 80
        Top = 41
        Width = 98
        Height = 13
        DataField = 'celular'
        DataSource = DtsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel5: TRLLabel
        Left = 147
        Top = 17
        Width = 49
        Height = 18
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 408
        Top = 63
        Width = 58
        Height = 18
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel7: TRLLabel
        Left = 588
        Top = 63
        Width = 57
        Height = 18
        Caption = 'Estado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel8: TRLLabel
        Left = 0
        Top = 41
        Width = 72
        Height = 18
        Alignment = taCenter
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 0
        Top = 17
        Width = 59
        Height = 18
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBText1: TRLDBText
        Left = 194
        Top = 41
        Width = 81
        Height = 16
        DataField = 'telefone'
        DataSource = DtsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel9: TRLLabel
        Left = 0
        Top = 65
        Width = 77
        Height = 18
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBText2: TRLDBText
        Left = 84
        Top = 65
        Width = 57
        Height = 16
        DataField = 'endereco'
        DataSource = DtsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel10: TRLLabel
        Left = 330
        Top = 41
        Width = 46
        Height = 18
        Caption = 'Email:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBText3: TRLDBText
        Left = 382
        Top = 41
        Width = 35
        Height = 16
        DataField = 'email'
        DataSource = DtsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel11: TRLLabel
        Left = 0
        Top = 90
        Width = 39
        Height = 18
        Caption = 'CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBText4: TRLDBText
        Left = 43
        Top = 90
        Width = 25
        Height = 16
        DataField = 'cep'
        DataSource = DtsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel12: TRLLabel
        Left = 179
        Top = 41
        Width = 17
        Height = 18
        Alignment = taCenter
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLAngleLabel1: TRLAngleLabel
        Left = 698
        Top = 18
        Width = 15
        Height = 92
        Angle = 90.000000000000000000
        Caption = 'Ficha de Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object QryClientes: TFDQuery
    Active = True
    Connection = dtmConexao.conexaoDB
    SQL.Strings = (
      'SELECT*  '
      'FROM clientes'
      'order by nome;')
    Left = 456
    Top = 8
    object QryClientesclienteID: TFDAutoIncField
      FieldName = 'clienteID'
      ReadOnly = True
    end
    object QryClientesnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object QryClientescidade: TStringField
      FieldName = 'cidade'
      Size = 50
    end
    object QryClientesestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object QryClientescelular: TStringField
      FieldName = 'celular'
      Size = 15
    end
    object QryClientesCPF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 14
    end
    object QryClientesendereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 60
    end
    object QryClientesbairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 40
    end
    object QryClientescep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cep'
      Origin = 'cep'
      Size = 10
    end
    object QryClientestelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 14
    end
    object QryClientesemail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object QryClientesdataNascimento: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dataNascimento'
      Origin = 'dataNascimento'
    end
  end
  object DtsClientes: TDataSource
    DataSet = QryClientes
    Left = 504
    Top = 8
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 400
    Top = 8
  end
end

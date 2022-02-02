object FrmRelCliente: TFrmRelCliente
  Left = 0
  Top = 0
  Caption = 'FrmRelCliente'
  ClientHeight = 484
  ClientWidth = 796
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
    Left = 32
    Top = 8
    Width = 794
    Height = 1123
    Borders.Sides = sdCustom
    Borders.DrawLeft = False
    Borders.DrawTop = False
    Borders.DrawRight = False
    Borders.DrawBottom = False
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
      Height = 59
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
        Left = 228
        Top = 6
        Width = 261
        Height = 46
        Align = faCenter
        Alignment = taJustify
        Caption = 'Lista Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -33
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
    end
    object Rodape: TRLBand
      Left = 38
      Top = 145
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
    object RLBand2: TRLBand
      Left = 38
      Top = 97
      Width = 718
      Height = 24
      BandType = btColumnHeader
      Transparent = False
      object RLPanel1: TRLPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 24
        Align = faClient
        Color = 13092783
        ParentColor = False
        Transparent = False
        object RLLabel4: TRLLabel
          Left = 0
          Top = 3
          Width = 60
          Height = 19
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel5: TRLLabel
          Left = 63
          Top = 3
          Width = 49
          Height = 19
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel6: TRLLabel
          Left = 422
          Top = 3
          Width = 58
          Height = 19
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 530
          Top = 3
          Width = 58
          Height = 19
          Caption = 'Estado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel8: TRLLabel
          Left = 618
          Top = 3
          Width = 58
          Height = 19
          Alignment = taCenter
          Caption = 'Celular'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 121
      Width = 718
      Height = 24
      Transparent = False
      object RLDBText1: TRLDBText
        Left = 6
        Top = 3
        Width = 54
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
      object RLDBText2: TRLDBText
        Left = 63
        Top = 3
        Width = 36
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
      object RLDBText3: TRLDBText
        Left = 422
        Top = 3
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
      object RLDBText4: TRLDBText
        Left = 544
        Top = 3
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
      object RLDBText5: TRLDBText
        Left = 603
        Top = 2
        Width = 42
        Height = 16
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

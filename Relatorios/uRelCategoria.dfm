object FrmRelCategoria: TFrmRelCategoria
  Left = 0
  Top = 0
  Caption = 'FrmRelCategoria'
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
    Left = 24
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DtsCategorias
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
      Transparent = False
      object RLDraw1: TRLDraw
        Left = 0
        Top = 46
        Width = 718
        Height = 13
        Align = faBottom
        DrawKind = dkLine
        Pen.Width = 2
        Transparent = False
      end
      object RLLabel1: TRLLabel
        Left = 168
        Top = 3
        Width = 386
        Height = 46
        Caption = 'Listagem Categorias'
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
          Left = 3
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
          Left = 78
          Top = 3
          Width = 81
          Height = 19
          Caption = 'Descri'#231#227'o'
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
        Left = 3
        Top = 4
        Width = 69
        Height = 16
        Alignment = taCenter
        DataField = 'categoriaID'
        DataSource = DtsCategorias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLDBText2: TRLDBText
        Left = 78
        Top = 5
        Width = 62
        Height = 16
        DataField = 'Descricao'
        DataSource = DtsCategorias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
    end
  end
  object QryCategorias: TFDQuery
    Active = True
    Connection = dtmConexao.conexaoDB
    SQL.Strings = (
      'SELECT categoriaID,'
      '        Descricao '
      'FROM categorias;')
    Left = 456
    Top = 8
    object QryCategoriascategoriaID: TFDAutoIncField
      FieldName = 'categoriaID'
      Origin = 'categoriaID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryCategoriasDescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Size = 30
    end
  end
  object DtsCategorias: TDataSource
    DataSet = QryCategorias
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

object FrmRelProdutosPorCategoria: TFrmRelProdutosPorCategoria
  Left = 0
  Top = 0
  Caption = 'FrmRelProdutosPorCategoria'
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
    Left = -6
    Top = -48
    Width = 794
    Height = 1123
    DataSource = DtsProdutosPorCategoria
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
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
        Left = 56
        Top = 0
        Width = 606
        Height = 46
        Align = faCenter
        Alignment = taCenter
        Caption = 'Listagem Produtos por categoria'
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
      Top = 266
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
        Width = 128
        Height = 17
        Info = itLastPageNumber
        Text = ''
        Transparent = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 562
        Top = 9
        Width = 100
        Height = 17
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
    object BandaDoGrupo: TRLGroup
      Left = 38
      Top = 97
      Width = 718
      Height = 169
      DataFields = 'categoriaId'
      Transparent = False
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 16
        BandType = btHeader
        Color = 15527119
        ParentColor = False
        Transparent = False
        object RLDBText6: TRLDBText
          Left = 275
          Top = -1
          Width = 102
          Height = 16
          DataField = 'nomeCategoria'
          DataSource = DtsProdutosPorCategoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLLabel9: TRLLabel
          Left = 149
          Top = -1
          Width = 82
          Height = 18
          Alignment = taCenter
          Caption = 'Categoria :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBText7: TRLDBText
          Left = 237
          Top = -1
          Width = 13
          Height = 16
          Alignment = taRightJustify
          DataField = 'categoriaId'
          DataSource = DtsProdutosPorCategoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLLabel10: TRLLabel
          Left = 259
          Top = -2
          Width = 9
          Height = 19
          Caption = '-'
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
        Left = 0
        Top = 16
        Width = 718
        Height = 24
        BandType = btColumnHeader
        Color = clScrollBar
        ParentColor = False
        Transparent = False
        object RLLabel4: TRLLabel
          Left = 3
          Top = 2
          Width = 55
          Height = 18
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel5: TRLLabel
          Left = 66
          Top = 2
          Width = 75
          Height = 18
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel6: TRLLabel
          Left = 422
          Top = 2
          Width = 34
          Height = 18
          Caption = 'Qtd.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 463
          Top = 2
          Width = 41
          Height = 18
          Caption = 'Unid.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel8: TRLLabel
          Left = 655
          Top = 2
          Width = 40
          Height = 18
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 40
        Width = 718
        Height = 24
        Transparent = False
        object RLDBText1: TRLDBText
          Left = 4
          Top = 5
          Width = 58
          Height = 16
          Alignment = taCenter
          DataField = 'produtoId'
          DataSource = DtsProdutosPorCategoria
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
          Left = 68
          Top = 6
          Width = 36
          Height = 16
          DataField = 'nome'
          DataSource = DtsProdutosPorCategoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText3: TRLDBText
          Left = 420
          Top = 5
          Width = 37
          Height = 16
          Alignment = taRightJustify
          DataField = 'quantidade'
          DataSource = DtsProdutosPorCategoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText4: TRLDBText
          Left = 463
          Top = 5
          Width = 41
          Height = 16
          Alignment = taCenter
          DataField = 'unidade'
          DataSource = DtsProdutosPorCategoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 640
          Top = 6
          Width = 75
          Height = 16
          Alignment = taRightJustify
          DataField = 'valor'
          DataSource = DtsProdutosPorCategoria
          DisplayMask = '#0.00'
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
      object RLBand5: TRLBand
        Left = 0
        Top = 64
        Width = 718
        Height = 102
        BandType = btSummary
        BeforePrint = RLBand5BeforePrint
        object RLDraw3: TRLDraw
          Left = 312
          Top = 6
          Width = 403
          Height = 9
          DrawKind = dkLine
          Pen.Width = 2
          Transparent = False
        end
        object RLLabel11: TRLLabel
          Left = 312
          Top = 21
          Width = 275
          Height = 18
          Caption = 'Quanidade de Estoque por Categoria :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object ResultEstoque: TRLDBResult
          Left = 673
          Top = 21
          Width = 120
          Height = 17
          DataField = 'quantidade'
          DataSource = DtsProdutosPorCategoria
          Info = riSum
          Text = ''
          Visible = False
          OnCompute = ResultEstoqueCompute
        end
        object LblResultCategoria: TRLLabel
          Left = 593
          Top = 21
          Width = 114
          Height = 17
          Alignment = taRightJustify
          Caption = 'soma na formula'
        end
        object RLLabel12: TRLLabel
          Left = 357
          Top = 44
          Width = 230
          Height = 18
          Caption = 'Valor estoque (pre'#231'o de custo) :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object LblResultCusto: TRLLabel
          Left = 593
          Top = 44
          Width = 114
          Height = 17
          Alignment = taRightJustify
          Caption = 'soma na formula'
        end
        object ResultCusto: TRLDBResult
          Left = 673
          Top = 44
          Width = 42
          Height = 17
          Alignment = taRightJustify
          DataField = 'valorCusto'
          DataSource = DtsProdutosPorCategoria
          Info = riSum
          Text = ''
          Visible = False
        end
        object RLLabel13: TRLLabel
          Left = 352
          Top = 68
          Width = 235
          Height = 18
          Caption = 'Valor estoque (pre'#231'o de venda) :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object LblResultVenda: TRLLabel
          Left = 593
          Top = 68
          Width = 114
          Height = 17
          Alignment = taRightJustify
          Caption = 'soma na formula'
        end
        object ResultVenda: TRLDBResult
          Left = 673
          Top = 68
          Width = 37
          Height = 17
          Alignment = taRightJustify
          DataField = 'valor'
          DataSource = DtsProdutosPorCategoria
          Info = riSum
          Text = ''
          Visible = False
        end
        object RLDraw4: TRLDraw
          Left = 0
          Top = 87
          Width = 718
          Height = 9
          DrawKind = dkLine
          Pen.Width = 2
          Transparent = False
        end
      end
    end
  end
  object QryProdutosPorCategoria: TFDQuery
    Active = True
    Connection = dtmConexao.conexaoDB
    SQL.Strings = (
      'select p.produtoId,'
      #9'   p.nome,'
      #9'   p.descricao, '
      #9'   p.valorCusto,'
      '           p.unidade,'
      #9'   p.valor,'
      #9'   p.quantidade,'
      #9'   p.categoriaId,'
      #9'   categorias.Descricao as nomeCategoria'
      'from produtos p '
      'left join categorias on categorias.categoriaID = p.categoriaId'
      'order by p.categoriaId, p.produtoId; ')
    Left = 456
    Top = 8
    object QryProdutosPorCategoriaprodutoId: TFDAutoIncField
      FieldName = 'produtoId'
      Origin = 'produtoId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryProdutosPorCategorianome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object QryProdutosPorCategoriadescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 255
    end
    object QryProdutosPorCategoriavalorCusto: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valorCusto'
      Origin = 'valorCusto'
      Precision = 18
      Size = 5
    end
    object QryProdutosPorCategoriavalor: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 18
      Size = 5
    end
    object QryProdutosPorCategoriaquantidade: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'quantidade'
      Origin = 'quantidade'
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 5
    end
    object QryProdutosPorCategoriacategoriaId: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'categoriaId'
      Origin = 'categoriaId'
    end
    object QryProdutosPorCategorianomeCategoria: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomeCategoria'
      Origin = 'Descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object QryProdutosPorCategoriaunidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'unidade'
      Origin = 'unidade'
      Size = 10
    end
  end
  object DtsProdutosPorCategoria: TDataSource
    DataSet = QryProdutosPorCategoria
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

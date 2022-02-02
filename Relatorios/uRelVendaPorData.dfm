object FrmRelVendaPorData: TFrmRelVendaPorData
  Left = 0
  Top = 0
  Caption = 'FrmRelVendaPorData'
  ClientHeight = 484
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = -6
    Top = -48
    Width = 794
    Height = 1123
    DataSource = DtsVendaPorData
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
        Left = 202
        Top = 0
        Width = 314
        Height = 46
        Align = faCenter
        Alignment = taCenter
        Caption = 'Vendas Por Data'
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
      Top = 276
      Width = 718
      Height = 79
      BandType = btFooter
      Transparent = False
      object RLPanel2: TRLPanel
        Left = 0
        Top = 41
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
        Height = 21
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
        Transparent = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 0
        Top = 17
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
        Top = 18
        Width = 128
        Height = 17
        Info = itLastPageNumber
        Text = ''
        Transparent = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 562
        Top = 16
        Width = 100
        Height = 17
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
        Transparent = False
      end
      object RLLabel2: TRLLabel
        Left = 668
        Top = 16
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
        Top = 16
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
      Height = 152
      DataFields = 'datavenda'
      Transparent = False
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 25
        BandType = btHeader
        Color = 15527119
        ParentColor = False
        Transparent = False
        object RLLabel4: TRLLabel
          Left = 155
          Top = 4
          Width = 40
          Height = 18
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBText1: TRLDBText
          Left = 201
          Top = 5
          Width = 62
          Height = 16
          Alignment = taCenter
          DataField = 'datavenda'
          DataSource = DtsVendaPorData
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
      object RLBand2: TRLBand
        Left = 0
        Top = 25
        Width = 718
        Height = 24
        BandType = btColumnHeader
        Color = clScrollBar
        ParentColor = False
        Transparent = False
        object RLLabel5: TRLLabel
          Left = 85
          Top = 3
          Width = 122
          Height = 18
          Caption = 'Nome do Cliente'
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
        object RLLabel7: TRLLabel
          Left = 9
          Top = 2
          Width = 63
          Height = 18
          Caption = 'VendaID'
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
        Top = 49
        Width = 718
        Height = 24
        Transparent = False
        object RLDBText2: TRLDBText
          Left = 86
          Top = 6
          Width = 36
          Height = 16
          DataField = 'nome'
          DataSource = DtsVendaPorData
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
          Left = 649
          Top = 6
          Width = 66
          Height = 16
          Alignment = taRightJustify
          DataField = 'totalVenda'
          DataSource = DtsVendaPorData
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
        object RLDBText3: TRLDBText
          Left = 9
          Top = 6
          Width = 49
          Height = 16
          DataField = 'vendaID'
          DataSource = DtsVendaPorData
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
        Top = 73
        Width = 718
        Height = 62
        BandType = btSummary
        object RLDraw3: TRLDraw
          Left = 480
          Top = 6
          Width = 235
          Height = 9
          DrawKind = dkLine
          Pen.Width = 2
          Transparent = False
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
        object RLDBResult1: TRLDBResult
          Left = 641
          Top = 21
          Width = 117
          Height = 17
          DataField = 'totalVenda'
          DataSource = DtsVendaPorData
          Info = riSum
          Text = ''
        end
        object RLLabel6: TRLLabel
          Left = 494
          Top = 20
          Width = 110
          Height = 17
          Alignment = taCenter
          Caption = 'Total venda Dia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 249
      Width = 718
      Height = 27
      BandType = btSummary
      object RLLabel9: TRLLabel
        Left = 457
        Top = 6
        Width = 152
        Height = 18
        Alignment = taCenter
        Caption = 'Total venda per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBResult2: TRLDBResult
        Left = 615
        Top = 4
        Width = 117
        Height = 17
        DataField = 'totalVenda'
        DataSource = DtsVendaPorData
        Info = riSum
        Text = ''
      end
    end
  end
  object QryVendaPorData: TFDQuery
    Active = True
    Connection = dtmConexao.conexaoDB
    SQL.Strings = (
      'select  v.vendaID,'
      '        v.clienteID ,'
      '        c.nome ,'
      '        v.datavenda,'
      '        v.totalVenda'
      'from vendas as v'
      'inner join clientes c on c.clienteID = v.clienteID'
      'where v.datavenda between :DataInicio and :DataFim'
      'order by v.datavenda , v.clienteID')
    Left = 456
    Top = 8
    ParamData = <
      item
        Name = 'DATAINICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = 44562d
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = 44592d
      end>
    object QryVendaPorDatavendaID: TFDAutoIncField
      FieldName = 'vendaID'
      Origin = 'vendaID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QryVendaPorDataclienteID: TIntegerField
      FieldName = 'clienteID'
      Origin = 'clienteID'
      Required = True
    end
    object QryVendaPorDatanome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QryVendaPorDatadatavenda: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'datavenda'
      Origin = 'datavenda'
    end
    object QryVendaPorDatatotalVenda: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'totalVenda'
      Origin = 'totalVenda'
      currency = True
      Precision = 18
      Size = 5
    end
  end
  object DtsVendaPorData: TDataSource
    DataSet = QryVendaPorData
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

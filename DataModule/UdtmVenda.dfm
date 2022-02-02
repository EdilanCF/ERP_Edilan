object DtmVenda: TDtmVenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 207
  Width = 364
  object QryCliente: TFDQuery
    Connection = dtmConexao.conexaoDB
    SQL.Strings = (
      'select clienteID, nome'
      'from clientes')
    Left = 32
    Top = 16
    object QryClienteclienteID: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteID'
      Origin = 'clienteID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryClientenome: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
  end
  object QryProduto: TFDQuery
    Connection = dtmConexao.conexaoDB
    SQL.Strings = (
      'select produtoID, nome, valor, quantidade, unidade'
      'From produtos')
    Left = 96
    Top = 16
    object QryProdutoprodutoID: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoID'
      ReadOnly = True
    end
    object QryProdutonome: TStringField
      DisplayLabel = 'Item'
      FieldName = 'nome'
      Size = 60
    end
    object QryProdutovalor: TFMTBCDField
      FieldName = 'valor'
      Precision = 18
      Size = 5
    end
    object QryProdutoquantidade: TFMTBCDField
      DisplayLabel = 'Qtd.'
      FieldName = 'quantidade'
      Precision = 18
      Size = 5
    end
    object QryProdutounidade: TStringField
      DisplayLabel = 'Unid.'
      FieldName = 'unidade'
      Size = 10
    end
  end
  object DtsCliente: TDataSource
    DataSet = QryCliente
    Left = 32
    Top = 80
  end
  object DtsProduto: TDataSource
    DataSet = QryProduto
    Left = 96
    Top = 80
  end
  object DtsItensVenda: TDataSource
    DataSet = CdsItensvenda
    Left = 192
    Top = 88
  end
  object CdsItensvenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 16
    object CdsItensvendaprodutoID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoID'
    end
    object CdsItensvendanomeProduto: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'nomeProduto'
      Size = 60
    end
    object CdsItensvendaValoUnitario: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'valorUnitario'
    end
    object CdsItensvendaquantidade: TFloatField
      DisplayLabel = 'Qtd.'
      FieldName = 'quantidade'
    end
    object CdsItensvendaunidade: TStringField
      DisplayLabel = 'Unid.'
      FieldName = 'unidade'
    end
    object CdsItensvendavalorTotalProduto: TFloatField
      DisplayLabel = 'Total Produto'
      FieldName = 'valorTotalProduto'
    end
  end
end

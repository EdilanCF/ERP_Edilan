object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 394
  Width = 578
  object conexaoDB: TFDConnection
    Params.Strings = (
      'Database=dbedilanteste'
      'User_Name=root'
      'Password=127611'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files (x86)\MySQL\MySQL Server 5.7\lib\libmysql.dll'
    Left = 120
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 248
    Top = 8
  end
  object QryScriptCategorias: TFDQuery
    Connection = conexaoDB
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS `categorias` ('
      '  `categoriaID` int(10) NOT NULL AUTO_INCREMENT,'
      '  `Descricao` varchar(30) DEFAULT NULL,'
      '  PRIMARY KEY (`categoriaID`)'
      ') ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;')
    Left = 32
    Top = 104
  end
  object QryScriptClientes: TFDQuery
    Connection = conexaoDB
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS `clientes` ('
      '  `clienteID` int(11) NOT NULL AUTO_INCREMENT,'
      '  `nome` varchar(60) DEFAULT NULL,'
      '  `CPF` varchar(14) DEFAULT NULL,'
      '  `endereco` varchar(60) DEFAULT NULL,'
      '  `cidade` varchar(50) DEFAULT NULL,'
      '  `bairro` varchar(40) DEFAULT NULL,'
      '  `estado` varchar(2) DEFAULT NULL,'
      '  `cep` varchar(10) DEFAULT NULL,'
      '  `telefone` varchar(14) DEFAULT NULL,'
      '  `celular` varchar(15) DEFAULT NULL,'
      '  `email` varchar(100) DEFAULT NULL,'
      '  `dataNascimento` date DEFAULT NULL,'
      '  PRIMARY KEY (`clienteID`)'
      ') ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;')
    Left = 32
    Top = 160
  end
  object QryScriptVendas: TFDQuery
    Connection = conexaoDB
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS `vendas` ('
      '  `vendaID` int(11) NOT NULL AUTO_INCREMENT,'
      '  `clienteID` int(11) NOT NULL,'
      '  `datavenda` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,'
      '  `totalVenda` decimal(18,5) DEFAULT '#39'0.00000'#39','
      '  PRIMARY KEY (`vendaID`),'
      '  KEY `vendas_FK` (`clienteID`),'
      
        '  CONSTRAINT `vendas_FK` FOREIGN KEY (`clienteID`) REFERENCES `c' +
        'lientes` (`clienteID`)'
      ') ENGINE=InnoDB DEFAULT CHARSET=utf8;')
    Left = 32
    Top = 280
  end
  object QryScriptItensVendas: TFDQuery
    Connection = conexaoDB
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS `vendasitens` ('
      '  `vendaID` int(11) NOT NULL,'
      '  `produtoID` int(11) NOT NULL,'
      '  `valorUnitario` decimal(18,5) DEFAULT '#39'0.00000'#39','
      '  `quantidade` decimal(18,0) DEFAULT '#39'0'#39','
      '  `unidade` varchar(4) DEFAULT NULL,'
      '  `totalProduto` decimal(18,5) DEFAULT '#39'0.00000'#39','
      '  PRIMARY KEY (`vendaID`,`produtoID`),'
      '  KEY `vendasItens_FK` (`produtoID`),'
      
        '  CONSTRAINT `vendasItens_FK` FOREIGN KEY (`produtoID`) REFERENC' +
        'ES `produtos` (`produtoId`)'
      ') ENGINE=InnoDB DEFAULT CHARSET=utf8')
    Left = 32
    Top = 336
  end
  object QryScriptProdutos: TFDQuery
    Connection = conexaoDB
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS `produtos` ('
      '  `produtoId` int(11) NOT NULL AUTO_INCREMENT,'
      '  `nome` varchar(60) DEFAULT NULL,'
      '  `descricao` varchar(255) DEFAULT NULL,'
      '  `valorCusto` decimal(18,2) DEFAULT '#39'0.01'#39','
      '  `valor` decimal(18,5) DEFAULT '#39'0.00000'#39','
      '  `quantidade` decimal(18,5) DEFAULT '#39'0.00000'#39','
      '  `unidade` varchar(10) DEFAULT NULL,'
      '  `categoriaId` int(11) DEFAULT NULL,'
      '  PRIMARY KEY (`produtoId`),'
      '  KEY `FK_ProdutosCategorias` (`categoriaId`),'
      
        '  CONSTRAINT `FK_ProdutosCategorias` FOREIGN KEY (`categoriaId`)' +
        ' REFERENCES `categorias` (`categoriaID`)'
      ') ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8')
    Left = 32
    Top = 224
  end
end

inherited FrmCadProduto: TFrmCadProduto
  Caption = 'Cadastro de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PgcPrincipal: TPageControl
    inherited TabListagem: TTabSheet
      inherited pnlListagemTopo: TPanel
        object CheckBox1: TCheckBox
          Left = 416
          Top = 18
          Width = 137
          Height = 17
          Caption = 'Exibir Valor de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = CheckBox1Click
        end
      end
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'produtoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 282
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valorCusto'
            Title.Caption = 'Valor Custo'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'unidade'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescricaoCategoria'
            Width = 121
            Visible = True
          end>
      end
    end
    inherited Tabmanutencao: TTabSheet
      object Label1: TLabel
        Left = 19
        Top = 81
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label2: TLabel
        Left = 210
        Top = 189
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label3: TLabel
        Left = 322
        Top = 189
        Width = 39
        Height = 13
        Caption = 'Estoque'
      end
      object Label4: TLabel
        Left = 472
        Top = 37
        Width = 47
        Height = 13
        Caption = 'Categoria'
      end
      object Label5: TLabel
        Left = 421
        Top = 189
        Width = 19
        Height = 13
        Caption = 'Uni.'
      end
      object Label6: TLabel
        Left = 19
        Top = 189
        Width = 55
        Height = 13
        Caption = 'Valor Custo'
      end
      object Label7: TLabel
        Left = 123
        Top = 190
        Width = 65
        Height = 13
        Caption = 'Tx. Marca'#231#227'o'
      end
      object Label8: TLabel
        Left = 177
        Top = 209
        Width = 14
        Height = 16
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtNome: TLabeledEdit
        Tag = 2
        Left = 19
        Top = 56
        Width = 430
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 1
      end
      object edtProdutoID: TLabeledEdit
        Tag = 1
        Left = 19
        Top = 16
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object EdtDescricao: TMemo
        Left = 19
        Top = 96
        Width = 758
        Height = 89
        Lines.Strings = (
          'EdtDescricao')
        MaxLength = 255
        TabOrder = 4
      end
      object EdtValor: TCurrencyEdit
        Left = 210
        Top = 208
        Width = 81
        Height = 21
        TabOrder = 7
        OnChange = EdtValorChange
      end
      object EdtQuantidade: TCurrencyEdit
        Left = 321
        Top = 208
        Width = 81
        Height = 21
        DisplayFormat = '0.00;  ,0.00'
        TabOrder = 8
      end
      object LkpCategoria: TDBLookupComboBox
        Tag = 2
        Left = 464
        Top = 56
        Width = 216
        Height = 21
        KeyField = 'categoriaID'
        ListField = 'Descricao'
        ListSource = DtsCategoria
        TabOrder = 2
      end
      object BtnCadCaegoria: TBitBtn
        Left = 686
        Top = 54
        Width = 91
        Height = 25
        Caption = 'Nova Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        TabStop = False
        OnClick = BtnCadCaegoriaClick
        OnExit = BtnCadCaegoriaExit
      end
      object EdtUnidade: TEdit
        Left = 416
        Top = 208
        Width = 33
        Height = 21
        MaxLength = 10
        TabOrder = 9
      end
      object EdtValorCusto: TCurrencyEdit
        Left = 19
        Top = 208
        Width = 81
        Height = 21
        TabOrder = 5
        OnExit = EdtValorCustoExit
      end
      object EdtTxMarcacao: TCurrencyEdit
        Left = 124
        Top = 208
        Width = 50
        Height = 21
        DisplayFormat = '0.00;-,0.00'
        TabOrder = 6
        OnExit = EdtTxMarcacaoExit
      end
    end
  end
  inherited pnlRodape: TPanel
    inherited BtnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TFDQuery
    Active = True
    SQL.Strings = (
      
        'select p.produtoId , p.nome , p.descricao ,p.valorCusto, p.valor' +
        ' , p.quantidade ,p.unidade, p.categoriaId ,'
      #9'   c.descricao as DescricaoCategoria'
      'from dbedilanteste.produtos p '
      
        'left join dbedilanteste.categorias c on c.categoriaID = p.catego' +
        'riaId; ')
    object QryListagemprodutoId: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      Origin = 'produtoId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryListagemnome: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object QryListagemdescricao: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 255
    end
    object QryListagemvalorCusto: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valorCusto'
      Origin = 'valorCusto'
      Precision = 18
      Size = 2
    end
    object QryListagemvalor: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 18
      Size = 5
    end
    object QryListagemquantidade: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 18
      Size = 5
    end
    object QryListagemunidade: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Unidade'
      FieldName = 'unidade'
      Origin = 'unidade'
      Size = 10
    end
    object QryListagemcategoriaId: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cod. Categoria'
      FieldName = 'categoriaId'
      Origin = 'categoriaId'
    end
    object QryListagemDescricaoCategoria: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o da Categoria'
      FieldName = 'DescricaoCategoria'
      Origin = 'Descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object DtsCategoria: TDataSource
    DataSet = QryCategoria
    Left = 708
    Top = 32
  end
  object QryCategoria: TFDQuery
    Connection = dtmConexao.conexaoDB
    SQL.Strings = (
      'SELECT categoriaID, Descricao'
      'FROM dbedilanteste.categorias;')
    Left = 636
    Top = 32
    object QryCategoriacategoriaID: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaID'
      Origin = 'categoriaID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryCategoriaDescricao: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Size = 30
    end
  end
end

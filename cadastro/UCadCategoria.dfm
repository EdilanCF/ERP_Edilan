inherited FrmCadCategoria: TFrmCadCategoria
  Caption = 'Cadastro de Categorias'
  ClientHeight = 402
  ClientWidth = 802
  ExplicitWidth = 808
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 13
  inherited PgcPrincipal: TPageControl
    Width = 802
    Height = 363
    ActivePage = Tabmanutencao
    ExplicitWidth = 802
    ExplicitHeight = 363
    inherited TabListagem: TTabSheet
      ExplicitWidth = 794
      ExplicitHeight = 335
      inherited pnlListagemTopo: TPanel
        Width = 794
        ExplicitTop = 0
        ExplicitWidth = 794
        inherited LblIndice: TLabel
          Left = 0
          Top = 1
          ExplicitLeft = 0
          ExplicitTop = 1
        end
        inherited MskPesquisar: TMaskEdit
          Top = 20
          ExplicitTop = 20
        end
      end
      inherited grdListagem: TDBGrid
        Width = 794
        Height = 278
        Columns = <
          item
            Expanded = False
            FieldName = 'categoriaID'
            Title.Caption = 'C'#211'DIGO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'DESCRI'#199#195'O'
            Visible = True
          end>
      end
    end
    inherited Tabmanutencao: TTabSheet
      ExplicitWidth = 794
      ExplicitHeight = 335
      object EdtCategoriaId: TLabeledEdit
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
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 19
        Top = 64
        Width = 430
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 363
    Width = 802
    ExplicitTop = 363
    ExplicitWidth = 802
    inherited BtnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TFDQuery
    SQL.Strings = (
      'SELECt *'
      #10'FROM dbedilanteste.categorias;')
  end
end

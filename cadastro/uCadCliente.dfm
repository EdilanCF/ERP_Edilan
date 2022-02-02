inherited frmCadCliente: TfrmCadCliente
  Caption = 'CADASTRO DE CLIENTE'
  ClientHeight = 403
  ClientWidth = 785
  ExplicitWidth = 791
  ExplicitHeight = 432
  PixelsPerInch = 96
  TextHeight = 13
  inherited PgcPrincipal: TPageControl
    Width = 785
    Height = 364
    ExplicitWidth = 785
    ExplicitHeight = 364
    inherited TabListagem: TTabSheet
      ExplicitWidth = 777
      ExplicitHeight = 336
      inherited pnlListagemTopo: TPanel
        Width = 777
        ExplicitWidth = 777
      end
      inherited grdListagem: TDBGrid
        Width = 777
        Height = 279
        Columns = <
          item
            Expanded = False
            FieldName = 'clienteID'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 225
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco'
            Width = 273
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cep'
            Width = 100
            Visible = True
          end>
      end
    end
    inherited Tabmanutencao: TTabSheet
      ExplicitWidth = 777
      ExplicitHeight = 336
      object Label1: TLabel
        Left = 461
        Top = 171
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label2: TLabel
        Left = 460
        Top = 85
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label3: TLabel
        Left = 572
        Top = 85
        Width = 33
        Height = 13
        Caption = 'Celular'
      end
      object Label4: TLabel
        Left = 12
        Top = 213
        Width = 96
        Height = 13
        Caption = 'Data de Nascimento'
      end
      object Label5: TLabel
        Left = 461
        Top = 45
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object EdtClienteId: TLabeledEdit
        Tag = 1
        Left = 12
        Top = 16
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 11
        NumbersOnly = True
        TabOrder = 0
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 12
        Top = 64
        Width = 430
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 1
      end
      object EdtCep: TMaskEdit
        Left = 460
        Top = 186
        Width = 94
        Height = 21
        EditMask = '99.999-999;1;_'
        MaxLength = 10
        TabOrder = 10
        Text = '  .   -   '
      end
      object EdtEndereco: TLabeledEdit
        Left = 12
        Top = 104
        Width = 430
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o'
        MaxLength = 60
        TabOrder = 3
      end
      object EdtBairro: TLabeledEdit
        Left = 461
        Top = 144
        Width = 154
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Bairro'
        MaxLength = 40
        TabOrder = 7
      end
      object EdtCidade: TLabeledEdit
        Left = 12
        Top = 144
        Width = 430
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Cidade'
        MaxLength = 50
        TabOrder = 6
      end
      object EdtTelefone: TMaskEdit
        Left = 460
        Top = 104
        Width = 96
        Height = 21
        EditMask = '(99)9999-9999;1;_'
        MaxLength = 13
        TabOrder = 4
        Text = '(  )    -    '
      end
      object EdtCelular: TMaskEdit
        Left = 572
        Top = 104
        Width = 90
        Height = 21
        EditMask = '(99)99999-9999;1;_'
        MaxLength = 14
        TabOrder = 5
        Text = '(  )     -    '
      end
      object EdtEmail: TLabeledEdit
        Left = 12
        Top = 186
        Width = 430
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'e-mail'
        MaxLength = 100
        TabOrder = 9
      end
      object edtDataNascimento: TDateEdit
        Left = 12
        Top = 232
        Width = 121
        Height = 21
        ClickKey = 114
        DialogTitle = 'Selecione a Data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 11
      end
      object edtEstado: TLabeledEdit
        Left = 621
        Top = 144
        Width = 41
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Estado'
        MaxLength = 2
        TabOrder = 8
        OnExit = edtEstadoExit
      end
      object EdtCPF: TMaskEdit
        Tag = 2
        Left = 461
        Top = 64
        Width = 96
        Height = 21
        MaxLength = 11
        TabOrder = 2
        Text = ''
        TextHint = 'APENAS N'#218'MEROS'
        OnExit = EdtCPFExit
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 364
    Width = 785
    ExplicitTop = 364
    ExplicitWidth = 785
    inherited BtnFechar: TBitBtn
      Left = 688
      ExplicitLeft = 688
    end
    inherited BtnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TFDQuery
    SQL.Strings = (
      
        'SELECT clienteID, nome, CPF, endereco, cidade, bairro, estado, c' +
        'ep, telefone, celular, email, dataNascimento'
      #10'FROM dbedilanteste.clientes;')
    object QryListagemclienteID: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteID'
      Origin = 'clienteID'
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
    object QryListagemendereco: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 60
    end
    object QryListagemcidade: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 50
    end
    object QryListagembairro: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 40
    end
    object QryListagemestado: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estado'
      FieldName = 'estado'
      Origin = 'estado'
      Size = 2
    end
    object QryListagemcep: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Origin = 'cep'
      Size = 10
    end
    object QryListagemtelefone: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 14
    end
    object QryListagemcelular: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Celular'
      FieldName = 'celular'
      Origin = 'celular'
      Size = 15
    end
    object QryListagememail: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Email'
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object QryListagemdataNascimento: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data Nascimento'
      FieldName = 'dataNascimento'
      Origin = 'dataNascimento'
    end
    object QryListagemCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
  end
end

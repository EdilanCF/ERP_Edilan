unit UdtmVenda;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient;

type
  TDtmVenda = class(TDataModule)
    QryCliente: TFDQuery;
    QryClienteclienteID: TFDAutoIncField;
    QryClientenome: TStringField;
    QryProduto: TFDQuery;
    QryProdutoprodutoID: TFDAutoIncField;
    QryProdutonome: TStringField;
    QryProdutovalor: TFMTBCDField;
    QryProdutoquantidade: TFMTBCDField;
    QryProdutounidade: TStringField;
    DtsCliente: TDataSource;
    DtsProduto: TDataSource;
    DtsItensVenda: TDataSource;
    CdsItensvenda: TClientDataSet;
    CdsItensvendaprodutoID: TIntegerField;
    CdsItensvendanomeProduto: TStringField;
    CdsItensvendaquantidade: TFloatField;
    CdsItensvendaValoUnitario: TFloatField;
    CdsItensvendavalorTotalProduto: TFloatField;
    CdsItensvendaunidade: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmVenda: TDtmVenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDM;

{$R *.dfm}

procedure TDtmVenda.DataModuleCreate(Sender: TObject);
begin
CdsItensvenda.CreateDataSet;

QryCliente.Open;
QryProduto.Open;
end;

procedure TDtmVenda.DataModuleDestroy(Sender: TObject);
begin
CdsItensvenda.close;
QryCliente.close;
QryProduto.close;
end;

end.

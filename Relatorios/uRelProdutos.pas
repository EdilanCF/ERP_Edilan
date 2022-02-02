unit uRelProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDM, Datasnap.DBClient, RLReport,
  RLFilters, RLPDFFilter;

type
  TFrmRelProdutos = class(TForm)
    QryProdutos: TFDQuery;
    DtsProdutos: TDataSource;
    QryProdutoscategoriaID: TFDAutoIncField;
    QryProdutosDescricao: TStringField;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RLPDFFilter1: TRLPDFFilter;
    Rodape: TRLBand;
    RLDraw2: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand2: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLPanel2: TRLPanel;
    QryProdutosprodutoId: TFDAutoIncField;
    QryProdutosnome: TStringField;
    QryProdutosvalorCusto: TFMTBCDField;
    QryProdutosvalor: TFMTBCDField;
    QryProdutosquantidade: TFMTBCDField;
    QryProdutosunidade: TStringField;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText5: TRLDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelProdutos: TFrmRelProdutos;

implementation

{$R *.dfm}

procedure TFrmRelProdutos.FormCreate(Sender: TObject);
begin
  Qryprodutos.open;
end;

procedure TFrmRelProdutos.FormDestroy(Sender: TObject);
begin
  Qryprodutos.Close;
end;

end.

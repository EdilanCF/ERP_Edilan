unit uRelProdutosPorCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDM, Datasnap.DBClient, RLReport,
  RLFilters, RLPDFFilter, Vcl.StdCtrls;

type
  TFrmRelProdutosPorCategoria = class(TForm)
    QryProdutosPorCategoria: TFDQuery;
    DtsProdutosPorCategoria: TDataSource;
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
    RLPanel2: TRLPanel;
    QryProdutosPorCategoriaprodutoId: TFDAutoIncField;
    QryProdutosPorCategorianome: TStringField;
    QryProdutosPorCategoriadescricao: TStringField;
    QryProdutosPorCategoriavalorCusto: TFMTBCDField;
    QryProdutosPorCategoriavalor: TFMTBCDField;
    QryProdutosPorCategoriaquantidade: TFMTBCDField;
    QryProdutosPorCategoriacategoriaId: TIntegerField;
    QryProdutosPorCategorianomeCategoria: TStringField;
    BandaDoGrupo: TRLGroup;
    RLBand4: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel10: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLBand5: TRLBand;
    RLDraw3: TRLDraw;
    RLLabel11: TRLLabel;
    ResultEstoque: TRLDBResult;
    QryProdutosPorCategoriaunidade: TStringField;
    LblResultCategoria: TRLLabel;
    RLLabel12: TRLLabel;
    LblResultCusto: TRLLabel;
    ResultCusto: TRLDBResult;
    RLLabel13: TRLLabel;
    LblResultVenda: TRLLabel;
    ResultVenda: TRLDBResult;
    RLDraw4: TRLDraw;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ResultEstoqueCompute(Sender: TObject; var Value: Variant;
      var AText: string; var ComputeIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelProdutosPorCategoria: TFrmRelProdutosPorCategoria;
  vResultEstoque : double;
  vresultCusto   : double;
  vResultVenda   : double;

implementation

{$R *.dfm}

procedure TFrmRelProdutosPorCategoria.FormCreate(Sender: TObject);
begin
  QryProdutosPorCategoria.open;
end;

procedure TFrmRelProdutosPorCategoria.FormDestroy(Sender: TObject);
begin
  QryProdutosPorCategoria.Close;
end;

procedure TFrmRelProdutosPorCategoria.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  LblResultCategoria.Caption := FloatToStrf(vResultEstoque, ffNumber, 12,2);
  vResultEstoque := 0.00;

  LblResultCusto.Caption := FloatToStrf(vresultCusto, ffNumber, 12,2);
  vresultCusto := 0.00;

  LblResultVenda.Caption := FloatToStrf(vResultVenda, ffNumber, 12,2);
  vResultVenda := 0.00;

end;

procedure TFrmRelProdutosPorCategoria.ResultEstoqueCompute(Sender: TObject;
  var Value: Variant; var AText: string; var ComputeIt: Boolean);
begin
  vResultEstoque := (vResultEstoque + ResultEstoque.Field.AsFloat);

  vresultCusto := (vresultCusto + ResultCusto.Field.AsFloat);

  vResultVenda := (vResultVenda + ResultVenda.Field.AsFloat);
end;

end.

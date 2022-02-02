unit uRelVendaPorData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDM, Datasnap.DBClient, RLReport,
  RLFilters, RLPDFFilter, Vcl.StdCtrls;

type
  TFrmRelVendaPorData = class(TForm)
    QryVendaPorData: TFDQuery;
    DtsVendaPorData: TDataSource;
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
    BandaDoGrupo: TRLGroup;
    RLBand4: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel8: TRLLabel;
    RLBand5: TRLBand;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    QryVendaPorDatavendaID: TFDAutoIncField;
    QryVendaPorDataclienteID: TIntegerField;
    QryVendaPorDatanome: TStringField;
    QryVendaPorDatadatavenda: TDateTimeField;
    QryVendaPorDatatotalVenda: TFMTBCDField;
    RLDBResult1: TRLDBResult;
    RLLabel6: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText3: TRLDBText;
    RLBand6: TRLBand;
    RLLabel9: TRLLabel;
    RLDBResult2: TRLDBResult;
    procedure FormDestroy(Sender: TObject);

  private

  published
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmRelVendaPorData: TFrmRelVendaPorData;


implementation

{$R *.dfm}

uses uSelecionarData;

{ TFrmRelVendaPorData }

procedure TFrmRelVendaPorData.FormDestroy(Sender: TObject);
begin
 QryVendaPorData.close;
end;

end.

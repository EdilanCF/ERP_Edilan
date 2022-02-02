unit uRelCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDM, Datasnap.DBClient, RLReport,
  RLFilters, RLPDFFilter;

type
  TFrmRelCliente = class(TForm)
    QryClientes: TFDQuery;
    DtsClientes: TDataSource;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
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
    RLPanel2: TRLPanel;
    RLDBText1: TRLDBText;
    QryClientesclienteID: TFDAutoIncField;
    QryClientesnome: TStringField;
    QryClientescidade: TStringField;
    QryClientesestado: TStringField;
    QryClientescelular: TStringField;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCliente: TFrmRelCliente;

implementation

{$R *.dfm}

procedure TFrmRelCliente.FormCreate(Sender: TObject);
begin
  QryClientes.open;
end;

procedure TFrmRelCliente.FormDestroy(Sender: TObject);
begin
  QryClientes.Close;
end;

end.

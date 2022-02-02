unit uRelClienteFicha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDM, Datasnap.DBClient, RLReport,
  RLFilters, RLPDFFilter;

type
  TFrmRelClienteFicha = class(TForm)
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
    RLPanel2: TRLPanel;
    QryClientesclienteID: TFDAutoIncField;
    QryClientesnome: TStringField;
    QryClientescidade: TStringField;
    QryClientesestado: TStringField;
    QryClientescelular: TStringField;
    QryClientesCPF: TStringField;
    QryClientesendereco: TStringField;
    QryClientesbairro: TStringField;
    QryClientescep: TStringField;
    QryClientestelefone: TStringField;
    QryClientesemail: TStringField;
    QryClientesdataNascimento: TDateField;
    RLBand4: TRLBand;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText4: TRLDBText;
    RLLabel12: TRLLabel;
    RLAngleLabel1: TRLAngleLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelClienteFicha: TFrmRelClienteFicha;

implementation

{$R *.dfm}

procedure TFrmRelClienteFicha.FormCreate(Sender: TObject);
begin
  QryClientes.open;
end;

procedure TFrmRelClienteFicha.FormDestroy(Sender: TObject);
begin
  QryClientes.Close;
end;

end.

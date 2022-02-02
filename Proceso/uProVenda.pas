unit uProVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaHeranca, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.ComCtrls, uDM, UdtmVenda, RxToolEdit, RxCurrEdit,
  Vcl.WinXCtrls, uEnum, cProVenda, Vcl.OleServer, Vcl.CmAdmCtl;

type
  TFrmProVenda = class(TFrmTelaHeranca)
    QryListagemvendaID: TFDAutoIncField;
    QryListagemclienteID: TIntegerField;
    QryListagemdatavenda: TDateTimeField;
    QryListagemtotalVenda: TFMTBCDField;
    QryListagemnome: TStringField;
    EdtVendaId: TLabeledEdit;
    Label4: TLabel;
    LkpCliente: TDBLookupComboBox;
    edtDataVenda: TDateEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    EdtValorTotal: TCurrencyEdit;
    Label2: TLabel;
    DBGridItensVenda: TDBGrid;
    Label3: TLabel;
    LkpProduto: TDBLookupComboBox;
    EdtValorProduto: TCurrencyEdit;
    Label5: TLabel;
    EdtQuantidade: TCurrencyEdit;
    EdtTotalProduto: TCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    BtnAdicionarIten: TBitBtn;
    BtnApagarIten: TBitBtn;
    EdtUnidade: TEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridItensVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnAdicionarItenClick(Sender: TObject);
    procedure LkpProdutoExit(Sender: TObject);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure EdtQuantidadeEnter(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnApagarClick(Sender: TObject);
    procedure BtnApagarItenClick(Sender: TObject);
    procedure DBGridItensVendaDblClick(Sender: TObject);
  private
    { Private declarations }
    DtmVenda: TdtmVenda;
    oVenda: Tvenda;
    function gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean; override;
    function apagar: Boolean; override;
    function TotalizaProduto(valorUnitario, quantidade: double): double;
    procedure limpaComponenteItem;
    procedure limpaCds;
    procedure CarregarRegistroSelecionado;
    function TotalizaVenda: double;

  public
    { Public declarations }
  end;

var
  FrmProVenda: TFrmProVenda;

implementation

{$R *.dfm}
{$REGION 'Override'}

function TFrmProVenda.apagar: Boolean;
begin
  if oVenda.Selecionar(QryListagem.FieldByName('vendaID').AsInteger, DtmVenda.CdsItensvenda) then
    result := oVenda.apagar;
end;

function TFrmProVenda.gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if EdtVendaId.text <> '' then
    oVenda.VendaID := strtoint(EdtVendaId.text)
  else
    oVenda.VendaID := 0;

  oVenda.ClienteID := LkpCliente.KeyValue;
  oVenda.DataVenda := edtDataVenda.Date;
  oVenda.TotalVenda := EdtValorTotal.Value;

  if (EstadoDoCadastro = ecinserir) then
    result := oVenda.inserir(DtmVenda.CdsItensvenda)
  else if (EstadoDoCadastro = ecalterar) then
    result := oVenda.Atualizar(DtmVenda.CdsItensvenda);
end;

procedure TFrmProVenda.LkpProdutoExit(Sender: TObject);
begin
  inherited;
  if TDBLookupComboBox(sender).KeyValue <> null then
    begin
    EdtValorProduto.Value:=Dtmvenda.QryProduto.FieldByName('valor').AsFloat;
    EdtQuantidade.Value := 1;
    EdtTotalProduto.Value:=TotalizaProduto(EdtValorProduto.Value, EdtQuantidade.value);
    EdtUnidade.text:=DtmVenda.QryProduto.FieldByName('unidade').AsString;
    end;
end;

{$ENDREGION}

procedure TFrmProVenda.BtnAdicionarItenClick(Sender: TObject);
begin
  inherited;
  if LkpProduto.KeyValue = null then
  begin
    MessageDlg('Produto é um campo Obrigatório.', mtInformation, [mbOK], 0);
    LkpProduto.SetFocus;
    abort;
  end;

  if EdtValorProduto.Value <= 0 then
  begin
    MessageDlg('valor do produto não pode ser zero', mtInformation, [mbok], 0);
    EdtValorProduto.SetFocus;
    abort;
  end;

  if EdtQuantidade.Value <=0 then
  begin
    MessageDlg('Quantidade não pode ser zero',mtInformation, [mbok], 0);
    EdtQuantidade.SetFocus;
    abort;
  end;

  if dtmVenda.CdsItensvenda.Locate('produtoID',LkpProduto.KeyValue, []) then
  begin
    MessageDlg('Esse produto já foi selecionado', mtInformation, [mbok], 0);
    LkpProduto.SetFocus;
    abort;
  end;

  EdtTotalProduto.Value:=TotalizaProduto(EdtValorProduto.Value, EdtQuantidade.value);

  Dtmvenda.CdsItensvenda.Append;
  Dtmvenda.CdsItensvenda.FieldByName('produtoID').AsInteger:=LkpProduto.KeyValue;
  Dtmvenda.CdsItensvenda.FieldByName('nomeProduto').AsString:=Dtmvenda.QryProduto.FieldByName('nome').AsString;
  Dtmvenda.CdsItensvenda.FieldByName('quantidade').asfloat:=EdtQuantidade.Value;
  Dtmvenda.CdsItensvenda.FieldByName('unidade').AsString:=EdtUnidade.Text;
  Dtmvenda.CdsItensvenda.FieldByName('valorUnitario').AsFloat:=EdtValorProduto.Value;
  Dtmvenda.CdsItensvenda.FieldByName('valorTotalProduto').AsFloat:=EdtTotalProduto.Value;
  Dtmvenda.CdsItensvenda.post;
  EdtValorTotal.Value := TotalizaVenda;
  limpaComponenteItem;

  LkpProduto.SetFocus;

end;

procedure TFrmProVenda.limpaComponenteItem;
begin
  LkpProduto.KeyValue:=null;
  EdtQuantidade.Value:=0;
  EdtUnidade.Text:='';
  EdtValorProduto.Value:=0;
  EdtTotalProduto.Value:=0;
end;

function TFrmProVenda.TotalizaProduto(valorUnitario, quantidade: double):Double;
begin
 result := valorUnitario*quantidade;
end;

procedure TFrmProVenda.limpaCds;
begin
  DtmVenda.CdsItensvenda.first;
  while not dtmvenda.CdsItensvenda.Eof do
  dtmvenda.CdsItensvenda.Delete;
end;

procedure TFrmProVenda.BtnAlterarClick(Sender: TObject);
begin
  if oVenda.Selecionar(QryListagem.FieldByName('vendaID').AsInteger, DtmVenda.CdsItensvenda) then
  begin
    EdtVendaId.text := IntToStr(oVenda.VendaID);
    LkpCliente.KeyValue := oVenda.ClienteID;
    edtDataVenda.Date := oVenda.DataVenda;
    EdtValorTotal.Value := oVenda.TotalVenda;
  end
  else
  begin
    btncancelar.Click;
    abort;
  end;

  inherited;
end;

procedure TFrmProVenda.BtnApagarClick(Sender: TObject);
begin
  inherited;
  limpaCds;
end;

procedure TFrmProVenda.BtnApagarItenClick(Sender: TObject);
begin
  inherited;
  if LkpProduto.KeyValue=null then
  begin
    MessageDlg('Selecione o produto a ser Excluido', mtInformation, [mbok], 0);
    DBGridItensVenda.SetFocus;
    abort;
  end;

  if DtmVenda.CdsItensvenda.locate('produtoID', LkpProduto.KeyValue,[]) then
  begin
    DtmVenda.CdsItensvenda.Delete;
    EdtValorTotal.Value := TotalizaVenda;
    limpaComponenteItem;
  end;
end;

procedure TFrmProVenda.BtnGravarClick(Sender: TObject);
begin
  inherited;
  limpaCds;
end;

procedure TFrmProVenda.BtnNovoClick(Sender: TObject);
begin
  inherited;
  limpaCds;
  edtDataVenda.Date := Date;
  LkpCliente.SetFocus;
end;

procedure TFrmProVenda.DBGridItensVendaDblClick(Sender: TObject);
begin
  inherited;
  CarregarRegistroSelecionado;
  BtnApagarIten.SetFocus;
end;

procedure TFrmProVenda.DBGridItensVendaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BloqueiaCTRL_DEL_DbGrid(Key, Shift);
end;

procedure TFrmProVenda.EdtQuantidadeEnter(Sender: TObject);
begin
  inherited;
  EdtTotalProduto.Value:=TotalizaProduto(EdtValorProduto.Value, EdtQuantidade.value);
end;

procedure TFrmProVenda.EdtQuantidadeExit(Sender: TObject);
begin
  inherited;
  EdtTotalProduto.Value:=TotalizaProduto(EdtValorProduto.Value, EdtQuantidade.value);
end;

procedure TFrmProVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(Dtmvenda) then
    FreeAndNil(Dtmvenda);

  if Assigned(oVenda) then
    FreeAndNil(oVenda);
end;

procedure TFrmProVenda.FormCreate(Sender: TObject);
begin
  inherited;
  Dtmvenda := Tdtmvenda.Create(self);

  oVenda := Tvenda.Create(dtmConexao.conexaoDB);
  IndiceAtual := 'clienteID';
end;

procedure TFrmProVenda.CarregarRegistroSelecionado;
begin
  LkpProduto.KeyValue   :=DtmVenda.CdsItensvenda.FieldByName('produtoID').asstring;
  EdtValorProduto.Value :=DtmVenda.CdsItensvenda.FieldByName('valorUnitario').AsFloat;
  edtQuantidade.Value   :=DtmVenda.CdsItensvenda.FieldByName('quantidade').AsFloat;
  EdtUnidade.Text       :=DtmVenda.CdsItensvenda.FieldByName('unidade').AsString;
  EdtTotalProduto.Value :=DtmVenda.CdsItensvenda.FieldByName('valorTotalProduto').AsFloat;
end;

function TFrmProVenda.TotalizaVenda:double;
begin
  Result := 0;
  DtmVenda.CdsItensvenda.First;
   while not DtmVenda.CdsItensvenda.Eof do
    begin
    Result := Result + DtmVenda.CdsItensvenda.FieldByName('valorTotalProduto').AsFloat;
    DtmVenda.CdsItensvenda.next;
    end;
end;


end.

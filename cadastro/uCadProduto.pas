unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaHeranca, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.ComCtrls, RxToolEdit, RxCurrEdit, uEnum, uDM, cCadProduto,
  UCadCategoria, Vcl.WinXCtrls;

type
  TFrmCadProduto = class(TFrmTelaHeranca)
    QryListagemprodutoId: TFDAutoIncField;
    QryListagemnome: TStringField;
    QryListagemdescricao: TStringField;
    QryListagemvalor: TFMTBCDField;
    QryListagemquantidade: TFMTBCDField;
    QryListagemcategoriaId: TIntegerField;
    QryListagemDescricaoCategoria: TStringField;
    EdtNome: TLabeledEdit;
    edtProdutoID: TLabeledEdit;
    EdtDescricao: TMemo;
    Label1: TLabel;
    EdtValor: TCurrencyEdit;
    EdtQuantidade: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    LkpCategoria: TDBLookupComboBox;
    DtsCategoria: TDataSource;
    QryCategoria: TFDQuery;
    QryCategoriacategoriaID: TFDAutoIncField;
    QryCategoriaDescricao: TStringField;
    Label4: TLabel;
    BtnCadCaegoria: TBitBtn;
    EdtUnidade: TEdit;
    Label5: TLabel;
    QryListagemunidade: TStringField;
    EdtValorCusto: TCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdtTxMarcacao: TCurrencyEdit;
    QryListagemvalorCusto: TFMTBCDField;
    CheckBox1: TCheckBox;
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnCadCaegoriaClick(Sender: TObject);
    procedure BtnCadCaegoriaExit(Sender: TObject);
    procedure EdtValorChange(Sender: TObject);
    procedure EdtValorCustoExit(Sender: TObject);
    procedure EdtTxMarcacaoExit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
     oProduto:Tproduto;
    function Apagar: boolean; override;
    function Gravar(estadodocadastro: TEstadodocadastro): boolean; override;
    procedure CalculaTxMarcacao;
    procedure CalculaPrecoVenda;
    procedure ExibirValorCusto;
    public
    { Public declarations }
  end;

var
  FrmCadProduto: TFrmCadProduto;

implementation

{$R *.dfm}

{ TFrmCadProduto }
 {$region 'override'}
function TFrmCadProduto.Apagar: boolean;
begin
  if oProduto.selecionar(QryListagem.fieldbyname('produtoID').asinteger) then
  begin
    result:=oproduto.Apagar;
  end;
end;

function TFrmCadProduto.Gravar(estadodocadastro: TEstadodocadastro): boolean;
begin

  if EdtProdutoId.Text <> emptystr then
    oProduto.codigo:=StrToInt(edtProdutoid.text)
  else
      oProduto.codigo := 0;

      oProduto.nome        := edtnome.Text;
      oProduto.descricao   := edtdescricao.text;
      oProduto.categoriaID := LkpCategoria.KeyValue;
      oProduto.valorCusto  := EdtValorCusto.value;
      oProduto.valor       := edtValor.Value;
      oProduto.quantidade  := edtquantidade.Value;
      oProduto.unidade     := EdtUnidade.Text;

  if (estadodocadastro = ecinserir) then
    result := oProduto.inserir
  else if (estadodocadastro = ecalterar) then
    result := oProduto.Atualizar;

end;

{$endregion}

procedure TFrmCadProduto.BtnAlterarClick(Sender: TObject);
begin
  if oProduto.selecionar(QryListagem.fieldbyname('produtoID').asinteger) then
  Begin
    edtProdutoID.Text := IntToStr(oProduto.codigo);
    EdtNome.Text := oProduto.nome;
    EdtDescricao.Text := oProduto.descricao;
    LkpCategoria.KeyValue := oProduto.categoriaID;
    EdtValorCusto.Value := oProduto.valorCusto;
    EdtValor.Value := oProduto.valor;
    EdtQuantidade.Value := oProduto.quantidade;
    EdtUnidade.Text := oProduto.unidade
  End
  else
  begin
    btnCancelar.Click;
    abort;
  end;

  inherited;
end;

procedure TFrmCadProduto.CheckBox1Click(Sender: TObject);
begin
  inherited;
  ExibirValorCusto;
end;

procedure TFrmCadProduto.BtnCadCaegoriaClick(Sender: TObject);
begin
  inherited;
  FrmCadCategoria := tFrmCadCategoria.create(self);
  FrmCadCategoria.ShowModal;
  FrmCadCategoria.Release;


end;

procedure TFrmCadProduto.BtnCadCaegoriaExit(Sender: TObject);
begin
  QryCategoria.Refresh;
  inherited;
end;

procedure TFrmCadProduto.BtnNovoClick(Sender: TObject);
begin
  inherited;
  edtnome.SetFocus;
  
   if EdtValor.Value = 0 then
    EdtValor.Value := 0.01;
    
   if EdtValorCusto.Value = 0 then
    EdtValorCusto.value := 0.01;
   
end;

procedure TFrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  QryCategoria.Close;
  if assigned(oproduto) then
  freeandnil(oproduto);
end;

procedure TFrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  Oproduto:=Tproduto.create(dtmConexao.conexaoDB);

  IndiceAtual:='nome';
  QryCategoria.open;

  ExibirValorCusto;

end;


procedure TFrmCadProduto.EdtTxMarcacaoExit(Sender: TObject);
begin
  inherited;
  CalculaPrecoVenda;
end;

procedure TFrmCadProduto.EdtValorChange(Sender: TObject);
begin
  inherited;
    
   CalculaTxMarcacao;
end;

procedure TFrmCadProduto.EdtValorCustoExit(Sender: TObject);
begin
  inherited;
  CalculaTxMarcacao
end;

procedure TFrmCadProduto.CalculaTxMarcacao;
var vTxMarcacao:double;
begin
  if EdtValorCusto.Value <> 0 then
   begin
    vTxMarcacao := 0;
    vTxMarcacao:= ((EdtValor.Value / EdtValorCusto.Value ) - 1) * 100;
    EdtTxMarcacao.value := vTxMarcacao
   end;
end;


procedure TFrmCadProduto.CalculaPrecoVenda;
var vPrecoVenda : double;
begin
if EdtTxMarcacao.value <> 0 then
       vPrecoVenda :=EdtValorCusto.Value + ((EdtValorCusto.Value)*(EdtTxMarcacao.value / 100));
       EdtValor.Value := vPrecoVenda;
end;

procedure TFrmCadProduto.ExibirValorCusto;
begin
  if CheckBox1.Checked then
   begin
    grdListagem.Columns[2].Visible := true;
   
  end

  else
  begin
    grdListagem.Columns[2].Visible := false;
   
  end;

end;

end.

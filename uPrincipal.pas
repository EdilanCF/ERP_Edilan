unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, Enter, uCadProduto,
  Vcl.Imaging.jpeg, uFrmAtualizaDB, UdtmVenda, uProVenda, Vcl.StdActns;

type
    TfrmPrincipal = class(TForm)
    ActionList1: TActionList;
    MainPrincipal: TMainMenu;
    CADASTRO1: TMenuItem;
    CADASTRO2: TMenuItem;
    RELATRIOS1: TMenuItem;
    CLIENTE1: TMenuItem;
    CLIENTE2: TMenuItem;
    CATEGIRIAS1: TMenuItem;
    CATEGIRIAS2: TMenuItem;
    PRODUTO1: TMenuItem;
    PRODUTO2: TMenuItem;
    MenuFechar: TMenuItem;
    VENDAS1: TMenuItem;
    CLIENTE3: TMenuItem;
    CLIENTE4: TMenuItem;
    PRODUTO3: TMenuItem;
    PRODUTO4: TMenuItem;
    VENDA1: TMenuItem;
    BtnFechar: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    BtnCadCliente: TButton;
    BtnCadFornecedor: TButton;
    BtnCadProduto: TButton;
    BtnVenda: TButton;
    Image1: TImage;
    Label1: TLabel;
    PnlCentral: TPanel;
    Timer1: TTimer;
    pnlTime: TPanel;
    DialogFontEdit1: TFontEdit;
    N1: TMenuItem;
    CATEGORIAS1: TMenuItem;
    ListadeClientes1: TMenuItem;
    FichadeClientes1: TMenuItem;
    LIstadeProdutos1: TMenuItem;
    ProduosporCategoria1: TMenuItem;
    procedure MenuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CATEGIRIAS1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnCadFornecedorClick(Sender: TObject);
    procedure BtnCadClienteClick(Sender: TObject);
    procedure CLIENTE1Click(Sender: TObject);
    procedure BtnCadProdutoClick(Sender: TObject);
    procedure PRODUTO1Click(Sender: TObject);
    procedure VENDAS1Click(Sender: TObject);
    procedure BtnVendaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CATEGORIAS1Click(Sender: TObject);
    procedure ListadeClientes1Click(Sender: TObject);
    procedure FichadeClientes1Click(Sender: TObject);
    procedure LIstadeProdutos1Click(Sender: TObject);
    procedure ProduosporCategoria1Click(Sender: TObject);
    procedure VENDA1Click(Sender: TObject);

  private
    { Private declarations }
    TeclaEnter: TMREnter;
    procedure AbrirCategoria;
    procedure AbrirCliente;
    procedure AbrirProduto;
    procedure atualizacaoBancoDados(aform: TFrmAtualizaDB);
    procedure abrirvenda;
    procedure ConfirmaFechar;


  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UCadCategoria, uDM, uCadCliente, uRelCategoria, uRelCliente, uRelClienteFicha,
  uRelProdutos, uRelProdutosPorCategoria, uSelecionarData, uRelVendaPorData;

procedure TfrmPrincipal.atualizacaoBancoDados(aform:TFrmAtualizaDB);
begin
  aForm.ChkConexao.Checked:=true;
  aform.Refresh;
  sleep(100);

  dtmConexao.QryScriptCategorias.ExecSQL;
  aform.ChkCategorias.Checked:=true;
  aform.Refresh;
  sleep(100);

  dtmConexao.QryScriptProdutos.ExecSQL;
  aform.ChkProdutos.Checked:=true;
  aform.Refresh;
  sleep(100);

  dtmConexao.QryScriptClientes.ExecSQL;
  aform.ChkClientes.Checked:=true;
  aform.Refresh;
  sleep(100);

  dtmConexao.QryScriptVendas.ExecSQL;
  aform.Chkvendas.Checked:=true;
  aform.Refresh;
  sleep(100);

  dtmConexao.QryScriptItensVendas.ExecSQL;
  aform.ChkItensVendas.Checked:=true;
  aform.Refresh;
  sleep(100);
end;

{$REGION 'Query tempo de execução feita pelo Cleber'}
{ var
  qryTemp: TFDQuery;
  I: Integer;
  Retorno: TStringList;
  begin
  qryTemp := TFDQuery.Create(Nil);
  Retorno := TStringList.Create;
  qryTemp.Connection := udm.dtmconexao.conexaodb;

  qryTemp.SQL.Add('SELECT * FROM tabelacriacaoteste');
  qryTemp.Open;
  qryTemp.First;

  while not qryTemp.Eof do
  begin

  Retorno.Add(qryTemp.FieldByName('NOME').AsString);
  // ShowMessage(qryTemp.FieldByName('NOME').AsString);

  qryTemp.Next;
  end;

  ShowMessage(Retorno.Text);

  qryTemp.Free;
  Retorno.Free;

  end; }
{$ENDREGION}

{$region 'Procedures Atalho botão'}

procedure tfrmprincipal.AbrirProduto;
begin
  FrmCadProduto := TFrmCadProduto.Create(self);
  FrmCadProduto.ShowModal;
  FrmCadProduto.Release
end;


procedure TfrmPrincipal.AbrirCliente;
begin
  frmCadCliente := TfrmCadCliente.Create(self);
  frmCadCliente.ShowModal;
  frmCadCliente.Release
end;

procedure TfrmPrincipal.AbrirCategoria;
begin
  FrmCadCategoria := tFrmCadCategoria.create(self);
  FrmCadCategoria.ShowModal;
  FrmCadCategoria.Release;
end;

procedure TfrmPrincipal.abrirvenda;
begin
 FrmProVenda := TFrmProVenda.create(self);
 FrmProVenda.ShowModal;
 FrmProVenda.release
end;

procedure TfrmPrincipal.ConfirmaFechar;
var Retorno: Integer;
begin
  Retorno := MessageDlg('Deseja fechar a Aplicação?', mtWarning,
    [mbno, mbYes], 0);
  if Retorno = 6 then
    Application.Terminate;
end;
{$endregion}

{$region 'Botão Click'}

 procedure TfrmPrincipal.BtnCadClienteClick(Sender: TObject);
begin
  AbrirCliente;
end;

procedure TfrmPrincipal.BtnCadFornecedorClick(Sender: TObject);
begin
  AbrirCategoria;
end;

procedure TfrmPrincipal.BtnCadProdutoClick(Sender: TObject);
begin
  AbrirProduto;
end;

procedure TfrmPrincipal.BtnVendaClick(Sender: TObject);
begin
  abrirvenda;
end;

procedure TfrmPrincipal.CATEGIRIAS1Click(Sender: TObject);
begin
  AbrirCategoria;
end;

procedure TfrmPrincipal.CATEGORIAS1Click(Sender: TObject);
begin
  FrmRelCategoria := TFrmRelCategoria.create(self);
  FrmRelCategoria.RLReport1.previewModal;
  FrmRelCategoria.Release;
end;

procedure TfrmPrincipal.CLIENTE1Click(Sender: TObject);
begin
  AbrirCliente;
end;

procedure TfrmPrincipal.ProduosporCategoria1Click(Sender: TObject);
begin
  FrmRelProdutosporcategoria := TFrmRelProdutosporcategoria.Create(self);
  FrmRelProdutosporcategoria.RLReport1.PreviewModal;
  FrmRelProdutosporcategoria.Release;
end;

procedure TfrmPrincipal.PRODUTO1Click(Sender: TObject);
begin
  AbrirProduto;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);

begin
  pnlTime.Caption := DatetimeToStr(now);
end;

procedure TfrmPrincipal.VENDA1Click(Sender: TObject);
begin
  try
    FrmSelecionarData := TFrmSelecionarData.create(Self);
    FrmSelecionarData.showModal;

    FrmRelVendaPorData := TFrmRelVendaPorData.Create(self);
    FrmRelVendaPorData.QryVendaPorData.Close;
    FrmRelVendaPorData.QryVendaPorData.ParamByName('DataInicio').AsDate := FrmSelecionarData.edtDataInicial.Date;
    FrmRelVendaPorData.QryVendaPorData.ParamByName('DataFim').AsDate := FrmSelecionarData.EdtDataFinal.Date;
    FrmRelVendaPorData.QryVendaPorData.Open;
    FrmRelVendaPorData.RLReport1.PreviewModal;

  finally
    FrmSelecionarData.Release;
    FrmRelVendaPorData.Release;
  end;
end;

procedure TfrmPrincipal.VENDAS1Click(Sender: TObject);
begin
  abrirvenda;
end;

procedure TfrmPrincipal.MenuFecharClick(Sender: TObject);
begin
  ConfirmaFechar
end;

procedure TfrmPrincipal.BtnFecharClick(Sender: TObject);
begin
  ConfirmaFechar
end;

{$endregion}

{$region 'Create And Close'}

 procedure TfrmPrincipal.FichadeClientes1Click(Sender: TObject);
begin
  FrmRelClienteFicha := TFrmRelClienteFicha.Create(self);
  FrmRelClienteFicha.RLReport1.PreviewModal;
  FrmRelCliente.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
  FreeAndNil(dtmconexao);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  begin
    FrmAtualizaDB := TFrmAtualizaDB.create(self);
    FrmAtualizaDB.show;
    FrmAtualizaDB.refresh;

    dtmconexao := TdtmConexao.create(self);
    dtmconexao.conexaodb.Connected := true
  end;
  atualizacaoBancoDados(frmAtualizadb);
  FrmAtualizaDB.Free;

  TeclaEnter := TMREnter.create(self);
  TeclaEnter.FocusEnabled := true;
  TeclaEnter.FocusColor := clWebKhaki;
end;
procedure TfrmPrincipal.ListadeClientes1Click(Sender: TObject);
begin
  FrmRelCliente := TFrmRelCliente.Create(self);
  FrmRelCliente.RLReport1.PreviewModal;
  FrmRelCliente.Release;
end;

procedure TfrmPrincipal.LIstadeProdutos1Click(Sender: TObject);
begin
  FrmRelProdutos := TFrmRelProdutos.Create(self);
  FrmRelProdutos.RLReport1.PreviewModal;
  FrmRelProdutos.Release;
end;

{$endregion}

end.

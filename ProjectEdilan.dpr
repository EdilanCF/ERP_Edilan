program ProjectEdilan;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDM in 'DataModule\uDM.pas' {dtmConexao: TDataModule},
  UtelaHeranca in 'heranca\UtelaHeranca.pas' {FrmTelaHeranca},
  UCadCategoria in 'cadastro\UCadCategoria.pas' {FrmCadCategoria},
  Enter in 'terceiros\Enter.pas',
  uEnum in 'heranca\uEnum.pas',
  cCadCategoria in 'Classes\cCadCategoria.pas',
  uCadCliente in 'cadastro\uCadCliente.pas' {frmCadCliente},
  cCadCliente in 'Classes\cCadCliente.pas',
  uValidaCPF in 'cadastro\uValidaCPF.pas',
  uCadProduto in 'cadastro\uCadProduto.pas' {FrmCadProduto},
  cCadProduto in 'Classes\cCadProduto.pas',
  uFrmAtualizaDB in 'DataModule\uFrmAtualizaDB.pas' {FrmAtualizaDB},
  UdtmVenda in 'DataModule\UdtmVenda.pas' {DtmVenda: TDataModule},
  uProVenda in 'Proceso\uProVenda.pas' {FrmProVenda},
  Vcl.Themes,
  Vcl.Styles,
  cProVenda in 'Classes\cProVenda.pas',
  cControleEstoque in 'Classes\cControleEstoque.pas',
  uRelClienteFicha in 'Relatorios\uRelClienteFicha.pas' {FrmRelClienteFicha},
  uRelVendaPorData in 'Relatorios\uRelVendaPorData.pas' {FrmRelVendaPorData},
  uRelCliente in 'Relatorios\uRelCliente.pas' {FrmRelCliente},
  uRelProdutos in 'Relatorios\uRelProdutos.pas' {FrmRelProdutos},
  uSelecionarData in 'Relatorios\uSelecionarData.pas' {FrmSelecionarData},
  uRelCategoria in 'Relatorios\uRelCategoria.pas' {FrmRelCategoria},
  uRelProdutosPorCategoria in 'Relatorios\uRelProdutosPorCategoria.pas' {FrmRelProdutosPorCategoria};

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := true;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.

unit UtelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uDM, uEnum, RxToolEdit, RxCurrEdit;

type
  TFrmTelaHeranca = class(TForm)
    PgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    TabListagem: TTabSheet;
    Tabmanutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    MskPesquisar: TMaskEdit;
    grdListagem: TDBGrid;
    BtnNovo: TBitBtn;
    BtnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    BtnGravar: TBitBtn;
    BtnApagar: TBitBtn;
    BtnFechar: TBitBtn;
    BtnNavigator: TDBNavigator;
    QryListagem: TFDQuery;
    DtsListagem: TDataSource;
    LblIndice: TLabel;
    BtnPesquisar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnApagarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure MskPesquisarChange(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
    procedure grdListagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private

    { Private declarations }

    procedure controlarBotoes(BtnNovo, BtnAlterar, btnCancelar, BtnGravar,
      BtnFechar: TBitBtn; navegador: TDBNavigator; PgcPrincipal: TPageControl;
      flag: boolean);
    procedure ControlarIndiceTab(PgcPrincipal: TPageControl; indice: integer);
    function retornarCampoTraduzido(campo: string): string;
    procedure exibirlabelindice(campo: string; alabel: TLabel);
    function ExisteCampoObrigatrio: boolean;
    procedure DesabilitarEditPK;
    procedure LimparEdt;

  public
    { Public declarations }
    estadodocadastro: TEstadodocadastro;
    IndiceAtual: string;
    function Apagar: boolean; virtual;
    function Gravar(estadodocadastro: TEstadodocadastro): boolean; virtual;
    procedure BloqueiaCTRL_DEL_DbGrid(var key: word; shift: TShiftState);
  end;

var
  FrmTelaHeranca: TFrmTelaHeranca;

implementation

{$R *.dfm}
{$REGION 'OBSERVAÇÕES'}
// tag:1 REFERENTE A CHAVE PRIMARIA - PK
// TAG:2 REFERENTE A COMPOS OBRIGATIRIOS
{$ENDREGION}
{$REGION 'FUNÇOES E PROCEDURES'}

procedure TFrmTelaHeranca.ControlarIndiceTab(PgcPrincipal: TPageControl;
  indice: integer);
begin
  if (PgcPrincipal.pages[indice].TabVisible) then
    PgcPrincipal.TabIndex := indice;

end;

function TFrmTelaHeranca.retornarCampoTraduzido(campo: string): string;
var
  i: integer;
begin
  for i := 0 to QryListagem.Fields.Count - 1 do
  begin
    if LowerCase(QryListagem.Fields[i].fieldname) = LowerCase(campo) then
    begin
      result := QryListagem.Fields[i].DisplayLabel;
      Break;
    end;

  end;

end;

procedure TFrmTelaHeranca.exibirlabelindice(campo: string; alabel: TLabel);
begin
  alabel.Caption := retornarCampoTraduzido(campo);
end;

function TFrmTelaHeranca.ExisteCampoObrigatrio: boolean;
var
  i: integer;
begin
  result := false;
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TLabeledEdit) then
    begin
      if (TLabeledEdit(Components[i]).Tag = 2) and
        (TLabeledEdit(Components[i]).Text = EmptyStr) then
      begin
        MessageDlg(TLabeledEdit(Components[i]).EditLabel.Caption +
          ' é um campo Obrigatório', mtInformation, [mbOK], 0);
        TLabeledEdit(Components[i]).SetFocus;
        result := true;
        Break;
      end;

    end
    else if (Components[i] is TMaskEdit) then
    begin
      if (TMaskEdit(Components[i]).Tag = 2) and
        (TMaskEdit(Components[i]).Text = EmptyStr) then
         begin
        MessageDlg('Campo Obrigatório', mtInformation, [mbOK], 0);
        TMaskEdit(Components[i]).SetFocus;
        result := true;
        Break;
      end;
    end
    else if (components[i] is TDBLookupComboBox) then
       begin
      if (TDBLookupComboBox(Components[i]).Tag = 2) and
        (TDBLookupComboBox(Components[i]).keyValue = null) then
         begin
        MessageDlg('Campo Obrigatório', mtInformation, [mbOK], 0);
        TDBLookupComboBox(Components[i]).SetFocus;
        result := true;
        Break;
      end;
    end

  end;


end;

procedure TFrmTelaHeranca.DesabilitarEditPK;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TLabeledEdit) then
    begin
      if (TLabeledEdit(Components[i]).Tag = 1) then
      begin
        TLabeledEdit(Components[i]).Enabled := false;
        Break;
      end;
    end;
  end;
end;

procedure TFrmTelaHeranca.LimparEdt;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TLabeledEdit) then
      TLabeledEdit(Components[i]).Text := EmptyStr
    else if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := ''
    else if (components[i] is TMaskEdit) then
     TMaskEdit(Components[i]).Text:= EmptyStr
    else if (components[i] is TDBLookupComboBox) then
      TDBLookupComboBox(Components[i]).KeyValue:= null
    else if (components[i] is TMemo) then
      TMemo(Components[i]).Text:= EmptyStr
    else if (components[i] is TCurrencyEdit) then
      TCurrencyEdit(Components[i]).value:= 0
    else if (components[i] is TDateEdit) then
      TDateEdit(Components[i]).date:= 0;

  end;
end;

{$ENDREGION}
{$REGION 'Métodos  Virtuais'}

function TFrmTelaHeranca.Apagar: boolean;
begin
  ShowMessage('DELETADO');
  result := true;
end;

function TFrmTelaHeranca.Gravar(estadodocadastro: TEstadodocadastro): boolean;
begin
  if (estadodocadastro = ecinserir) then
    ShowMessage('Dado Inserido')
  else if (estadodocadastro = ecAlterar) then
    ShowMessage('alterado');
  result := true
end;

{$ENDREGION}

procedure TFrmTelaHeranca.controlarBotoes(BtnNovo, BtnAlterar, btnCancelar,
  BtnGravar, BtnFechar: TBitBtn; navegador: TDBNavigator;
  PgcPrincipal: TPageControl; flag: boolean);
begin
  BtnNovo.Enabled := flag;
  BtnApagar.Enabled := flag;
  BtnAlterar.Enabled := flag;
  navegador.Enabled := flag;
  PgcPrincipal.pages[0].TabVisible := flag;
  btnCancelar.Enabled := not(flag);
  BtnGravar.Enabled := not(flag);

end;

procedure TFrmTelaHeranca.BtnNovoClick(Sender: TObject);
begin
  controlarBotoes(BtnNovo, BtnAlterar, btnCancelar, BtnGravar, BtnApagar,
    BtnNavigator, PgcPrincipal, false);
  estadodocadastro := ecinserir;
  LimparEdt;
end;

procedure TFrmTelaHeranca.BtnAlterarClick(Sender: TObject);
begin
  controlarBotoes(BtnNovo, BtnAlterar, btnCancelar, BtnGravar, BtnApagar,
    BtnNavigator, PgcPrincipal, false);

  estadodocadastro := ecAlterar;
end;

procedure TFrmTelaHeranca.BtnApagarClick(Sender: TObject);
begin
  try
    if (Apagar) then
    begin
      controlarBotoes(BtnNovo, BtnAlterar, btnCancelar, BtnGravar, BtnApagar,
        BtnNavigator, PgcPrincipal, true);
      ControlarIndiceTab(PgcPrincipal, 0);
      LimparEdt;
      QryListagem.Refresh
    end
    else
    begin
      MessageDlg('Erro na Exclusão', mtError, [mbOK], 0);
    end;
  finally
    estadodocadastro := ecNenhum
  end;
end;

procedure TFrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  controlarBotoes(BtnNovo, BtnAlterar, btnCancelar, BtnGravar, BtnApagar,
    BtnNavigator, PgcPrincipal, true);
  ControlarIndiceTab(PgcPrincipal, 0);
  estadodocadastro := ecNenhum;
  LimparEdt;
end;

procedure TFrmTelaHeranca.BtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmTelaHeranca.BtnGravarClick(Sender: TObject);
begin
  if (ExisteCampoObrigatrio) then
    abort;

  try
    if Gravar(estadodocadastro) then
    begin
      controlarBotoes(BtnNovo, BtnAlterar, btnCancelar, BtnGravar, BtnApagar,
        BtnNavigator, PgcPrincipal, true);
      ControlarIndiceTab(PgcPrincipal, 0);
      estadodocadastro := ecNenhum;
      LimparEdt;
      QryListagem.Refresh
    end
    else
    begin
      MessageDlg('Erro na Gravação', mtError, [mbOK], 0);
    end;

  finally

  end;

end;

procedure TFrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryListagem.close;
end;

procedure TFrmTelaHeranca.FormCreate(Sender: TObject);
begin
  QryListagem.Connection := dtmconexao.conexaodb;
  DtsListagem.DataSet := QryListagem;
  grdListagem.DataSource := DtsListagem;
  grdListagem.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines,
    dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit,
    dgTitleClick, dgTitleHotTrack]
end;

procedure TFrmTelaHeranca.FormShow(Sender: TObject);
begin
  if (QryListagem.SQL.Text <> EmptyStr) then
  begin
    QryListagem.IndexFieldNames := IndiceAtual;
    exibirlabelindice(IndiceAtual, LblIndice);
    QryListagem.Open;
  end;
  ControlarIndiceTab(PgcPrincipal, 0);
  DesabilitarEditPK;
  controlarBotoes(BtnNovo, BtnAlterar, btnCancelar, BtnGravar, BtnApagar,
    BtnNavigator, PgcPrincipal, true);

end;

procedure TFrmTelaHeranca.grdListagemDblClick(Sender: TObject);
begin
  BtnAlterar.Click;
end;

procedure TFrmTelaHeranca.grdListagemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  BloqueiaCTRL_DEL_DbGrid(key,shift);
end;

procedure TFrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.fieldname;
  QryListagem.IndexFieldNames := IndiceAtual;
  exibirlabelindice(IndiceAtual, LblIndice);

end;

procedure TFrmTelaHeranca.MskPesquisarChange(Sender: TObject);
begin
  QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey]);
end;

Procedure TFrmTelaHeranca.BloqueiaCTRL_DEL_DbGrid(var key: word; shift: TShiftState);
begin
  //bloqueia o CTRL + DEL
  if (shift = [ssCtrl]) and (Key = 46) then
  Key:=0
end;

end.

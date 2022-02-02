unit UCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaHeranca, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.ComCtrls, cCadCategoria, uDM, uEnum;

type
  TFrmCadCategoria = class(TFrmTelaHeranca)
    EdtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAlterarClick(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
  private
    { Private declarations }
    oCategoria: TCategoria;
    function Apagar: boolean; override;
    function Gravar(estadodocadastro: TEstadodocadastro): boolean; override;
  public
    { Public declarations }
  end;

var
  FrmCadCategoria: TFrmCadCategoria;

implementation

{$R *.dfm}
{$REGION 'override'}

function TFrmCadCategoria.Apagar: boolean;
begin
  if ocategoria.Selecionar(QryListagem.FieldByName('categoriaID').AsInteger) then
  result := oCategoria.Apagar;
end;

function TFrmCadCategoria.Gravar(estadodocadastro: TEstadodocadastro): boolean;
begin
  if EdtCategoriaId.Text <> emptystr then
    oCategoria.codigo := StrToInt(EdtCategoriaId.Text)
  else
    oCategoria.codigo := 0;

  oCategoria.descricao := edtDescricao.Text;

  if (estadodocadastro = ecinserir) then
    result := oCategoria.inserir
  else if (estadodocadastro = ecalterar) then
    result := oCategoria.Atualizar;

end;
procedure TFrmCadCategoria.grdListagemDblClick(Sender: TObject);
begin
  inherited;

end;

{$ENDREGION}

procedure TFrmCadCategoria.BtnAlterarClick(Sender: TObject);
begin
  if ocategoria.Selecionar(QryListagem.FieldByName('categoriaID').AsInteger) then
  begin
    EdtCategoriaId.Text:=IntToStr(oCategoria.codigo);
    edtDescricao.Text  :=oCategoria.descricao;
  end

  else
  begin
    btnCancelar.Click;
    abort;
  end;
  inherited;

end;

procedure TFrmCadCategoria.BtnNovoClick(Sender: TObject);
begin
  inherited;
edtDescricao.SetFocus;
end;

procedure TFrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategoria) then
    FreeAndNil(oCategoria);
end;

procedure TFrmCadCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  oCategoria := TCategoria.create(dtmConexao.conexaoDB);
  IndiceAtual := 'descricao'
end;

end.

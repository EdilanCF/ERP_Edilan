unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaHeranca, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.ComCtrls, RxToolEdit, cCadCliente, uEnum;

type
  TfrmCadCliente = class(TFrmTelaHeranca)
    EdtClienteId: TLabeledEdit;
    edtNome: TLabeledEdit;
    EdtCep: TMaskEdit;
    Label1: TLabel;
    EdtEndereco: TLabeledEdit;
    EdtBairro: TLabeledEdit;
    EdtCidade: TLabeledEdit;
    EdtTelefone: TMaskEdit;
    Label2: TLabel;
    EdtCelular: TMaskEdit;
    Label3: TLabel;
    EdtEmail: TLabeledEdit;
    Label4: TLabel;
    edtDataNascimento: TDateEdit;
    QryListagemclienteID: TFDAutoIncField;
    QryListagemnome: TStringField;
    QryListagemendereco: TStringField;
    QryListagemcidade: TStringField;
    QryListagembairro: TStringField;
    QryListagemestado: TStringField;
    QryListagemcep: TStringField;
    QryListagemtelefone: TStringField;
    QryListagemcelular: TStringField;
    QryListagememail: TStringField;
    QryListagemdataNascimento: TDateField;
    edtEstado: TLabeledEdit;
    EdtCPF: TMaskEdit;
    Label5: TLabel;
    QryListagemCPF: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure EdtCPFExit(Sender: TObject);
    procedure edtEstadoExit(Sender: TObject);
  private
    { Private declarations }
    oCliente:TCliente;
    function Apagar: boolean; override;
    function Gravar(estadodocadastro: TEstadodocadastro): boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

uses uDM, uValidaCPF ;

{ TfrmCadCliente }

{$region 'Override'}

function TfrmCadCliente.Apagar: boolean;
begin
  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').asinteger) then begin
     result:=oCliente.Apagar
  end;

end;

function TfrmCadCliente.Gravar(estadodocadastro: TEstadodocadastro): boolean;
begin
  if EdtClienteId.Text <> EmptyStr then
  oCliente.codigo := StrToInt(EdtClienteId.Text)
  else
    oCliente.codigo := 0;
      oCliente.nome              := edtNome.Text;
      oCliente.CPF               := EdtCPF.Text;
      oCliente.cep               := edtcep.Text;
      ocliente.endereco          := EdtEndereco.Text;
      oCliente.cidade            := EdtCidade.Text;
      ocliente.bairro            := edtbairro.Text;
      ocliente.estado            := edtEstado.Text;
      ocliente.telefone          := EdtTelefone.Text;
      ocliente.celular           := EdtCelular.text;
      oCliente.email             := EdtEmail.Text;
      ocliente.dataNascimento    := edtDataNascimento.Date;

  if (estadodocadastro=ecInserir) then
    result := oCliente.inserir
  else if (estadodocadastro=ecAlterar) then
  begin
     result := oCliente.Atualizar;
  end;
end;

{$endregion}

procedure TfrmCadCliente.BtnAlterarClick(Sender: TObject);
begin
  EdtCPF.Enabled:=false;

  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then
  begin
    EdtClienteId.Text       := inttostr(oCliente.codigo);
    edtNome.Text            := oCliente.nome;
    edtCPF.Text             := ocliente.CPF;
    edtcep.Text             := ocliente.cep;
    EdtEndereco.Text        := ocliente.endereco;
    edtcidade.Text          := ocliente.cidade;
    edtbairro.Text          := ocliente.bairro;
    edtEstado.Text          := ocliente.estado;
    EdtTelefone.Text        := oCliente.telefone;
    edtcelular.Text         := ocliente.celular;
    edtemail.Text           := ocliente.email;
    edtDataNascimento.Date  := ocliente.dataNascimento;
  end
  else begin
    btnCancelar.Click;
    abort;
  end;



  inherited;

end;

procedure TfrmCadCliente.BtnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataNascimento.date:=Date;
  edtNome.SetFocus;
end;

procedure TfrmCadCliente.EdtCPFExit(Sender: TObject);
begin
  inherited;
  if  isCPF(EdtCPF.Text) then
    EdtCPF.Text := imprimeCPF(EdtCPF.Text)
  else
  begin
    MessageDlg('CPF INVALIDO !!!' + #13 + ' DIGITAR SOMENTE NUMEROS.',
    TMsgDlgType.mtError, [mbOK], 0);
    EdtCPF.clear;
    EdtCPF.SetFocus;
  end;
end;

procedure TfrmCadCliente.edtEstadoExit(Sender: TObject);
begin
  inherited;
  edtEstado.Text:=UpperCase(edtEstado.Text);
end;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(ocliente) then
     FreeAndNil(ocliente);
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  oCliente := TCliente.create(dtmconexao.conexaodb);

  indiceAtual:='nome';
end;

end.

unit cControleEstoque;

interface

uses
  System.Classes,
  System.SysUtils,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.DBClient;

Type
  TControleEstoque = class

  Private
    ConexaoDB:TFDConnection;
    F_ProdutoID : integer;
    F_Quantidade : Double;

  Public
    constructor create(aconexao : TFDConnection);
    destructor destroy; override;
    function BaixarEstoque: boolean;
    function RetornarEstoque: boolean;
  published
    Property ProdutoID:integer      read F_ProdutoID    write F_ProdutoID;
    property Quantidade:Double      read F_Quantidade   Write F_quantidade;
  end;

implementation

{ TControleEstoque }
 {$region 'Constructor and Destructor'}
constructor TControleEstoque.create(aconexao: TFDConnection);
begin
  ConexaoDB := aconexao;
end;

destructor TControleEstoque.destroy;
begin

  inherited;
end;

{$endregion}

function TControleEstoque.BaixarEstoque: boolean;
var Qry:TFDQuery;
begin
  Try
    result:=true;
    Qry:= TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' UPDATE produtos '+
                ' SET quantidade = quantidade - :qtdBaixa ' +
                ' WHERE produtoId= :produtoID ;' );
    Qry.ParamByName('produtoID').AsInteger      :=ProdutoID;
    Qry.ParamByName('qtdbaixa').AsFloat         :=Quantidade;
    try
      Qry.ExecSQL
    except
      Result:=false
    end;
  Finally
     if assigned(Qry) then
     FreeAndNil(Qry);
  End;

end;

function TControleEstoque.RetornarEstoque: boolean;
var Qry:TFDQuery;
begin
  try
    result:=true;
    Qry:= TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' UPDATE produtos '+
                ' SET quantidade = quantidade + :qtdRetorno '+
                ' WHERE produtoId= :produtoID ;');
    Qry.ParamByName('produtoID').AsInteger    :=produtoID;
    Qry.ParamByName('qtdRetorno').AsFloat     :=quantidade;
    try
     Qry.ExecSQL;
    finally
     result:=false;
    end;

  finally
    if assigned(Qry) then
    FreeAndNil(qry);
  end;
end;

end.

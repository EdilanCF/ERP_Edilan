unit cCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaHeranca, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.ComCtrls, RxToolEdit, cCadCliente, uEnum;

Type
  TProduto = Class
  Private
    ConexaoDB:TFDConnection;
    F_produtoID:integer;
    F_nome: string;
    F_descricao: string;
    F_valorCusto: double;
    F_valor: Double;
    F_quantidade: Double;
    F_unidade: string;
    F_categoriaID: integer;
  Public
    constructor create(aConexao: TFDConnection);
    destructor destroy; override;
    function inserir: boolean;
    function Atualizar: boolean;
    function Apagar: boolean;
    function Selecionar(id: integer): boolean;
  published
    property codigo       :integer      read F_produtoID      write F_produtoID;
    property nome         :string       read F_nome           write F_nome;
    property descricao    :string       read F_descricao      write F_descricao;
    property valorCusto   :double       read F_valorCusto     write F_valorCusto;
    property valor        :double       read F_valor          write F_valor;
    property quantidade   :double       read F_quantidade     write F_quantidade;
    property unidade      :string       read F_unidade        write F_unidade;
    property categoriaID  :integer      read F_categoriaID    write F_categoriaID;

  End;


implementation

{ TProduto }

{$Region 'CONSTRUCTOR AND DESTRUCTOR'}

constructor TProduto.create(aConexao: TFDConnection);
begin
 ConexaoDB:=aConexao;
end;

destructor TProduto.destroy;
begin

  inherited;
end;

{$ENDREGION}

{$Region 'CRUD'}

function TProduto.Apagar: boolean;
var Qry :TFDQuery;
begin
    if MessageDlg('Deseja APAGAR o registro: ' +#13+#13+
                  'Código: ' +IntToStr(F_produtoID)+#13+
                  'Nome: '+F_nome, mtConfirmation, [mbno, mbYes], 0)= mrNo  then
                   begin
                     result := false;
                     abort;
                    end;
 try
   result:=true;
   qry:=TFDQuery.Create(nil);
   qry.Connection:=ConexaoDB;
   Qry.SQL.Clear;
   Qry.SQL.Add('DELETE FROM produtos '+
	            ' WHERE produtoID =:produtoId ');
   qry.ParamByName('produtoId').AsInteger :=F_produtoId;
   try
     Qry.ExecSQL;
   Except
     result:= false;
     ShowMessage('Erro na Exclusão')
   end;
  finally
    if Assigned(Qry) then
    FreeAndNil(Qry)
  end;
end;

function TProduto.Atualizar: boolean;
var Qry: TFDQuery;
begin
  try
    result:=true;
    Qry:=TFDQuery.Create(nil);
    qry.Connection:=Conexaodb;
    Qry.SQL.Clear;
      Qry.SQL.Add( ' UPDATE produtos ' +
                   ' SET nome         = :nome '+
                   ' , descricao      = :descricao ' +
                   ' , valorCusto     = :valorCusto ' +
                   ' , valor          = :valor ' +
                   ' , quantidade     = :quantidade ' +
                   ' , unidade        = :unidade ' +
                   ' , categoriaId    = :categoriaID ' +
                   ' WHERE produtoId  = :produtoID ; ');

    Qry.ParamByName('produtoID').AsInteger       :=self.F_produtoID;
    Qry.ParamByName('nome').AsString             :=self.F_nome;
    Qry.ParamByName('descricao').AsString        :=self.F_descricao;
    Qry.ParamByName('valorCusto').AsFloat        :=self.F_valorCusto;
    Qry.ParamByName('valor').Asfloat             :=self.F_valor;
    Qry.ParamByName('quantidade').Asfloat        :=self.F_quantidade;
    Qry.ParamByName('unidade').AsString          :=self.F_unidade;
    Qry.ParamByName('categoriaID').Asinteger     :=self.F_categoriaID;

      try
        Qry.ExecSQL;
      except
        result:=false;
      end;

  finally
     if Assigned(Qry) then
        FreeAndNil(Qry);
  end;
end;


function TProduto.inserir: boolean;
var Qry: Tfdquery;
begin

  try
    result := true;
    Qry := Tfdquery.create(nil);
    Qry.Connection:= ConexaoDB;
    Qry.sql.Clear;
    Qry.sql.Add (' INSERT INTO produtos ' +
                 ' (nome, descricao, valorCusto, valor,  quantidade, unidade, categoriaId) ' +
                 ' VALUES( :nome, :descricao, :valorCusto, :valor, :quantidade, :unidade, :categoriaID);');

      Qry.ParamByName('nome').AsString         :=self.F_nome;
      Qry.ParamByName('descricao').AsString    :=self.F_descricao;
      Qry.ParamByName('valorCusto').AsFloat    :=self.F_valorCusto;
      Qry.ParamByName('valor').AsFloat         :=self.F_valor;
      Qry.ParamByName('quantidade').AsFloat    :=self.F_quantidade;
      Qry.ParamByName('unidade').AsString      :=self.F_unidade;
      Qry.ParamByName('categoriaID').AsInteger :=self.F_categoriaID;

    try
      Qry.ExecSQL;
    except
      result := false
    end;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);

  end;
end;

function TProduto.Selecionar(id: integer): boolean;
var
  Qry: Tfdquery;
 begin
 try
      result := true;
      Qry := Tfdquery.create(nil);
      Qry.Connection := ConexaoDB;
      Qry.sql.Clear;
      Qry.SQL.Add( ' SELECT produtoId,  nome, descricao, valorCusto, valor, quantidade, unidade, categoriaId ' +
                   ' FROM produtos ' +
                   ' where  produtoID = :produtoID');

      Qry.ParamByName('produtoID').AsInteger :=id;
      try
        Qry.open;

        self.F_produtoID   := Qry.FieldByName('produtoID').AsInteger;
        self.F_nome        := Qry.FieldByName('nome').AsString;
        self.F_descricao   := Qry.FieldByName('descricao').AsString;
        self.F_valorCusto  := Qry.FieldByName('valorCusto').AsFloat;
        self.F_valor       := Qry.FieldByName('valor').AsFloat;
        self.F_quantidade  := Qry.FieldByName('quantidade').AsFloat;
        self.F_unidade     := Qry.FieldByName('unidade').AsString;
        self.F_categoriaID := Qry.FieldByName('categoriaID').AsInteger;
      except
        result := false
      end;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
 end;
end;
{$endregion}


end.

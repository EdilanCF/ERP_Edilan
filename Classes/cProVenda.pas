unit cProVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaHeranca, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.ComCtrls, RxToolEdit, cCadCliente, uEnum, Datasnap.DBClient,
  cControleEstoque;

type
  Tvenda = class
  Private
    conexaoDB:TFDConnection;
    F_vendaID:integer;
    F_ClienteID:Integer;
    F_dataVenda:TDateTime;
    F_totalVenda:double;
    function InserirItens(cds: TClientDataSet; IdVenda: integer): Boolean;
    function ApagarItens(Cds: TClientDataSet): boolean;
    function InNot(Cds: TClientDataSet): String;
    function EsteItemExiste(vendaID, produtoID: integer): boolean;
    function AtualizarItem(cds: TclientDataSet): boolean;
    procedure BaixarEstoque(produtoID: Integer; Quantidade: Double);
    procedure RetornarEstoque(sCodigo: string; Acao: TAcaoExcluirEstoque);

  Public
    Constructor Create (aconexao:TFDConnection);
    destructor Destroy; override;
    function Inserir(Cds:TClientDataSet):boolean;
    function Atualizar(cds:TClientDataSet):boolean;
    function Apagar:boolean;
    function Selecionar (id:Integer;var cds:TClientDataSet):boolean;

  published
    property VendaID:integer      read F_vendaID    write F_vendaID;
    property ClienteID:integer    read F_clienteID  write F_clienteID;
    property DataVenda:TDateTime  read F_dataVenda  write F_dataVenda;
    property TotalVenda:Double    read F_totalVenda write F_totalVenda;

  end;

implementation


{ Tvenda }

{$Region 'Constructor and destructor'}


constructor Tvenda.Create(aconexao: TFDConnection);
begin
   conexaoDB:=aconexao;
end;

destructor Tvenda.Destroy;
begin
  inherited;
end;
{$endRegion}


function Tvenda.Apagar: boolean;
var Qry :TFDQuery;
begin
   if MessageDlg('Deseja APAGAR o registro: ' +#13+#13+
                  'venda Nº: '+IntToStr(vendaID)+'?', mtConfirmation, [mbno, mbYes], 0)= mrNo  then
                  begin
                    result:= false;
                    abort;
                  end;
  try
   result:=true;
   ConexaoDB.StartTransaction;
   qry:=TFDQuery.Create(nil);
   qry.Connection:=ConexaoDB;
   //apaga primeiro os itens da tabela
   Qry.SQL.Clear;
   Qry.SQL.Add('DELETE FROM vendasitens '+
	            ' WHERE vendaID =:vendaID ');
   qry.ParamByName('vendaID').AsInteger :=vendaID;
   try
     Qry.ExecSQL;
     //Apaga a tabela master
     Qry.SQL.Clear;
     Qry.SQL.Add('DELETE FROM vendas '+
	            ' WHERE vendaID =:vendaID ');
      qry.ParamByName('vendaID').AsInteger :=vendaID;
      qry.ExecSQL;
      conexaoDB.Commit
   Except
     conexaoDB.Rollback;
     result:= false;
   end;

  finally
    if Assigned(Qry) then
    FreeAndNil(Qry)
  end;
end;

function Tvenda.Atualizar(cds:TClientDataSet): boolean;
var Qry : TFDQuery;
begin
 Try
  result:=true;
  conexaoDB.StartTransaction;
  Qry:=TfdQuery.Create(nil);
  Qry.Connection:=conexaoDB ;
  Qry.SQL.Clear;
  Qry.SQL.Add( ' UPDATE vendas '+
               ' SET clienteID = :clienteID, dataVenda = :dataVenda, totalVenda = :totalVenda '+
               ' WHERE vendaID= :vendaID ');

  Qry.ParamByName('vendaID').AsInteger      :=Self.F_vendaID;
  Qry.ParamByName('clienteID').Asinteger    :=Self.F_ClienteID;
  Qry.ParamByName('dataVenda').AsDateTime   :=Self.F_dataVenda;
  Qry.ParamByName('totalVenda').AsFloat     :=Self.F_totalVenda;

    Try
     // update Vendas
     Qry.ExecSQL;

     // apaga intens no banco de dados que já foram apagados na tela
     ApagarItens(cds);

     cds.First;
     while not cds.Eof do begin
       if EsteItemExiste(self.F_vendaID, cds.FieldByName('produtoID').AsInteger) then begin
         AtualizarItem(cds);
       end
       else begin
         InserirItens(cds, self.F_vendaID);
       end;

       cds.Next;
     end;

    except
     Result:=false;
     conexaoDB.Rollback
    End;

    conexaoDB.Commit;
  Finally
   if assigned(Qry) then
    FreeAndNil(Qry);
 End;
end;

function Tvenda.AtualizarItem(cds:TclientDataSet): boolean;
var Qry:TFDQuery;
    controleestoque:TControleEstoque;
begin
  try
  result:=true;
  RetornarEstoque(CDS.FieldByName('produtoID').AsString, aeealterar);
  Qry:=TFDQuery.Create(nil);
  Qry.Connection:=conexaoDB;
  qry.SQL.Clear;
  Qry.SQL.Add(  ' UPDATE vendasItens '+
                ' SET valorUnitario= :valorUnitario, '+
                ' quantidade= :quantidade, '+
                ' unidade= :unidade, '+
                ' totalProduto= :totalProduto ' +
                ' WHERE vendaID= :vendaID AND produtoID= :produtoID; ');
  Qry.ParamByName('vendaID').AsInteger         :=self.F_vendaID;
  Qry.ParamByName('produtoID').AsInteger       :=cds.FieldByName('produtoID').AsInteger;
  Qry.ParamByName('valorUnitario').AsFloat     :=cds.FieldByName('valorUnitario').AsFloat;
  Qry.ParamByName('quantidade').AsFloat        :=cds.FieldByName('quantidade').AsFloat;
  Qry.ParamByName('unidade').AsString          :=cds.FieldByName('unidade').AsString;
  Qry.ParamByName('TotalProduto').AsFloat :=cds.FieldByName('ValorTotalProduto').AsFloat;
    try
      Qry.ExecSQL;
      BaixarEstoque(CDS.FieldByName('produtoID').asinteger, cds.FieldByName('quantidade').AsFloat);
    except
      result:=false;
    end;

  finally
    if assigned(Qry) then
       FreeAndNil(Qry)
  end;


end;

function Tvenda.EsteItemExiste(vendaID : integer; produtoID : integer): boolean;
var Qry : TFDQuery ;
begin
 try
 Qry:=TFDQuery.Create(nil);
 Qry.Connection:=conexaoDB;
 qry.SQL.Clear;
 qry.SQL.Add( 'SELECT Count(vendaID) as Qtde ' +
              ' FROM vendasItens ' +
              ' WHERE vendaID = :vendaID and produtoID= :ProdutoID ' );
 Qry.ParamByName('vendaID').asinteger   :=vendaID;
 qry.ParamByName('produtoID').AsInteger :=produtoID;
    try
      Qry.Open;
      if Qry.FieldByName('qtde').AsInteger>0 then
      result:=true
      else
      result:=false;

    except
      result:=false;
    end;
 finally
    if assigned(Qry) then
    FreeAndNil(Qry);
 end;


end;

Function Tvenda.ApagarItens(Cds:TClientDataSet): boolean;
var Qry:TFDQuery;
    sCodNoCds:string;
begin
   try
     result:=true;
     sCodNoCds:=InNot(cds);
     RetornarEstoque(sCodNoCds, aeeApagar);
     Qry:=TFDQuery.Create(nil);
     Qry.Connection:=conexaoDB;
     Qry.SQL.Clear;
     Qry.SQL.Add(' DELETE FROM Vendasitens '+
                 ' Where vendaID = :vendaID '+
                 ' And produtoID NOT IN ('+sCodNoCds+') ');

     Qry.ParamByName('vendaID').AsInteger   :=Self.F_vendaID;
      try
        Qry.ExecSQL;
      except
        result := false;
      end;

   finally
    if assigned(Qry) then
       FreeAndNil(qry);
   end;
end;

function Tvenda.InNot(Cds:TClientDataSet): String;
var sInNot:string;
begin
 sInNot:= EmptyStr;
 cds.First;
 while not cds.Eof do
 begin
   if sInNot = EmptyStr then
   sInNot := cds.FieldByName('produtoID').Asstring
   else
    sInNot := SinNot + ',' +cds.FieldByName('produtoID').AsString;

   Cds.Next
 end;
 Result:=sInNot;
end;

function Tvenda.Inserir(Cds:TClientDataSet): boolean;
Var Qry:TFDQuery;
    IdVendaGerado:integer;
begin
 Try

  result:=true;
  ConexaoDB.StartTransaction;
  Qry:=TFDQuery.Create(nil);
  Qry.Connection:=conexaoDB;
  Qry.SQL.Clear;
  qry.SQL.Add( 'INSERT INTO vendas (clienteID, dataVenda, totalVenda )'+
               'values ( :clienteID, :dataVenda, :totalVenda )') ;

  Qry.ParamByName('clienteID').Asinteger    :=Self.F_ClienteID;
  Qry.ParamByName('dataVenda').AsDateTime   :=Self.F_dataVenda;
  Qry.ParamByName('totalVenda').AsFloat     :=Self.F_totalVenda;

  Try
    Qry.ExecSQL;
    //recupera o ID Gerado no insert
    Qry.SQL.Clear;
    Qry.SQL.Add(' Select LAST_INSERT_ID() as ID ');
    Qry.Open;

    //id TABELA MASTER (VENDA)
    IdVendaGerado:=Qry.FieldByName('ID').AsInteger;
    // GRAVAR NA TELA VendasItens
    Cds.First;
    while not cds.Eof do
    begin
      InserirItens(cds, IdVendaGerado);
      cds.Next
    end;
    ConexaoDB.Commit;
  except
    COnexaoDB.Rollback;
    result:=false;
  End;
 Finally
   if Assigned(Qry) then
   FreeAndNil(Qry);

 End;
end;

function Tvenda.InserirItens(cds:TClientDataSet; IdVenda:integer):Boolean;
var Qry:TFDQuery;
Begin
try
  result:= true;
  Qry:= TFDQuery.Create(nil);
  Qry.Connection:= conexaoDB;
  Qry.SQL.Clear;
  Qry.SQL.Add( ' INSERT INTO vendasitens ' +
               '(vendaID, produtoID, valorUnitario, quantidade, unidade, totalProduto)'+
               ' VALUES(:vendaID, :produtoID, :valorUnitario, :quantidade, :unidade, :totalProduto) ');
  Qry.ParamByName('vendaID').AsInteger     := IdVenda;
  Qry.ParamByName('produtoID').AsInteger   := cds.FieldByName('produtoID').AsInteger;
  Qry.ParamByName('valorUnitario').AsFloat := cds.FieldByName('valorUnitario').AsFloat;
  Qry.ParamByName('quantidade').AsFloat    := cds.FieldByName('quantidade').AsFloat;
  Qry.ParamByName('unidade').AsString      := cds.FieldByName('unidade').AsString;
  Qry.ParamByName('totalProduto').AsFloat  := cds.FieldByName('ValorTotalProduto').asfloat;
  try
   Qry.ExecSQL;
   BaixarEstoque(CDS.FieldByName('produtoID').asinteger, cds.FieldByName('quantidade').AsFloat);
  except
   result := False
  end;
finally
  if assigned(Qry) then
  FreeAndNil(Qry);
end;


End;


function Tvenda.Selecionar(id: Integer ;var cds:TClientDataSet): boolean;
var Qry:TFDQuery;
begin
 try
   Result:= true;
   Qry:=TFDQuery.Create(nil);
   Qry.Connection:=conexaoDB;
   Qry.SQL.Clear;
   Qry.SQL.Add( 'SELECT vendaID, clienteID, datavenda, totalVenda ' +
                'FROM vendas '+
                'Where vendaID= :vendaID');
     Qry.ParamByName('vendaID').AsInteger :=id;
   try
    Qry.Open;

    Self.F_vendaID          :=Qry.FieldByName('vendaID').AsInteger;
    self.F_ClienteID        :=Qry.FieldByName('clienteID').AsInteger;
    self.F_dataVenda        :=Qry.FieldByName('dataVenda').AsDateTime;
    self.F_totalVenda       :=Qry.FieldByName('totalVenda').AsFloat;

    // apagar CDS caso esteja com registro
    cds.First;
    while not cds.Eof do begin
      cds.Delete;
    end;

    // seleciona os itens do banco de dados com a propriedade F_vendaID

    Qry.Close;
    Qry.SQL.Clear;
    qry.sql.Add(  ' select v.produtoID , p.nome , v.valorUnitario , v.quantidade, v.unidade ,v.totalProduto' +
                  ' from vendasitens v '+
                  ' inner join produtos p on p.produtoId  = v.produtoID '+
                  ' where vendaID =:vendaID ' );
    Qry.ParamByName('vendaID').AsInteger      :=self.F_vendaID;
    Qry.Open;

    // pega da Qry e joga no CDS(ClientDataSet)
    Qry.First;
    while not qry.Eof do
    begin
     cds.Append;
     cds.FieldByName('produtoID').AsInteger   :=Qry.FieldByName('produtoID').AsInteger;
     cds.FieldByName('nomeProduto').asstring  :=Qry.FieldByName('nome').Asstring;
     cds.FieldByName('valorUnitario').AsFloat :=Qry.FieldByName('valorUnitario').AsFloat;
     cds.FieldByName('quantidade').AsFloat    :=qry.FieldByName('quantidade').AsFloat;
     cds.FieldByName('unidade').AsString      :=Qry.FieldByName('unidade').AsString;
     cds.FieldByName('valorTotalProduto').AsFloat := Qry.FieldByName('totalProduto').AsFloat;
     cds.Post;
     qry.Next;
    end;
    cds.First;

   except
    result:=false;
   end;

 finally
   if Assigned(Qry) then
   FreeAndNil(Qry);
 end;

end;

{$region'CONTROLE DE ESTOQUE'}
// utiliza no update e no delete
Procedure TVenda.RetornarEstoque(sCodigo:string ; Acao:TAcaoExcluirEstoque);
var Qry:TFDQuery;
    oControleEstoque:TControleEstoque;
begin
    Qry := TFDQuery.Create(nil);
    Qry.connection:= conexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT produtoID, quantidade '+
                ' FROM vendasItens ' +
                ' WHERE vendaID = :vendaID ' );
    if acao=aeeApagar then
      Qry.SQL.Add(' AND ProdutoID NOT IN('+sCodigo+') ')
    else
      Qry.SQL.Add(' AND ProdutoID = ('+sCodigo+')');

    Qry.ParamByName('vendaID').AsInteger    :=Self.F_vendaID ;
    try
      oControleEstoque:=TControleEstoque.create(ConexaoDB);
      Qry.Open;
      Qry.First;
      while not Qry.Eof do begin
        oControleEstoque.ProdutoID  :=Qry.FieldByName('produtoID').AsInteger;
        oControleEstoque.Quantidade :=Qry.FieldByName('quantidade').AsFloat;
        oControleEstoque.RetornarEstoque;
        Qry.Next
      end;

    finally
      if Assigned(oControleEstoque)  then
         FreeAndNil(oControleEstoque);
    end;

end;
//utiliza no insert
Procedure TVenda.BaixarEstoque(produtoID:Integer; Quantidade:Double);
var oControleEstoque: TControleEstoque;
 begin
   try
     oControleEstoque:=TControleEstoque.create(conexaoDB);
     oControleEstoque.ProdutoID   := produtoID;
     oControleEstoque.Quantidade  := quantidade;
     oControleEstoque.BaixarEstoque;
   finally
     if assigned(oControleEstoque) then
     FreeAndNil(oControleEstoque);
   end;
 end;

{$ENDREGION}

end.

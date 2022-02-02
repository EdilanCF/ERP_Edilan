unit cCadCategoria;

interface

uses System.Classes, Vcl.controls, Vcl.ExtCtrls, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Comp.UI, System.SysUtils;

type
  Tcategoria = class
  private
    ConexaoDB: TFDConnection;
    F_categoriaid: integer;
    F_descricao: string;
    function getCodigo: integer;
    function getDescricao: string;
    procedure setCodigo(const Value: integer);
    procedure SetDescricao(const Value: string);
  public
    constructor create(aConexao: TFDConnection);
    destructor destroy; override;
    function inserir: boolean;
    function Atualizar: boolean;
    function Apagar: boolean;
    function Selecionar(id: integer): boolean;
  published
    property codigo: integer read getCodigo write setCodigo;
    property descricao: string read getDescricao write SetDescricao;
  end;

implementation

{$REGION 'constructor and destructor'}

constructor Tcategoria.create(aConexao: TFDConnection);
begin
  ConexaoDB := aConexao;
end;

destructor Tcategoria.destroy;
begin

  inherited;
end;

{$ENDREGION}
{$REGION 'CRUD'}

function Tcategoria.Apagar: boolean;
var Qry:TFDQuery;
begin
   if MessageDlg('Deseja APAGAR o registro: ' +#13+#13+
                  'Código: ' +IntToStr(F_categoriaid)+#13+
                  'Descrição: '+F_descricao, mtConfirmation, [mbno, mbYes], 0)= mrNo  then
                  begin
                    result:= false;
                    abort;
                  end;
  try
   result:=true;
   qry:=TFDQuery.Create(nil);
   qry.Connection:=ConexaoDB;
   Qry.SQL.Clear;
   Qry.SQL.Add('DELETE FROM categorias '+
	            ' WHERE categoriaID =:categoriaID ');
   qry.ParamByName('categoriaID').AsInteger :=F_categoriaid;
   try
     Qry.ExecSQL;
   Except
     result:= false;
   end;
  finally
    if Assigned(Qry) then
    FreeAndNil(Qry)
  end;
end;

function Tcategoria.Atualizar: boolean;
var Qry: TFDQuery;
begin
try
  Result := true;
  Qry := TFDQuery.Create(nil);
  Qry.Connection := ConexaoDB;
  qry.SQL.Clear;
  Qry.SQL.Add ('UPDATE categorias ' +
	' SET Descricao = :descricao ' +
  ' WHERE categoriaID = :categoriaID ');

   qry.ParamByName('categoriaID').AsInteger := self.F_categoriaid;
   Qry.ParamByName('Descricao').AsString   :=Self.F_descricao;

   try
     qry.ExecSQL;
   except
     result := false;
   end;

finally
   if Assigned(qry) then
   FreeAndNil(qry);
end;

end;

function Tcategoria.inserir: boolean;
var Qry: Tfdquery;
begin
  try
    result := true;
    Qry := Tfdquery.create(nil);
    Qry.Connection:= ConexaoDB;
    Qry.sql.Clear;
    Qry.sql.Add('insert into categorias (descricao) values (:descricao)');
                Qry.ParamByName('descricao').AsString := self.F_descricao;


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

function Tcategoria.Selecionar(id: integer): boolean;
var
  Qry: Tfdquery;
  sSQL: string;

begin
  try
    result := true;
    Qry := Tfdquery.create(nil);
    Qry.Connection := ConexaoDB;
    Qry.sql.Clear;
    sSQL := 'select categoriaID,'
    + 'descricao '
    + 'from categorias '
    +'where categoriaID = :categoriaID';
    Qry.sql.Add(sSQL);
    Qry.ParamByName('categoriaID').AsInteger := id;

    try
      Qry.open;

      self.F_categoriaid := Qry.FieldByName('categoriaID').AsInteger;
      self.F_descricao := Qry.FieldByName('descricao').AsString;
    except
      result := false
    end;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);

  end;
end;
{$ENDREGION}
{$REGION'GETS'}

function Tcategoria.getCodigo: integer;
begin
  result := self.F_categoriaid;
end;

function Tcategoria.getDescricao: string;
begin
  result := self.F_descricao
end;

{$ENDREGION}
{$REGION'SETS'}

procedure Tcategoria.setCodigo(const Value: integer);
begin
  self.F_categoriaid := Value;
end;

procedure Tcategoria.SetDescricao(const Value: string);
begin
  self.F_descricao := Value;
end;
{$ENDREGION}

end.

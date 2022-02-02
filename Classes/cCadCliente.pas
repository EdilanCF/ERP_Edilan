unit cCadCliente;

interface

uses System.Classes, Vcl.controls, Vcl.ExtCtrls, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Comp.UI, System.SysUtils;

type
  TCliente = class
  private
    Conexaodb :TFDConnection;
    F_clienteId :Integer;
    F_nome :string;
    F_CPF :string;
    F_endereco :string;
    F_cidade :string;
    F_bairro :string;
    F_estado :string;
    F_cep : string;
    F_telefone :string;
    F_celular:string;
    F_email: string;
    F_dataNascimento: TDateTime;

  public

    constructor create(aConexao: TFDConnection);
    destructor destroy; override;
    function inserir: boolean;
    function Atualizar: boolean;
    function Apagar: boolean;
    function Selecionar(id: integer): boolean;

  Published

    property codigo         :Integer     read F_ClienteID      Write F_clienteId;
    property nome           :string      read F_nome           write F_nome;
    property CPF            :string      read F_CPF            Write F_CPF;
    property endereco       :string      read F_endereco       write F_endereco;
    property cidade         :string      read F_cidade         write F_cidade;
    property bairro         :string      read F_bairro         write F_bairro;
    property estado         :string      read F_estado         write F_estado;
    property cep            :string      read F_cep            write F_cep;
    property telefone       :string      read F_telefone       write F_telefone;
    property celular        :string      read F_celular        write F_celular;
    property email          :string      read F_email          Write F_email;
    property dataNascimento :TDateTime   read F_dataNascimento write F_dataNascimento;
end;

implementation
{$region 'CONSTRUCTOR AND DESTRUCTOR'}

constructor TCliente.create(aConexao: TFDConnection);
begin
  Conexaodb:=aConexao;
end;

destructor TCliente.destroy;
begin

  inherited;
end;

{$endregion}
{$region 'CRUD'}
 function TCliente.Apagar: boolean;
 var Qry :TFDQuery;
begin
    if MessageDlg('Deseja APAGAR o registro: ' +#13+#13+
                  'Código: ' +IntToStr(F_clienteId)+#13+
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
   Qry.SQL.Add('DELETE FROM clientes '+
	            ' WHERE clienteId =:clienteId ');
   qry.ParamByName('clienteId').AsInteger :=F_clienteId;
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

function TCliente.Atualizar: boolean;
var Qry: TFDQuery;
begin
  try
    result:=true;
    Qry:=TFDQuery.Create(nil);
    qry.Connection:=Conexaodb;
    Qry.SQL.Clear;
    Qry.SQL.Add (' UPDATE dbedilanteste.clientes ' +
                ' SET nome = :nome ' +
                ' ,CPF = :CPF ' +
                ' ,endereco = :endereco '+
                ' ,cidade = :cidade ' +
                ' ,bairro = :bairro ' +
                ' ,estado = :estado ' +
                ' ,cep = :cep ' +
                ' ,telefone = :telefone ' +
                ' ,celular = :celular ' +
                ' ,email = :email ' +
                ' ,dataNascimento = :dataNascimento ' +
                ' WHERE clienteID = :clienteID ');


    Qry.ParamByName('clienteID').AsInteger       :=self.F_clienteID;
    Qry.ParamByName('nome').AsString             :=self.F_nome;
    Qry.ParamByName('CPF').AsString              :=self.F_CPF;
    Qry.ParamByName('endereco').AsString         :=self.F_endereco;
    Qry.ParamByName('cidade').AsString           :=self.F_cidade;
    Qry.ParamByName('bairro').AsString           :=self.F_bairro;
    Qry.ParamByName('estado').AsString           :=self.F_estado;
    Qry.ParamByName('cep').AsString              :=self.F_cep;
    Qry.ParamByName('telefone').AsString         :=self.F_telefone;
    Qry.ParamByName('celular').AsString          :=self.F_celular;
    Qry.ParamByName('email').AsString            :=self.F_email;
    qry.ParamByName('dataNascimento').AsDate     :=self.F_dataNascimento;

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

function TCliente.inserir: boolean;
var Qry:TFDQuery;
begin
  try
  result:=true;
  qry:=TFDQuery.Create(nil);
  Qry.Connection:=Conexaodb;
  qry.SQL.Clear;
  qry.SQL.Add(' INSERT INTO clientes ( nome, CPF, endereco, cidade, bairro, estado, cep, telefone, celular, email, dataNascimento) ' +
  ' VALUES (:nome, :CPF, :endereco, :cidade, :bairro, :estado, :cep, :telefone, :celular, :email, :dataNascimento)' );

    Qry.ParamByName('nome').AsString             :=self.F_nome;
    qry.ParamByName('CPF').AsString              :=self.F_CPF;
    Qry.ParamByName('endereco').AsString         :=self.F_endereco;
    Qry.ParamByName('cidade').AsString           :=self.F_cidade;
    Qry.ParamByName('bairro').AsString           :=self.F_bairro;
    Qry.ParamByName('estado').AsString           :=self.F_estado;
    Qry.ParamByName('cep').AsString              :=self.F_cep;
    Qry.ParamByName('telefone').AsString         :=self.F_telefone;
    Qry.ParamByName('celular').AsString          :=self.F_celular;
    Qry.ParamByName('email').AsString            :=self.F_email;
    qry.ParamByName('dataNascimento').AsDateTime :=self.F_dataNascimento;

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

function TCliente.Selecionar(id: integer): boolean;
var Qry:TFDQuery;
begin
  try
    result := true;
    Qry := TFDQuery.Create(nil);
    Qry.Connection := Conexaodb;
    qry.SQL.Clear;
    qry.SQL.Add(' SELECT clienteID, nome, CPF, endereco, cidade, bairro, estado, cep, telefone, celular, email, dataNascimento ' +
                ' FROM dbedilanteste.clientes ' +
                ' where clienteID = :clienteId ');
    Qry.ParamByName('clienteID').AsInteger:=id;
    try
      Qry.Open;

      self.F_clienteId          := Qry.FieldByName('clienteId').AsInteger;
      self.F_nome               := Qry.FieldByName('nome').AsString;
      self.F_CPF                := qry.FieldByName('CPF').AsString;
      self.F_endereco           := Qry.FieldByName('endereco').AsString;
      self.F_cidade             := Qry.FieldByName('cidade').AsString;
      self.F_bairro             := Qry.FieldByName('bairro').AsString;
      self.F_estado             := Qry.FieldByName('estado').AsString;
      self.F_cep                := Qry.FieldByName('cep').AsString;
      self.F_telefone           := Qry.FieldByName('telefone').AsString;
      self.F_celular            := Qry.FieldByName('celular').AsString;
      self.F_email              := Qry.FieldByName('email').AsString;
      self.F_dataNascimento     := Qry.FieldByName('dataNascimento').AsDateTime;

    Except
      result := false;
    end;

  finally
    if Assigned(Qry) then
    FreeAndNil(qry)
  end;
end;

{$endRegion}
end.

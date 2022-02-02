unit uFrmAtualizaDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TFrmAtualizaDB = class(TForm)
    Panel1: TPanel;
    s: TPanel;
    Image1: TImage;
    Label1: TLabel;
    ChkConexao: TCheckBox;
    ChkCategorias: TCheckBox;
    ChkProdutos: TCheckBox;
    ChkClientes: TCheckBox;
    ChkVendas: TCheckBox;
    ChkItensVendas: TCheckBox;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualizaDB: TFrmAtualizaDB;

implementation

{$R *.dfm}

end.

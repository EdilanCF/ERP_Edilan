unit uSelecionarData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  RxToolEdit, Vcl.Buttons, system.DateUtils, Vcl.ExtCtrls;

type
  TFrmSelecionarData = class(TForm)
    edtDataInicial: TDateEdit;
    EdtDataFinal: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelecionarData: TFrmSelecionarData;

implementation

{$R *.dfm}

procedure TFrmSelecionarData.BitBtn1Click(Sender: TObject);
begin

    if (edtDatafinal.Date)<(edtDataInicial.Date) then begin
     MessageDlg('Data inicial não pode ser maior que a data final', mtInformation, [mbok], 0);
     edtDataInicial.SetFocus;
     abort;
    end;

    if (edtDataInicial.date = 0) or (EdtDataFinal.date = 0) then begin
      MessageDlg('Data Inicial e Final são campos obrigatórios', mtInformation, [mbok], 0);
      edtDataInicial.SetFocus;
      abort;
    end;

    Close;
end;

procedure TFrmSelecionarData.FormShow(Sender: TObject);
begin
   edtDataInicial.Date := StartOfTheMonth(date);
   EdtDataFinal.Date := EndOfTheMonth(date);
end;

end.

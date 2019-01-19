unit UnCadastrarProcedente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmCadastrarProcedente = class(TForm)
    PaConteudo: TPanel;
    LblNome: TLabel;
    CpoNome: TEdit;
    BtnSalvar: TButton;
    BtnFechar: TButton;
    QrProcedente: TFDQuery;
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastrarProcedente: TFrmCadastrarProcedente;

implementation

{$R *.dfm}

uses
  DmConn;

procedure TFrmCadastrarProcedente.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastrarProcedente.BtnSalvarClick(Sender: TObject);
begin
  QrProcedente.Close;
  QrProcedente.SQL.Text :=
    'INSERT INTO procedente (NOME) '+
    '                VALUES (:NOME)';
  QrProcedente.ParamByName('NOME').AsString := CpoNome.Text;
  try
    QrProcedente.ExecSQL;
    Application.MessageBox('Procedente salvo com sucesso !','Information',MB_OK or MB_IconInformation);
    CpoNome.Clear;
  except
    Application.MessageBox('Não foi possível salvar !','Information',MB_OK or MB_IconInformation);
  end;
  CpoNome.SetFocus;
end;

end.

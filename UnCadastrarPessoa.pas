unit UnCadastrarPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, Data.DBXMySQL, Data.FMTBcd, FireDAC.Phys.MSAccDef,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSAcc,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmCadastrarPessoa = class(TForm)
    PaConteudo: TPanel;
    LblNome: TLabel;
    CpoNome: TEdit;
    BtnSalvar: TButton;
    BtnFechar: TButton;
    QrPessoa: TFDQuery;
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastrarPessoa: TFrmCadastrarPessoa;

implementation

{$R *.dfm}

uses
  DmConn;

procedure TFrmCadastrarPessoa.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastrarPessoa.BtnSalvarClick(Sender: TObject);
begin
  QrPessoa.Close;
  QrPessoa.SQL.Text :=
    'INSERT INTO pessoa (NOME) '+
    '            VALUES (:NOME)';
  QrPessoa.ParamByName('NOME').AsString := CpoNome.Text;
  try
    QrPessoa.ExecSQL;
    Application.MessageBox('Pessoa salva com sucesso !','Information',MB_OK or MB_IconInformation);
    CpoNome.Clear;
  except
    Application.MessageBox('Não foi possível salvar !','Information',MB_OK or MB_IconInformation);
  end;
  CpoNome.SetFocus;
end;

end.

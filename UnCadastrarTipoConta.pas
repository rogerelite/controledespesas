unit UnCadastrarTipoConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmCadastrarTipoConta = class(TForm)
    PaConteudo: TPanel;
    LblNome: TLabel;
    CpoNome: TEdit;
    BtnSalvar: TButton;
    BtnFechar: TButton;
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastrarTipoConta: TFrmCadastrarTipoConta;

implementation

{$R *.dfm}

uses
  DmConn;

procedure TFrmCadastrarTipoConta.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastrarTipoConta.BtnSalvarClick(Sender: TObject);
var InsSQL : String;
begin
  DataModule1.QrTipoConta.SQL.Clear;
  InsSQL := ('INSERT INTO contatipo (NOME) VALUES ('+ QuotedStr(CpoNome.Text) +')');
  DataModule1.QrTipoConta.SQL.Add(InsSQL);
  try
    DataModule1.QrTipoConta.ExecSQL;
    Application.MessageBox('Tipo de conta salva com sucesso !','Information',MB_OK or MB_IconInformation);
    CpoNome.Clear;
  except
    Application.MessageBox('Não foi possível salvar !','Information',MB_OK or MB_IconInformation);
  end;
  CpoNome.SetFocus;
end;

end.

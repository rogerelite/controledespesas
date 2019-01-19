unit UnConfigurarTipoConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmConfigurarTipoConta = class(TForm)
    PaConteudo: TPanel;
    BtnBuscar: TButton;
    CpoId: TEdit;
    CpoNome: TEdit;
    BtnSalvar: TButton;
    BtnExcluir: TButton;
    BtnFechar: TButton;
    QrTipoConta: TFDQuery;
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfigurarTipoConta: TFrmConfigurarTipoConta;
  bAbriuPorConfigurar : boolean;

implementation

{$R *.dfm}

uses UnConsultaTipoConta;

procedure TFrmConfigurarTipoConta.BtnBuscarClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFrmConsultaTipoConta, FrmConsultaTipoConta);
    bAbriuPorConfigurar := True;
    FrmConsultaTipoConta.ShowModal;
  finally
    FreeAndNil(FrmConsultaTipoConta);
  end;
end;

procedure TFrmConfigurarTipoConta.BtnExcluirClick(Sender: TObject);
begin
  QrTipoConta.Close;
  QrTipoConta.SQL.Text :=
    ' DELETE FROM contatipo               '+
    '  WHERE ID_CONTATIPO = :ID_CONTATIPO ';
  QrTipoConta.ParamByName('ID_CONTATIPO').AsInteger := StrToInt(CpoId.Text);
  try
    QrTipoConta.ExecSQL;
    Application.MessageBox('Pessoa removida com sucesso !','Information',MB_OK or MB_IconInformation);
    CpoId.Clear;
    CpoNome.Clear;
  except
    Application.MessageBox('Não foi possível remover !','Information',MB_OK or MB_IconInformation);
  end;
end;

procedure TFrmConfigurarTipoConta.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfigurarTipoConta.BtnSalvarClick(Sender: TObject);
begin
  QrTipoConta.Close;
  QrTipoConta.SQL.Text :=
    ' UPDATE contatipo                    '+
    '    SET NOME = :NOME                 '+
    '  WHERE ID_CONTATIPO = :ID_CONTATIPO ';
  QrTipoConta.ParamByName('NOME').AsString          := CpoNome.Text;
  QrTipoConta.ParamByName('ID_CONTATIPO').AsInteger := StrToInt(CpoId.Text);
  try
    QrTipoConta.ExecSQL;
    Application.MessageBox('Tipo de conta salva com sucesso !','Information',MB_OK or MB_IconInformation);
    CpoId.Clear;
    CpoNome.Clear;
  except
    Application.MessageBox('Não foi possível salvar !','Information',MB_OK or MB_IconInformation);
  end;
end;

procedure TFrmConfigurarTipoConta.FormShow(Sender: TObject);
begin
  CpoId.Enabled := False;
end;

end.

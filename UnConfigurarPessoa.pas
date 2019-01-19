unit UnConfigurarPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmConfigurarPessoa = class(TForm)
    PaConteudo: TPanel;
    BtnExcluir: TButton;
    BtnFechar: TButton;
    BtnBuscar: TButton;
    CpoNome: TEdit;
    CpoId: TEdit;
    QrPessoa: TFDQuery;
    BtnSalvar: TButton;
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfigurarPessoa: TFrmConfigurarPessoa;
  bAbriuPorConfigurar : boolean;

implementation

{$R *.dfm}

uses
  DmConn, UnConsultaPessoa;

procedure TFrmConfigurarPessoa.BtnBuscarClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFrmConsultaPessoa, FrmConsultaPessoa);
    bAbriuPorConfigurar := True;
    FrmConsultaPessoa.ShowModal;
  finally
    FreeAndNil(FrmConsultaPessoa);
  end;
end;

procedure TFrmConfigurarPessoa.BtnExcluirClick(Sender: TObject);
begin
  QrPessoa.Close;
  QrPessoa.SQL.Text :=
    ' DELETE FROM pessoa            '+
    '  WHERE ID_PESSOA = :ID_PESSOA ';
  QrPessoa.ParamByName('ID_PESSOA').AsInteger := StrToInt(CpoId.Text);
  try
    QrPessoa.ExecSQL;
    Application.MessageBox('Pessoa removida com sucesso !','Information',MB_OK or MB_IconInformation);
    CpoId.Clear;
    CpoNome.Clear;
  except
    Application.MessageBox('Não foi possível remover !','Information',MB_OK or MB_IconInformation);
  end;
end;

procedure TFrmConfigurarPessoa.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfigurarPessoa.BtnSalvarClick(Sender: TObject);
begin
  QrPessoa.Close;
  QrPessoa.SQL.Text :=
    ' UPDATE pessoa                 '+
    '    SET NOME = :NOME           '+
    '  WHERE ID_PESSOA = :ID_PESSOA ';
  QrPessoa.ParamByName('NOME').AsString       := CpoNome.Text;
  QrPessoa.ParamByName('ID_PESSOA').AsInteger := StrToInt(CpoId.Text);
  try
    QrPessoa.ExecSQL;
    Application.MessageBox('Pessoa alterada com sucesso !','Information',MB_OK or MB_IconInformation);
    CpoId.Clear;
    CpoNome.Clear;
  except
    Application.MessageBox('Não foi possível alterar !','Information',MB_OK or MB_IconInformation);
  end;
end;

procedure TFrmConfigurarPessoa.FormShow(Sender: TObject);
begin
  CpoId.Enabled := False;
end;

end.

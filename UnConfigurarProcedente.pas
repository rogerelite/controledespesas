unit UnConfigurarProcedente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmConfigurarProcedente = class(TForm)
    PaConteudo: TPanel;
    BtnExcluir: TButton;
    BtnFechar: TButton;
    BtnBuscar: TButton;
    CpoNome: TEdit;
    CpoId: TEdit;
    BtnSalvar: TButton;
    QrProcedente: TFDQuery;
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    procedure FormShow(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfigurarProcedente: TFrmConfigurarProcedente;
  bAbriuPorConfigurar : boolean;

implementation

{$R *.dfm}

uses
  DmConn, UnConsultaProcedente, UnConsultaPessoa;

procedure TFrmConfigurarProcedente.FormShow(Sender: TObject);
begin
  CpoId.Enabled := False;
end;

procedure TFrmConfigurarProcedente.BtnBuscarClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFrmConsultaProcedente, FrmConsultaProcedente);
    bAbriuPorConfigurar := True;
    FrmConsultaProcedente.ShowModal;
  finally
    FreeAndNil(FrmConsultaProcedente);
  end;
end;

procedure TFrmConfigurarProcedente.BtnExcluirClick(Sender: TObject);
begin
  QrProcedente.Close;
  QrProcedente.SQL.Text :=
    ' DELETE FROM procedente                '+
    '  WHERE ID_PROCEDENTE = :ID_PROCEDENTE ';
  QrProcedente.ParamByName('ID_PROCEDENTE').AsInteger := StrToInt(CpoId.Text);
  try
    QrProcedente.ExecSQL;
    Application.MessageBox('Procedente removido com sucesso !','Information',MB_OK or MB_IconInformation);
    CpoId.Clear;
    CpoNome.Clear;
  except
    Application.MessageBox('Não foi possível remover !','Information',MB_OK or MB_IconInformation);
  end;
end;

procedure TFrmConfigurarProcedente.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfigurarProcedente.BtnSalvarClick(Sender: TObject);
begin
  QrProcedente.Close;
  QrProcedente.SQL.Text :=
    ' UPDATE procedente                     '+
    '    SET NOME = :NOME                   '+
    '  WHERE ID_PROCEDENTE = :ID_PROCEDENTE ';
  QrProcedente.ParamByName('NOME').AsString           := CpoNome.Text;
  QrProcedente.ParamByName('ID_PROCEDENTE').AsInteger := StrToInt(CpoId.Text);
  try
    QrProcedente.ExecSQL;
    Application.MessageBox('Procedente alterado com sucesso !','Information',MB_OK or MB_IconInformation);
    CpoId.Clear;
    CpoNome.Clear;
  except
    Application.MessageBox('Não foi possível alterar !','Information',MB_OK or MB_IconInformation);
  end;
end;

end.

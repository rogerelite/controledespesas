unit UnConsultaProcedente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TFrmConsultaProcedente = class(TForm)
    PaConteudo: TPanel;
    GrdConsultaProcedentes: TDBGrid;
    DsConsultaProcedentes: TDataSource;
    QrConsultaProcedentes: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure GrdConsultaProcedentesDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaProcedente: TFrmConsultaProcedente;

implementation

{$R *.dfm}

uses
  DmConn, UnMenu, UnCadastrarConta, UnConfigurarProcedente;

procedure TFrmConsultaProcedente.FormShow(Sender: TObject);
begin
  QrConsultaProcedentes.Close;
  QrConsultaProcedentes.SQL.Text :=
    'SELECT * FROM procedente';
  QrConsultaProcedentes.Open;
end;

procedure TFrmConsultaProcedente.GrdConsultaProcedentesDblClick(Sender: TObject);
var
  sId, sNome : String;
begin
  sId   := GrdConsultaProcedentes.Columns.Items[0].Field.Text;
  sNome := GrdConsultaProcedentes.Columns.Items[1].Field.Text;

  if (bAbriuPorCadastrarConta) then
  begin
    FrmCadastrarConta.CpoIdProcedente.Text := sId;
    FrmCadastrarConta.CpoProcedente.Text   := sNome;
    bAbriuPorCadastrarConta                := False;
  end
  else if (UnConfigurarProcedente.bAbriuPorConfigurar) then
  begin
    FrmConfigurarProcedente.CpoId.Text         := sId;
    FrmConfigurarProcedente.CpoNome.Text       := sNome;
    UnConfigurarProcedente.bAbriuPorConfigurar := False;
  end;
  Close;
end;

end.

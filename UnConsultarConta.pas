unit UnConsultarConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TFrmConsultarConta = class(TForm)
    PaConteudo: TPanel;
    GrdConsultaConta: TDBGrid;
    DsConsultaConta: TDataSource;
    QrConsultaConta: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure GrdConsultaContaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarConta: TFrmConsultarConta;

implementation

{$R *.dfm}
uses
  UnCadastrarConta;

procedure TFrmConsultarConta.FormShow(Sender: TObject);
begin
  QrConsultaConta.Close;
  QrConsultaConta.SQL.Text :=
    ' SELECT ID_CONTA, '+
    '        DESCRICAO '+
    '   FROM conta     ';
  QrConsultaConta.Open;
end;

procedure TFrmConsultarConta.GrdConsultaContaDblClick(Sender: TObject);
var
  sId,
  sDescricao : String;
begin
  sId        := GrdConsultaConta.Columns.Items[0].Field.Text;
  sDescricao := GrdConsultaConta.Columns.Items[1].Field.Text;
  if (UnCadastrarConta.bAbriuPorCadastrarConta) then
  begin
    FrmCadastrarConta.CpoIdConta.Text        := sId;
    FrmCadastrarConta.CpoDescricaoConta.Text := sDescricao;
    FrmCadastrarConta.CpoIdContaExit(Sender);
    UnCadastrarConta.bAbriuPorCadastrarConta := False;
  end;
  QrConsultaConta.Close;
  Close;
end;

end.

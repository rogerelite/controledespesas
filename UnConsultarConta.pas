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
    QrSelecionaConta: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure GrdConsultaContaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sIdConta : String;
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
begin
  sIdConta   := GrdConsultaConta.Columns.Items[0].Field.Text;

  QrSelecionaConta.Close;
  QrSelecionaConta.SQL.Text :=
    ' SELECT *                    '+
    '   FROM conta                '+
    '  WHERE ID_CONTA = :ID_CONTA ';
  QrSelecionaConta.ParamByName('ID_CONTA').AsString := sIdConta;
  QrSelecionaConta.Close;
  QrSelecionaConta.Open;

  if (UnCadastrarConta.bAbriuPorCadastrarConta) then
  begin
    FrmCadastrarConta.CpoIdConta.Text        := sIdConta;
    FrmCadastrarConta.CpoDescricaoConta.Text := QrSelecionaConta.FieldByName('DESCRICAO').AsString;
    FrmCadastrarConta.CpoValorConta.Text     := QrSelecionaConta.FieldByName('VALOR').AsString;
    FrmCadastrarConta.CpoIdContaExit(Sender);
    UnCadastrarConta.bAbriuPorCadastrarConta := False;
  end;
  QrConsultaConta.Close;
  QrSelecionaConta.Close;
  Close;
end;

end.

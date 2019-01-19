unit UnConsultaTipoConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TFrmConsultaTipoConta = class(TForm)
    PaConteudo: TPanel;
    GrdConsultaPessoas: TDBGrid;
    DsConsultaTipoConta: TDataSource;
    QrTipoConta: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure GrdConsultaPessoasDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    bAbriuPorCadastroConta : boolean;
  end;

var
  FrmConsultaTipoConta: TFrmConsultaTipoConta;
  sId, sTipoConta : String;

implementation

uses
  DmConn, UnMenu, UnCadastrarConta, UnConfigurarTipoConta;

{$R *.dfm}

procedure TFrmConsultaTipoConta.FormShow(Sender: TObject);
begin
  QrTipoConta.Close;
  QrTipoConta.SQL.Text :=
    'SELECT * FROM contatipo';
  QrTipoConta.Open;
end;

procedure TFrmConsultaTipoConta.GrdConsultaPessoasDblClick(Sender: TObject);
begin
  sId        := GrdConsultaPessoas.Columns.Items[0].Field.Text;
  sTipoConta := GrdConsultaPessoas.Columns.Items[1].Field.Text;

  if (bAbriuPorCadastroConta) then
  begin
    FrmCadastrarConta.CpoIdTipoConta.Text := sId;
    FrmCadastrarConta.CpoTipoConta.Text   := sTipoConta;
    bAbriuPorCadastroConta                := False;
  end
  else if (UnConfigurarTipoConta.bAbriuPorConfigurar) then
  begin
    FrmConfigurarTipoConta.CpoId.Text := sId;
    FrmConfigurarTipoConta.CpoNome.Text   := sTipoConta;
    UnConfigurarTipoConta.bAbriuPorConfigurar  := False;
  end;

  Close;
end;

end.

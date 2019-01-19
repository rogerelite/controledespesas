unit UnConsultaPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.DBClient;

type
  TFrmConsultaPessoa = class(TForm)
    PaConteudo: TPanel;
    GrdConsultaPessoas: TDBGrid;
    DsConsultaPessoas: TDataSource;
    QrConsultaPessoas: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure GrdConsultaPessoasDblClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  FrmConsultaPessoa: TFrmConsultaPessoa;

implementation

{$R *.dfm}

uses
  DmConn, UnMenu, UnCadastrarConta, UnConfigurarPessoa;

procedure TFrmConsultaPessoa.FormShow(Sender: TObject);
begin
  QrConsultaPessoas.Close;
  QrConsultaPessoas.SQL.Text :=
    'SELECT * FROM pessoa';
  QrConsultaPessoas.Open;

end;

procedure TFrmConsultaPessoa.GrdConsultaPessoasDblClick(Sender: TObject);
var
  sId, sNome : String;
begin
  sId   := GrdConsultaPessoas.Columns.Items[0].Field.Text;
  sNome := GrdConsultaPessoas.Columns.Items[1].Field.Text;
  if (UnMenu.bAbriuPorMenu) then
  begin
    FrmMenu.EdtId.Text   := sId;
    FrmMenu.EdtNome.Text := sNome;
    bAbriuPorMenu        := False
  end
  else if (bAbriuPorCadastroConta) then
  begin
    FrmCadastrarConta.CpoIdTitular.Text := sId;
    FrmCadastrarConta.CpoNome.Text      := sNome;
    bAbriuPorCadastroConta              := False;
  end
  else if (UnConfigurarPessoa.bAbriuPorConfigurar) then
  begin
    FrmConfigurarPessoa.CpoId.Text         := sId;
    FrmConfigurarPessoa.CpoNome.Text       := sNome;
    UnConfigurarPessoa.bAbriuPorConfigurar := False;
  end;
  Close;
end;

end.

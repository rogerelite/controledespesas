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
    GrdConsultaPessoas: TDBGrid;
    DsConsultaConta: TDataSource;
    QrConsultaConta: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarConta: TFrmConsultarConta;

implementation

{$R *.dfm}

end.

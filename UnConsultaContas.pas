unit UnConsultaContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFrmConsultaContas = class(TForm)
    PaConteudo: TPanel;
    GrdConsultaPessoas: TDBGrid;
    CdsGrade: TClientDataSet;
    CdsGradeNUM_PARCELA: TIntegerField;
    CdsGradeTIPO_CONTA: TStringField;
    CdsGradeVALOR: TCurrencyField;
    CdsGradeDESCRICAO: TStringField;
    CdsGradePAGO: TStringField;
    CdsGradeVENCIMENTO: TStringField;
    CdsGradeID_PARCELA: TIntegerField;
    QrGrade: TFDQuery;
    DsGrade: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaContas: TFrmConsultaContas;

implementation

{$R *.dfm}

end.

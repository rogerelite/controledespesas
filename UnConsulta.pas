unit UnConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmConsulta = class(TForm)
    PaConteudo: TPanel;
    LblPessoa: TLabel;
    CBNome: TComboBox;
    LblSalario: TLabel;
    EdtSalario: TEdit;
    LblData: TLabel;
    LblMes: TLabel;
    CBMes: TComboBox;
    DBGrdContas: TDBGrid;
    GBFiltro: TGroupBox;
    ChkListarAtrasadas: TCheckBox;
    ChkListarEmDia: TCheckBox;
    ChkListarPagas: TCheckBox;
    GBTotais: TGroupBox;
    LblSaldo: TLabel;
    LblValorSaldo: TLabel;
    LblTotalContas: TLabel;
    LblValorContas: TLabel;
    LblTotalAtrasadas: TLabel;
    LblValorAtrasadas: TLabel;
    LblTotalEmDia: TLabel;
    LblValorEmDia: TLabel;
    LblTotalPagas: TLabel;
    LblValorPagas: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsulta: TFrmConsulta;

implementation

{$R *.dfm}

procedure TFrmConsulta.FormShow(Sender: TObject);
begin
  LblData.Caption := DateToStr(Date);
end;

end.

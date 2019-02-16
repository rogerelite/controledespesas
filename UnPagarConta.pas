unit UnPagarConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmPagarConta = class(TForm)
    PaConteudo: TPanel;
    LblDescricao: TLabel;
    CpoDescricao: TEdit;
    BtnPagar: TButton;
    BtnFechar: TButton;
    LblValor: TLabel;
    CpoValor: TEdit;
    LblVencimentoLuz: TLabel;
    CpoVencimento: TDateTimePicker;
    CpoIdParcela: TEdit;
    QrPagarConta: TFDQuery;
    LblDataPagamento: TLabel;
    CpoDataPagemento: TDateTimePicker;
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnPagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPagarConta: TFrmPagarConta;

implementation

{$R *.dfm}

procedure TFrmPagarConta.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPagarConta.BtnPagarClick(Sender: TObject);
begin
  QrPagarConta.Close;
  QrPagarConta.SQL.Text :=
    ' UPDATE parcela                  '+
    '    SET PAGO = ''S'',            '+
    '        PAGAMENTO = :PAGAMENTO   '+
    '  WHERE ID_PARCELA = :ID_PARCELA ';
  QrPagarConta.ParamByName('ID_PARCELA').AsInteger := StrToInt(CpoIdParcela.Text);
  QrPagarConta.ParamByName('PAGAMENTO').AsDate     := CpoDataPagemento.Date;
  QrPagarConta.ExecSQL;
  BtnFecharClick(Sender);
end;

procedure TFrmPagarConta.FormShow(Sender: TObject);
begin
  CpoDataPagemento.Date := Date;
end;

end.

unit UnConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.DBClient, Vcl.Samples.Spin, Vcl.ComCtrls, System.DateUtils;

type
  TFrmConsulta = class(TForm)
    PaConteudo: TPanel;
    LblSalario: TLabel;
    LblData: TLabel;
    LblMes: TLabel;
    CpoMes: TComboBox;
    GBFiltro: TGroupBox;
    CpoAtrasadas: TCheckBox;
    CpoEmDia: TCheckBox;
    CpoPagas: TCheckBox;
    grpGbTotais: TGroupBox;
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
    CdsGrade: TClientDataSet;
    CdsGradeNUM_PARCELA: TIntegerField;
    CdsGradeTIPO_CONTA: TStringField;
    CdsGradeVALOR: TCurrencyField;
    CdsGradeDESCRICAO: TStringField;
    CdsGradeVENCIMENTO: TDateField;
    CdsGradePAGO: TStringField;
    QrGrade: TFDQuery;
    DsGrade: TDataSource;
    BtnBuscar: TButton;
    CpoNome: TEdit;
    CpoIdNome: TEdit;
    GrdContas: TDBGrid;
    BtnConsultar: TButton;
    CpoSalario: TEdit;
    QrConsulta: TFDQuery;
    CpoNumeroMes: TEdit;
    grpGbFixas: TGroupBox;
    GbAgua: TGroupBox;
    LblValorAgua: TLabel;
    CpoValorAgua: TEdit;
    GbLuz: TGroupBox;
    LblValorLuz: TLabel;
    LblVencimentoLuz: TLabel;
    CpoValorLuz: TEdit;
    GbInternet: TGroupBox;
    LblValorInternet: TLabel;
    CpoValorInternet: TEdit;
    CpoVencimentoLuz: TDateTimePicker;
    LblVencimentoAgua: TLabel;
    CpoVencimentoAgua: TDateTimePicker;
    LblVencimentoInternet: TLabel;
    CpoVencimentoInternet: TDateTimePicker;
    BtnLimpar: TButton;
    LblAno: TLabel;
    CpoAno: TSpinEdit;
    LblValorAnteriorLuz: TLabel;
    LblVencAnteriorLuz: TLabel;
    LblValorAnteriorAgua: TLabel;
    LblVencAnteriorAgua: TLabel;
    LblVencAnteriorInternet: TLabel;
    LblValorAnteriorInternet: TLabel;
    QrCadastra: TFDQuery;
    BtnSalvarLuz: TButton;
    BtnSalvarAgua: TButton;
    BtnSalvarInternet: TButton;
    procedure FormShow(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure CpoMesClick(Sender: TObject);
    procedure ConsultaContasFixas(Sender: TObject);
  private
    function CalculaSaldo: Currency;
    function CalculaTotalContas: Currency;
    procedure CadastraContasFixas(Sender: TObject);

  public

  end;

var
  FrmConsulta: TFrmConsulta;
  bAbriuPorConsulta : boolean;

implementation

{$R *.dfm}

uses UnConsultaPessoa;

procedure TFrmConsulta.BtnBuscarClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFrmConsultaPessoa, FrmConsultaPessoa);
    bAbriuPorConsulta := True;
    FrmConsultaPessoa.ShowModal;
  finally
    FreeAndNil(FrmConsultaPessoa);
  end;
end;

procedure TFrmConsulta.BtnConsultarClick(Sender: TObject);
begin
  //CalculaTotalContas;

  QrConsulta.Close;
  QrConsulta.SQL.Text :=
    ' SELECT *                        '+
    '   FROM contafixa                '+
    '  WHERE MONTH(VENCIMENTO) = :MES '+
    '    AND YEAR(VENCIMENTO) = :ANO  ';
  QrConsulta.ParamByName('MES').AsInteger := StrToInt(CpoNumeroMes.Text);
  QrConsulta.ParamByName('ANO').AsInteger := StrToInt(CpoAno.Text);
  QrConsulta.Open;

  if (QrConsulta.IsEmpty) then
  begin
    CpoValorLuz.Visible              := True;
    CpoVencimentoLuz.Visible         := True;
    LblValorAnteriorLuz.Visible      := False;
    LblVencAnteriorLuz.Visible       := False;
    CpoValorAgua.Visible             := True;
    CpoVencimentoAgua.Visible        := True;
    LblValorAnteriorAgua.Visible     := False;
    LblVencAnteriorAgua.Visible      := False;
    CpoValorInternet.Visible         := True;
    CpoVencimentoInternet.Visible    := True;
    LblValorAnteriorInternet.Visible := False;
    LblVencAnteriorInternet.Visible  := False;
    QrConsulta.Close;
    CadastraContasFixas(Sender);
  end
  else
  begin
    ConsultaContasFixas(Sender);
  end;
  //CalculaSaldo;
end;

function TFrmConsulta.CalculaSaldo : Currency;
var
  cSalario, cTotalContas : Currency;
begin
  cSalario     := StrToCurr(CpoSalario.Text);
  cTotalContas := StrToCurr(LblValorContas.Caption);

  LblValorSaldo.Caption := CurrToStr(cSalario - cTotalContas);
end;

function TFrmConsulta.CalculaTotalContas : Currency;
begin

end;

procedure TFrmConsulta.ConsultaContasFixas(Sender: TObject);
begin
  LblValorAnteriorLuz.Visible := True;
  LblVencAnteriorLuz.Visible  := True;
  QrConsulta.Close;
  QrConsulta.SQL.Text :=
    ' SELECT *                        '+
    '   FROM contafixa                '+
    '  WHERE MONTH(VENCIMENTO) = :MES '+
    '    AND YEAR(VENCIMENTO) = :ANO  '+
    '    AND NOME = ''Luz''           ';
  QrConsulta.ParamByName('MES').AsInteger := StrToInt(CpoNumeroMes.Text);
  QrConsulta.ParamByName('ANO').AsInteger := StrToInt(CpoAno.Text);
  QrConsulta.Open;
  LblValorAnteriorLuz.Caption := CurrToStr(QrConsulta.FieldByName('VALOR').AsCurrency);
  LblVencAnteriorLuz.Caption  := QrConsulta.FieldByName('VENCIMENTO').AsString;
  CpoValorLuz.Visible         := False;
  CpoVencimentoLuz.Visible    := False;
  LblValorAnteriorLuz.Visible := True;
  QrConsulta.Close;

  LblValorAnteriorAgua.Visible := True;
  LblVencAnteriorAgua.Visible  := True;
  QrConsulta.Close;
  QrConsulta.SQL.Text :=
    ' SELECT *                        '+
    '   FROM contafixa                '+
    '  WHERE MONTH(VENCIMENTO) = :MES '+
    '    AND YEAR(VENCIMENTO) = :ANO  '+
    '    AND NOME = ''Agua''          ';
  QrConsulta.ParamByName('MES').AsInteger := StrToInt(CpoNumeroMes.Text);
  QrConsulta.ParamByName('ANO').AsInteger := StrToInt(CpoAno.Text);
  QrConsulta.Open;
  LblValorAnteriorAgua.Caption := CurrToStr(QrConsulta.FieldByName('VALOR').AsCurrency);
  LblVencAnteriorAgua.Caption  := QrConsulta.FieldByName('VENCIMENTO').AsString;
  CpoValorAgua.Visible         := False;
  CpoVencimentoAgua.Visible    := False;
  LblValorAnteriorAgua.Visible := True;
  QrConsulta.Close;

  LblValorAnteriorInternet.Visible := True;
  LblVencAnteriorInternet.Visible  := True;
  QrConsulta.Close;
  QrConsulta.SQL.Text :=
    ' SELECT *                        '+
    '   FROM contafixa                '+
    '  WHERE MONTH(VENCIMENTO) = :MES '+
    '    AND YEAR(VENCIMENTO) = :ANO  '+
    '    AND NOME = ''Internet''      ';
  QrConsulta.ParamByName('MES').AsInteger := StrToInt(CpoNumeroMes.Text);
  QrConsulta.ParamByName('ANO').AsInteger := StrToInt(CpoAno.Text);
  QrConsulta.Open;
  LblValorAnteriorInternet.Caption := CurrToStr(QrConsulta.FieldByName('VALOR').AsCurrency);
  LblVencAnteriorInternet.Caption  := QrConsulta.FieldByName('VENCIMENTO').AsString;
  CpoValorInternet.Visible         := False;
  CpoVencimentoInternet.Visible    := False;
  LblValorAnteriorInternet.Visible := True;
  QrConsulta.Close;
end;

procedure TFrmConsulta.CadastraContasFixas(Sender: TObject);
begin
  QrCadastra.Close;
  QrCadastra.SQL.Text :=
    ' INSERT INTO contafixa (NOME,        '+
    '                        VALOR,       '+
    '                        VENCIMENTO,  '+
    '                        PAGO)        '+
    '                VALUES (:NOME,       '+
    '                        :VALOR,      '+
    '                        :VENCIMENTO, '+
    '                        :PAGO)       ';
  QrCadastra.ParamByName('NOME').AsString       := ;
  QrCadastra.ParamByName('VALOR').AsCurrency    := CpoValorLuz.Text;
  QrCadastra.ParamByName('VENCIMENTO').AsString := DateToStr(CpoVencimentoLuz.Date);
  QrCadastra.ParamByName('PAGO').AsString       := 'N';
end;

procedure TFrmConsulta.CpoMesClick(Sender: TObject);
begin
  case CpoMes.ItemIndex of
    0:begin
        CpoNumeroMes.Text := '1';
      end;
    1:begin
        CpoNumeroMes.Text := '2';
      end;
    2:begin
        CpoNumeroMes.Text := '3';
      end;
    3:begin
        CpoNumeroMes.Text := '4';
      end;
    4:begin
        CpoNumeroMes.Text := '5';
      end;
    5:begin
        CpoNumeroMes.Text := '6';
      end;
    6:begin
        CpoNumeroMes.Text := '7';
      end;
    7:begin
        CpoNumeroMes.Text := '8';
      end;
    8:begin
        CpoNumeroMes.Text := '9';
      end;
    9:begin
        CpoNumeroMes.Text := '10';
      end;
    10:begin
         CpoNumeroMes.Text := '11';
       end;
    11:begin
         CpoNumeroMes.Text := '12';
       end;
  end;
end;

procedure TFrmConsulta.FormShow(Sender: TObject);
begin
  LblData.Caption                  := DateToStr(Date);
  CpoAno.Value                     := YearOf(StrToDate(LblData.Caption));
  LblValorAnteriorLuz.Visible      := False;
  LblVencAnteriorLuz.Visible       := False;
  LblValorAnteriorAgua.Visible     := False;
  LblVencAnteriorAgua.Visible      := False;
  LblValorAnteriorInternet.Visible := False;
  LblVencAnteriorInternet.Visible  := False;
end;

end.

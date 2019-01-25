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
    CpoIdPessoa: TEdit;
    GrdContas: TDBGrid;
    BtnConsultar: TButton;
    CpoSalario: TEdit;
    QrConsulta: TFDQuery;
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
    QrCadastra: TFDQuery;
    BtnSalvarLuz: TButton;
    BtnSalvarAgua: TButton;
    BtnSalvarInternet: TButton;
    CpoMes: TSpinEdit;
    QrFixas: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure ConsultaContasFixas(Sender: TObject);
    procedure BtnSalvarLuzClick(Sender: TObject);
    procedure BtnSalvarAguaClick(Sender: TObject);
    procedure BtnSalvarInternetClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
  private
    function CalculaSaldo: Currency;
    function CalculaTotalContas: Currency;
    procedure ConsultaContas(Sender: TObject);
    procedure LimparCampos(Sender: TObject);

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
var
  bLuz, bAgua, bInternet : Boolean;
begin
  if (CpoNome.Text = '') then
  begin
    ShowMessage('Selecione uma pessoa.');
    Abort;
  end;
  if (CpoMes.Value = 0) then
  begin
    ShowMessage('Digite o mês.');
    Abort;
  end;
  if (CpoAno.Value = 0) then
  begin
    ShowMessage('Digite o ano.');
    Abort;
  end;

  bLuz      := False;
  bAgua     := False;
  bInternet := False;

  QrFixas.Close;
  QrFixas.SQL.Text :=
    ' SELECT *                        '+
    '   FROM contafixa                '+
    '  WHERE MONTH(VENCIMENTO) = :MES '+
    '    AND YEAR(VENCIMENTO) = :ANO  ';
  QrFixas.ParamByName('MES').AsInteger := StrToInt(CpoMes.Text);
  QrFixas.ParamByName('ANO').AsInteger := StrToInt(CpoAno.Text);
  QrFixas.Open;

  while not QrFixas.EoF do
  begin
    if (QrFixas.FieldByName('NOME').AsString = 'Luz') then
    begin
      bLuz := True;
    end;
    if (QrFixas.FieldByName('NOME').AsString = 'Água') then
    begin
      bAgua := True;
    end;
    if (QrFixas.FieldByName('NOME').AsString = 'Internet') then
    begin
      bInternet := True;
    end;
    QrFixas.Next;
  end;

  if (bLuz) then
  begin
    CpoValorLuz.Enabled      := False;
    CpoVencimentoLuz.Enabled := False;
    BtnSalvarLuz.Enabled     := False;
    ConsultaContasFixas(Sender);
  end
  else
  begin
    CpoValorLuz.Enabled      := True;
    CpoVencimentoLuz.Enabled := True;
    BtnSalvarLuz.Enabled     := True;
  end;

  if (bAgua) then
  begin
    CpoValorAgua.Enabled      := False;
    CpoVencimentoAgua.Enabled := False;
    BtnSalvarAgua.Enabled     := False;
    ConsultaContasFixas(Sender);
  end
  else
  begin
    CpoValorAgua.Enabled      := True;
    CpoVencimentoAgua.Enabled := True;
    BtnSalvarAgua.Enabled     := True;
  end;

  if (bInternet) then
  begin
    CpoValorInternet.Enabled      := False;
    CpoVencimentoInternet.Enabled := False;
    BtnSalvarInternet.Enabled     := False;
    ConsultaContasFixas(Sender);
  end
  else
  begin
    CpoValorInternet.Enabled      := True;
    CpoVencimentoInternet.Enabled := True;
    BtnSalvarInternet.Enabled     := True;
  end;

  QrFixas.Close;
  //CalculaTotalContas;
  //CalculaSaldo;
end;

procedure TFrmConsulta.BtnLimparClick(Sender: TObject);
begin
  LimparCampos(Sender);
  BtnBuscar.SetFocus;
end;

procedure TFrmConsulta.BtnSalvarAguaClick(Sender: TObject);
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
  QrCadastra.ParamByName('NOME').AsString     := 'Água';
  QrCadastra.ParamByName('VALOR').AsCurrency  := StrToCurr(CpoValorAgua.Text);
  QrCadastra.ParamByName('VENCIMENTO').AsDate := CpoVencimentoAgua.Date;
  QrCadastra.ParamByName('PAGO').AsString     := 'N';
  QrCadastra.ExecSQL;
end;

procedure TFrmConsulta.BtnSalvarInternetClick(Sender: TObject);
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
  QrCadastra.ParamByName('NOME').AsString     := 'Luz';
  QrCadastra.ParamByName('VALOR').AsCurrency  := StrToCurr(CpoValorInternet.Text);
  QrCadastra.ParamByName('VENCIMENTO').AsDate := CpoVencimentoInternet.Date;
  QrCadastra.ParamByName('PAGO').AsString     := 'N';
  QrCadastra.ExecSQL;
end;

procedure TFrmConsulta.BtnSalvarLuzClick(Sender: TObject);
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
  QrCadastra.ParamByName('NOME').AsString     := 'Luz';
  QrCadastra.ParamByName('VALOR').AsCurrency  := StrToCurr(CpoValorLuz.Text);
  QrCadastra.ParamByName('VENCIMENTO').AsDate := CpoVencimentoLuz.Date;
  QrCadastra.ParamByName('PAGO').AsString     := 'N';
  QrCadastra.ExecSQL;
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

procedure TFrmConsulta.ConsultaContas(Sender: TObject);
begin
  QrConsulta.Close;
  QrConsulta.SQL.Text :=
    ' SELECT c.*,                                  '+
    '        p.*                                   '+
    '         FROM conta c                         '+
    '   INNER JOIN parcela p                       '+
    '           ON p.ID_CONTA = c.ID_CONTA         '+
    '        WHERE c.ID_PESSOA = :ID_PESSOA        '+
    '          AND MONTH(VENCIMENTO) = :MES        '+
    '          AND YEAR(VENCIMENTO) = :ANO         ';
  QrConsulta.ParamByName('ID_PESSOA').AsInteger := StrToInt(CpoIdPessoa.Text);
  QrConsulta.ParamByName('MES').AsInteger       := CpoMes.Value;
  QrConsulta.ParamByName('ANO').AsInteger       := CpoAno.Value;

end;

procedure TFrmConsulta.ConsultaContasFixas(Sender: TObject);
begin
  QrConsulta.Close;
  QrConsulta.SQL.Text :=
    ' SELECT *                        '+
    '   FROM contafixa                '+
    '  WHERE MONTH(VENCIMENTO) = :MES '+
    '    AND YEAR(VENCIMENTO) = :ANO  '+
    '    AND NOME = ''Luz''           ';
  QrConsulta.ParamByName('MES').AsInteger := StrToInt(CpoMes.Text);
  QrConsulta.ParamByName('ANO').AsInteger := StrToInt(CpoAno.Text);
  QrConsulta.Open;
  if (not QrConsulta.IsEmpty) then
  begin
    CpoValorLuz.Text      := CurrToStr(QrConsulta.FieldByName('VALOR').AsCurrency);
    CpoVencimentoLuz.Date := QrConsulta.FieldByName('VENCIMENTO').AsDateTime;
  end;
  QrConsulta.Close;

  QrConsulta.Close;
  QrConsulta.SQL.Text :=
    ' SELECT *                        '+
    '   FROM contafixa                '+
    '  WHERE MONTH(VENCIMENTO) = :MES '+
    '    AND YEAR(VENCIMENTO) = :ANO  '+
    '    AND NOME = ''Água''          ';
  QrConsulta.ParamByName('MES').AsInteger := StrToInt(CpoMes.Text);
  QrConsulta.ParamByName('ANO').AsInteger := StrToInt(CpoAno.Text);
  QrConsulta.Open;
  if (not QrConsulta.IsEmpty) then
  begin
    CpoValorAgua.Text      := CurrToStr(QrConsulta.FieldByName('VALOR').AsCurrency);
    CpoVencimentoAgua.Date := QrConsulta.FieldByName('VENCIMENTO').AsDateTime;
  end;
  QrConsulta.Close;

  QrConsulta.Close;
  QrConsulta.SQL.Text :=
    ' SELECT *                        '+
    '   FROM contafixa                '+
    '  WHERE MONTH(VENCIMENTO) = :MES '+
    '    AND YEAR(VENCIMENTO) = :ANO  '+
    '    AND NOME = ''Internet''      ';
  QrConsulta.ParamByName('MES').AsInteger := StrToInt(CpoMes.Text);
  QrConsulta.ParamByName('ANO').AsInteger := StrToInt(CpoAno.Text);
  QrConsulta.Open;
  if (not QrConsulta.IsEmpty) then
  begin
    CpoValorInternet.Text      := CurrToStr(QrConsulta.FieldByName('VALOR').AsCurrency);
    CpoVencimentointernet.Date := QrConsulta.FieldByName('VENCIMENTO').AsDateTime;
  end;
  QrConsulta.Close;
end;

procedure TFrmConsulta.FormShow(Sender: TObject);
begin
  LblData.Caption := DateToStr(Date);
  CpoMes.Value    := MonthOf(StrToDate(LblData.Caption));
  CpoAno.Value    := YearOf(StrToDate(LblData.Caption));
end;

procedure TFrmConsulta.LimparCampos(Sender: TObject);
begin
  CpoNome.Clear;
  CpoIdPessoa.Clear;
  CpoSalario.Clear;
  CpoMes.Value                   := MonthOf(StrToDate(LblData.Caption));
  CpoAno.Value                   := YearOf(StrToDate(LblData.Caption));
  CpoAtrasadas.Checked           := False;
  CpoEmDia.Checked               := False;
  CpoPagas.Checked               := False;
  CpoValorLuz.Clear;
  CpoValorAgua.Clear;
  CpoValorInternet.Clear;
  CpoVencimentoLuz.Enabled       := True;
  CpoVencimentoLuz.DateTime      := Date;
  BtnSalvarLuz.Enabled           := True;
  CpoVencimentoAgua.Enabled      := True;
  CpoVencimentoAgua.DateTime     := Date;
  BtnSalvarAgua.Enabled          := True;
  CpoVencimentoInternet.Enabled  := True;
  CpoVencimentoInternet.DateTime := Date;
  BtnSalvarInternet.Enabled      := True;
end;

end.

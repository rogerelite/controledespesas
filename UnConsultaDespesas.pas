unit UnConsultaDespesas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.DBClient, Vcl.Samples.Spin, Vcl.ComCtrls, System.DateUtils,
  Vcl.Mask, Vcl.DBCtrls;

type
  TFrmConsultaDespesas = class(TForm)
    PaConteudo: TPanel;
    LblSalario: TLabel;
    LblData: TLabel;
    LblMes: TLabel;
    LblAno: TLabel;
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
    BtnBuscar: TButton;
    CpoNome: TEdit;
    CpoIdPessoa: TEdit;
    GrdContas: TDBGrid;
    BtnConsultar: TButton;
    grpGbFixas: TGroupBox;
    GbAgua: TGroupBox;
    LblValorAgua: TLabel;
    LblVencimentoAgua: TLabel;
    CpoValorAgua: TEdit;
    CpoVencimentoAgua: TDateTimePicker;
    BtnSalvarAgua: TButton;
    GbLuz: TGroupBox;
    LblValorLuz: TLabel;
    LblVencimentoLuz: TLabel;
    CpoValorLuz: TEdit;
    CpoVencimentoLuz: TDateTimePicker;
    BtnSalvarLuz: TButton;
    GbInternet: TGroupBox;
    LblValorInternet: TLabel;
    LblVencimentoInternet: TLabel;
    CpoValorInternet: TEdit;
    CpoVencimentoInternet: TDateTimePicker;
    BtnSalvarInternet: TButton;
    GroupBox1: TGroupBox;
    LblValorTelefone: TLabel;
    LblVencimentoTelefone: TLabel;
    CpoValorTelefone: TEdit;
    CpoVencimentoTelefone: TDateTimePicker;
    BtnSalvarTelefone: TButton;
    BtnLimpar: TButton;
    CpoAno: TSpinEdit;
    CpoMes: TSpinEdit;
    QrFixas: TFDQuery;
    CdsGrade: TClientDataSet;
    CdsGradeNUM_PARCELA: TIntegerField;
    CdsGradeTIPO_CONTA: TStringField;
    CdsGradeVALOR: TCurrencyField;
    CdsGradeDESCRICAO: TStringField;
    CdsGradePAGO: TStringField;
    CdsGradeVENCIMENTO: TStringField;
    CdsGradeID_PARCELA: TIntegerField;
    QrGrade: TFDQuery;
    QrCadastra: TFDQuery;
    DsGrade: TDataSource;
    QrConsulta: TFDQuery;
    CpoSalario: TEdit;
    procedure BtnBuscarClick(Sender: TObject);
    procedure CpoSalarioClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSalvarAguaClick(Sender: TObject);
    procedure BtnSalvarInternetClick(Sender: TObject);
    procedure BtnSalvarLuzClick(Sender: TObject);
    procedure BtnSalvarTelefoneClick(Sender: TObject);
    procedure GrdContasDblClick(Sender: TObject);
    procedure CpoAtrasadasClick(Sender: TObject);
    procedure CpoEmDiaClick(Sender: TObject);
    procedure CpoPagasClick(Sender: TObject);
  private
    procedure ConsultaContasFixas(Sender: TObject);
    procedure ConsultaContas(Sender: TObject);
    function CalculaTotalContas: Currency;
    function CalculaSaldo: Currency;
    function CalculaTotalFixas: Currency;
    procedure LimparCampos(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaDespesas: TFrmConsultaDespesas;
  bAbriuPorConsultaDespesas : boolean;

implementation

{$R *.dfm}

uses UnConsultaPessoa, UnPagarConta;

procedure TFrmConsultaDespesas.BtnBuscarClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFrmConsultaPessoa, FrmConsultaPessoa);
    bAbriuPorConsultaDespesas := True;
    FrmConsultaPessoa.ShowModal;
  finally
    FreeAndNil(FrmConsultaPessoa);
  end;
end;

procedure TFrmConsultaDespesas.BtnConsultarClick(Sender: TObject);
var
  cTotalContas : Currency;
  bLuz, bAgua, bInternet, bTelefone : Boolean;
begin
  CdsGrade.EmptyDataSet;

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
  bTelefone := False;

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
    if (QrFixas.FieldByName('NOME').AsString = 'Telefone') then
    begin
      bTelefone := True;
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
    CpoValorLuz.Clear;
    CpoValorLuz.Enabled       := True;
    CpoVencimentoLuz.DateTime := Date;
    CpoVencimentoLuz.Enabled  := True;
    BtnSalvarLuz.Enabled      := True;
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
    CpoValorAgua.Clear;
    CpoValorAgua.Enabled       := True;
    CpoVencimentoAgua.DateTime := Date;
    CpoVencimentoAgua.Enabled  := True;
    BtnSalvarAgua.Enabled      := True;
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
    CpoValorInternet.Clear;
    CpoValorInternet.Enabled       := True;
    CpoVencimentoInternet.DateTime := Date;
    CpoVencimentoInternet.Enabled  := True;
    BtnSalvarInternet.Enabled      := True;
  end;

  if (bTelefone) then
  begin
    CpoValorTelefone.Enabled      := False;
    CpoVencimentoTelefone.Enabled := False;
    BtnSalvarTelefone.Enabled     := False;
    ConsultaContasFixas(Sender);
  end
  else
  begin
    CpoValorTelefone.Clear;
    CpoValorTelefone.Enabled       := True;
    CpoVencimentoTelefone.DateTime := Date;
    CpoVencimentoTelefone.Enabled  := True;
    BtnSalvarTelefone.Enabled      := True;
  end;

  QrFixas.Close;
  ConsultaContas(Sender);
  cTotalContas           := CalculaTotalContas;
  LblValorContas.Caption := CurrToStr(cTotalContas);
  CalculaSaldo;
end;

procedure TFrmConsultaDespesas.BtnLimparClick(Sender: TObject);
begin
  LimparCampos(Sender);
  BtnBuscar.SetFocus;
end;

procedure TFrmConsultaDespesas.BtnSalvarAguaClick(Sender: TObject);
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
  BtnConsultarClick(Sender);
end;

procedure TFrmConsultaDespesas.BtnSalvarInternetClick(Sender: TObject);
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
  QrCadastra.ParamByName('NOME').AsString     := 'Internet';
  QrCadastra.ParamByName('VALOR').AsCurrency  := StrToCurr(CpoValorInternet.Text);
  QrCadastra.ParamByName('VENCIMENTO').AsDate := CpoVencimentoInternet.Date;
  QrCadastra.ParamByName('PAGO').AsString     := 'N';
  QrCadastra.ExecSQL;
  BtnConsultarClick(Sender);
end;

procedure TFrmConsultaDespesas.BtnSalvarLuzClick(Sender: TObject);
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
  BtnConsultarClick(Sender);
end;

procedure TFrmConsultaDespesas.BtnSalvarTelefoneClick(Sender: TObject);
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
  QrCadastra.ParamByName('NOME').AsString     := 'Telefone';
  QrCadastra.ParamByName('VALOR').AsCurrency  := StrToCurr(CpoValorTelefone.Text);
  QrCadastra.ParamByName('VENCIMENTO').AsDate := CpoVencimentoTelefone.Date;
  QrCadastra.ParamByName('PAGO').AsString     := 'N';
  QrCadastra.ExecSQL;
  BtnConsultarClick(Sender);
end;

procedure TFrmConsultaDespesas.CpoAtrasadasClick(Sender: TObject);
begin
  BtnConsultarClick(Sender);
end;

procedure TFrmConsultaDespesas.CpoEmDiaClick(Sender: TObject);
begin
  BtnConsultarClick(Sender);
end;

procedure TFrmConsultaDespesas.CpoPagasClick(Sender: TObject);
begin
  BtnConsultarClick(Sender);
end;

procedure TFrmConsultaDespesas.CpoSalarioClick(Sender: TObject);
begin
  CpoSalario.SelectAll;
end;

procedure TFrmConsultaDespesas.FormShow(Sender: TObject);
begin
  LblData.Caption                := DateToStr(Date);
  CpoMes.Value                   := MonthOf(StrToDate(LblData.Caption));
  CpoAno.Value                   := YearOf(StrToDate(LblData.Caption));
  CpoVencimentoLuz.DateTime      := Date;
  CpoVencimentoAgua.DateTime     := Date;
  CpoVencimentoInternet.DateTime := Date;
  CpoVencimentoTelefone.DateTime := Date;
  CdsGrade.CreateDataSet;
end;

procedure TFrmConsultaDespesas.GrdContasDblClick(Sender: TObject);
begin
  if (CdsGradePAGO.AsString = 'N') then
  begin
    try
      Application.CreateForm(TFrmPagarConta, FrmPagarConta);
      FrmPagarConta.CpoIdParcela.Text     := IntToStr(CdsGradeID_PARCELA.AsInteger);
      FrmPagarConta.CpoDescricao.Text     := CdsGradeDESCRICAO.AsString;
      FrmPagarConta.CpoValor.Text         := CurrToStr(CdsGradeVALOR.AsCurrency);
      FrmPagarConta.CpoVencimento.Date    := CdsGradeVENCIMENTO.AsDateTime;
      FrmPagarConta.CpoIdParcela.Enabled  := False;
      FrmPagarConta.CpoDescricao.Enabled  := False;
      FrmPagarConta.CpoValor.Enabled      := False;
      FrmPagarConta.CpoVencimento.Enabled := False;
      FrmPagarConta.ShowModal;
    finally
      BtnConsultarClick(Sender);
      FreeAndNil(FrmPagarConta);
    end;
  end
  else
  begin
    ShowMessage('Essa conta já está paga.');
  end;
end;

procedure TFrmConsultaDespesas.ConsultaContas(Sender: TObject);
begin
  QrConsulta.Close;
  QrConsulta.SQL.Text :=
    '    SELECT c.DESCRICAO,                     '+
    '          p.ID_PARCELA,                     '+
    '	         p.NUMERO,                         '+
    '	         P.VALOR,                          '+
    '	         p.VENCIMENTO,                     '+
    '	         p.PAGO,                           '+
    '	         ct.NOME                           '+
    '      FROM conta c                          '+
    ' LEFT JOIN parcela p                        '+
    '        ON p.ID_CONTA = c.ID_CONTA          '+
    ' LEFT JOIN contatipo ct                     '+
    '        ON ct.ID_CONTATIPO = c.ID_CONTATIPO '+
    '     WHERE MONTH(VENCIMENTO) = :MES         '+
    '       AND YEAR(VENCIMENTO) = :ANO          ';
  QrConsulta.ParamByName('MES').AsInteger       := CpoMes.Value;
  QrConsulta.ParamByName('ANO').AsInteger       := CpoAno.Value;

  if (CpoNome.Text <> '') then
  begin
    QrConsulta.SQL.Add(' AND c.ID_PESSOA = :ID_PESSOA ');
    QrConsulta.ParamByName('ID_PESSOA').AsInteger := StrToInt(CpoIdPessoa.Text);
  end;

  if (CpoAtrasadas.Checked) then
  begin
    QrConsulta.SQL.Add(' AND p.VENCIMENTO < '+ LblData.Caption);
  end;

  if (CpoEmDia.Checked) then
  begin
    QrConsulta.SQL.Add(' AND p.VENCIMENTO >= '+ LblData.Caption);
  end;

  if (CpoPagas.Checked) then
  begin
    QrConsulta.SQL.Add(' AND p.PAGO = ''S'' ');
  end;

  QrConsulta.Open;

  while not QrConsulta.Eof do
  begin
    CdsGrade.Append;
    CdsGradeID_PARCELA.AsInteger  := QrConsulta.FieldByName('ID_PARCELA').AsInteger;
    CdsGradeNUM_PARCELA.AsInteger := QrConsulta.FieldByName('NUMERO').AsInteger;
    CdsGradeTIPO_CONTA.AsString   := QrConsulta.FieldByName('NOME').AsString;
    CdsGradeVALOR.AsCurrency      := QrConsulta.FieldByName('VALOR').AsCurrency;
    CdsGradeDESCRICAO.AsString    := QrConsulta.FieldByName('DESCRICAO').AsString;
    CdsGradeVENCIMENTO.AsDateTime := QrConsulta.FieldByName('VENCIMENTO').AsDateTime;
    CdsGradePAGO.AsString         := QrConsulta.FieldByName('PAGO').AsString;
    CdsGrade.Post;
    QrConsulta.Next;
  end;
end;

procedure TFrmConsultaDespesas.ConsultaContasFixas(Sender: TObject);
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
    CpoVencimentoInternet.Date := QrConsulta.FieldByName('VENCIMENTO').AsDateTime;
  end;
  QrConsulta.Close;

  QrConsulta.Close;
  QrConsulta.SQL.Text :=
    ' SELECT *                        '+
    '   FROM contafixa                '+
    '  WHERE MONTH(VENCIMENTO) = :MES '+
    '    AND YEAR(VENCIMENTO) = :ANO  '+
    '    AND NOME = ''Telefone''      ';
  QrConsulta.ParamByName('MES').AsInteger := StrToInt(CpoMes.Text);
  QrConsulta.ParamByName('ANO').AsInteger := StrToInt(CpoAno.Text);
  QrConsulta.Open;
  if (not QrConsulta.IsEmpty) then
  begin
    CpoValorTelefone.Text      := CurrToStr(QrConsulta.FieldByName('VALOR').AsCurrency);
    CpoVencimentoTelefone.Date := QrConsulta.FieldByName('VENCIMENTO').AsDateTime;
  end;
  QrConsulta.Close;
end;

function TFrmConsultaDespesas.CalculaTotalContas : Currency;
var
  cTotalContas, cTotalContasFixas : Currency;
begin
  cTotalContas := 0;
  CdsGrade.First;

  while not CdsGrade.EoF do
  begin
    cTotalContas := cTotalContas + CdsGradeVALOR.AsCurrency;
    CdsGrade.Next;
  end;

  cTotalContasFixas := CalculaTotalFixas;
  Result            := cTotalContas + cTotalContasFixas;
end;

function TFrmConsultaDespesas.CalculaSaldo : Currency;
var
  cSalario, cTotalContas : Currency;
begin
  cSalario     := StrToCurrDef(CpoSalario.Text,0);
  cTotalContas := StrToCurrDef(LblValorContas.Caption,0);

  LblValorSaldo.Caption := CurrToStr(cSalario - cTotalContas);
end;

function TFrmConsultaDespesas.CalculaTotalFixas : Currency;
begin
  Result := StrToCurrDef(CpoValorLuz.Text,0) +
                       StrToCurrDef(CpoValorAgua.Text,0) +
                       StrToCurrDef(CpoValorinternet.Text,0);
end;

procedure TFrmConsultaDespesas.LimparCampos(Sender: TObject);
begin
  CpoNome.Clear;
  CpoIdPessoa.Clear;
  CpoSalario.Clear;
  CpoMes.Value                   := MonthOf(StrToDate(LblData.Caption));
  CpoAno.Value                   := YearOf(StrToDate(LblData.Caption));
  CpoAtrasadas.Checked           := False;
  CpoEmDia.Checked               := False;
  CpoPagas.Checked               := False;
  LblValorSaldo.Caption          := '0';
  LblValorContas.Caption         := '0';
  LblValorAtrasadas.Caption      := '0';
  LblValorEmDia.Caption          := '0';
  LblValorPagas.Caption          := '0';
  CpoValorLuz.Clear;
  CpoValorAgua.Clear;
  CpoValorInternet.Clear;
  CpoValorLuz.Enabled            := True;
  CpoValorAgua.Enabled           := True;
  CpoValorInternet.Enabled       := True;
  CpoValorTelefone.Enabled       := True;
  CpoVencimentoLuz.DateTime      := Date;
  CpoVencimentoAgua.DateTime     := Date;
  CpoVencimentoInternet.DateTime := Date;
  CpoVencimentoTelefone.DateTime := Date;
  CpoVencimentoLuz.Enabled       := True;
  CpoVencimentoAgua.Enabled      := True;
  CpoVencimentoInternet.Enabled  := True;
  CpoVencimentoTelefone.Enabled  := True;
  BtnSalvarLuz.Enabled           := True;
  BtnSalvarAgua.Enabled          := True;
  BtnSalvarInternet.Enabled      := True;
  BtnSalvarTelefone.Enabled      := True;
  CdsGrade.EmptyDataSet;
end;

end.

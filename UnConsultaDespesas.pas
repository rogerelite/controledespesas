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
    procedure GrdContasDblClick(Sender: TObject);
    procedure CpoAtrasadasClick(Sender: TObject);
    procedure CpoEmDiaClick(Sender: TObject);
    procedure CpoPagasClick(Sender: TObject);
  private
    procedure ConsultaContasFixas;
    procedure ConsultaContas(Sender: TObject);
    function CalculaTotalContas: Currency;
    function CalculaSaldo: Currency;
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

  ConsultaContas(Sender);
  cTotalContas           := CalculaTotalContas;
  LblValorContas.Caption := CurrToStr(cTotalContas);
  CalculaSaldo;
  ConsultaContasFixas;
end;

procedure TFrmConsultaDespesas.BtnLimparClick(Sender: TObject);
begin
  LimparCampos(Sender);
  BtnBuscar.SetFocus;
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

procedure TFrmConsultaDespesas.ConsultaContasFixas;
var
 iMes : Integer;
begin
  try
    QrConsulta.Close;
    QrConsulta.SQL.Text :=
      ' SELECT cf.ID_CONTA AS ID_FIXA,             '+
      '        cf.NOME,                            '+
      '        cf.ATIVA,                           '+
      '        p.VENCIMENTO                        '+
      '   FROM contafixa cf                        '+
      '        INNER JOIN conta c                  '+
      '           ON c.ID_CONTAFIXA = cf.ID_CONTA  '+
      '        INNER JOIN parcela p                '+
      '           ON p.ID_CONTA = c.ID_CONTA       '+
      '  WHERE cf.ATIVA = ''S''                    '+
      '    AND MonthOf(p.VENCIMENTO) = :MES        ';
    QrConsulta.ParamByName('MES').AsInteger := CpoMes.Value;
    QrConsulta.Open;

    iMes := MonthOf(QrConsulta.FieldByName('VENCIMENTO').AsDateTime);

    while (not QrConsulta.Eof) do
    begin
      {1 - Luz}
      if ((QrConsulta.FieldByName('ID_FIXA').AsInteger = 1) and
          (iMes <> CpoMes.Value)) then
      begin
        ShowMessage('Conta de luz não cadastrada para este mês.');
      end;

      {2 - Água}
      if ((QrConsulta.FieldByName('ID_FIXA').AsInteger = 2)and
          (iMes <> CpoMes.Value)) then
      begin
        ShowMessage('Conta de água não cadastrada para este mês.');
      end;

      {3 - Telefone móvel}
      if ((QrConsulta.FieldByName('ID_FIXA').AsInteger = 3)and
          (iMes <> CpoMes.Value)) then
      begin
        ShowMessage('Conta de telefone móvel não cadastrada para este mês.');
      end;

      {4 - Internet}
      if ((QrConsulta.FieldByName('ID_FIXA').AsInteger = 4)and
          (iMes <> CpoMes.Value)) then
      begin
        ShowMessage('Conta de internet não cadastrada para este mês.');
      end;
      QrConsulta.Next;
    end;
  finally
    QrConsulta.Close;
  end;
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

  Result := cTotalContas;
end;

function TFrmConsultaDespesas.CalculaSaldo : Currency;
var
  cSalario, cTotalContas : Currency;
begin
  cSalario     := StrToCurrDef(CpoSalario.Text,0);
  cTotalContas := StrToCurrDef(LblValorContas.Caption,0);

  LblValorSaldo.Caption := CurrToStr(cSalario - cTotalContas);
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
  CdsGrade.EmptyDataSet;
end;

end.

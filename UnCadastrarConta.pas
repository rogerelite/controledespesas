unit UnCadastrarConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ValEdit, Vcl.Samples.Spin, Data.DB, Vcl.DBGrids, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.DBClient, Datasnap.Provider, System.DateUtils;

type
  TFrmCadastrarConta = class(TForm)
    PaConteudo: TPanel;
    LblTitular: TLabel;
    LblDescricao: TLabel;
    LblValorConta: TLabel;
    CpoValorConta: TEdit;
    GrpParcelas: TGroupBox;
    BtnAdicionar: TButton;
    GrdParcelas: TDBGrid;
    LblNumero: TLabel;
    CpoNumeroParcela: TSpinEdit;
    LblValorParcelas: TLabel;
    CpoValorParcela: TEdit;
    LblVencimentoParcelado: TLabel;
    CpoVencimentoParcelado: TDateTimePicker;
    BtnSalvar: TButton;
    BtnFechar: TButton;
    GrpModoPagamento: TRadioGroup;
    LblVencimentoUnico: TLabel;
    CpoVencimentoUnico: TDateTimePicker;
    CpoDescricao: TMemo;
    BtnRemover: TButton;
    LblTipoConta: TLabel;
    BtnBuscarNome: TButton;
    CpoNome: TEdit;
    CpoIdTitular: TEdit;
    CpoIdTipoConta: TEdit;
    CpoPago: TEdit;
    IdConta: TLabel;
    QrIdConta: TFDQuery;
    QrCadastraConta: TFDQuery;
    QrGrade: TFDQuery;
    CdsGrade: TClientDataSet;
    DsGrade: TDataSource;
    CdsGradeNUMERO: TIntegerField;
    CdsGradeVALOR: TCurrencyField;
    CdsGradeVENC_PARCELA: TDateField;
    CdsGradePAGO: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CpoIdProcedente: TEdit;
    QrCadastraParcela: TFDQuery;
    BtnBuscarTipoConta: TButton;
    CpoTipoConta: TEdit;
    BtnBuscarProcedente: TButton;
    CpoProcedente: TEdit;
    CpoIdConta: TEdit;
    QrConsulta: TFDQuery;
    BtnCancelar: TButton;
    BtnExcluir: TButton;
    QrExcluiConta: TFDQuery;
    QrExcluiParcela: TFDQuery;
    BtnBuscarConta: TButton;
    procedure BtnFecharClick(Sender: TObject);
    procedure GrpModoPagamentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnBuscarNomeClick(Sender: TObject);
    procedure BtnBuscarTipoContaClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure LimpaCampos;
    procedure BtnAdicionarClick(Sender: TObject);
    procedure BtnRemoverClick(Sender: TObject);
    procedure BtnBuscarProcedenteClick(Sender: TObject);
    procedure CpoIdContaExit(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure GrdParcelasDblClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnBuscarContaClick(Sender: TObject);
  private
    procedure ConsultaConta;
    procedure CarregaUltimoId(Sender: TObject);
    procedure ConsultaParcelas;
    procedure CadastraConta;
    procedure AtualizaConta;
    function RetornaUltimoId: Integer;
    { Private declarations }
  public

  end;

var
  FrmCadastrarConta: TFrmCadastrarConta;
  bParcelado,
  bAbriuPorCadastroConta,
  bContaExistente         : boolean;
  iIdConta                : Integer;
  sModoPagamento          : String;

implementation

{$R *.dfm}

uses
DmConn, UnConsultaPessoa, UnConsultaTipoConta, UnConsultaProcedente, UnFuncoes;

procedure TFrmCadastrarConta.FormShow(Sender: TObject);
begin
  CarregaUltimoId(Sender);
  CdsGrade.CreateDataSet;
  CpoVencimentoUnico.Date     := Date;
  CpoVencimentoUnico.Enabled  := False;
  CpoVencimentoParcelado.Date := Date;
end;

function ZeroAEsquerda(const sValor: string; const iComprimento: integer): string;
var
  sZeros, sRetorno: string;
  iTamanho, iContador: integer;
begin
  iTamanho := Length(Trim(sValor));
  sZeros   := ' ';

  for iContador := 1 to iComprimento do
  begin
    sZeros := sZeros + '0';
  end;

  sRetorno := Copy(Trim(sZeros) + Trim(sValor), iTamanho + 1 , iComprimento);
  Result   := sRetorno;
end;

procedure TFrmCadastrarConta.CarregaUltimoId(Sender: TObject);
begin
  QrIdConta.Close;
  QrIdConta.SQL.Text :=
    ' SELECT MAX(ID_CONTA) AS COD '+
    '   FROM conta                ';
  QrIdConta.Open;
  iIdConta        := QrIdConta.FieldByName('COD').AsInteger + 1;
  CpoIdConta.Text := IntToStr(iIdConta);
end;

function TFrmCadastrarConta.RetornaUltimoId: Integer;
begin
  try
    QrIdConta.Close;
    QrIdConta.SQL.Text :=
      ' SELECT MAX(ID_CONTA) AS COD '+
      '   FROM conta                ';
    QrIdConta.Open;

    Result := QrIdConta.FieldByName('COD').AsInteger;
  finally
    QrIdConta.Close;
  end;
end;

procedure TFrmCadastrarConta.BtnAdicionarClick(Sender: TObject);
begin
  if (CdsGrade.Locate('NUMERO', CpoNumeroParcela.Value,[])) then
  begin
    CdsGrade.Edit;
  end
  else
  begin
    CdsGrade.Append;
  end;
  CdsGradeNUMERO.AsInteger        := CpoNumeroParcela.Value;
  CdsGradeVALOR.AsCurrency        := StrToCurr(CpoValorParcela.Text);
  CdsGradeVENC_PARCELA.AsDateTime := CpoVencimentoParcelado.DateTime;
  CdsGradePAGO.AsString           := CpoPago.Text;
  CdsGrade.Post;
  CpoNumeroParcela.Value := CpoNumeroParcela.Value + 1;
  CpoValorParcela.Clear;
end;

procedure TFrmCadastrarConta.BtnBuscarContaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultarConta, FrmConsultarConta);
  try
    bAbriuPorCadastroConta := True;
    FrmConsultarConta.ShowModal;
  finally
    FreeAndNil(FrmConsultarConta);
  end;
end;

procedure TFrmCadastrarConta.BtnBuscarNomeClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultaPessoa, FrmConsultaPessoa);
  try
    bAbriuPorCadastroConta := True;
    FrmConsultaPessoa.ShowModal;
  finally
    FreeAndNil(FrmConsultaPessoa);
  end;
end;

procedure TFrmCadastrarConta.BtnBuscarProcedenteClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFrmConsultaProcedente, FrmConsultaProcedente);
    bAbriuPorCadastroConta := True;
    FrmConsultaProcedente.ShowModal;
  finally
    FreeAndNil(FrmConsultaProcedente);
  end;
end;

procedure TFrmCadastrarConta.BtnBuscarTipoContaClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFrmConsultaTipoConta, FrmConsultaTipoConta);
    FrmConsultaTipoConta.bAbriuPorCadastroConta := True;
    FrmConsultaTipoConta.ShowModal;
  finally
    FreeAndNil(FrmConsultaTipoConta);
  end;
end;

procedure TFrmCadastrarConta.BtnCancelarClick(Sender: TObject);
begin
  LimpaCampos;
  CarregaUltimoId(Sender);
  CpoIdConta.Enabled := True;
  CpoIdConta.SetFocus;
end;

procedure TFrmCadastrarConta.BtnExcluirClick(Sender: TObject);
begin
  try
    QrExcluiParcela.Close;
    QrExcluiParcela.SQL.Text :=
      ' DELETE            '+
      '   FROM parcela    '+
      '  WHERE ID_CONTA = '+ CpoIdConta.Text;
    QrExcluiParcela.ExecSQL;

    QrExcluiConta.Close;
    QrExcluiConta.SQL.Text :=
      ' DELETE            '+
      '   FROM conta      '+
      '  WHERE ID_CONTA = '+ CpoIdConta.Text;
    QrExcluiConta.ExecSQL;
  finally
    QrExcluiParcela.Close;
    QrExcluiConta.Close;
  end;
  BtnCancelarClick(Sender);
end;

procedure TFrmCadastrarConta.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastrarConta.BtnRemoverClick(Sender: TObject);
begin
  if (not CdsGrade.IsEmpty) then
  begin
    CdsGrade.Delete;
    CpoNumeroParcela.Value := CpoNumeroParcela.Value - 1;
  end;
end;

procedure TFrmCadastrarConta.BtnSalvarClick(Sender: TObject);
begin
  try
    QrConsulta.Close;
    QrConsulta.SQL.Text :=
      ' SELECT ID_CONTA             '+
      '   FROM conta                '+
      '  WHERE ID_CONTA = :ID_CONTA ';
    QrConsulta.ParamByName('ID_CONTA').AsInteger := StrToIntDef(CpoIdConta.Text,0);
    QrConsulta.Open;

    if (QrConsulta.IsEmpty) then
    begin
      CadastraConta;
    end
    else
    begin
      AtualizaConta;
    end;
  finally
    QrConsulta.Close;
  end;
  BtnCancelarClick(Sender);
end;

procedure TFrmCadastrarConta.CpoIdContaExit(Sender: TObject);
begin
  QrConsulta.Close;
  QrConsulta.SQL.Text :=
    ' SELECT ID_CONTA '+
    '   FROM conta    ';
  QrConsulta.Open;

  if (QrConsulta.IsEmpty) then
  begin
    bContaExistente          := False;
    CpoIdConta.Enabled       := True;
    GrpModoPagamento.Enabled := True;
  end
  else
  begin
    bContaExistente          := True;
    CpoIdConta.Enabled       := False;
    GrpModoPagamento.Enabled := False;
    ConsultaConta;
    ConsultaParcelas;
  end;
end;

procedure TFrmCadastrarConta.GrdParcelasDblClick(Sender: TObject);
begin
  CpoNumeroParcela.Value      := CdsGradeNUMERO.AsInteger;
  CpoValorParcela.Text        := CurrToStr(CdsGradeVALOR.AsCurrency);
  CpoVencimentoParcelado.Date := CdsGradeVENC_PARCELA.AsDateTime;
end;

procedure TFrmCadastrarConta.GrpModoPagamentoClick(Sender: TObject);
begin
  case GrpModoPagamento.ItemIndex of
    0:begin
      bParcelado                     := True;
      CpoNumeroParcela.Enabled       := True;
      CpoValorParcela.Enabled        := True;
      CpoVencimentoParcelado.Enabled := True;
      CpoVencimentoUnico.Enabled     := False;
      BtnAdicionar.Enabled           := True;
      BtnRemover.Enabled             := True;
      GrdParcelas.Enabled            := True;
    end;
    1:begin
      bParcelado                     := False;
      CpoNumeroParcela.Enabled       := False;
      CpoValorParcela.Enabled        := False;
      CpoVencimentoParcelado.Enabled := False;
      CpoVencimentoUnico.Enabled     := True;
      BtnAdicionar.Enabled           := False;
      BtnRemover.Enabled             := False;
      GrdParcelas.Enabled            := False;
    end;
    2:begin
      bParcelado                     := False;
      CpoNumeroParcela.Enabled       := False;
      CpoValorParcela.Enabled        := False;
      CpoVencimentoParcelado.Enabled := False;
      CpoVencimentoUnico.Enabled     := False;
      BtnAdicionar.Enabled           := False;
      BtnRemover.Enabled             := False;
      GrdParcelas.Enabled            := False;
      CpoVencimentoUnico.Enabled     := True;
    end;
  end;
end;

procedure TFrmCadastrarConta.ConsultaConta;
begin
  try
    QrConsulta.Close;
    QrConsulta.SQL.Text :=
      ' SELECT c.DESCRICAO,                        '+
      '        c.MODO_PGTO,                        '+
      '        c.VALOR AS VALORCONTA,              '+
      '        p.ID_PESSOA,                        '+
      '        p.NOME AS NOMEPESSOA,               '+
      '        ct.ID_CONTATIPO,                    '+
      '        ct.NOME AS NOMECONTATIPO,           '+
      '        pro.ID_PROCEDENTE,                  '+
      '        pro.NOME AS NOMEPROCEDENTE          '+
      '   FROM conta c                             '+
      '  INNER JOIN pessoa p                       '+
      '     ON p.ID_PESSOA = c.ID_PESSOA           '+
      '  INNER JOIN contatipo ct                   '+
      '     ON ct.ID_CONTATIPO = c.ID_CONTATIPO    '+
      '  INNER JOIN procedente pro                 '+
      '     ON pro.ID_PROCEDENTE = c.ID_PROCEDENTE '+
      '  WHERE c.ID_CONTA = :ID_CONTA              ';
    QrConsulta.ParamByName('ID_CONTA').AsInteger := StrToIntDef(CpoIdConta.Text,0);
    QrConsulta.Open;

    CpoIdTitular.Text      := QrConsulta.FieldByName('ID_PESSOA').AsString;
    CpoNome.Text           := QrConsulta.FieldByName('NOMEPESSOA').AsString;
    CpoIdTipoConta.Text    := QrConsulta.FieldByName('ID_CONTATIPO').AsString;
    CpoTipoConta.Text      := QrConsulta.FieldByName('NOMECONTATIPO').AsString;
    CpoIdProcedente.Text   := QrConsulta.FieldByName('ID_PROCEDENTE').AsString;
    CpoProcedente.Text     := QrConsulta.FieldByName('NOMEPROCEDENTE').AsString;
    CpoDescricao.Text      := QrConsulta.FieldByName('DESCRICAO').AsString;
    CpoValorConta.Text     := QrConsulta.FieldByName('VALORCONTA').AsString;

    if (QrConsulta.FieldByName('MODO_PGTO').AsString = 'Parcelado') then
    begin
      GrpModoPagamento.ItemIndex := 0;
    end
    else if (QrConsulta.FieldByName('MODO_PGTO').AsString = 'Parcela única') then
    begin
      GrpModoPagamento.ItemIndex := 1;
    end
    else if (QrConsulta.FieldByName('MODO_PGTO').AsString = 'Mensal') then
    begin
      GrpModoPagamento.ItemIndex := 2;
    end;
  finally
    QrConsulta.Close;
  end;
end;

procedure TFrmCadastrarConta.ConsultaParcelas;
begin
  QrConsulta.Close;
  QrConsulta.SQL.Text :=
    ' SELECT *                    '+
    '   FROM parcela              '+
    '  WHERE ID_CONTA = :ID_CONTA ';
  QrConsulta.ParamByName('ID_CONTA').AsInteger := StrToIntDef(CpoIdConta.Text,0);
  QrConsulta.Open;

  if (not QrConsulta.IsEmpty) then
  begin
    while not QrConsulta.EoF do
    begin
      CdsGrade.Append;
      CdsGradeNUMERO.AsInteger        := QrConsulta.FieldByName('NUMERO').AsInteger;
      CdsGradeVALOR.AsCurrency        := QrConsulta.FieldByName('VALOR').AsCurrency;
      CdsGradeVENC_PARCELA.AsDateTime := QrConsulta.FieldByName('VENCIMENTO').AsDateTime;
      CdsGradePAGO.AsString           := QrConsulta.FieldByName('PAGO').AsString;
      CdsGrade.Post;
      QrConsulta.Next;
    end;
  end;
end;

procedure TFrmCadastrarConta.LimpaCampos;
begin
  CpoIdConta.Clear;
  CpoIdTitular.Clear;
  CpoNome.Clear;
  CpoIdTipoConta.Clear;
  CpoTipoConta.Clear;
  CpoIdProcedente.Clear;
  CpoProcedente.Clear;
  CpoDescricao.Clear;
  CpoValorConta.Clear;
  CpoNumeroParcela.Clear;
  CpoValorParcela.Clear;
  CdsGrade.Edit;
  CdsGrade.EmptyDataSet;
end;

procedure TFrmCadastrarConta.CadastraConta;
begin
case GrpModoPagamento.ItemIndex of
    0:begin
      sModoPagamento := 'Parcelado';
      QrCadastraConta.Close;
      QrCadastraConta.SQL.Text :=
        ' INSERT INTO conta(ID_PESSOA,      '+
        '                   ID_PROCEDENTE,  '+
        '                   DESCRICAO,      '+
        '                   MODO_PGTO,      '+
        '                   VALOR,          '+
        '                   ID_CONTATIPO)   '+
        '            VALUES(:ID_PESSOA,     '+
        '                   :ID_PROCEDENTE, '+
        '                   :DESCRICAO,     '+
        '                   :MODO_PGTO,     '+
        '                   :VALOR,         '+
        '                   :ID_CONTATIPO)  ';
      QrCadastraConta.ParamByName('ID_PESSOA').AsInteger     :=
        StrToIntDef(CpoIdTitular.Text,0);
      QrCadastraConta.ParamByName('ID_PROCEDENTE').AsInteger :=
        StrToIntDef(CpoIdProcedente.Text,0);
      QrCadastraConta.ParamByName('DESCRICAO').AsString      :=
        CpoDescricao.Text;
      QrCadastraConta.ParamByName('MODO_PGTO').AsString      :=
        sModoPagamento;
      QrCadastraConta.ParamByName('VALOR').AsCurrency        :=
        StrToCurr(CpoValorConta.Text);
      QrCadastraConta.ParamByName('ID_CONTATIPO').AsInteger  :=
        StrToIntDef(CpoIdTipoConta.Text,0);
      QrCadastraConta.ExecSQL;

      CdsGrade.First;
      while not CdsGrade.Eof do
      begin
        QrCadastraParcela.Close;
        QrCadastraParcela.SQL.Text :=
          ' INSERT INTO parcela(NUMERO,        '+
          '                     VALOR,         '+
          '                     VENCIMENTO,    '+
          '                     PAGO,          '+
          '                     ID_CONTA)      '+
          '              VALUES(:NUMERO,       '+
          '                     :VALOR,        '+
          '                     :VENCIMENTO,   '+
          '                     :PAGO,         '+
          '                     :ID_CONTA)     ';
        QrCadastraParcela.ParamByName('NUMERO').AsInteger        :=
          CdsGradeNUMERO.AsInteger;
        QrCadastraParcela.ParamByName('VALOR').AsCurrency        :=
          CdsGradeVALOR.AsCurrency;
        QrCadastraParcela.ParamByName('VENCIMENTO').AsDateTime   :=
          CdsGradeVENC_PARCELA.AsDateTime;
        QrCadastraParcela.ParamByName('PAGO').AsString           :=
          CdsGradePAGO.AsString;
        QrCadastraParcela.ParamByName('ID_CONTA').AsInteger      :=
          StrToInt(CpoIdConta.Text);
        QrCadastraParcela.ExecSQL;
        CdsGrade.Next;
      end;
      LimpaCampos;
    end;
    1:begin
      sModoPagamento := 'Parcela única';
      QrCadastraConta.Close;
      QrCadastraConta.SQL.Text :=
        ' INSERT INTO conta(ID_PESSOA,      '+
        '                   ID_PROCEDENTE,  '+
        '                   DESCRICAO,      '+
        '                   MODO_PGTO,      '+
        '                   VALOR,          '+
        '                   ID_CONTATIPO)   '+
        '            VALUES(:ID_PESSOA,     '+
        '                   :ID_PROCEDENTE, '+
        '                   :DESCRICAO,     '+
        '                   :MODO_PGTO,     '+
        '                   :VALOR,         '+
        '                   :ID_CONTATIPO)  ';
      QrCadastraConta.ParamByName('ID_PESSOA').AsInteger     :=
        StrToIntDef(CpoIdTitular.Text,0);
      QrCadastraConta.ParamByName('ID_PROCEDENTE').AsInteger :=
        StrToIntDef(CpoIdProcedente.Text,0);
      QrCadastraConta.ParamByName('DESCRICAO').AsString      :=
        CpoDescricao.Text;
      QrCadastraConta.ParamByName('MODO_PGTO').AsString      :=
        sModoPagamento;
      QrCadastraConta.ParamByName('VALOR').AsCurrency        :=
        StrToCurr(CpoValorConta.Text);
      QrCadastraConta.ParamByName('ID_CONTATIPO').AsInteger  :=
        StrToIntDef(CpoIdTipoConta.Text,0);
      QrCadastraConta.ExecSQL;

      QrCadastraParcela.Close;
        QrCadastraParcela.SQL.Text :=
          ' INSERT INTO parcela(NUMERO,        '+
          '                     VALOR,         '+
          '                     VENCIMENTO,    '+
          '                     PAGO,          '+
          '                     ID_CONTA)      '+
          '              VALUES(:NUMERO,       '+
          '                     :VALOR,        '+
          '                     :VENCIMENTO,  '+
          '                     :PAGO,         '+
          '                     :ID_CONTA)     ';
        QrCadastraParcela.ParamByName('NUMERO').AsInteger        := 1 ;
        QrCadastraParcela.ParamByName('VALOR').AsCurrency        :=
          StrToCurr(CpoValorConta.Text);
        QrCadastraParcela.ParamByName('VENCIMENTO').AsDate     :=
          CpoVencimentoUnico.Date;
        QrCadastraParcela.ParamByName('PAGO').AsString           := 'N';
        QrCadastraParcela.ParamByName('ID_CONTA').AsInteger      :=
          StrToInt(CpoIdConta.Text);
        QrCadastraParcela.ExecSQL;
      LimpaCampos;
    end;
    2:begin
      sModoPagamento := 'Mensal';
      QrCadastraConta.Close;
      QrCadastraConta.SQL.Text :=
        ' INSERT INTO conta(ID_PESSOA,      '+
        '                   ID_PROCEDENTE,  '+
        '                   DESCRICAO,      '+
        '                   MODO_PGTO,      '+
        '                   VALOR,          '+
        '                   ID_CONTATIPO,   '+
        '                   ID_CONTAFIXA)   '+
        '            VALUES(:ID_PESSOA,     '+
        '                   :ID_PROCEDENTE, '+
        '                   :DESCRICAO,     '+
        '                   :MODO_PGTO,     '+
        '                   :VALOR,         '+
        '                   :ID_CONTATIPO,  '+
        '                   :ID_CONTAFIXA)  ';
      QrCadastraConta.ParamByName('ID_PESSOA').AsInteger     :=
        StrToIntDef(CpoIdTitular.Text,0);
      QrCadastraConta.ParamByName('ID_PROCEDENTE').AsInteger :=
        StrToIntDef(CpoIdProcedente.Text,0);
      QrCadastraConta.ParamByName('DESCRICAO').AsString      :=
        CpoDescricao.Text;
      QrCadastraConta.ParamByName('MODO_PGTO').AsString      :=
        sModoPagamento;
      QrCadastraConta.ParamByName('VALOR').AsCurrency        :=
        StrToCurr(CpoValorConta.Text);
      QrCadastraConta.ParamByName('ID_CONTATIPO').AsInteger  :=
        StrToIntDef(CpoIdTipoConta.Text,0);

      if (StrToInt(CpoIdTipoConta.Text) <= 4) then
      begin
        QrCadastraConta.ParamByName('ID_CONTAFIXA').AsInteger  :=
          StrToIntDef(CpoIdTipoConta.Text,0);
      end;

      QrCadastraConta.ExecSQL;

      QrCadastraParcela.Close;
      QrCadastraParcela.SQL.Text :=
        ' INSERT INTO parcela(NUMERO,        '+
        '                     VALOR,         '+
        '                     VENCIMENTO,    '+
        '                     PAGO,          '+
        '                     ID_CONTA)      '+
        '              VALUES(:NUMERO,       '+
        '                     :VALOR,        '+
        '                     :VENCIMENTO,  '+
        '                     :PAGO,         '+
        '                     :ID_CONTA)     ';
      QrCadastraParcela.ParamByName('NUMERO').AsInteger   := 1 ;
      QrCadastraParcela.ParamByName('VALOR').AsCurrency   :=
        StrToCurr(CpoValorConta.Text);

      QrCadastraParcela.ParamByName('VENCIMENTO').AsDate  :=
        CpoVencimentoUnico.Date;
      QrCadastraParcela.ParamByName('PAGO').AsString := 'N';
      QrCadastraParcela.ParamByName('ID_CONTA').AsInteger := RetornaUltimoId;
      QrCadastraParcela.ExecSQL;
      LimpaCampos;
    end;
  end;
end;

procedure TFrmCadastrarConta.AtualizaConta;
begin
  case GrpModoPagamento.ItemIndex of
    0:begin
      sModoPagamento := 'Parcelado';
      QrCadastraConta.Close;
      QrCadastraConta.SQL.Text :=
        ' UPDATE conta                             '+
        '    SET ID_PESSOA = :ID_PESSOA,           '+
        '        ID_PROCEDENTE = :ID_PROCEDENTE,   '+
        '        DESCRICAO = :DESCRICAO,           '+
        '        MODO_PGTO = :MODO_PGTO,           '+
        '        VALOR = :VALOR,                   '+
        '        ID_CONTATIPO = :ID_CONTATIPO      '+
        '  WHERE ID_CONTA = :ID_CONTA              ';
      QrCadastraConta.ParamByName('ID_CONTA').AsInteger      :=
        StrToIntDef(CpoIdConta.Text,0);
      QrCadastraConta.ParamByName('ID_PESSOA').AsInteger     :=
        StrToIntDef(CpoIdTitular.Text,0);
      QrCadastraConta.ParamByName('ID_PROCEDENTE').AsInteger :=
        StrToIntDef(CpoIdProcedente.Text,0);
      QrCadastraConta.ParamByName('DESCRICAO').AsString      :=
        CpoDescricao.Text;
      QrCadastraConta.ParamByName('MODO_PGTO').AsString      :=
        sModoPagamento;
      QrCadastraConta.ParamByName('VALOR').AsCurrency        :=
        StrToCurr(CpoValorConta.Text);
      QrCadastraConta.ParamByName('ID_CONTATIPO').AsInteger  :=
        StrToIntDef(CpoIdTipoConta.Text,0);
      QrCadastraConta.ExecSQL;

      CdsGrade.First;
      while not CdsGrade.Eof do
      begin
        QrCadastraParcela.Close;
        QrCadastraParcela.SQL.Text :=
          ' UPDATE parcela                   '+
          '    SET NUMERO = :NUMERO,         '+
          '        VALOR = :VALOR,           '+
          '        VENCIMENTO = :VENCIMENTO, '+
          '        PAGO = :PAGO              '+
          '  WHERE ID_CONTA = :ID_CONTA      ';
        QrCadastraParcela.ParamByName('NUMERO').AsInteger        :=
          CdsGradeNUMERO.AsInteger;
        QrCadastraParcela.ParamByName('VALOR').AsCurrency        :=
          CdsGradeVALOR.AsCurrency;
        QrCadastraParcela.ParamByName('VENCIMENTO').AsDateTime   :=
          CdsGradeVENC_PARCELA.AsDateTime;
        QrCadastraParcela.ParamByName('PAGO').AsString           :=
          CdsGradePAGO.AsString;
        QrCadastraParcela.ParamByName('ID_CONTA').AsInteger      :=
          StrToInt(CpoIdConta.Text);
        QrCadastraParcela.ExecSQL;
        CdsGrade.Next;
      end;
      LimpaCampos;
    end;
    1:begin
      sModoPagamento := 'Parcela única';
      QrCadastraConta.Close;
      QrCadastraConta.SQL.Text :=
        ' UPDATE conta                           '+
        '    SET ID_PESSOA = :ID_PESSOA,         '+
        '        ID_PROCEDENTE = :ID_PROCEDENTE, '+
        '        DESCRICAO = :DESCRICAO,         '+
        '        MODO_PGTO = :MODO_PGTO,         '+
        '        VALOR = :VALOR,                 '+
        '        ID_CONTATIPO = :ID_CONTATIPO    '+
        '  WHERE ID_CONTA = :ID_CONTA            ';
      QrCadastraConta.ParamByName('ID_CONTA').AsInteger      :=
        StrToIntDef(CpoIdConta.Text,0);
      QrCadastraConta.ParamByName('ID_PESSOA').AsInteger     :=
        StrToIntDef(CpoIdTitular.Text,0);
      QrCadastraConta.ParamByName('ID_PROCEDENTE').AsInteger :=
        StrToIntDef(CpoIdProcedente.Text,0);
      QrCadastraConta.ParamByName('DESCRICAO').AsString      :=
        CpoDescricao.Text;
      QrCadastraConta.ParamByName('MODO_PGTO').AsString      :=
        sModoPagamento;
      QrCadastraConta.ParamByName('VALOR').AsCurrency        :=
        StrToCurr(CpoValorConta.Text);
      QrCadastraConta.ParamByName('ID_CONTATIPO').AsInteger  :=
        StrToIntDef(CpoIdTipoConta.Text,0);
      QrCadastraConta.ExecSQL;

      QrCadastraParcela.Close;
        QrCadastraParcela.SQL.Text :=
          ' UPDATE parcela                   '+
          '    SET NUMERO = :NUMERO,         '+
          '        VALOR = :VALOR,           '+
          '        VENCIMENTO = :VENCIMENTO, '+
          '        PAGO = :PAGO,             '+
          '  WHERE ID_CONTA = :ID_CONTA      ';
        QrCadastraParcela.ParamByName('NUMERO').AsInteger   := 1 ;
        QrCadastraParcela.ParamByName('VALOR').AsCurrency   :=
          StrToCurr(CpoValorConta.Text);
        QrCadastraParcela.ParamByName('VENCIMENTO').AsDate  :=
          CpoVencimentoUnico.Date;
        QrCadastraParcela.ParamByName('PAGO').AsString      := 'N';
        QrCadastraParcela.ParamByName('ID_CONTA').AsInteger :=
          StrToInt(CpoIdConta.Text);
        QrCadastraParcela.ExecSQL;
      LimpaCampos;
    end;
    2:begin
      sModoPagamento := 'Mensal';
      QrCadastraConta.Close;
      QrCadastraConta.SQL.Text :=
        ' UPDATE conta                           '+
        '    SET ID_PESSOA = :ID_PESSOA,         '+
        '        ID_PROCEDENTE = :ID_PROCEDENTE, '+
        '        DESCRICAO = :DESCRICAO,         '+
        '        MODO_PGTO = :MODO_PGTO,         '+
        '        VALOR = :VALOR,                 '+
        '        ID_CONTATIPO = :ID_CONTATIPO    '+
        '  WHERE ID_CONTA = :ID_CONTA            ';
      QrCadastraConta.ParamByName('ID_CONTA').AsInteger      :=
        StrToIntDef(CpoIdConta.Text,0);
      QrCadastraConta.ParamByName('ID_PESSOA').AsInteger     :=
        StrToIntDef(CpoIdTitular.Text,0);
      QrCadastraConta.ParamByName('ID_PROCEDENTE').AsInteger :=
        StrToIntDef(CpoIdProcedente.Text,0);
      QrCadastraConta.ParamByName('DESCRICAO').AsString      :=
        CpoDescricao.Text;
      QrCadastraConta.ParamByName('MODO_PGTO').AsString      :=
        sModoPagamento;
      QrCadastraConta.ParamByName('VALOR').AsCurrency        :=
        StrToCurr(CpoValorConta.Text);
      QrCadastraConta.ParamByName('ID_CONTATIPO').AsInteger  :=
        StrToIntDef(CpoIdTipoConta.Text,0);
      QrCadastraConta.ExecSQL;
      LimpaCampos;
    end;
  end;
end;

end.

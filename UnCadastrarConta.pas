unit UnCadastrarConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ValEdit, Vcl.Samples.Spin, Data.DB, Vcl.DBGrids, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.DBClient, Datasnap.Provider;

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
    LblDiaVencimento: TLabel;
    CpoDiaVencimento: TSpinEdit;
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
    procedure BtnFecharClick(Sender: TObject);
    procedure GrpModoPagamentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnBuscarNomeClick(Sender: TObject);
    procedure BtnBuscarTipoContaClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure LimpaCampos(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure BtnRemoverClick(Sender: TObject);
    procedure BtnBuscarProcedenteClick(Sender: TObject);
    procedure CpoIdContaExit(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure GrdParcelasDblClick(Sender: TObject);
  private
    procedure ConsultaConta(Sender: TObject);
    procedure CarregaUltimoId(Sender: TObject);
    procedure ConsultaParcelas(Sender: TObject);
    { Private declarations }
  public

  end;

var
  FrmCadastrarConta: TFrmCadastrarConta;
  bParcelado,
  bAbriuPorCadastroConta  : boolean;
  iIdConta                : Integer;
  sModoPagamento          : String;

implementation

{$R *.dfm}

uses
DmConn, UnConsultaPessoa, UnConsultaTipoConta, UnConsultaProcedente;

procedure TFrmCadastrarConta.FormShow(Sender: TObject);
begin
  CarregaUltimoId(Sender);
  CdsGrade.CreateDataSet;
  CpoVencimentoUnico.Date     := Date;
  CpoVencimentoUnico.Enabled  := False;
  CpoVencimentoParcelado.Date := Date;
  CpoDiaVencimento.Enabled    := False;
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

procedure TFrmCadastrarConta.BtnBuscarNomeClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFrmConsultaPessoa, FrmConsultaPessoa);
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
  LimpaCampos(Sender);
  CarregaUltimoId(Sender);
  CpoIdConta.Enabled := True;
  CpoIdConta.SetFocus;
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
      LimpaCampos(Sender);
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
      LimpaCampos(Sender);
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
        '                   DIA_VENC,       '+
        '                   ID_CONTATIPO)   '+
        '            VALUES(:ID_PESSOA,     '+
        '                   :ID_PROCEDENTE, '+
        '                   :DESCRICAO,     '+
        '                   :MODO_PGTO,     '+
        '                   :VALOR,         '+
        '                   :DIA_VENC,      '+
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
      QrCadastraConta.ParamByName('DIA_VENC').AsInteger      :=
        StrToInt(CpoDiaVencimento.Text);
      QrCadastraConta.ParamByName('ID_CONTATIPO').AsInteger  :=
        StrToIntDef(CpoIdTipoConta.Text,0);
      QrCadastraConta.ExecSQL;
      LimpaCampos(Sender);
    end;
  end;
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
    CpoIdConta.Enabled       := True;
    GrpModoPagamento.Enabled := True;
  end
  else
  begin
    CpoIdConta.Enabled       := False;
    GrpModoPagamento.Enabled := False;
    ConsultaConta(Sender);
    ConsultaParcelas(Sender);
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
      CpoDiaVencimento.Enabled       := False;
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
      CpoDiaVencimento.Enabled       := False;
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
      CpoDiaVencimento.Enabled       := True;
      BtnRemover.Enabled             := False;
      GrdParcelas.Enabled            := False;
    end;
  end;
end;

procedure TFrmCadastrarConta.ConsultaConta(Sender: TObject);
begin
  QrConsulta.Close;
  QrConsulta.SQL.Text :=
    ' SELECT c.DESCRICAO,                        '+
    '        c.VALOR AS VALORCONTA,              '+
    '        c.DIA_VENC AS DIAVENCIMENTO,        '+
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
  CpoDiaVencimento.Value := QrConsulta.FieldByName('DIAVENCIMENTO').AsInteger;
end;

procedure TFrmCadastrarConta.ConsultaParcelas(Sender: TObject);
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

procedure TFrmCadastrarConta.LimpaCampos(Sender: TObject);
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
  CpoDiaVencimento.Clear;
  CpoNumeroParcela.Clear;
  CpoValorParcela.Clear;
  CdsGrade.Edit;
  CdsGrade.EmptyDataSet;
end;

end.

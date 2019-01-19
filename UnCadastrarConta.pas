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
    LbId: TLabel;
    IdConta: TLabel;
    QrIdConta: TFDQuery;
    BtnBuscarTipoConta: TButton;
    CpoTipoConta: TEdit;
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
    BtnBuscarProcedente: TButton;
    CpoProcedente: TEdit;
    Label3: TLabel;
    CpoIdProcedente: TEdit;
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
  private
    { Private declarations }
  public

  end;

var
  FrmCadastrarConta: TFrmCadastrarConta;
  bParcelado, bAbriuPorCadastroConta : boolean;
  iIdConta   : Integer;
  sModoPagamento : String;

implementation

{$R *.dfm}

uses
DmConn, UnConsultaPessoa, UnConsultaTipoConta, UnConsultaProcedente;

procedure TFrmCadastrarConta.FormShow(Sender: TObject);
begin
  QrIdConta.SQL.Clear;
  QrIdConta.SQL.Text :=
    'SELECT MAX(ID_CONTA) AS COD FROM conta';
  QrIdConta.Open;
  iIdConta                   := QrIdConta.FieldByName('COD').AsInteger + 1;
  LbId.Caption               := IntToStr(iIdConta);
  QrIdConta.Close;
  CpoVencimentoUnico.Enabled := False;
  CpoDiaVencimento.Enabled   := False;
  CpoDescricao.Clear;
  CpoTipoConta.Clear;
  CdsGrade.CreateDataSet;
end;

procedure TFrmCadastrarConta.BtnAdicionarClick(Sender: TObject);
begin
  CdsGrade.Append;
  CdsGradeNUMERO.AsInteger        := CpoNumeroParcela.Value;
  CdsGradeVALOR.AsCurrency        := StrToCurr(CpoValorParcela.Text);
  CdsGradeVENC_PARCELA.AsDateTime := CpoVencimentoParcelado.DateTime;
  CdsGradePAGO.AsString           := CpoPago.Text;
  CdsGrade.Post;
  CpoNumeroParcela.Value := CpoNumeroParcela.Value + 1;
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
        ' INSERT INTO conta(ID_PESSOA,  '+
        '                   DESCRICAO,  '+
        '                   MODO_PGTO,  '+
        '                   VALOR)      '+
        '            VALUES(:ID_PESSOA, '+
        '                   :DESCRICAO, '+
        '                   :MODO_PGTO, '+
        '                   :VALOR)     ';
      QrCadastraConta.ParamByName('ID_PESSOA').AsInteger    :=
        StrToInt(CpoIdTitular.Text);
      QrCadastraConta.ParamByName('DESCRICAO').AsString     :=
        CpoDescricao.Text;
      QrCadastraConta.ParamByName('MODO_PGTO').AsString     :=
        sModoPagamento;
      QrCadastraConta.ParamByName('VALOR').AsCurrency       :=
        StrToCurr(CpoValorConta.Text);
      QrCadastraConta.ExecSQL;

      CdsGrade.First;
      while not CdsGrade.Eof do
      begin
        QrCadastraConta.Close;
        QrCadastraConta.SQL.Text :=
          ' INSERT INTO parcela(NUMERO,        '+
          '                     VALOR,         '+
          '                     VENC_PARCELA,  '+
          '                     PAGO,          '+
          '                     ID_CONTA)      '+
          '              VALUES(:NUMERO,       '+
          '                     :VALOR,        '+
          '                     :VENC_PARCELA, '+
          '                     :PAGO,         '+
          '                     :ID_CONTA)     ';
        QrCadastraConta.ParamByName('NUMERO').AsInteger        :=
          CdsGradeNUMERO.AsInteger;
        QrCadastraConta.ParamByName('VALOR').AsCurrency        :=
          CdsGradeVALOR.AsCurrency;
        QrCadastraConta.ParamByName('VENC_PARCELA').AsDateTime :=
          CdsGradeVENC_PARCELA.AsDateTime;
        QrCadastraConta.ParamByName('PAGO').AsString           :=
          CdsGradePAGO.AsString;
        QrCadastraConta.ParamByName('ID_CONTA').AsInteger      :=
          StrToInt(LbId.Caption);
        QrCadastraConta.ExecSQL;
        CdsGrade.Next;
      end;
      LimpaCampos(Sender);
    end;
    1:begin
      sModoPagamento := 'Parcela única';
      QrCadastraConta.Close;
      QrCadastraConta.SQL.Text :=
        ' INSERT INTO conta(ID_PESSOA,     '+
        '                   DESCRICAO,     '+
        '                   MODO_PGTO,     '+
        '                   VALOR,         '+
        '                   VENC_CONTA,    '+
        '                   ID_TIPOCONTA)  '+
        '            VALUES(:ID_PESSOA,    '+
        '                   :DESCRICAO,    '+
        '                   :MODO_PGTO,    '+
        '                   :VALOR,        '+
        '                   :VENC_CONTA,   '+
        '                   :ID_TIPOCONTA) ';
      QrCadastraConta.ParamByName('ID_PESSOA').AsInteger    :=
        StrToInt(CpoIdTitular.Text);
      QrCadastraConta.ParamByName('DESCRICAO').AsString     :=
        CpoDescricao.Text;
      QrCadastraConta.ParamByName('MODO_PGTO').AsString     :=
        sModoPagamento;
      QrCadastraConta.ParamByName('VALOR').AsCurrency       :=
        StrToCurr(CpoValorConta.Text);
      QrCadastraConta.ParamByName('VENC_CONTA').AsDate      :=
        CpoVencimentoUnico.DateTime;
      QrCadastraConta.ParamByName('ID_TIPOCONTA').AsInteger :=
        StrToInt(CpoIdTipoConta.Text);
      QrCadastraConta.ExecSQL;
      LimpaCampos(Sender);
    end;
    2:begin
      sModoPagamento := 'Mensal';
      QrCadastraConta.Close;
      QrCadastraConta.SQL.Text :=
        ' INSERT INTO conta(ID_PESSOA,     '+
        '                   DESCRICAO,     '+
        '                   MODO_PGTO,     '+
        '                   VALOR,         '+
        '                   DIA_VENC,      '+
        '                   ID_TIPOCONTA)  '+
        '            VALUES(:ID_PESSOA,    '+
        '                   :DESCRICAO,    '+
        '                   :MODO_PGTO,    '+
        '                   :VALOR,        '+
        '                   :DIA_VENC,     '+
        '                   :ID_TIPOCONTA) ';
      QrCadastraConta.ParamByName('ID_PESSOA').AsInteger    :=
        StrToInt(CpoIdTitular.Text);
      QrCadastraConta.ParamByName('DESCRICAO').AsString     :=
        CpoDescricao.Text;
      QrCadastraConta.ParamByName('MODO_PGTO').AsString     :=
        sModoPagamento;
      QrCadastraConta.ParamByName('VALOR').AsCurrency       :=
        StrToCurr(CpoValorConta.Text);
      QrCadastraConta.ParamByName('DIA_VENC').AsInteger     :=
        StrToInt(CpoDiaVencimento.Text);
      QrCadastraConta.ParamByName('ID_TIPOCONTA').AsInteger :=
        StrToInt(CpoIdTipoConta.Text);
      QrCadastraConta.ExecSQL;
      LimpaCampos(Sender);
    end;
  end;
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
    end;
    1:begin
      bParcelado                     := False;
      CpoNumeroParcela.Enabled       := False;
      CpoValorParcela.Enabled        := False;
      CpoVencimentoParcelado.Enabled := False;
      CpoVencimentoUnico.Enabled     := True;
      BtnAdicionar.Enabled           := False;
      CpoDiaVencimento.Enabled       := False;
    end;
    2:begin
      bParcelado                     := False;
      CpoNumeroParcela.Enabled       := False;
      CpoValorParcela.Enabled        := False;
      CpoVencimentoParcelado.Enabled := False;
      CpoVencimentoUnico.Enabled     := False;
      BtnAdicionar.Enabled           := False;
      CpoDiaVencimento.Enabled       := True;
    end;
  end;
end;

procedure TFrmCadastrarConta.LimpaCampos(Sender: TObject);
begin
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

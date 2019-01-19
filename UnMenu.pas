unit UnMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmMenu = class(TForm)
    PaConteudo: TPanel;
    MainMenu: TMainMenu;
    Consulta: TMenuItem;
    Cadastro: TMenuItem;
    CadTipoConta: TMenuItem;
    CadPessoa: TMenuItem;
    CadConta: TMenuItem;
    Configurar: TMenuItem;
    ConfTipoConta: TMenuItem;
    ConfPessoa: TMenuItem;
    ConfConta: TMenuItem;
    BtnBuscar: TButton;
    EdtNome: TEdit;
    EdtId: TEdit;
    PROCEDENTE1: TMenuItem;
    ConfProcedente: TMenuItem;
    LblSalario: TLabel;
    LblData: TLabel;
    LblMes: TLabel;
    EdtSalario: TEdit;
    CBMes: TComboBox;
    GrdContas: TDBGrid;
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
    DsGrade: TDataSource;
    QrGrade: TFDQuery;
    CdsGrade: TClientDataSet;
    CdsGradeNUM_PARCELA: TIntegerField;
    CdsGradeTIPO_CONTA: TStringField;
    CdsGradeVALOR: TCurrencyField;
    CdsGradeDESCRICAO: TStringField;
    CdsGradeVENCIMENTO: TDateField;
    CdsGradePAGO: TStringField;
    procedure ConsultaClick(Sender: TObject);
    procedure CadTipoContaClick(Sender: TObject);
    procedure CadPessoaClick(Sender: TObject);
    procedure CadContaClick(Sender: TObject);
    procedure ConfTipoContaClick(Sender: TObject);
    procedure ConfPessoaClick(Sender: TObject);
    procedure ConfContaClick(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure CadProcedenteClick(Sender: TObject);
    procedure ConfProcedenteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;
  bAbriuPorMenu : boolean;

implementation

{$R *.dfm}

uses UnConsulta, UnConsultaPessoa, UnConfigurarConta, UnConfigurarPessoa, UnConfigurarTipoConta,
  UnCadastrarConta, UnCadastrarPessoa, UnCadastrarTipoConta,
  UnCadastrarProcedente, UnConfigurarProcedente;

procedure TFrmMenu.ConfContaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConfigurarConta, FrmConfigurarConta);
  FrmConfigurarConta.Show;
end;

procedure TFrmMenu.ConfPessoaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConfigurarPessoa, FrmConfigurarPessoa);
  FrmConfigurarPessoa.Show;
end;

procedure TFrmMenu.ConfProcedenteClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConfigurarProcedente, FrmConfigurarProcedente);
  FrmConfigurarProcedente.Show;
end;

procedure TFrmMenu.ConfTipoContaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConfigurarTipoConta, FrmConfigurarTipoConta);
  FrmConfigurarTipoConta.Show;
end;

procedure TFrmMenu.ConsultaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsulta, FrmConsulta);
  FrmConsulta.Show;
end;

procedure TFrmMenu.CadProcedenteClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastrarProcedente, FrmCadastrarProcedente);
  FrmCadastrarProcedente.Show;
end;

procedure TFrmMenu.BtnBuscarClick(Sender: TObject);
begin
  bAbriuPorMenu := True;
  Application.CreateForm(TFrmConsultaPessoa, FrmConsultaPessoa);
  FrmConsultaPessoa.Show;
end;

procedure TFrmMenu.CadContaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastrarConta, FrmCadastrarConta);
  FrmCadastrarConta.Show;
end;

procedure TFrmMenu.CadPessoaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastrarPessoa, FrmCadastrarPessoa);
  FrmCadastrarPessoa.Show;
end;

procedure TFrmMenu.CadTipoContaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastrarTipoConta, FrmCadastrarTipoConta);
  FrmCadastrarTipoConta.Show;
end;

end.

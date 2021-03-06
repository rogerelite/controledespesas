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
    CadProcedente: TMenuItem;
    ConfProcedente: TMenuItem;
    ConsDespesas: TMenuItem;
    ConfSistema: TMenuItem;
    procedure CadTipoContaClick(Sender: TObject);
    procedure CadPessoaClick(Sender: TObject);
    procedure CadContaClick(Sender: TObject);
    procedure ConfTipoContaClick(Sender: TObject);
    procedure ConfPessoaClick(Sender: TObject);
    procedure ConfContaClick(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure CadProcedenteClick(Sender: TObject);
    procedure ConfProcedenteClick(Sender: TObject);
    procedure ConsDespesasClick(Sender: TObject);
    procedure ConfSistemaClick(Sender: TObject);
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
  UnCadastrarProcedente, UnConfigurarProcedente, UnConsultaDespesas,
  UnConsultarConta, UnConfigurarSistema;

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

procedure TFrmMenu.ConfSistemaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConfigurarSistema, FrmConfigurarSistema);
  FrmConfigurarSistema.Show;
end;

procedure TFrmMenu.ConfTipoContaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConfigurarTipoConta, FrmConfigurarTipoConta);
  FrmConfigurarTipoConta.Show;
end;

procedure TFrmMenu.ConsDespesasClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultaDespesas, FrmConsultaDespesas);
  FrmConsultaDespesas.Show;
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

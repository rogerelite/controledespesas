program ControleDespesas;

uses
  Vcl.Forms,
  UnMenu in 'UnMenu.pas' {FrmMenu},
  UnCadastrarConta in 'UnCadastrarConta.pas' {FrmCadastrarConta},
  UnCadastrarTipoConta in 'UnCadastrarTipoConta.pas' {FrmCadastrarTipoConta},
  UnCadastrarPessoa in 'UnCadastrarPessoa.pas' {FrmCadastrarPessoa},
  UnConfigurarTipoConta in 'UnConfigurarTipoConta.pas' {FrmConfigurarTipoConta},
  UnConfigurarPessoa in 'UnConfigurarPessoa.pas' {FrmConfigurarPessoa},
  DmConn in 'DmConn.pas' {DataModule1: TDataModule},
  UnConsultaPessoa in 'UnConsultaPessoa.pas' {FrmConsultaPessoa},
  UnConsultaTipoConta in 'UnConsultaTipoConta.pas' {FrmConsultaTipoConta},
  UnConsultaProcedente in 'UnConsultaProcedente.pas' {FrmConsultaProcedente},
  UnCadastrarProcedente in 'UnCadastrarProcedente.pas' {FrmCadastrarProcedente},
  UnConfigurarProcedente in 'UnConfigurarProcedente.pas' {FrmConfigurarProcedente},
  UnPagarConta in 'UnPagarConta.pas' {FrmPagarConta},
  UnConsultaDespesas in 'UnConsultaDespesas.pas' {FrmConsultaDespesas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TFrmCadastrarConta, FrmCadastrarConta);
  Application.CreateForm(TFrmCadastrarTipoConta, FrmCadastrarTipoConta);
  Application.CreateForm(TFrmCadastrarPessoa, FrmCadastrarPessoa);
  Application.CreateForm(TFrmConfigurarTipoConta, FrmConfigurarTipoConta);
  Application.CreateForm(TFrmConfigurarPessoa, FrmConfigurarPessoa);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFrmConsultaPessoa, FrmConsultaPessoa);
  Application.CreateForm(TFrmConsultaTipoConta, FrmConsultaTipoConta);
  Application.CreateForm(TFrmConsultaProcedente, FrmConsultaProcedente);
  Application.CreateForm(TFrmCadastrarProcedente, FrmCadastrarProcedente);
  Application.CreateForm(TFrmConfigurarProcedente, FrmConfigurarProcedente);
  Application.CreateForm(TFrmPagarConta, FrmPagarConta);
  Application.CreateForm(TFrmConsultaDespesas, FrmConsultaDespesas);
  Application.Run;
end.

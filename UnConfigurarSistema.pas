unit UnConfigurarSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, Vcl.Samples.Spin;

type
  TFrmConfigurarSistema = class(TForm)
    PaConteudo: TPanel;
    GbContasMensais: TGroupBox;
    CpoLuz: TCheckBox;
    CpoAgua: TCheckBox;
    CpoInternet: TCheckBox;
    CpoTelefoneMovel: TCheckBox;
    BtnSalvar: TButton;
    QrContaFixa: TFDQuery;
    LblConta: TStaticText;
    QrConsulta: TFDQuery;
    procedure BtnSalvarClick(Sender: TObject);
    procedure AtivaContaFixa(iIdContaFixa: Integer);
    procedure DesativaContaFixa(iIdContaFixa: Integer);
    procedure FormShow(Sender: TObject);
    procedure CarregaCampos;
  private
    bContaLuzAtiva,
    bContaAguaAtiva,
    bContaTelefoneMovelAtiva,
    bContaInternetAtiva       : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfigurarSistema: TFrmConfigurarSistema;

implementation

uses
  UnFuncoes;

{$R *.dfm}

procedure TFrmConfigurarSistema.BtnSalvarClick(Sender: TObject);
begin
  if (CpoLuz.Checked) then
  begin
    if (not bContaLuzAtiva) then
    begin
      AtivaContaFixa(1);
    end;
  end
  else
  begin
    if (bContaLuzAtiva) then
    begin
      DesativaContaFixa(1);
    end;
  end;

  if (CpoAgua.Checked) then
  begin
    if (not bContaAguaAtiva) then
    begin
      AtivaContaFixa(2);
    end;
  end
  else
  begin
    if (bContaAguaAtiva) then
    begin
      DesativaContaFixa(2);
    end;
  end;

  if (CpoTelefoneMovel.Checked) then
  begin
    if (not bContaTelefoneMovelAtiva) then
    begin
      AtivaContaFixa(3);
    end;
  end
  else
  begin
    if (bContaTelefoneMovelAtiva) then
    begin
      DesativaContaFixa(3);
    end;
  end;

  if (CpoInternet.Checked) then
  begin
    if (not bContaInternetAtiva) then
    begin
      AtivaContaFixa(4);
    end;
  end
  else
  begin
    if (bContaInternetAtiva) then
    begin
      DesativaContaFixa(4);
    end;
  end;
end;

procedure TFrmConfigurarSistema.AtivaContaFixa(iIdContaFixa: Integer);
begin
  try
    QrContaFixa.Close;
    QrContaFixa.SQL.Text :=
      ' UPDATE contafixa             '+
      '    SET ATIVA = ''S''         '+
      '  WHERE ID_CONTA = :ID_CONTA  ';
    QrContaFixa.ParamByName('ID_CONTA').AsInteger := iIdContaFixa;
    QrContaFixa.ExecSQL;
  finally
    QrContaFixa.Close;
  end;
end;

procedure TFrmConfigurarSistema.DesativaContaFixa(iIdContaFixa: Integer);
begin
  try
    QrContaFixa.Close;
    QrContaFixa.SQL.Text :=
      ' UPDATE contafixa            '+
      '    SET ATIVA = ''N''        '+
      '  WHERE ID_CONTA = :ID_CONTA ';
    QrContaFixa.ParamByName('ID_CONTA').AsInteger := iIdContaFixa;
    QrContaFixa.ExecSQL;
  finally
    QrContaFixa.Close;
  end;
end;

procedure TFrmConfigurarSistema.FormShow(Sender: TObject);
begin
  CarregaCampos;
end;

procedure TFrmConfigurarSistema.CarregaCampos;
begin
  try
    QrConsulta.Close;
    QrConsulta.SQL.Text :=
      ' SELECT ID_CONTA, '+
      '        ATIVA     '+
      '   FROM contafixa ';
    QrConsulta.Open;

    while not QrConsulta.Eof do
    begin
      if ((QrConsulta.FieldByName('ID_CONTA').AsInteger = 1) and
          (QrConsulta.FieldByName('ATIVA').AsString = 'S')) then
      begin
        bContaLuzAtiva         := True;
        CpoLuz.Checked         := True;
      end
      else if ((QrConsulta.FieldByName('ID_CONTA').AsInteger = 1) and
               (QrConsulta.FieldByName('ATIVA').AsString = 'N')) then
      begin
        bContaLuzAtiva := False;
        CpoLuz.Checked := False;
      end;

      if ((QrConsulta.FieldByName('ID_CONTA').AsInteger = 2) and
          (QrConsulta.FieldByName('ATIVA').AsString = 'S')) then
      begin
        bContaAguaAtiva         := True;
        CpoAgua.Checked         := True;
      end
      else if ((QrConsulta.FieldByName('ID_CONTA').AsInteger = 2) and
               (QrConsulta.FieldByName('ATIVA').AsString = 'N')) then
      begin
        bContaAguaAtiva := False;
        CpoAgua.Checked := False;
      end;

      if ((QrConsulta.FieldByName('ID_CONTA').AsInteger = 3) and
          (QrConsulta.FieldByName('ATIVA').AsString = 'S')) then
      begin
        bContaTelefoneMovelAtiva         := True;
        CpoTelefoneMovel.Checked         := True;
      end
      else if ((QrConsulta.FieldByName('ID_CONTA').AsInteger = 3) and
               (QrConsulta.FieldByName('ATIVA').AsString = 'N')) then
      begin
        bContaTelefoneMovelAtiva := False;
        CpoTelefoneMovel.Checked := False;
      end;

      if ((QrConsulta.FieldByName('ID_CONTA').AsInteger = 4) and
          (QrConsulta.FieldByName('ATIVA').AsString = 'S')) then
      begin
        bContaInternetAtiva         := True;
        CpoInternet.Checked         := True;
      end
      else if ((QrConsulta.FieldByName('ID_CONTA').AsInteger = 4) and
               (QrConsulta.FieldByName('ATIVA').AsString = 'N')) then
      begin
        bContaInternetAtiva := False;
        CpoInternet.Checked := False;
      end;
      QrConsulta.Next;
    end;
  finally
    QrConsulta.Close;
  end;
end;

end.

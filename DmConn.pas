unit DmConn;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Comp.DataSet;

type
  TDataModule1 = class(TDataModule)
    QrConsultaTipoContas: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    QrPessoa: TFDQuery;
    FDConn: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    QrTipoConta: TFDQuery;
    QrConta: TFDQuery;
    QrParcela: TFDQuery;
    procedure MySQLConnSetting;
    function OpenConnection:Boolean;
    procedure CloseConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    StrHostName,StrDBName,StrDBUser,StrDBPass,StrDBPort:String;
    intUID:integer;
    BlnStatus:Boolean;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
procedure TDataModule1.MySQLConnSetting;
begin
  FDConn := TFDConnection.Create(Self);

  try
    FDConn.DriverName               := 'MySQL';
//    FDConn.Params.Add('127.0.0.1=' + StrHostName);
//    FDConn.Params.Add('controledespesas=' + StrDBName);
//    FDConn.Params.Add('root=' + StrDBUser);
//    FDConn.Params.Add('' + StrDBPass);
//    FDConn.Params.Add('https://databases-auth.000webhost.com/db_structure.php?db=id8575239_controledespesas&token=07649b51b1ebd4700d9e03469968d5e0=' + StrHostName);
//    FDConn.Params.Add('id8575239_controledespesas=' + StrDBName);
//    FDConn.Params.Add('id8575239_roger=' + StrDBUser);
//    FDConn.Params.Add('Roger1986' + StrDBPass);
//    FDConn.Params.Add('3306=' + StrDBPort);
//    FDConn.LoginPrompt              := False;
//    FDConn.Connected                := True;
//    QrPessoa                        := TFDQuery.Create(Self);
//    QrPessoa.Connection             := FDConn;
//    QrTipoConta                     := TFDQuery.Create(Self);
//    QrTipoConta.Connection          := FDConn;
//    QrConsultaTipoContas            := TFDQuery.Create(Self);
//    QrConsultaTipoContas.Connection := FDConn;
//    QrParcela                       := TFDQuery.Create(Self);
//    QrParcela.Connection            := FDConn;
    FDGUIxWaitCursor1.ScreenCursor  := gcrNone;
  except
    //
  end;
end;

function TDataModule1.OpenConnection:Boolean;
var ConnString:String;
begin
  try
    if FDConn.Connected = True then
      begin
        result:=True;
      end
    else
      begin
        MySQLConnSetting;
      end;

  except
    result:=False;
  end;
end;

procedure TDataModule1.CloseConnection;
begin
  QrPessoa.Close;
  QrTipoConta.Close;
  QrConsultaTipoContas.Close;
  QrParcela.Close;
  FDConn.Close;
end;
end.

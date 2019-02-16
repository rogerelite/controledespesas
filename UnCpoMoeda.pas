unit UnCpoMoeda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrameCpoMoeda = class(TFrame)
    CpoMoeda: TEdit;
    procedure CpoMoedaClick(Sender: TObject);
    procedure CpoMoedaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrameCpoMoeda.CpoMoedaClick(Sender: TObject);
begin
  if (CpoMoeda.Text = 'R$ 0,00') then
  begin
    CpoMoeda.Clear;
  end;
end;

procedure TFrameCpoMoeda.CpoMoedaExit(Sender: TObject);
begin
  CpoMoeda.Text := FormatFloat('R$ #,##0.00', StrToFloatDef(CpoMoeda.Text,0));
end;

end.

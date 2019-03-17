unit UnFuncoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFrmFuncoes = class(TForm)
  private
    { Private declarations }
  public
    function ZeroAEsquerda(const sValor: string; const iComprimento: integer): string;
    { Public declarations }
  end;

var
  FrmFuncoes: TFrmFuncoes;

implementation

function TFrmFuncoes.ZeroAEsquerda(const sValor: string; const iComprimento: integer): string;
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

{$R *.dfm}

end.

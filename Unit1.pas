unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMaquina, Vcl.StdCtrls, uTroco,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var maquina : TMaquina; lista : Tlist;
i: integer;
Str, TipoCel : String;
begin
   maquina := TMaquina.Create;
   lista := Tlist.Create;
   lista := maquina.MontarTroco(StrtoFloat(Edit1.Text));
   Str   := '';

   for I := 0 to lista.Count -1 do
   begin
     if TTroco(lista.Items[i]).Quantidade > 0 then
     begin
        if TTroco(lista.Items[i]).Tipo > ceNota2 then
          TipoCel := ' Moeda'
        else
          TipoCel := ' Cédula';

        if TTroco(lista.Items[i]).Quantidade > 1 then
          TipoCel := TipoCel + 's';

        Str := Str +(intToStr(TTroco(lista.Items[i]).Quantidade)+ TipoCel+' de '+
                     FormatFloat('R$ ###,###,##0.00',CValorCedula[TTroco(lista.Items[i]).Tipo]))+#10+#13;

        TTroco(lista.Items[i]).Free;
     end;
   end;

   ShowMessage(Str);
   maquina.Free;
   lista.Free;
end;

end.

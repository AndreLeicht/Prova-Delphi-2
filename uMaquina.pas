unit uMaquina;

interface

uses
  uIMaquina, Classes, uTroco, dialogs, sysutils, math;

type

  TMaquina = class(TInterfacedObject, IMaquina)
  public
    function MontarTroco(aTroco: Double): TList;
  end;

implementation

function TMaquina.MontarTroco(aTroco: Double): TList;
var
  vValor : double;
  vQuantidadeCedulas : integer;
  vTipo: TCedula;
  oTroco : TTroco;
  vLista : TList;
begin
   vValor := aTroco;
   vQuantidadeCedulas := 0;
   vTipo := ceNota100;
   vLista := TList.Create;

   while vValor > 0 do
   begin
     if (vValor >= CValorCedula[vTipo]) then
     begin
       vValor := RoundTo(vValor - CValorCedula[vTipo], -2);
       vQuantidadeCedulas := vQuantidadeCedulas + 1;



       if (vValor = 0) then
       begin
         oTroco := TTroco.Create(vTipo,vQuantidadeCedulas);
         vLista.Add(oTroco);

       end;

     end
     else
     begin
       if vQuantidadeCedulas > 0 then
       begin
         oTroco := TTroco.Create(vTipo,vQuantidadeCedulas);
         vLista.Add(oTroco);
       end;

       case vTipo of
         ceNota100  : vTipo  := ceNota50;
         ceNota50   : vTipo  := ceNota20;
         ceNota20   : vTipo  := ceNota10;
         ceNota10   : vTipo  := ceNota5;
         ceNota5    : vTipo  := ceNota2;
         ceNota2    : vTipo  := ceMoeda100;
         ceMoeda100 : vTipo  := ceMoeda50;
         ceMoeda50  : vTipo  := ceMoeda25;
         ceMoeda25  : vTipo  := ceMoeda10;
         ceMoeda10  : vTipo  := ceMoeda5;
         ceMoeda5   : vTipo  := ceMoeda1;
       end;
       vQuantidadeCedulas := 0;
     end;
   end;


  Result := vLista;

end;

end.


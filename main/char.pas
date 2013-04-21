unit char;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart,mnk,Math;

type
Tstak=array of array[0..3] of double;
 masi=array of integer;
  MathFunc=object
  private
  loopcounter:integer;
    Map:integer;
    b,g,a:mas;
    mai:Tstak;
    function m1(m:integer):double;
    function m2(m:integer):double;
    function m3(m:integer):double;
    function m4 ():double;
    procedure maxis (X,Y:mas;m:integer;var ai,bi,gi:mas;var Tmai:Tstak);
    function GetTrand(Tmai:Tstak):integer;
        function FindIndex(I:double;M:mas):integer;
  public
  Chart1: TChart;
  Chart2: TChart;
  limit:integer;
  BO:mas;
    DateLastCheng:TDateTime;
   Xi:mas;
    Yi:mas;
    NoDate:TDate;
    Setcode:String;
   trand:double;
   SecBoard:string;
     value:mas;
      capch:double;
    function GetTrand2(var n1,n2:double):integer;
   function  TechF(n1,n2:integer):integer;
  constructor creat;
  procedure SetXY(X,Y,O:mas;D:TDate;N,m:integer);

   destructor Destroy;
  function MyMath(m:integer):double;

  end;
//------------------------------------------------------
  TForm2 = class(TForm)
    Chart1: TChart;
    Series1: TPointSeries;
    Series4: TPointSeries;
    Chart2: TChart;
    Series7: TFastLineSeries;
    Series6: TPointSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series5: TLineSeries;
    Series8: TLineSeries;
    Series10: TPointSeries;
    Series9: TPointSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
constructor MathFunc.creat;
 begin
 trand:=99;
 end;
  function  MathFunc.TechF(n1,n2:integer):integer;
 var
 NK1,NK2,Fk:double;
 fil:System.text;
  begin
   if FileExists ('F.txt')then
    begin
      AssignFile(fil,'F.txt');
      Reset(fil);
      While (not eof(fil))or((NK1=n1)and(NK2=n2)) do
             begin
             Readln(fil,NK1,NK2,Fk);
             end;
         if  (NK1<>n1)and(NK2<>n2) then
              begin
                Fk:=0;
                CloseFile(fil);
                Rewrite(fil);
                WriteLn(fil,n1,n2,'0');
              end;
    end
      else
        begin
           AssignFile(fil,'F.txt');
           Rewrite(fil);
           WriteLn(fil,n1,n2,'0');

        end;
        CloseFile(fil);
  end;

 function MathFunc.FindIndex(I:double;M:mas):integer;
 var
  j:integer;
 begin
   for j:=0 to Length(M)-1 do
   if M[j]-I<0.001 then FindIndex:=j;
 end;

 //*****************************************************************
 function MathFunc.m3(m:integer):double;
 var
 alfa,dlina:double;
 Lmai,LXi,LYi:integer;
 begin

 Form2.Chart1.Series[7].Clear;
 Lmai:= Length(mai)-1;
 LXi:=Length(Xi)-1;
 LYi:=Length(Yi)-1;
 m3:=0;

 if (LYi>30)and(Lmai>0) then
begin
Chart1.Series[7].AddXY(mai[Length(mai)-1,0]*0.25,mai[Lmai,1]);
 if (Yi[LYi]-mai[Lmai,1])>0.000001 then
    begin
        alfa:=ArcTan(abs(Xi[LXi]-mai[Lmai,0]*0.25)/abs(Yi[LYi]-mai[Lmai,1]));
     end
        else
alfa:=1.5707963;
dlina:= (Xi[length(Xi)-1]-mai[Length(mai)-1,0]*0.25);
 if(alfa>0.349065)and(dlina>Length(Xi)/20)and(NoDate[trunc(mai[Length(mai)-1,0])]-DateLastCheng>0.02) then
 begin

                m3:=1;
 end;
                end;
 end;


////////////////////////////////////////////////////////////////////
function MathFunc.m4():double;
  var
  i:integer;
  max:double;
  Norma:array of double;
  begin
  m4:=0;
  if Length(Yi)>20 then
  begin
  Setlength(Norma,Length(Yi));
  for i:=Length(Yi)-1 downto 20 do
  Norma[i]:=Yi[i]-Yi[i-20];
  max:=abs(Norma[0]);
  for i:=0 to Length(Yi)-1 do
  if max<abs(Norma[i]) then
  max:=abs(Norma[i]);
  for i:=0 to  Length(Yi)-1 do  begin
  Norma[i]:=Norma[i]/max;
  Chart2.Series[0].AddXY(i,Norma[i]) ;
  end;
  for i:=Length(Yi)-1 downto  20 do
  if  ((Norma[i]<0)and(Norma[i+1]>0))or((Norma[i]>0)and(Norma[i+1]<0)) then
  if  (Norma[Length(Yi)-1]>0.9)or(Norma[Length(Yi)-1]<-0.95) then
        begin
        if  ((Norma[Length(Yi)-1]<0)and(trand<0))or((Norma[Length(Yi)-1]>0)and(trand>0)) then
        m4:=1

        end;
    end;
  end;


 //*****************************************************************
 function MathFunc.m2(m:integer):double;
 var
i,o:integer;
S,itog:double;
begin
m2:=0;
for i:=0 to Length(BO)-1 do
S:=S+BO[i];
S:=S/Length(BO);
i:=Length(BO)-1;
if i>60 then
repeat
begin
 i:=i-1;
 end;
until((NoDate[i]-DateLastCheng>0.000000001)or(i=0))         ;
itog:=0;
for o:=i to Length(BO)-1 do
itog:=itog+BO[o]-S;

if ((trand>0) and (itog<0))or((trand<0) and (itog>0)) then
m2:=1;

  end;










 //*******************************************************
  function MathFunc.m1(m:integer):double;
   var
  f:System.Text;
     k,i,buf:integer;
    ds:mas;
     h,pkt,MP:double;
     j,y,Sg:integer;
  suma:double;
  PkM,stak:array[1..3] of double;
     begin
     MP:=0;
     if Length(Xi)>40 then
        begin
if FileExists (Setcode+'txt')then
begin
AssignFile(f,Setcode+'.txt');
Append (f);
end
else
begin
 AssignFile(f,Setcode+'.txt');
 Rewrite(f);
 WriteLn(f,'Xi   Yi   trand');
end;
     i:=0;
  y:=Length(Yi)-1;
   while (y>=34)and(i<>1)  do
  begin
              suma:=0;
                    for j:=y downto y-33 do
                    suma:=suma+Yi[j];
                    suma:=suma/34;
                  Chart1.Series[6].AddXY(Xi[y],suma);
                    Stak[3]:=Stak[2];
                    Stak[2]:=Stak[1];
                    Stak[1]:=suma;
                    PkM[3]:= PkM[2];
                    PkM[2]:= PkM[1];
                    PkM[1]:=Pk(Xi[y],a,b,g,m);
            				Setlength(ds,Length(Yi)-y);
				ds[Length(ds)-1]:=suma;
            if  Length(ds)>4  then
  if ((PkM[1]>Stak[1])and(PkM[3]<Stak[3]))or((PkM[1]<Stak[1])and(PkM[3]>Stak[3])) then
  begin
		 Sg:=y;
     while ((Length(Yi)-1)>=Sg )and(i<>1) do
      begin
      if (NoDate[Sg]-DateLastCheng<0.02) then
      i:=1;
       if ((Pk(Xi[Sg],a,b,g,m)-ds[Length(ds)-1])>0.05)and(NoDate[Sg]-DateLastCheng>0.02) then
			            begin
                  MP:=1-MP;
                 Chart1.Series[3].AddXY(Xi[y],suma);
			            end
			            else
                  SetLength(ds,Length(ds)-1);
       Sg:=Sg+1;
      end;
    end;
  y:=y-1;
  end;
  CloseFile(f);
  end;
  m1:=MP;
 end;
 destructor MathFunc.Destroy;
 begin
 SetLength(mai,0);
 SetLength(Xi,0);
 SetLength(Yi,0);
SetLength(a,0);
 SetLength(b,0);
 SetLength(g,0);

 end;
procedure MathFunc.maxis (X,Y:mas;m:integer;var ai,bi,gi:mas;var Tmai:Tstak);
var
i1,i,n:integer;
i2,i3:double;
stak:array[0..2] of double;
h:double;
begin
SetLength(mai,0);
 SetLength(a,0);
      SetLength(b,0);
      SetLength(g,0);

  SetLength(a,m+1);
      SetLength(b,m+1);
      SetLength(g,m+1);
      i3:=Xi[Length(Xi)-1];
     h:=0.25;
     n:=0;
     i2:=Xi[0]*4;
     i:=0;
  TMNK(Xi,Yi,b,g,a,Length(Xi)-1,m) ;

     repeat
              for i1:=0 to 1 do
              stak[i1]:=stak[i1+1];
              stak[2]:=Pk(i2*h,a,b,g,m);
             Form2.Chart1.Series[2].AddXY(i2*h,stak[2]);
              if (stak[0]>0.00001) and (stak[1]>0.00001) and (stak[2]>0.00001) then
              begin
                  if (stak[0]>stak[1])and(stak[1]<stak[2])then
                       begin
                       i:=i+1;
                       SetLength(Tmai,i);
                       Tmai[i-1,0]:=i2;
                        Tmai[i-1,1]:=stak[1];
                          Tmai[i-1,2]:=-1 ;
                         Tmai[i-1,3]:=Yi[FindIndex(i2*h,Xi)]  ;
                      end
                          else if (stak[0]<stak[1])and(stak[1]>stak[2]) then
                       begin
                       i:=i+1;
                       SetLength(mai,i);
                       Tmai[i-1,0]:=i2;
                        Tmai[i-1,1]:=stak[1];
                         Tmai[i-1,2]:=1;
                           Tmai[i-1,3]:=Yi[FindIndex(i2*h,Xi)]  ;
                      end;
              end;
              i2:=i2+1;
        until(i2*h>=i3);

end;
//*********************************************************
  procedure MathFunc.SetXY(X,Y,O:mas;D:TDate;N,m:integer);
  var
  i:integer;
  begin
  Form2.Chart1.Series[0].Clear;
  Form2.Chart1.Series[1].Clear;
  Form2.Chart1.Series[2].Clear;
  Form2.Chart1.Series[5].Clear;
   Form2.Chart1.Series[4].Clear;
      Form2.Chart1.Series[3].Clear;
   Form2.Chart1.Series[6].Clear;
  // Form2.Chart1.Series[7].Clear;
  // Form2.Chart1.Series[8].Clear;
    Form2.Chart2.Series[0].Clear;
  Form2.Chart2.Series[1].Clear;
SetLength(BO,0);
   SetLength(Xi,0);
  SetLength(Yi,0);
  SetLength(NoDate,0);
SetLength(BO,N);
  SetLength(Xi,N);
  SetLength(Yi,N);
  SetLength(NoDate,N);
  for i:=0 to  N-1 do
  begin
  Xi[i]:=X[i];
  Yi[i]:=Y[i];
  NoDate[i]:=D[i];
  Map:=m;
  BO[i]:=O[i];
  Form2.Chart1.Series[1].AddXY(Xi[i],Yi[i]);
  Form2.Chart2.Series[0].AddXY(Xi[i],BO[i]);

  end;
   maxis (Xi,Yi,m,a,b,g,mai);
  end;
//****************************************************

function MathFunc.GetTrand2(var n1,n2:double):integer;
var
i:integer;
y1,y2,G1,G2,S,f,Fk,t,NF1,NF2,nol,h:double;
fil:System.text;
sglag,X:mas;
begin
h:=0.25;
SetLength(sglag,Length(Xi)*4);
SetLength(X,Length(Xi)*4);
for i:=0 to Length(Xi)*4-1 do
      begin
        sglag[i]:=Pk(i*h,a,b,g,map);
        X[i]:=i;
      end;
nol:=0;
GetTrand2:=0;
S:=0;
   n1 :=Length(X)div 2;
   n2:=Length(X)-n1;
    for i:=0 to round(n1-1) do
    S:=S+sglag[i]   ;
    y1:=S/n1;
    S:=0;

    for i:=round(n1) to length(X)-1 do
    S:=S+sglag[i]  ;
    y2:=S/n2;

    S:=0;
    for i:=0 to Round(n1-1) do
    S:=Sqr(sglag[i]-y1);
    G1:=S/(n1-1);

 S:=0;
     for i:=Round(n1) to length(X)-1 do
     S:=Sqr(sglag[i]-y2);
     G2:=S/(n2-1);

     if G1>=G2 then
     F:=G1/G2;
     if G2>=G1 then
     F:=G2/G1;
//*******************************************************
     if FileExists ('F.txt')then
    begin
      AssignFile(fil,'F.txt');
      Reset(fil);
      While (not eof(fil)) do
             begin
             Read(fil,NF1);
             Read(fil,NF2);
             Read(fil,Fk);
              if  ((NF1=n1)and(NF2=n2)) then
              break;
             end;
         if  (NF1<>n1)and(NF2<>n2) then
              begin
                Fk:=0;
                CloseFile(fil);
                Append(fil);
                Write(fil,n1);
                Write(fil,n2);
                Write(fil,nol);
              end;
    end
      else
        begin
           AssignFile(fil,'F.txt');
           Rewrite(fil);
            Write(fil,n1,n2,nol);

        end;
        CloseFile(fil);
        if (Fk<>0)then
     if F<Fk then
          BEGIN
          F:=Sqrt(((n1-1)*G1+(n2-1)*G2)/(n1+n2-1));
          t:=abs(y1-y2)/(F*Sqrt(1/n1+1/n2));
          //*********************************************************
              if FileExists ('T.txt')then
    begin
                    AssignFile(fil,'T.txt');
      Reset(fil);
      While (not eof(fil))or((NF1=n1)and(NF2=n2)) do
             begin
           Read(fil,NF1);
             Read(fil,NF2);
             Read(fil,Fk);
             end;
         if  (NF1<>n1)and(NF2<>n2) then
              begin
                Fk:=0;
                CloseFile(fil);
                Rewrite(fil);
                Write(fil,n1,n2,nol);

              end;
    end
      else
        begin
           AssignFile(fil,'T.txt');
           Rewrite(fil);
           Write(fil,n1,n2,nol);

        end;
        CloseFile(fil);
          //*********************************************************
          if Fk<>0 then
              begin
                if t>Fk then
                     if Yi[i]>Yi[Length(Yi)-1] then
                        GetTrand2:=-1
                        else if  Yi[i]<Yi[Length(Yi)-1]    then
                              GetTrand2:=1
                                  else
                                  GetTrand2:=0;
              end;
          end
          else
          begin
          GetTrand2:=0;
          end;
      SetLength(sglag,0);
      SetLength(X,0);
end;
 //***************************************************
function MathFunc.GetTrand(Tmai:Tstak):integer;
var
i:integer;
Vershina,M:double;
dlina:integer;
H,buf:double;
close:boolean;

begin
close:=true;
GetTrand:=0;
While close do
begin
H:=Xi[Length(Xi)-1];
dlina:=Length(mai);
if(Length(mai)>0) then
begin
Vershina:=mai[dlina-1,0];
 Form2.Chart1.Series[5].Clear;
 Form2.Chart1.Series[5].AddXY(H,Yi[Length(Yi)-1]);
 Form2.Chart1.Series[5].AddXY(mai[dlina-1,0]*0.25,mai[dlina-1,1]);
 buf:= mai[dlina-1,1]-Yi[Length(Yi)-1];
M:=ArcTan((H-mai[dlina-1,0]*0.25)/abs(Yi[Length(Yi)-1]-mai[dlina-1,1]));
if(M>0.5235987)and((Xi[length(Xi)-1]-mai[dlina-1,0]*0.25)>Length(Xi)/4)then
			begin
       Form2.Chart1.Series[3].Clear;
      Form2.Chart1.Series[3].AddXY(Vershina*0.25,mai[dlina-1,1]);
        Form2.Chart1.Series[3].AddXY(Xi[Length(Xi)-1],Yi[Length(Yi)-1]);
		     if Yi[Length(Yi)-1]>mai[dlina-1,1] then
         begin
		         GetTrand:=1  ;
             close:=false;
              DateLastCheng:=NoDate[Length(NoDate)-1];
            //  Form2.Chart1.Series[8].AddXY(Xi[Length(NoDate)-1]*0.25,Yi[Length(NoDate)-1]);
         end
			else
            begin
		        	   GetTrand:=-1;
                  close:=false;
                   DateLastCheng:=NoDate[Length(NoDate)-1];
                 //   Form2.Chart1.Series[8].AddXY(Xi[Length(NoDate)-1]*0.25,Yi[Length(NoDate)-1]);
            end;
          end
		else
      begin
          SetLength(mai,dlina-1);
      end;
  end
      else
          begin
               close:=false;
          end ;

  end;
  end;
//************************************************************
    function MathFunc.MyMath(m:integer):double;
    var
    H:double;
    begin
    if (trand<>1)and(trand<>-1) then
    begin
  	 capch:=0;
     trand:=GetTrand(mai);
     end
  else
      begin
      H:= (m2(m)+m1(m)+m3(m)+m4())/4;
       if (H>=0.5) then
       begin
         DateLastCheng:=NoDate[Length(NoDate)-1];
       if trand>0 then
          begin
              trand:=0-trand ;
              capch:=-H ;
              loopcounter:=loopcounter+1;
              DateLastCheng:=NoDate[Length(NoDate)-1];
          //    Form2.Chart1.Series[8].AddXY(Xi[Length(NoDate)-1]*0.25,Yi[Length(NoDate)-1]);
          end
        else
        begin
            trand:=0-trand;
            capch:=H;
            loopcounter:=loopcounter+1;
            DateLastCheng:=NoDate[Length(NoDate)-1];
         //   Form2.Chart1.Series[8].AddXY(Xi[Length(NoDate)-1]*0.25,Yi[Length(NoDate)-1]);
        end;
        if loopcounter>3 then
        begin
        maxis(Xi,Yi,m,a,b,g,mai);
        if trand<>GetTrand(mai) then
        begin
            trand:=GetTrand(mai);
            capch:=0;
        end
        else
         loopcounter:=0;
        end ;

       end
       else
       capch:=0;
      end;
    end;


end.

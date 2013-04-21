unit xxx;

interface
uses
char,mnk;
type
Tstak=array of array[0..3] of double;
 masi=array of integer;
  MathFunc=object
  private
   obem:longint;
  public
   Xi:mas;
    Yi:mas;
   mai:Tstak;
   sglag:mas;
   trand:integer;
   procedure GetTrand(mi:Tstak);
  constructor creat;
  procedure SetXY(X,Y:mas;N:integer);
   procedure maxis ();
   destructor Destroy;

  function MyMath(m:integer):integer;
 // function GetTrand():integer; overload;
  end;
implementation
 constructor MathFunc.creat;
var
i:integer;
 begin
 trand:=99;
 end;
 destructor MathFunc.Destroy;
 begin
 SetLength(mai,0);
 SetLength(Xi,0);
 SetLength(Yi,0);
// SetLength(sglag,0);
 end;
procedure MathFunc.maxis();
var
i:integer;
begin

end;
  procedure MathFunc.SetXY(X,Y:mas;N:integer);
  var
  i:integer;
  begin
   SetLength(Xi,0);
  SetLength(Yi,0);
  SetLength(Xi,N);
  SetLength(Yi,N);
  Form2.Chart1.Series[0].Clear;
Form2.Chart1.Series[1].Clear;
Form2.Chart1.Series[2].Clear;
Form2.Chart1.Series[3].Clear;
Form2.Chart1.Series[4].Clear;
Form2.Chart1.Series[5].Clear;
  for i:=0 to  N-1 do
  begin
  Xi[i]:=X[i];
  Yi[i]:=Y[i];
  end;
  end;

 //***************************************************
procedure MathFunc.GetTrand(mi:Tstak);
var
i:integer;
m1,M:double;
dlina,H:integer;
begin

m1:=0;
trand:=0;
H:=Length(Yi);
dlina:=Length(mai);
if(Length(mai)>0) then
begin
m1:=mai[dlina-1,0];
M:=Abs(mai[dlina-1,1]-Yi[H-1])/Yi[H-1];
if(M > 0.1) then
begin
   if Yi[H-1]>mai[dlina-1,1] then
		     trand:=1
			else
			   trand:=-1;
end
else
if(M>0.01)AND((H-m1*0.25)/(H)<0.4)and((H-m1*0.25)/H>0.15)AND(abs(mai[dlina-1,1]-mai[dlina-1,3])>0.001) then
			begin
      Form2.Chart1.Series[0].AddXY(m1*0.25,mai[dlina-1,1]);
        Form2.Chart1.Series[0].AddXY(Xi[H-1],Yi[H-1]);
		     if Yi[H-1]>mai[dlina-1,1] then
		     trand:=1
			else
			   trand:=-1;

		end
		else
    begin
    SetLength(mai,dlina-1);
    GetTrand(mai);
    end;

  end ;

   for i:=0 to Length(Xi)-1 do
       Form2.Chart1.Series[1].AddXY(Xi[i],Yi[i])      ;

  end;


    function MathFunc.MyMath(m:integer):integer;
     var
     i1,i,n,i2,i3:integer;
     b,g,a:mas;
     h,pkt:double;
     stak:array[0..2] of double;
       j,y:integer;
//  scol34,scol64:mas;
  suma:double;
     begin
      SetLength(a,m+1);
      SetLength(b,m+1);
      SetLength(g,m+1);
      i3:=Length(Yi);
     h:=0.25;
     n:=0;
     i2:=0;
     i:=0;
     SetLength(sglag,Length(Yi)*4);
  TMNK(Xi,Yi,b,g,a,Length(Xi)-1,m) ;

     repeat
              for i1:=0 to 1 do
              stak[i1]:=stak[i1+1];
              stak[2]:=Pk(i2*h,a,b,g,m);
             // n:=n+1;
            // sglag[n-1]:= Pk(i2*h,a,b,g,m);
              if (stak[0]>0.00001) and (stak[1]>0.00001) and (stak[2]>0.00001) then
              begin
                  if (stak[0]>stak[1])and(stak[1]<stak[2])then
                       begin
                       i:=i+1;
                       SetLength(mai,i);
                       mai[i-1,0]:=i2;
                        mai[i-1,1]:=stak[1];
                          mai[i-1,2]:=-1 ;
                         mai[i-1,3]:=Yi[Round(i2*h)]  ;
                      end
                          else if (stak[0]<stak[1])and(stak[1]>stak[2]) then
                       begin
                       i:=i+1;
                       SetLength(mai,i);
                       mai[i-1,0]:=i2;
                        mai[i-1,1]:=stak[1];
                         mai[i-1,2]:=1
                      end
              end;
             Form2.Chart1.Series[2].AddXY(i2*h,Pk(i2*h,a,b,g,m));
              i2:=i2+1;
        until(i2*h>=i3);


// Setlength(scol34,Length(Yi)-34);
//  Setlength(scol64,Length(Yi)-64);
   for y:=Length(Yi)-1 downto 34  do
              begin
              suma:=0;
                    for j:=y downto y-33 do
                    suma:=suma+Yi[j];
                    suma:=suma/34;
                    pkt:=Pk(y,a,b,g,m);
                Form2.Chart1.Series[4].AddXY(y,suma);
          if (suma-pkt<=0.00001) then
          Form2.Chart1.Series[3].AddXY(y,pkt);
               end;

          for y:=Length(Yi)-1 downto 64 do
              begin
              suma:=0;
                    for j:=y downto y-63 do
                    suma:=suma+Yi[j];
                    suma:=suma/64;
                  pkt:=Pk(y,a,b,g,m);
                Form2.Chart1.Series[5].AddXY(y,suma);
          if (suma-pkt<=0.00001)then
          Form2.Chart1.Series[3].AddXY(y,pkt);
               end;

      SetLength(a,0);
      SetLength(b,0);
      SetLength(g,0);
    MyMath:=0;
     end;

end.

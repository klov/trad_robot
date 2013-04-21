unit mkt;
interface
type
 mas=array of double;
  function qk( xi:double;b,g:mas;k:integer):double;
procedure  TMNK(xi,fi:mas;var b:mas ;var g:mas;var a:mas;n:integer;m:integer)   ;
function   Pk(x:double;a,b,g:mas;m:integer):double;
function Sk(xi,fi,a,b,g:mas;n,m:integer):double    ;
var
a,b,g:array of real;
xi,fi:mas  ;
implementation
   function qk( xi:double;b,g:mas;k:integer):double;
var
i:integer;
z:real;
   begin
  z:=0;
if k=0 then
                qk:=1
else

if k=1   then
                qk:=xi-b[0]

else
if (k>1)  then
        qk:=(xi-b[k-1])*qk(xi,b,g,k-1)-g[k-2]*qk(xi,b,g,k-2);
end;
 procedure  TMNK(xi,fi:mas;var b:mas ;var g:mas;var a:mas;n:integer;m:integer)   ;
 var
  i,k:integer;
  l,t:real;
 begin
  l:=0;
  t:=0;
for k:=0 to m do
        if (k=0) then
                begin
                for i:=0 to n do
                 l:=l+xi[i];
                b[k]:=l/(n+1);
                l:=0;
                end
        else
        begin
                for i:=0 to n do
                l:=l+xi[i]*sqr(qk(xi[i],b,g,k));
                for i:=0 to n do
                t:=t+sqr(qk(xi[i],b,g,k));
                b[k]:=l/t;
                l:=0; t:=0;
                for i:=0 to n do l:=l+xi[i]*qk(xi[i],b,g,k)*qk(xi[i],b,g,k-1);
                for i:=0 to n do t:=t+sqr(qk(xi[i],b,g,k-1));
                g[k-1]:=l/t;
                l:=0; t:=0;
        end;

for k:=0 to m do
        begin
         if (k=0)  then
                begin
                for i:=0 to n do l:=l+fi[i];
                a[k]:=l/(n+1);
                l:=0;
                end;
        if (k=1) then
        begin
                for i:=0 to n do l:=l+fi[i]*(xi[i]-b[0]);
              for i:=0 to n do t:=t+sqr(xi[i]-b[0]);
                a[k]:=l/t;
                l:=0; t:=0;
         end;
        if k>1 then
                begin for i:=0 to n do l:=l+fi[i]*qk(xi[i],b,g,k);
                for i:=0 to n do  t:=t+sqr(qk(xi[i],b,g,k));
                a[k]:=l/t;
                l:=0; t:=0;
                end;
      end;
      end;

function   Pk(x:double;a,b,g:mas;m:integer):double;
var

k:integer;
t:real;
begin
t:=0;
begin
for k:=0 to m do
t:=t+a[k]*qk(x,b,g,k);
Pk:=t;
end
end;
function Sk(xi,fi,a,b,g:mas;n,m:integer):double ;
var
i:integer;
t:real;
begin
 t:=0;
for i:=0 to length(xi) do
t:=t+sqr(Pk(xi[i],a,b,g,m)-fi[i]);
Sk:=t;
end;

end .

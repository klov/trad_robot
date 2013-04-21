unit UnitLes2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleServer, TEClientLib_TLB, Grids, ExtCtrls, TeeProcs,
  TeEngine, Chart, DB, MemDS, DBAccess, MyAccess, Series, ComCtrls, Spin,mnk,
  CheckLst,char;

  type
  HOLDING=record
  ID,ClientID:integer;
  Account,SecCode,Ticker:string;
  Min,PlannedPosBuy,PlannedPosSell:longint;
    CurrentPos:longint;
  end;
  TPOSITION=record
  ID:integer;
  ClientID:integer;
  Account:string;
  OpenBal,CurrentPos,PlannedPos,Commission,Commission2,Profit,Free:double;
  end;
  TSECURIT=record
     ID:integer;
     SecBoard,SecCode:string;
     LegalCurrentPrice,Low,High,Bid,Offer,Volatility,HighPriceLimit,LowPriceLimit:double;
     OfferDepthT:Longint;
     BidDepthT:Longint;
     ShortName:string;
  end;
TOrdersBookStruct=record
     SecBoard,BuySell:string;
      SecCode:string;
     Price:double;
     OrderNo:int64;
  end;
  zap=record
  Setcode:string;
  SecBoard:string;
  value:mas;
  capch:double;
  end;
  Tzap=object(MathFunc)
  public
  OfferDepthT:integer;
  end;
   TINDEXES=array of TOrdersBookStruct;
type

  TfrmSec = class(TForm)
    Slot: TSlot;
    edLogin: TEdit;
    edPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnConnect: TButton;
    lbConnectionResult: TLabel;
    SlotTable: TSlotTable;
    sgSecs: TStringGrid;
    SlotTable1: TSlotTable;
    Timer1: TTimer;
    SlotFace1: TSlotFace;
    zayavki: TSfxOrder;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    analiz: TTimer;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    StringGrid1: TStringGrid;
    Label3: TLabel;
    Label6: TLabel;
    POSITION: TSlotTable;
    TabSheet2: TTabSheet;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    HOLDING: TSlotTable;
    Button5: TButton;
    time: TEdit;
    Timer2: TTimer;
    MyQuery1: TMyQuery;
    MyConnection1: TMyConnection;
    TabSheet3: TTabSheet;
    StringGrid4: TStringGrid;
    ORDERS: TSlotTable;
    Edit1: TEdit;
    SetTime: TButton;
    StringGrid5: TStringGrid;
    kontrol: TTimer;
    Label4: TLabel;
    Edit2: TEdit;
    CheckListBox1: TCheckListBox;
    Chart1: TChart;
    Chart2: TChart;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    Series3: TFastLineSeries;
    Series4: TFastLineSeries;
    Series5: TFastLineSeries;
    Series6: TFastLineSeries;
    Series7: TFastLineSeries;
    Series8: TFastLineSeries;
    Series9: TFastLineSeries;
    Series10: TFastLineSeries;
    Series11: TFastLineSeries;
    procedure btnConnectClick(Sender: TObject);
    procedure SlotTableOpened(ASender: TObject; OpenID: Integer);
    procedure SlotTableError(ASender: TObject; OpenID, Code: Integer;
      const Description: WideString);
    procedure btnStartClick(Sender: TObject);
    procedure SlotTableAddRow(ASender: TObject; OpenID, RowID: Integer;
      Fields: OleVariant);
    procedure FormCreate(Sender: TObject);
    procedure SlotTable1AddRow(ASender: TObject; OpenID, RowID: Integer;
      Fields: OleVariant);
    procedure Timer1Timer(Sender: TObject);
    procedure SlotTable1UpdateRow(ASender: TObject; OpenID, RowID: Integer;
      Fields: OleVariant);
    procedure SlotTable1Opened(ASender: TObject; OpenID: Integer);
    procedure SetTimeClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SlotTable1DeleteRow(ASender: TObject; OpenID,
      RowID: Integer);
    procedure SlotTable1ReplBegin(ASender: TObject; OpenID: Integer);
    procedure SlotTable1ReplEnd(ASender: TObject; OpenID: Integer);
    procedure SlotTable1Error(ASender: TObject; OpenID, Code: Integer;
      const Description: WideString);
    procedure SlotTableClear(ASender: TObject; OpenID: Integer);
    procedure POSITIONOpened(ASender: TObject; OpenID: Integer);
    procedure POSITIONError(ASender: TObject; OpenID, Code: Integer;
      const Description: WideString);
    procedure POSITIONAddRow(ASender: TObject; OpenID, RowID: Integer;
      Fields: OleVariant);
    procedure HOLDINGAddRow(ASender: TObject; OpenID, RowID: Integer;
      Fields: OleVariant);
    procedure HOLDINGClear(ASender: TObject; OpenID: Integer);
    procedure HOLDINGError(ASender: TObject; OpenID, Code: Integer;
      const Description: WideString);
    procedure HOLDINGOpened(ASender: TObject; OpenID: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure SlotSynchronized(ASender: TObject; SlotID: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
    procedure analizTimer(Sender: TObject);
    procedure SlotTable1Clear(ASender: TObject; OpenID: Integer);
    procedure ORDERSAddRow(ASender: TObject; OpenID, RowID: Integer;
      Fields: OleVariant);
    procedure ORDERSClear(ASender: TObject; OpenID: Integer);
    procedure ORDERSError(ASender: TObject; OpenID, Code: Integer;
      const Description: WideString);
    procedure kontrolTimer(Sender: TObject);

  private
     public
    { Public declarations }
  end;
     procedure pechat;
 procedure kupit(kol:integer;SecBoard,SecCode:string;var limit:integer);
 procedure prodat(kol:integer;SecBoard,SecCode:string);
 function format(S:string):string   ;
 procedure MeProdaSh(ms:array of Tzap;flag:boolean);
 procedure MePokupki(ms:array of Tzap;flag:boolean);
 procedure Snitie(SecBoard,SecCode:string;res:int64);
var
Sec:array of TSECURIT;
Hold:array of HOLDING;
posit:TPOSITION;
Table:TSlotTable;
SecBoard,SecCode:array of string;
repind:boolean;
Ceni:array of Tzap;

  frmSec: TfrmSec;
 bolt:boolean=false;
str,str2,nam:string;
   FOrderBook: TINDEXES;
   Sglag:mas;
  nambe,Namb,chislo,Q:integer;
implementation

{$R *.dfm}

/////////////////////////////////////////////////////////////////////////////////
 procedure MeProdaSh(ms:array of Tzap;flag:boolean);
 var
 i,j,n:integer;
 value:double;
 begin
  for i:=0 to Length(ms)-1 do
   if (ms[i].capch<0)and(ms[i].capch<>99) then
   for j:=0 to Length(FOrderBook)-1 do
  if (ms[i].Setcode=FOrderBook[j].SecCode)and(FOrderBook[j].BuySell='B') then
  Snitie (ms[i].SecBoard,ms[i].Setcode,FOrderBook[j].OrderNo);

 for j:=0 to Length(ms)-1 do
 if (ms[j].capch<0)and(ms[j].capch<>99) then
 begin
 value:=ms[j].value[0];
 for i:=0 to Length(Hold)-1 do
    begin
        if (Hold[i].SecCode=ms[j].Setcode)and(Hold[i].CurrentPos>0) then
            begin
            if flag then
                  begin
                  if  Hold[i].CurrentPos>ms[j].limit then
                      prodat(Hold[i].CurrentPos-ms[j].limit,ms[j].SecBoard,Hold[i].SecCode);
                  end
                  else
                      prodat(Hold[i].CurrentPos,ms[j].SecBoard,Hold[i].SecCode);
            end;

    end;
    end;
 end;
///////////////////////////////////////////////////////////////////////////////////
 procedure MePokupki(ms:array of Tzap;flag:boolean);
 var
 i,j,kol,bot:integer;
 Summa,Free:double;
 begin
 for i:=0 to Length(ms)-1 do
   if (ms[i].capch>0)and(ms[i].capch<>99) then
   for j:=0 to Length(FOrderBook)-1 do
  if (ms[i].Setcode=FOrderBook[j].SecCode)and(FOrderBook[j].BuySell='S') then
  Snitie (ms[i].SecBoard,ms[i].Setcode,FOrderBook[j].OrderNo);
 for i:=0 to Length(ms)-1 do
        if (ms[i].capch>0)and(ms[i].capch<>99) then
                Summa:=Summa+ms[i].value[0];
    Free:=posit.Free/5;
    Summa:=Summa/100;
     for i:=0 to Length(ms)-1 do
    if (ms[i].capch>0)and(ms[i].capch<>99)and(ms[i].value[0]<>0) then
          begin
          kol:=Round((ms[i].capch*(Free/100)*(ms[i].value[0]/Summa))/ms[i].value[0]);
          if kol>ms[i].OfferDepthT then
          kol:=ms[i].OfferDepthT;
          if flag then
           kupit(kol,ms[i].SecBoard,ms[i].Setcode,ms[i].limit)
           else
           kupit(kol,ms[i].SecBoard,ms[i].Setcode,bot)
          end;
 end;
function format(S:string):string   ;
 var
 i:integer;
 u:string;
 begin
 u:=S;
 for i:=0 to Length(S)-1 do
   if u[i]=',' then u[i]:='.';
   format:=u;
 end;
 ////////////////////////////////pechat/////////////////////////////////
procedure pechat;
var
i,j:integer;
max:integer;
begin
if Length(ceni)<>0 then
begin
max:=Length(ceni[0].value);
 frmSec.StringGrid1.ColCount:=max+1;
 frmSec.StringGrid1.RowCount:=Length(ceni);
 for i:=0 to  Length(ceni)-1 do
 begin
  frmSec.StringGrid1.Cells[0,i]:= ceni[i].Setcode;
 for j:=1 to max-1 do
  frmSec.StringGrid1.Cells[j,i]:=FloatToStr(ceni[i].value[j]);
 end;
 end;
  frmSec.StringGrid5.ColCount :=Length(ceni);
  frmSec.StringGrid4.ColCount :=Length(ceni)*2;
  frmSec.StringGrid4.RowCount:= frmSec.StringGrid4.RowCount+1;
   frmSec.StringGrid5.RowCount:= frmSec.StringGrid5.RowCount+1;
  j:=0;
  for i:=0 to Length(ceni)-1 do
      begin
      frmSec.StringGrid5.Cells[Round(j/2),frmSec.StringGrid5.RowCount-1]:=DateToStr(ceni[i].DateLastCheng);
          frmSec.StringGrid4.Cells[j,frmSec.StringGrid4.RowCount-1]:=FloatToStr(ceni[i].trand);
           j:=j+1;
          frmSec.StringGrid4.Cells[j,frmSec.StringGrid4.RowCount-1]:=FloatToStr(ceni[i].capch);
          j:=j+1;
      end;
 end;
procedure TfrmSec.btnConnectClick(Sender: TObject);
var s:WideString;
begin
  slot.Connect1(Edit2.Text,edLogin.Text,edPassword.Text,s);
  lbConnectionResult.Caption:=s;

end;

procedure TfrmSec.SlotTableOpened(ASender: TObject; OpenID: Integer);
begin
//  MessageDlg('Таблица финансовых инструментов успешно открыта',mtInformation,[mbOk],0);
end;

procedure TfrmSec.SlotTableError(ASender: TObject; OpenID, Code: Integer;
  const Description: WideString);
begin
  MessageDlg('Ошибка открытия таблицы финансовых инструментов',mtError,[mbOk],0);
end;

procedure TfrmSec.btnStartClick(Sender: TObject);
var
name:string;
begin
 SetLength(SecCode,0);
 SetLength(Hold,0);
name:= 'SECURITIES';
    SlotTable.FieldNames:='ID,SecBoard,SecCode,BuySell, LegalCurrentPrice,Low,High,Bid,offer,OfferDepthT,BidDepthT,ShortName,Offer,LegalCurrentPrice';
   SlotTable.Open(Slot.ID,name,'');
   SlotTable.Activate(Slot.ID,name,'');
   name:= 'POSITIONS';
   POSITION.FieldNames:='ID,ClientID,Account,OpenBal,CurrentPos,PlannedPos,Commission,Commission2,Profit,Free';
   POSITION.Open(Slot.ID,name,'');

   name:='HOLDING';
   HOLDING.FieldNames:='ID,ClientID,Account,SecCode,Min,PlannedPosBuy,PlannedPosSell,Ticker'    ;
   HOLDING.Open(Slot.ID,name,'');
   end;

procedure TfrmSec.SlotTableAddRow(ASender: TObject; OpenID, RowID: Integer;
  Fields: OleVariant);
var
y:boolean;
i:integer;
stroka:string;
  begin
  y:=false;
  try
  if(slot.GetCurrentState=7) then
      begin
   //  DateTimeToString(s,'s/n/h/d/m',now);
     MyQuery1.Active:=false;
              MyQuery1.SQL.Clear;
              stroka:='INSERT INTO katerovki(SecBoard,SecCode,LegalCurrentPrice,Low,High,Bid,offer,OfferDepthT,BidDepthT,ShortName,Volatility,Value,Last)';
              stroka:=stroka+'VALUES("'+Fields[1]+'","'+Fields[2]+'","';
              stroka:=stroka+format(fLOATtOsTR(Fields[3]))+'","'+format(Fields[4])+'","'+format(Fields[5])+'","'+format(Fields[6])+'","';
               stroka:=stroka+format(FloatToStr(Fields[7]))+'","'+intToStr(Fields[8])+'","'+format(intToStr(Fields[9]))+'","'+format(Fields[10])+'","'+format(Fields[11])+'","'+format(Fields[14])+'","'+format(Fields[15])+'")';
              MyQuery1.SQL.Add(stroka);
              MyQuery1.Execute;
   sgSecs.RowCount:=sgSecs.RowCount+1;
  sgSecs.Cells[0,sgSecs.RowCount-1]:=Fields[0];
  sgSecs.Cells[1,sgSecs.RowCount-1]:=Fields[1];
   sgSecs.Cells[2,sgSecs.RowCount-1]:=Fields[2];
   sgSecs.Cells[3,sgSecs.RowCount-1]:=Fields[3];
   sgSecs.Cells[4,sgSecs.RowCount-1]:=Fields[4];
   sgSecs.Cells[5,sgSecs.RowCount-1]:=Fields[5];
   sgSecs.Cells[6,sgSecs.RowCount-1]:=Fields[6];
   sgSecs.Cells[7,sgSecs.RowCount-1]:=Fields[7];
     sgSecs.Cells[8,sgSecs.RowCount-1]:=Fields[8];
  sgSecs.Cells[9,sgSecs.RowCount-1]:=Fields[9];
   sgSecs.Cells[10,sgSecs.RowCount-1]:=Fields[10];
   sgSecs.Cells[11,sgSecs.RowCount-1]:=Fields[11];
 for i:=0 to Length(ceni)-1 do
 if ceni[i].Setcode=Fields[2] then
  begin
  ceni[i].value[Length(ceni[i].value)-1]:=Fields[3];
  ceni[i].OfferDepthT:=Fields[7];
 y:=true;
 end;
 if not y then
  begin
 Q:=Q+1;
 CheckListBox1.Items.Add(IntToStr(Q));
 SetLength(ceni,Q);
 ceni[Q-1].Setcode:= Fields[2];
 SetLength(ceni[Q-1].value,1);
 ceni[Q-1].value[0]:= Fields[3];
 ceni[Q-1].capch:=99;
 ceni[Q-1].OfferDepthT:=Fields[7];
 ceni[Q-1].SecBoard:=  Fields[1]  ;
 SetLength(SecCode,Q);
 SetLength(SecBoard,Q);
 SecCode[Q-1]:=Fields[2];
 SecBoard[Q-1]:=Fields[1]  ;
 SetLength(Sec,Q);
 Sec[Q-1].SecCode:= Fields[2];
 end;
 y:=false;
 for i:=0 to Length(Sec)-1 do
 if Sec[i].SecCode=Fields[2] then
 begin
 Sec[i].ID:=Fields[0];
 Sec[i].SecBoard:=Fields[1];
 Sec[i].SecCode:=Fields[2];
 Sec[i].LegalCurrentPrice:=Fields[3];
 Sec[i].Low:=Fields[4];
 Sec[i].High:=Fields[5];
 Sec[i].Bid:=Fields[6];
 Sec[i].Offer:=Fields[7];
 Sec[i].OfferDepthT:=Fields[8];
 Sec[i].BidDepthT:=Fields[9] ;
 Sec[i].ShortName:= Fields[10];
 Sec[i].Volatility:=Fields[11];
 Sec[i].HighPriceLimit:=Fields[12];
 Sec[i].LowPriceLimit:=Fields[13];
 end;
 end;
 except
 ShowMessage('произошла ошибка');
 end;
end;
procedure TfrmSec.FormCreate(Sender: TObject);
var
S:string;
begin
try
   sgSecs.Cells[0,0]:='ID';
  sgSecs.Cells[1,0]:='Рынок';
  sgSecs.Cells[2,0]:='Код бумаги';
  sgSecs.Cells[3,0]:='Название';
  sgSecs.Cells[4,0]:='Кратк. назв';
  sgSecs.Cells[5,0]:='Спрос';
  sgSecs.Cells[6,0]:='Предложение';
  sgSecs.Cells[7,0]:='LegalCurrentPrice';
  sgSecs.ColWidths[2]:=100;
  sgSecs.ColWidths[3]:=200;
  sgSecs.ColWidths[4]:=150;

  StringGrid2.Cells[0,0]:='ID';
  StringGrid2.Cells[1,0]:='ClientID';
  StringGrid2.Cells[2,0]:='Account';
  StringGrid2.Cells[3,0]:='OpenBal';
  StringGrid2.Cells[4,0]:='CurrentPos';
  StringGrid2.Cells[5,0]:='PlannedPos';
  StringGrid2.Cells[6,0]:='Commission';
  StringGrid2.Cells[7,0]:='Commission2';
  StringGrid2.Cells[8,0]:='Profit';
  StringGrid2.Cells[9,0]:='Free';

    StringGrid3.Cells[0,0]:='ID';
  StringGrid3.Cells[1,0]:='ClientID';
  StringGrid3.Cells[2,0]:='Account';
  StringGrid3.Cells[3,0]:='SecCode';
  StringGrid3.Cells[4,0]:='Min';
  StringGrid3.Cells[5,0]:='PlannedPosBuy';
  StringGrid3.Cells[6,0]:='PlannedPosSell';
  StringGrid3.Cells[7,0]:='Ticker';


{  S:='DELETE  FROM katerovki';
              MyQuery1.SQL.Clear;
              MyQuery1.SQL.Add(S);
             MyQuery1.Open;   }
 except
 end;
end;

procedure TfrmSec.SlotTable1AddRow(ASender: TObject; OpenID,
  RowID: Integer; Fields: OleVariant);
  var
  t,i,j:integer;
  S:string;
  begin
  S:=Fields[4];
 if (Fields[4]='O') then
    begin
     SetLength(FOrderBook,Length(FOrderBook)+1);
     FOrderBook[Length(FOrderBook)-1].SecBoard:=Fields[0];
     FOrderBook[Length(FOrderBook)-1].SecCode:=Fields[1];
      FOrderBook[Length(FOrderBook)-1].BuySell:=Fields[2];
      FOrderBook[Length(FOrderBook)-1].OrderNo:=Fields[3];
     end;

end;

procedure TfrmSec.Timer1Timer(Sender: TObject);
     var
     y,f:integer;
     pris,stroka:string;
        begin

{        repind:=true;
//****************************************************************
 for y:=0 to Length(FOrderBook)-1 do
          begin
               MyQuery1.Active:=false;
              MyQuery1.SQL.Clear;
              pris:=  FloatToSTR(FOrderBook.Orders[y].Price);
              for f:=0 to length(pris) do
              if pris[f]=',' then pris[f]:='.';
              stroka:='INSERT INTO orders(IDOrde,SecBoard,SecCode,BuySell,valua,date)';
              stroka:=stroka+'VALUES("'+IntToStr(FOrderBook.Orders[y].ID)+'","'+FOrderBook.Orders[y].SecBoard+'","'+FOrderBook.Orders[y].SecCode+'","';
              stroka:=stroka+FOrderBook.Orders[y].BuySell+'","'+ pris+'","'+DateToStr(SysUtils.Date)+'")';
              MyQuery1.SQL.Add(stroka);
              MyQuery1.Execute;
          end;
//****************************************************************************
 for y:=0 to Length(Sec) do
          begin

          end;
        }
//*****************************************************************************
end;

procedure TfrmSec.SlotTable1UpdateRow(ASender: TObject; OpenID,
  RowID: Integer; Fields: OleVariant);
  var
  n:integer;
  begin

end;

procedure TfrmSec.SlotTable1Opened(ASender: TObject; OpenID: Integer);
begin
// MessageDlg('Таблица катеровок успешно открыта',mtInformation,[mbOk],0);
bolt:=true;
end;

procedure TfrmSec.SetTimeClick(Sender: TObject);
var
p,i:integer;
name:string;
begin
analiz.Interval:=StrToInt(Edit1.text)*60000;
{   name:= 'ORDERS';
   SlotTable1.FieldNames:='ID,SecBoard,SecCode,BuySell,OrderNo,Status';
   SlotTable.Open(Slot.ID,name,'');

     for i:=0 to Q-1 do
   begin
       Table:= TSlotTable.Create(self);
       Table.Tag:=i;
        Table.OnAddRow:=SlotTable1.OnAddRow;
        Table.OnOpened:=SlotTable1.OnOpened;
        Table.OnClear:=SlotTable1.OnClear;
        Table.OnReplBegin:=SlotTable1.OnReplBegin;
        Table.OnReplEnd:= SlotTable1.OnReplEnd;
       // FOrderBook.Orders[i].SecBoard:=SecBoard[i];
        //FOrderBook.Orders[i].SecCode:=SecCode[i];
        Table.OpenOrderbook(p,SecBoard[i],SecCode[i]);
   end;
   Timer1.Enabled:=true;
//   analiz.Enabled:=true;    }
end;
//--------------------------------KUPIT---------------------------------------
procedure kupit(kol:integer;SecBoard,SecCode:string;var limit:integer);
var
msg:WideString;
nambe:int64;
begin
if  (kol<>0)  then
begin
With frmSec do
begin
zayavki.SlotID:=Slot.ID;
  zayavki.SplitFlag:='S';
  zayavki.ImmCancel:=' ';
 zayavki.EnterType:='P';
  zayavki.OrderMode:='N';
  zayavki.BuySell:='B';
  zayavki.SecBoard:= SecBoard;
  zayavki.SecCode:= SecCode;
  zayavki.MktLimit:='M';
  zayavki.Account:='000000000001';
 // zayavki.Price:=Price+Price/100;
  zayavki.Quantity:=kol;
  zayavki.BrokerRef:=Slot.BrokerRef;
  zayavki.Add(nambe,msg);
  if nambe<>0 then
  limit:=kol;
//  MessageDlg(msg,mtInformation,[mbOk],0);
  end;
  end;
end;
procedure TfrmSec.Button2Click(Sender: TObject);
begin
kupit(10,ceni[0].SecBoard,ceni[0].Setcode,ceni[0].limit);
end;

procedure TfrmSec.Button3Click(Sender: TObject);
var
res:WideString;
begin
{ zayavki.SlotID:=Slot.ID;
  zayavki.SplitFlag:='S';
  zayavki.ImmCancel:=' ';
 zayavki.EnterType:='P';
  zayavki.OrderMode:='N';
  zayavki.BuySell:='B';
  zayavki.OrderNo:=nord;
  zayavki.SecBoard:= FOrderBook[n].SecBoard;
  zayavki.SecCode:= FOrderBook[n].SecCode;
  zayavki.Account:='000000000001';
  zayavki.BrokerRef:=Slot.BrokerRef;
  zayavki.Delete(res);
  MessageDlg(Res,mtInformation,[mbOk],0); }
end;
//---------------------------SnIt----------------------------------------------
procedure Snitie(SecBoard,SecCode:string;res:int64);
var
msg:Widestring;
begin
With frmSec do
  begin
  zayavki.SlotID:=Slot.ID;
  zayavki.SplitFlag:='S';
  zayavki.ImmCancel:=' ';
   zayavki.OrderMode:='N';
  zayavki.BuySell:='B';
  zayavki.OrderNo:=res;
  zayavki.SecBoard:= SecBoard;
  zayavki.SecCode:= SecCode;
  zayavki.Account:='000000000001';
  zayavki.BrokerRef:=Slot.BrokerRef;
  zayavki.Delete(msg);
 // MessageDlg(msg,mtInformation,[mbOk],0);
end;
end;
//--------------------------PRODAT-------------------------------------------
procedure prodat(kol:integer;SecBoard,SecCode:string);
var
msg:widestring;
nambe:int64;
begin
if  (kol<>0)  then
with frmSec do
begin
 zayavki.SlotID:=Slot.ID;
  zayavki.SplitFlag:='S';
  zayavki.ImmCancel:=' ';
 zayavki.EnterType:='W';
  zayavki.OrderMode:='N';
  zayavki.BuySell:='S';
  zayavki.SecBoard:= SecBoard;
  zayavki.SecCode:= SecCode;
  zayavki.MktLimit:='M';
  zayavki.Account:='000000000001';
 // zayavki.Price:=Price+Price/100;
  zayavki.Quantity:=kol;
  zayavki.BrokerRef:=Slot.BrokerRef;
  zayavki.Add(nambe,msg);
// MessageDlg(msg,mtInformation,[mbOk],0);
  end;
end;
procedure TfrmSec.Button4Click(Sender: TObject);
var
value:double;
begin
value:=ceni[0].value[0];
    prodat(Hold[0].CurrentPos,ceni[0].SecBoard,Hold[0].SecCode);
end;

procedure TfrmSec.SlotTable1DeleteRow(ASender: TObject; OpenID,
  RowID: Integer);
  var
  i,t:integer;
begin    {
 for i:=0 to FOrderBook.N do
 if RowID=FOrderBook.Orders[i].ID then
 t:=i;
 for i:=t to FOrderBook.N-2 do
 with  FOrderBook do begin
   Orders[i].ID:=Orders[i+1].ID;
     Orders[i].SecBoard:=Orders[i+1].SecBoard;
     Orders[i].SecCode:= Orders[i+1].SecCode;
      Orders[i].BuySell:=Orders[i+1].BuySell;
      Orders[i].Price:= Orders[i+1].Price;
      Orders[i].Quantity:=Orders[i+1].Quantity;
       end;
 FOrderBook.N:=FOrderBook.N-1;
 SetLength(FOrderBook.Orders,FOrderBook.N);     }
end;

procedure TfrmSec.SlotTable1ReplBegin(ASender: TObject; OpenID: Integer);
begin
//Timer1.Enabled:=false;
end;

procedure TfrmSec.SlotTable1ReplEnd(ASender: TObject; OpenID: Integer);
begin
//Timer1.Enabled:=true;
//analiz.Enabled:=true;
end;

procedure TfrmSec.SlotTable1Error(ASender: TObject; OpenID, Code: Integer;
  const Description: WideString);
begin
 MessageDlg('ошибка'+Description+' '+IntToStr(Code),mtInformation,[mbOk],0);
end;

procedure TfrmSec.SlotTableClear(ASender: TObject; OpenID: Integer);
begin
   sgSecs.RowCount:=1;

end;


//******************************************************************************
procedure TfrmSec.POSITIONOpened(ASender: TObject; OpenID: Integer);
begin
//MessageDlg('Таблица позиций по деньгам открыта',mtInformation,[mbOk],0);
end;

procedure TfrmSec.POSITIONError(ASender: TObject; OpenID, Code: Integer;
  const Description: WideString);
begin
 MessageDlg('ошибка'+Description+' '+IntToStr(Code),mtInformation,[mbOk],0);
end;

procedure TfrmSec.POSITIONAddRow(ASender: TObject; OpenID, RowID: Integer;
  Fields: OleVariant);
begin
posit.ID:=Fields[0];
posit.ClientID:=Fields[1];
posit.Account:= Fields[2];
posit.OpenBal:= Fields[3];
posit.CurrentPos:=Fields[4];
posit.PlannedPos:=Fields[5];
posit.Commission:= Fields[6];
posit.Commission2:= Fields[7];
posit.Profit:= Fields[8];
posit.Free:= Fields[9];


 StringGrid2.Cells[0,1]:=IntToStr(Fields[0]);
 StringGrid2.Cells[1,1]:=IntToStr(Fields[1]);
 StringGrid2.Cells[2,1]:= Fields[2];
 StringGrid2.Cells[3,1]:= FloatToStr(Fields[3]);
 StringGrid2.Cells[4,1]:= FloatToStr(Fields[4]);
 StringGrid2.Cells[5,1]:= FloatToStr(Fields[5]);
 StringGrid2.Cells[6,1]:=  FloatToStr(Fields[6]);
 StringGrid2.Cells[7,1]:=  FloatToStr(Fields[7]);
 StringGrid2.Cells[8,1]:=  FloatToStr(Fields[8]);
 StringGrid2.Cells[9,1]:=  FloatToStr(Fields[9]);
end;

procedure TfrmSec.HOLDINGAddRow(ASender: TObject; OpenID, RowID: Integer;
  Fields: OleVariant);
  var
  f:integer;
begin

f:=Length(Hold)+1;
SetLength(Hold,f);
  StringGrid3.RowCount:=f+1;
 StringGrid3.Cells[0,f]:=IntToStr(Fields[0]);
 StringGrid3.Cells[1,f]:=IntToStr(Fields[1]);
 StringGrid3.Cells[2,f]:= Fields[2];
 StringGrid3.Cells[3,f]:= Fields[3];
 StringGrid3.Cells[4,f]:= IntToStr(Fields[4]);
 StringGrid3.Cells[5,f]:= IntToStr(Fields[5]);
 StringGrid3.Cells[6,f]:=  IntToStr(Fields[6]);
 StringGrid3.Cells[7,f]:=  Fields[7];
f:=f-1;
Hold[f].ID:=Fields[0];
Hold[f].ClientID:=Fields[1];
Hold[f].Account:= Fields[2];
Hold[f].SecCode:= Fields[3];
Hold[f].Min:=Fields[4];
Hold[f].PlannedPosBuy:=Fields[5];
Hold[f].PlannedPosSell:= Fields[6];
Hold[f].Ticker:= Fields[7];
Hold[f].CurrentPos:=Fields[8];

end;

procedure TfrmSec.HOLDINGClear(ASender: TObject; OpenID: Integer);
begin
SetLength(Hold,0);
end;

procedure TfrmSec.HOLDINGError(ASender: TObject; OpenID, Code: Integer;
  const Description: WideString);
begin
 MessageDlg('ошибка'+Description+' '+IntToStr(Code),mtInformation,[mbOk],0);
end;

procedure TfrmSec.HOLDINGOpened(ASender: TObject; OpenID: Integer);
begin
//MessageDlg('Таблица позиций по бумагам  открыта',mtInformation,[mbOk],0);
end;

procedure TfrmSec.Timer2Timer(Sender: TObject);
var
name,S:string;
i,f:integer;
begin
Label3.Caption:='false';
if(slot.GetCurrentState=7) then
begin
    repind:=true;
    SetLength(Hold,0);
    name:= 'SECURITIES';
    s:='ID,SecBoard,SecCode,WaPrice';
    s:=s+',Low,High,Bid,offer,BidDepthT,OfferDepthT,ShortName,Volatility,HighPriceLimit,LowPriceLimit,Value,Last';
      SlotTable.FieldNames:=s ;
   SlotTable.Open(Slot.ID,name,'');
   name:= 'POSITIONS';
   POSITION.FieldNames:='ID,ClientID,Account,OpenBal,CurrentPos,PlannedPos,Commission,Commission2,Profit,Free';
   POSITION.Open(Slot.ID,name,'');
   name:='HOLDING';
   HOLDING.FieldNames:='ID,ClientID,Account,SecCode,Min,PlannedPosBuy,PlannedPosSell,Ticker,CurrentPos'    ;
   HOLDING.Open(Slot.ID,name,'');
    name:='ORDERS';
   ORDERS.FieldNames:='SecBoard,SecCode,BuySell,OrderNo,Status'    ;
   ORDERS.Open(Slot.ID,name,'');
        Label3.Caption:='true';
        end;
 end;
procedure TfrmSec.SlotSynchronized(ASender: TObject; SlotID: Integer);
begin
Timer2.Enabled:=true;
analiz.Enabled:=true;
kontrol.Enabled:=true;
end;

procedure TfrmSec.FormClose(Sender: TObject; var Action: TCloseAction);
var
s:WideString;
begin

Slot.Disconnect1(s);
lbConnectionResult.Caption:=s;
end;

procedure TfrmSec.Button5Click(Sender: TObject);
begin
Timer2.Interval:=StrToInt(time.Text)*60000;
end;

procedure TfrmSec.analizTimer(Sender: TObject);
var
i3,TRAnd,m,y,j,i,count:integer;
mas3,P,obem:mas;
Dates:TDate;
W,suma:double;
//T:MathFunc;
S:string;
begin
if(slot.GetCurrentState=7) then
begin
m:=8;
i3:=150;
MyQuery1.Active:=false;

for i:=0 to Length(ceni)-1 do
    begin
//*****************************************************************************
S:='SELECT SecCode,LegalCurrentPrice,Value,Date,Low,High,Last FROM katerovki WHERE SecCode LIKE "'+ceni[i].Setcode+'"ORDER BY id DESC LIMIT 150';
              MyQuery1.SQL.Clear;
              MyQuery1.SQL.Add(S);
              MyQuery1.Open;
              MyQuery1.First;
               count:=MyQuery1.RecordCount;

SetLength(P,0);
Setlength(mas3,0);
Setlength(obem,0);
SetLength(Dates,0);

SetLength(P,count);
Setlength(mas3,count);
Setlength(obem,count);
SetLength(Dates,count);
       y:=0;
       j:=0;
              While Not MyQuery1.EOF Do
              Begin

  				                obem[count-1-j]:= MyQuery1.Fields[2].AsFloat;
                          mas3[count-1-j]:= (MyQuery1.Fields[6].AsFloat+MyQuery1.Fields[5].AsFloat+MyQuery1.Fields[4].AsFloat)/3;
                           P[j]:=j;
                           Dates[count-1-j]:=MyQuery1.Fields[3].AsDateTime;
                            j:=j+1;
                   MyQuery1.Next;
              end   ;
              if length(P)>10 then
              begin
              if CheckListBox1.Checked[i] then  begin
              ceni[i].Chart1:=Form2.Chart1;
              ceni[i].Chart2:=Form2.Chart2;
              end else
                  begin
                  ceni[i].Chart1:=Chart1;
                   ceni[i].Chart2:=Chart2;
                  end;
         ceni[i].SetXY(P,mas3,obem,Dates,Length(P),m);
         ceni[i].MyMath(m);
         SetLength(ceni[i].Xi,0);
         SetLength(ceni[i].Yi,0);
         SetLength(ceni[i].BO,0);

           end;
//*****************************************************************************
      end;
      MeProdaSh(ceni,true);
      MePokupki(ceni,true);
     SetLength(P,0);
     Setlength(mas3,0);
     Setlength(obem,0);
       pechat;
     end;
     Timer2.Enabled:=true;
end;

procedure TfrmSec.SlotTable1Clear(ASender: TObject; OpenID: Integer);
begin
SetLength(FOrderBook,0);
end;

procedure TfrmSec.ORDERSAddRow(ASender: TObject; OpenID, RowID: Integer;
  Fields: OleVariant);
  var
  t,i,j:integer;
  S:string;
  begin
 if (Fields[4]='O') then
    begin
     SetLength(FOrderBook,Length(FOrderBook)+1);
     FOrderBook[Length(FOrderBook)-1].SecBoard:=Fields[0];
     FOrderBook[Length(FOrderBook)-1].SecCode:=Fields[1];
      FOrderBook[Length(FOrderBook)-1].BuySell:=Fields[2];
      FOrderBook[Length(FOrderBook)-1].OrderNo:=Fields[3];
     end;
end;

procedure TfrmSec.ORDERSClear(ASender: TObject; OpenID: Integer);
begin
SetLength(FOrderBook,0);
end;

procedure TfrmSec.ORDERSError(ASender: TObject; OpenID, Code: Integer;
  const Description: WideString);
begin
 MessageDlg('ошибка'+Description+' '+IntToStr(Code),mtInformation,[mbOk],0);
end;

procedure TfrmSec.kontrolTimer(Sender: TObject);
var
S:string;
count,j,i:integer;
P,Norma:mas;
Dates:TDate;

begin

S:='SELECT * FROM katerovki WHERE LegalCurrentPrice=0';
              MyQuery1.SQL.Clear;
              MyQuery1.SQL.Add(S);
              MyQuery1.Open;
              MyQuery1.First;
         While not MyQuery1.Eof do
         begin
         MyQuery1.Delete;
         MyQuery1.Next;
         end;

////////////////////////////////////////////////////////////////////////////
{for i:=0 to Length(ceni)-1 do
    begin
     Chart1.Series[0].Clear;
          Chart1.Series[1].Clear ;
           Chart1.Series[2].Clear;
//*****************************************************************************
S:='SELECT LegalCurrentPrice,Date FROM katerovki WHERE SecCode LIKE "'+ceni[i].Setcode+'" ORDER BY id DESC LIMIT 1000';
              MyQuery1.SQL.Clear;
              MyQuery1.SQL.Add(S);
              MyQuery1.Open;
              MyQuery1.First;
               count:=MyQuery1.RecordCount;

SetLength(P,0);
SetLength(Dates,0);

SetLength(P,count);
SetLength(Dates,count);
       j:=0;
       if count>30 then
       begin
              While Not MyQuery1.EOF Do
              Begin
                          P[count-1-j]:= MyQuery1.Fields[0].AsFloat;
                           Dates[count-1-j]:=MyQuery1.Fields[1].AsDateTime;
                            j:=j+1;
                   MyQuery1.Next;
              end   ;
              if length(P)>20 then
         ceni[i].capch:=MasMom[i].Moment(P,Dates,Norma);
         for j:=0 to Length(Norma)-1 do
         begin
         Chart1.Series[0].AddXY(j,Norma[j]);
          Chart1.Series[1].AddXY(j,0.9);
           Chart1.Series[2].AddXY(j,-0.9);
         end;
            end;
end;
 MeProdaSh(ceni,true);
 MePokupki(ceni,true);
SetLength(P,0);
SetLength(Dates,0); }
end;
end.


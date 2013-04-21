program ProjectLes2;

uses
  Forms,
  UnitLes2 in 'UnitLes2.pas' {frmSec},
  xxx in 'xxx.pas',
  mnk in '..\help tools\mnk.pas',
  char in 'char.pas' {Form2},
  Stochastics in 'Stochastics.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSec, frmSec);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

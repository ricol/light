program Light;

uses
  Forms,
  Main in 'Main.pas' {FormMain},
  MyUnit in 'MyUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.

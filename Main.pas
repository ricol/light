unit Main;

{
CONTACT: WANGXINGHE1983@GMAIL.COM
}

interface

uses
  Windows, Messages, SysUtils, Graphics, Controls, Forms, Menus, ExtCtrls, Classes;

type
  TContent = (WHITE, BLACK);

  TFormMain = class(TForm)
    MainMenu: TMainMenu;
    MenuGame: TMenuItem;
    MenuConfig: TMenuItem;
    MenuAbout: TMenuItem;
    MenuGameStart: TMenuItem;
    MenuDif: TMenuItem;
    MenuDifLow: TMenuItem;
    MenuDifMedium: TMenuItem;
    MenuDifHigh: TMenuItem;
    MenuConfigRecord: TMenuItem;
    MenuRecordShow: TMenuItem;
    MenuRecordReshow: TMenuItem;
    TimerRecordShow: TTimer;
    MenuRecordSave: TMenuItem;
    MenuRecordLoad: TMenuItem;
    MenuExit: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure MenuDifLowClick(Sender: TObject);
    procedure MenuDifMediumClick(Sender: TObject);
    procedure MenuDifHighClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MenuGameStartClick(Sender: TObject);
    procedure MenuAboutClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuRecordShowClick(Sender: TObject);
    procedure MenuRecordReshowClick(Sender: TObject);
    procedure MenuRecordSaveClick(Sender: TObject);
    procedure MenuRecordLoadClick(Sender: TObject);
    procedure MenuExitClick(Sender: TObject);
    procedure TimerRecordShowTimer(Sender: TObject);
  private
    GameDif: integer;
    GameData: array of array of TContent;
    GameRecordData: array of TPoint;
    GameRecordFlag, GameTmpFlag: integer;
    GameRecord, GameRecordShow: boolean;
    procedure ShowContentToForm(content: TContent; i, j: integer);
    procedure InitData();
    procedure FreeData();
    procedure ShowData();
    procedure RefreshForm();
    function GetI(X, Y: integer): integer;
    function GetJ(X, Y: integer): integer;
    function CheckGame(): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  MyUnit;

{ TForm1 }

const
  STARTX = 10;
  STARTY = 10;
  MULX = 50;
  MULY = 50;
  PANELWIDTH = 48;
  PANELHEIGHT = 48;

procedure TFormMain.InitData;
var
  i, j: integer;
begin
  SetLength(GameData, GameDif, GameDif);
  for i := 0 to GameDif - 1 do
    for j := 0 to GameDif - 1 do
      GameData[i, j] := WHITE;
end;

procedure TFormMain.ShowData;
var
  i, j: integer;
begin
  for i := 0 to GameDif - 1 do
    for j := 0 to GameDif - 1 do
      ShowContentToForm(GameData[i, j], i, j);
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  GameDif := 5;
  GameRecord := true;
  GameRecordShow := false;
  GameRecordFlag := 0;
  SetLength(GameRecordData, 1000);
  InitData();
  FormPaint(Sender);
end;

procedure TFormMain.FormPaint(Sender: TObject);
begin
  RefreshForm;
  ShowData();
  Self.Height := GameDif * PANELHEIGHT + 80;
  Self.Width := GameDif * PANELWIDTH + 35;
end;

procedure TFormMain.ShowContentToForm(content: TContent; i, j: integer);
var
  m, n: integer;
begin
  m := i * MULX + STARTX;
  n := j * MULY + STARTY;
  Self.Canvas.Pen.Color := clBlack;
  if content = WHITE then
    Self.Canvas.Brush.Color := clWhite
  else
    Self.Canvas.Brush.Color := clBlack;
  Self.Canvas.Rectangle(m, n, m + PANELWIDTH, n + PANELHEIGHT);
end;

procedure TFormMain.FreeData;
begin
  SetLength(GameData, 0, 0);
end;

procedure TFormMain.MenuDifLowClick(Sender: TObject);
begin
  GameDif := 5;
  MenuGameStartClick(Sender);
end;

procedure TFormMain.MenuDifMediumClick(Sender: TObject);
begin
  GameDif := 6;
  MenuGameStartClick(Sender);
end;

procedure TFormMain.MenuDifHighClick(Sender: TObject);
begin
  GameDif := 7;
  MenuGameStartClick(Sender);
end;

procedure TFormMain.RefreshForm;
begin
  Self.Canvas.Pen.Color := clBtnFace;
  Self.Canvas.Brush.Color := clBtnFace;
  Self.Canvas.Rectangle(0, 0, Self.Width, Self.Height);
end;

function TFormMain.GetI(X, Y: integer): integer;
var
  k: integer;
begin
  result := -1;
  k := (X - STARTX) div MULX;
  if (k >= 0) and (k <= GameDif - 1) then
    result := k;
end;

function TFormMain.GetJ(X, Y: integer): integer;
var
  k: integer;
begin
  result := -1;
  k := (Y - STARTY) div MULY;
  if (k >= 0) and (k <= GameDif - 1) then
    result := k;
end;

procedure TFormMain.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  m, n: integer;
begin
  m := GetI(X, Y);
  n := GetJ(X, Y);
  if (m = -1) or (n = -1) then exit;
  if GameRecord then
  begin
    GameRecordData[GameRecordFlag].X := m;
    GameRecordData[GameRecordFlag].Y := n;
    inc(GameRecordFlag);
  end;
  if (m >= 0) and (m <= GameDif - 1) and
     (n >= 0) and (n <= GameDif - 1) then
  begin
    if GameData[m, n] = WHITE then
      GameData[m, n] := BLACK
    else
      GameData[m, n] := WHITE;
    ShowContentToForm(GameData[m, n], m, n);
  end;
  if (m - 1 >= 0) and (m - 1 <= GameDif - 1) and
     (n >= 0) and (n <= GameDif - 1) then
  begin
    if GameData[m - 1, n] = WHITE then
      GameData[m - 1, n] := BLACK
    else
      GameData[m - 1, n] := WHITE;
    ShowContentToForm(GameData[m - 1, n], m - 1, n);
  end;
  if (m >= 0) and (m <= GameDif - 1) and
     (n - 1 >= 0) and (n - 1 <= GameDif - 1) then
  begin
    if GameData[m, n - 1] = WHITE then
      GameData[m, n - 1] := BLACK
    else
      GameData[m, n - 1] := WHITE;
    ShowContentToForm(GameData[m, n - 1], m, n - 1);
  end;
  if (m + 1 >= 0) and (m + 1 <= GameDif - 1) and
     (n >= 0) and (n <= GameDif - 1) then
  begin
    if GameData[m + 1, n] = WHITE then
      GameData[m + 1, n] := BLACK
    else
      GameData[m + 1, n] := WHITE;
    ShowContentToForm(GameData[m + 1, n], m + 1, n);
  end;
  if (m >= 0) and (m <= GameDif - 1) and
     (n + 1 >= 0) and (n + 1 <= GameDif - 1) then
  begin
    if GameData[m, n + 1] = WHITE then
      GameData[m, n + 1] := BLACK
    else
      GameData[m, n + 1] := WHITE;
    ShowContentToForm(GameData[m, n + 1], m, n + 1);
  end;
  if CheckGame() then
  begin
    MessageBox(0, '祝贺您成功了！', '恭喜', MB_OK);
    GameRecord := false;
  end;
end;

procedure TFormMain.MenuGameStartClick(Sender: TObject);
begin
  FreeData;
  InitData;
  FormPaint(Sender);
  GameRecord := true;
  GameRecordShow := false;
  GameRecordFlag := 0;
end;

function TFormMain.CheckGame: boolean;
var
  i, j: integer;
begin
  result := true;
  for i := 0 to GameDif - 1 do
    for j := 0 to GameDif - 1 do
      if GameData[i, j] = WHITE then
      begin
        result := false;
        exit;
      end;
end;

procedure TFormMain.MenuAboutClick(Sender: TObject);
begin
  MessageBox(0, '游戏开始时，格子全是白色的。点击一个格子，' + #$D + #$A
              + '它和周围四个格子的颜色都会由白变黑或由黑变白。' + #$D + #$A
              + '当所有格子全变成黑色时，游戏结束！', '关于', MB_OK);
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetLength(GameRecordData, 0);
end;

procedure TFormMain.MenuRecordShowClick(Sender: TObject);
var
  i: integer;
  s: string;
begin
  s := '';
  for i := 0 to GameRecordFlag - 1 do
    s := s + #$D + #$A + format('(%d, %d)', [GameRecordData[i].X, GameRecordData[i].Y]);
  MessageBox(0, PChar(s), '记录', MB_OK);
end;

procedure TFormMain.MenuRecordReshowClick(Sender: TObject);
begin
  MenuRecordReshow.Checked := not MenuRecordReshow.Checked;
  GameRecord := false;
  TimerRecordShow.Enabled := MenuRecordReshow.Checked;
end;

procedure TFormMain.MenuRecordSaveClick(Sender: TObject);
var
  list: TStringList;
  s: string;
  i: integer;
begin
  if GameRecordFlag = 0 then exit;
  list := TStringList.Create;
  try
    for i := 0 to GameRecordFlag - 1 do
    begin
      s := format('(%d, %d)', [GameRecordData[i].X, GameRecordData[i].Y]);
      list.Add(s);
    end;
    list.SaveToFile('GameRecord.txt');
    MessageBox(0, '记录保存成功.', '信息', MB_OK);
  finally
    list.Free;
  end;
end;

procedure TFormMain.MenuRecordLoadClick(Sender: TObject);
var
  list: TStringList;
  s, left, right: string;
  i: integer;
begin
  list := TStringList.Create;
  try
    list.LoadFromFile('GameRecord.txt');
    for i := 0 to list.Count - 1 do
    begin
      s := '';
      s := list.Strings[i];
      left := '';
      left := LeftString(s, 2);
      right := '';
      right := RightString(left, 1);
      GameRecordData[i].X := StrToInt(right);
      right := '';
      right := RightString(s, 2);
      left := '';
      left := LeftString(right, 1);
      GameRecordData[i].Y := StrToInt(left);
    end;
    GameRecordFlag := list.Count;
    MessageBox(0, '记录载入成功.', '信息', MB_OK);
  finally
    list.Free;
  end;
end;

procedure TFormMain.MenuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.TimerRecordShowTimer(Sender: TObject);
var
  x, y: integer;
begin
  if not GameRecordShow then
  begin
    if GameRecordFlag <= 0 then
    begin
      TimerRecordShow.Enabled := false;
      MenuRecordReshow.Checked := false;
      exit;
    end;
    GameRecordShow := true;
    GameTmpFlag := 0;
    GameRecord := false;
    FreeData;
    InitData;
    FormPaint(Sender);
  end;
  Self.Caption := '点灯游戏' + ' - ' + IntToStr(GameTmpFlag) + '/' + IntToStr(GameRecordFlag - 1);
  x := GameRecordData[GameTmpFlag].X * MULX + STARTX + 25;
  y := GameRecordData[GameTmpFlag].Y * MULY + STARTY + 75;
  SetCursorPos(Self.Left + x, Self.Top + y);
  inc(GameTmpFlag);
  if GameTmpFlag >= GameRecordFlag then
  begin
    TimerRecordShow.Enabled := false;
    Application.ProcessMessages;
    MenuRecordReshow.Checked := false;
    GameRecordShow := false;
  end;
  FormMouseDown(Sender, mbLeft, [], x, y - 50);
end;

end.

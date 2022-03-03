unit MyUnit;

(*
  Made By Ricol. Functions And Procedures for Delphi Programmer.
*)

interface

uses
  Windows, Dialogs, SysUtils, MMSystem, Math, Graphics, Classes;

type

  PItem = ^Item;

  Item = record
    data: integer;
    next: PItem;
  end;

  TList = class                          //链表结构
  private
    head: PItem;                         //链表的头指针
  public
    constructor Create();                //构造函数head置为nil
    destructor Free();                   //析构函数head置为nil
    procedure Insert(position: integer; num: integer);       //在position前插入num，如果position比链表长度要长一位，则数据夹在链表的末尾，而不是插在中间
    procedure Delete(position: integer); //删除position位置的数据   1<=position<=GetLength
    function GetData(position: integer): integer;      //返回position位置的数据
    function IsEmpty(): boolean;        //判断链表是否为空
    procedure Clear();                  //清除链表中所有数据
    function GetLength(): integer;      //返回链表的长度
    procedure Dump();                   //输出链表中所有数据
    function Print(position: integer): string;  //输出链表中指定位置的数据
  end;

  TQueue = class                          //队列结构
  private
    head, tail: PItem;                     //队列的首尾指针
  public
    constructor Create();                   //构造函数
    destructor Free();                      //析构函数
    procedure EnQueue(num: integer);        //将num入队
    function DeQueue(): integer;            //出队操作
    procedure Clear();                      //清空队列中的所有数据
    function IsEmpty(): boolean;            //判断队列是否为空
    function GetLength(): integer;          //返回队列的长度
    procedure Dump();                       //输出队列中的所有数据
    function Print(position: integer): string;     //返回指定位置的数据
  end;

  TStack = class                                  //堆栈结构
  private
    top: integer;                                 //堆栈的栈顶指示数据
    stack: PItem;                                 //栈顶指针
  public
    constructor Create();                         //构造函数
    destructor Free();                            //析构函数
    procedure Push(num: integer);                 //将num入栈
    function Pop(): integer;                      //出栈操作
    procedure Clear();                            //清空堆栈中的所有数据
    function IsEmpty(): boolean;                  //判断堆栈是否为空
    function IsFull(): boolean;                   //判断堆栈是否为满
    function GetLenth(): integer;                 //返回堆栈的长度
    procedure Dump();                             //输出堆栈中的所有数据
    function Print(position: integer): string;    //返回指定位置的堆栈数据
  end;

procedure StartCount(); // 开始计数
procedure EndCount();   // 在StartCount之后调用，结束计数并进行统计
procedure ShowCount();  //显示统计信息
procedure ArraybubbleSort(var a: array of integer; flag: boolean); //对数组a进行冒泡排序
procedure ArrayInsertSort(var a: array of integer; flag: boolean); //对数组a进行插入排序
procedure ArraySelectSort(var a: array of integer; flag: boolean); //对数组a进行选择排序
function OtherToTen(const flag: integer; const other: string): integer;     //将flag进制的other转换为十进制数
function TenToOther(const flag: integer; const num: integer): string;       //将十进制num转换为flag进制数
function HexToTen(const Hex: string): integer;    //将十六进制的数转换为十进制数
function TenToHex(const num: integer): string;    //将十进制的数转换为十六进制数
procedure SetWaveLeft(const Volume: integer);         //设置左声道音量大小（1-13）
procedure SetWaveRight(const Volume: integer);        //设置右声道音量大小（1-13）
procedure SetWaveBalance(const Volume: integer);      //设置双声道音量大小（1-13）
procedure Swap(var a, b: string); overload;        //交换两个字符串变量
procedure Swap(var a, b: integer); overload;       //交换两个整型变量
procedure Swap(var a, b: real); overload;          //交换两个实型变量
function SelectDirectory(): string;
function Max(const a, b: integer): integer; overload;    //返回两个整型变量的最大值
function Min(const a, b: integer): integer; overload;    //返回两个整型变量的最小值
function Max(const a, b: real): real; overload;       //返回两个实型变量的最大值
function Min(const a, b: real): real; overload;       //返回两个实型变量的最小值
function IIF(const flag: boolean; const a, b: string): string;  //条件选择函数
function RightString(const s: string; length: integer): string; //返回右边字符串
function LeftString(const s: string; length: integer): string;  //返回左边字符串
function StrCmp(const s1, s2: string): integer;          //比较字符串大小  s1<s2 -1 s1=s2 0 s1>s2 1
function FloatToInteger(const f: double): integer;        //浮点型数据转换为定点数据
function SubInStringPosition(const s: string; const sub: string): integer;   //判断是否含有子串
function CharInStringPosition(const s: string; const c: string): integer;     //定位字符在母串的位置
function BlankString(const num: integer): string;    //返回指定个数的空格
function HanZiCount(const s: string): integer;       //返回母串中汉字的个数
function HanZiInString(const s: string): string;      //返回母串中的所有汉字
function ReverseString(const s: string): string;       //倒转字符串
procedure ShowInteger(const num: integer);        //显示整型数据
procedure ShowFloat(const num: real);         //显示浮点数据
procedure ShowString(const s: string);         //显示字符串
procedure ShowBoolean(const b: boolean);        //显示布尔数据
procedure ShowArray(const a: array of integer);     //显示一维数组数据
procedure ProcessStringWithOutBlank(var s: string);    //除去字符串中的所有空格
procedure ShowInfo(const num: integer); overload;      //显示整型变量的内容
procedure ShowInfo(const num: real); overload;         //显示实型变量的内容
procedure ShowInfo(const s: string); overload;         //显示字符串变量的内容
procedure ShowInfo(const b: boolean); overload;        //显示布尔变量的内容
procedure ShowInfo(const a: array of integer); overload;   //显示整型数组变量的内容
procedure HawDrawWave(Buf: PChar; Length: LongInt; DesCanvas: TCanvas;
DH, DW: SmallInt; Min, Max: LongInt; DrawLineColor, DrawBackColor: TColor;
StartPoi: LongInt = 0; DrawLength: LongInt = 0);
function GetFileSize(const FileName: string): cardinal;
function NewLine(): string;

implementation

var
  CountNum: Int64;              //用于操作计数的全局变量

const
  _NewLine: string = #$D + #$A;

function NewLine(): string;
begin
  result := _NewLine;
end;

procedure ShowCount();
begin
  MessageBox(0, PChar('本次操作用时：' + IntToStr(CountNum) + '毫秒'), PChar('信息'), MB_OK);
end;

procedure StartCount();
begin
  CountNum := GetTickCount();
end;

procedure EndCount();
begin
  CountNum := GetTickCount() - CountNum;
end;

procedure ArraybubbleSort(var a: array of integer; flag: boolean);
var
  i, j: integer;
begin
  if flag then
  begin
    for i := low(a) to high(a) - 1 do
      for j := high(a) downto i + 1 do
        if a[j] < a[j - 1] then Swap(a[j], a[j - 1]);
  end
  else
  begin
    for i := low(a) to high(a) - 1 do
      for j := high(a) downto i + 1 do
        if a[j] > a[j - 1] then Swap(a[j], a[j - 1]);
  end;
end;

procedure ArrayInsertSort(var a: array of integer; flag: boolean);
var
  i, j: integer;
  temp: integer;
begin
  if flag then
  begin
    for i := low(a) + 1 to high(a) do
    begin
      temp := a[i];
      for j := i - 1 downto low(a) do
      begin
        if a[j] > temp then a[j + 1] := a[j]
        else break;
      end;
      a[j + 1] := temp;
    end;
  end
  else
  begin
    for i := low(a) + 1 to high(a) do
    begin
      temp := a[i];
      for j := i - 1 downto low(a) do
      begin
        if a[j] < temp then a[j + 1] := a[j]
        else break;
      end;
      a[j + 1] := temp;
    end;
  end;
end;

procedure ArraySelectSort(var a: array of integer; flag: boolean);
var
  i, j: integer;
  temp: integer;
begin
  if flag then
    for i := low(a) to high(a) - 1 do
    begin
      temp := i + 1;
      for j := i + 1 to high(a) do           //在剩下的数列中搜寻最值
      begin
        if a[temp] > a[j] then temp := j;
      end;
      if a[i] > a[temp] then                //与最值比较确定是否交换
        Swap(a[temp], a[i]);
    end
  else
    for i := low(a) to high(a) - 1 do
    begin
      temp := i + 1;
      for j := i + 1 to high(a) do          //在剩下的数列中搜寻最值
      begin
        if a[temp] < a[j] then temp := j;
      end;
      if a[i] < a[temp] then                //与最值比较确定是否交换
        Swap(a[temp], a[i]);
    end;
end;

function OtherToTen(const flag: integer; const other: string): integer;
var
  i, Len, num: integer;
  tempStr: string;
begin
  if (flag > 21) or (flag < 2) then
  begin
    result := 0;
    exit;
  end;
  Len := StrLen(PChar(other));
  tempStr := other;
  tempStr := LowerCase(tempStr);
  i := Len;
  num := 0;
  while i >= 1 do
  begin
    case tempStr[i] of
    'a': num := num + 10 * FloatToInteger(Power(flag, Len - i));
    'b': num := num + 11 * FloatToInteger(Power(flag, Len - i));
    'c': num := num + 12 * FloatToInteger(Power(flag, Len - i));
    'd': num := num + 13 * FloatToInteger(Power(flag, Len - i));
    'e': num := num + 14 * FloatToInteger(Power(flag, Len - i));
    'f': num := num + 15 * FloatToInteger(Power(flag, Len - i));
    'g': num := num + 16 * FloatToInteger(Power(flag, Len - i));
    'h': num := num + 17 * FloatToInteger(Power(flag, Len - i));
    'i': num := num + 18 * FloatToInteger(Power(flag, Len - i));
    'j': num := num + 19 * FloatToInteger(Power(flag, Len - i));
    'k': num := num + 20 * FloatToInteger(Power(flag, Len - i));
    else
      num := num + StrToInt(tempStr[i]) * FloatToInteger(Power(flag, Len - i));
    end;
    dec(i);
  end;
  result := num;
end;

function TenToOther(const flag: integer; const num: integer): string;
var
  strTemp: string;
  data: array [1..100] of integer;
  i, j, temp1, temp2: integer;
begin
  strTemp := '';
  result := strTemp;
  if flag <= 1 then
  begin
    MessageBox(0, '进制信息出错，没有1进制', '信息', MB_OK);
    exit;
  end;
  if flag = 10 then
    result := IntToStr(num)
  else if flag < 10 then
  begin
    i := low(data);
    temp2 := num;
    repeat
      temp1 := temp2 mod flag;
      data[i] := temp1;
      temp2 := temp2 div flag;
      inc(i);
    until temp2 < flag;
    data[i] := temp2;
    for j := i downto low(data) do
      strTemp := strTemp + IntToStr(data[j]);
    result := strTemp;
  end
  else
  begin
    result := '';
    MessageBox(0, '大于十进制的还没有完成相应的功能', '信息', MB_OK);
  end;
end;

function HexToTen(const Hex: string): integer;
begin
  result := OtherToTen(16, Hex);
end;

function TenToHex(const num: integer): string;
begin
  result := IntToHex(num, 0);
end;

procedure SetWaveLeft(const Volume: integer);
var
  Wave: string;
begin
  Wave := '$' + IntToHex(0, 4) + IntToHex(Volume * 5000, 4);
  WaveOutSetVolume(0, StrToInt(Wave));
end;

procedure SetWaveRight(const Volume: integer);
var
  Wave: string;
begin
  Wave := '$' + IntToHex(Volume * 5000, 4) + IntToHex(0, 4);
  WaveOutSetVolume(0, StrToInt(Wave));
end;

procedure SetWaveBalance(const Volume: integer);
var
  Wave: string;
begin
  Wave := '$' + IntToHex(Volume * 5000, 4) + IntToHex(Volume * 5000, 4);
  WaveOutSetVolume(0, StrToInt(Wave));
end;

function Max(const a, b: real): real;
begin
  if a >= b then
    result := a
  else
    result := b;
end;

function Min(const a, b: real): real;
begin
  if a >= b then
    result := b
  else
    result := a;
end;

procedure ShowInfo(const num: integer);
begin
  ShowInteger(num);
end;

procedure ShowInfo(const num: real);
begin
  ShowFloat(num);
end;

procedure ShowInfo(const s: string);
begin
  ShowString(s);
end;

procedure ShowInfo(const b: boolean);
begin
  ShowBoolean(b);
end;

procedure ShowInfo(const a: array of integer);
begin
  ShowArray(a);
end;

procedure Swap(var a, b: string);
var
  temp: string;
begin
  temp := a;
  a := b;
  b := temp;
end;

procedure Swap(var a, b: integer); 
var
  temp: integer;
begin
  temp := a;
  a := b;
  b := temp;
end;

procedure Swap(var a, b: real);
var
  temp: real;
begin
  temp := a;
  a := b;
  b := temp;
end;

function StrCmp(const s1, s2: string): integer;
var
  s1Length, s2Length, i, j: integer;
begin
  s1Length := System.Length(s1);
  s2Length := System.Length(s2);
  if (s1Length = 0) and (s2Length <> 0) then
  begin
    result := -1;
    exit;
  end;
  if (s1Length <> 0) and (s2Length = 0) then
  begin
    result := 1;
    exit;
  end;
  if (s1Length =0) and (s2Length = 0) then
  begin
    result := 0;
    exit;
  end;
  i := 0;
  j := 0;
  while ((i <= s1Length) and (j <= s2Length) and (s1[i] = s2[j])) do
  begin
    inc(i);
    inc(j);
  end;
  if Ord(s1[i]) > Ord(s2[j]) then
    result := 1
  else if Ord(s1[i]) = Ord(s2[j]) then
    result := 0
  else
    result := -1;
end;

function ReverseString(const s: string): string;
var
  tempS: string;
  i: integer;
begin
  tempS := '';
  for i := System.Length(s) downto 1 do
    tempS := tempS + s[i];
  result := tempS;
end;

function HanZiInString(const s: string): string;
var
  i: integer;
  HanZi: string;
  CanContinue: boolean;
begin
  HanZi := '';
  CanContinue := false;
  for i := 1 to System.Length(s) do
  begin
    if CanContinue then
    begin
      CanContinue := false;
      continue;
    end;
    if Ord(s[i]) >= 129 then
    begin
      CanContinue := true;
      HanZi := HanZi + s[i] + s[i + 1];
    end;
  end;
  result := HanZi;
end;

function HanZiCount(const s: string): integer;
var
  Count: integer;
  i: integer;
begin
  Count := 0;
  for i := 1 to System.Length(s) do
  begin
    if Ord(s[i]) >= 129 then
      inc(Count);
  end;
  result := Count div 2;
end;

function BlankString(const num: integer): string;
var
  i: integer;
begin
  result := '';
  for i := 1 to num do
    result := result + ' ';
  exit;
end;

function SelectDirectory(): string;
begin
  result := '';
end;

procedure ShowArray(const a: array of integer);
var
  i, num: integer;
  s: string;
begin
  s := 'ARRAY:' + #$d + #$a;
  num := 0;
  for i := low(a) to high(a) do
  begin
    inc(num);
    if num = 10 then
    begin
      s := s + IntToStr(i) + ':' + IntToStr(a[i]) + #$d + #$a;
      num := 0;
    end
    else                                               
      s := s+ IntToStr(i) + ':' + IntToStr(a[i]) + #$9;
  end;
  ShowString(s);
end;

procedure ShowBoolean(const b: boolean);
begin
  if b then
    ShowString('true')
  else
    ShowString('false');
end;

function CharInStringPosition(const s: string; const c: string): integer;
var
  i: integer;
begin
  result := 0;
  for i := 1 to System.Length(s) do
  begin
    if s[i] = c then
    begin
      result := i;
      exit;
    end;
  end;
end;

function SubInStringPosition(const s: string; const sub: string): integer;
var
  i, j, k: integer;
  s_len, sub_len: integer;
  tmpS, tmpSub: string;
  found: boolean;
begin
  result := 0;
  s_len := StrLen(PChar(s));
  sub_len := StrLen(PChar(sub));
  tmpS := s;
  tmpSub := sub;
  found := false;
  for i := 1 to s_len - sub_len + 1 do
  begin
    j := i;
    k := 1;
    while (tmpS[j] = tmpSub[k]) do
    begin
      inc(j);
      inc(k);
      if (k >= sub_len + 1) then
      begin
        found := true;
        break;
      end;
    end;
    if found then
    begin
      result := i;
      exit;
    end;
  end;
end;

function FloatToInteger(const f: double): integer;
var
  s: string;
begin
  s := FloatToStr(f);
  if SubInStringPosition(s, '.') <> 0 then
  begin
    s := copy(s, 1, CharInStringPosition(s, '.') - 1);
    result := StrToInt(s);
  end
  else
    result := StrToInt(s);
end;

function RightString(const s: string; length: integer): string;
var
  i: integer;
  tempS: string;
begin
  tempS := '';
  result := '';
  for i := System.Length(s) downto 1 do
    tempS := tempS + s[i];
  tempS := copy(tempS, 1, length);
  for i := System.Length( (tempS)) downto 1 do
    result := result + tempS[i];
end;

function LeftString(const s: string; length: integer): string;
begin
  result := copy(s, 1, length);
end;

procedure ProcessStringWithOutBlank(var s: string);
var
  i: integer;
  target: string;
begin
  target := '';
  for i := 1 to Length(s) do
  begin
    if s[i] = ' ' then continue;
    target := target + s[i];
  end;
  s := target;
end;

function Max(const a, b: integer): integer;
begin
  if a >= b then
    result := a
  else
    result := b;
end;

function Min(const a, b: integer): integer;
begin
  if a > b then
    result := b
  else
    result := a;
end;

function IIF(const flag: boolean; const a, b: string): string;
begin
  if flag then
    result := a
  else
    result := b;
end;

procedure ShowInteger(const num: integer);
begin
  MessageBox(0, PChar(IntToStr(num)), '信息', MB_OK);
end;

procedure ShowFloat(const num: real);
begin
  MessageBox(0, PChar(FloatToStr(num)), '信息', MB_OK);
end;

procedure ShowString(const s: string);
begin
  MessageBox(0, PChar(s), '信息', MB_OK);
end;

{ TList }

procedure TList.Clear;
var
  temp: PItem;
begin
  if IsEmpty() then exit;
  while GetLength <> 0 do
  begin
    temp := head;
    head := head^.next;
    FreeMem(temp);
  end;
end;

constructor TList.Create();
begin
  if head <> nil then
    Free();
  head := nil;
end;

procedure TList.Delete(position: integer);
var
  i: integer;
  temp, pretemp: PItem;
begin
  if IsEmpty() then exit;
  if (position <= 0) or (position >= GetLength() + 1) then exit;
  i := 1;
  pretemp := nil;
  temp := head;
  while (i <> position) do
  begin
    pretemp := temp;
    temp := temp^.next;
    inc(i);
  end;
  if position = 1 then
    head := head^.next
  else
    pretemp^.next := temp^.next;
  FreeMem(temp);
end;

procedure TList.Dump;
var
  temp: PItem;
begin
  temp := head;
  while temp <> nil do
  begin
    ShowInfo('address: ' + IntToHex(integer(temp), 10) + #$d + #$a +
             'data:    ' + IntToStr(temp^.data) + #$d + #$a +
             'next:    ' + IntToHex(integer(temp^.next), 10));
    temp := temp^.next;
  end;
end;

destructor TList.Free;
var
  temp, pre: PItem;
begin
  temp := head;
  while temp <> nil do
  begin
    pre := temp;
    temp := temp^.next;
    FreeMem(pre);
  end;
  head := nil;
end;

function TList.GetData(position: integer): integer;
var
  i: integer;
  temp: PItem;
begin
  i := 1;
  if IsEmpty() then
  begin
    result := 0;
    exit;
  end;
  if (position <= 0) or (position >= GetLength + 1) then
  begin
    result := 0;
    exit;
  end;
  temp := head;
  while (i <> position) and (temp <> nil) do
  begin
    temp := temp^.next;
    inc(i);
  end;
  result := temp^.data;
end;

function TList.GetLength: integer;
var
  temp: PItem;
begin
  temp := head;
  result := 0;
  while temp <> nil do
  begin
    result := result + 1;
    temp := temp^.next;
  end;
end;

procedure TList.Insert(position, num: integer);
var
  i: integer;
  temp, pre, new: PItem;
begin
  if (position <= 0) or (position > GetLength + 1) then
    exit;
  i := 1;
  pre := nil;
  temp := head;
  while (i <> position) and (temp <> nil) do
  begin
    pre := temp;
    temp := temp^.next;
    inc(i);
  end;
  GetMem(new, sizeof(new));
  new^.data := num;
  new^.next := temp;
  if pre = nil then
    head := new
  else
    pre^.next := new;
end;

function TList.IsEmpty: boolean;
begin
  if GetLength <> 0 then
    result := false
  else
    result := true;
end;

function TList.Print(position: integer): string;
var
  i: integer;
  temp: PItem;
begin
  i := 1;
  if IsEmpty() then exit;
  if (position <= 0) or (position >= GetLength + 1) then exit;
  temp := head;
  while (i <> position) and (temp <> nil) do
  begin
    temp := temp^.next;
    inc(i);
  end;
  result := 'position: ' + IntToStr(position) +
            '     address: ' + IntToHex(integer(temp), 10) + #$d + #$a +
            '     data:    ' + IntToStr(temp^.data) + #$d + #$a +
            '     next:    ' + IntToHex(integer(temp^.next), 10);
end;

{ TQueue }

procedure TQueue.Clear;
var
  temp, pre: PItem;
begin
  temp := Tail;
  if temp = nil then exit;
  while temp <> nil do
  begin
    pre := temp;
    temp := temp^.next;
    FreeMem(pre);
  end;
  Head := nil;
end;

constructor TQueue.Create;
begin
  Head := nil;
  Tail := nil;
end;

function TQueue.DeQueue: integer;
var
  temp: PItem;
begin
  if Head = nil then
  begin
    result := 0;
    exit;
  end;
  if (Head = Tail) then
  begin
    result := Tail^.data;
    FreeMem(Tail);
    Head := nil;
    Tail := nil;
    exit;
  end;
  temp := Tail;
  Tail := Tail^.next;
  result := temp^.data;
  FreeMem(temp);
end;

procedure TQueue.Dump;
begin

end;

procedure TQueue.EnQueue(num: integer);
var
  temp: PItem;
begin
  GetMem(temp, sizeof(temp));
  temp^.data := num;
  temp^.next := nil;
  if Head = nil then
  begin
    Head := temp;
    Tail := temp;
  end
  else
  begin
    Head^.next := temp;
    Head := temp;
  end;
end;

destructor TQueue.Free;
begin
  Self.Clear;
end;

function TQueue.GetLength: integer;
var
  i: integer;
  temp: PItem;
begin
  if Head = nil then
  begin
    result := 0;
    exit;
  end;
  temp := Tail;
  i := 0;
  while temp <> nil do
  begin
    inc(i);
    temp := temp^.next;
  end;
  result := i;
end;

function TQueue.IsEmpty: boolean;
begin
  if Head = nil then
    result := true
  else
    result := false;
end;

function TQueue.Print(position: integer): string;
var
  i: integer;
  temp: PItem;
begin
  if Self.IsEmpty then exit;
  if (position <= 0) or (position >= Self.GetLength + 1) then exit;
  temp := Tail;
  i := 0;
  while temp <> nil do
  begin
    inc(i);
    if i = position then
    begin
      result := 'position: ' + IntToStr(position) +
                '     address: ' + IntToHex(integer(temp), 10) + #$d + #$a +
                '     data:    ' + IntToStr(temp^.data) + #$d + #$a +
                '     next:    ' + IntToHex(integer(temp^.next), 10);
      exit;
    end;
    temp := temp^.next;
  end;
end;

{ TStack }

procedure TStack.Clear;
begin
  while Self.IsEmpty = false do
    Self.Pop;
end;

constructor TStack.Create;
begin
  top := 0;
  stack := nil;
end;

procedure TStack.Dump;
var
  temp: PItem;
  position: integer;
  s: string;
begin
  temp := stack;
  position := 0;
  while temp <> nil do
  begin
    inc(position);
     s := 'position: ' + IntToStr(position) +
          '     address: ' + IntToHex(integer(temp), 10) + #$d + #$a +
          '     data:    ' + IntToStr(temp^.data) + #$d + #$a +
          '     next:    ' + IntToHex(integer(temp^.next), 10);
     ShowInfo(s);
     temp := temp^.next;
  end;
end;

destructor TStack.Free;
begin
  Self.Clear;
  top := 0;
  stack := nil;
end;

function TStack.GetLenth: integer;
begin
  result := top;
end;

function TStack.IsEmpty: boolean;
begin
  if top = 0 then
    result := true
  else
    result := false;
end;

function TStack.IsFull: boolean;
begin
  result := false;
end;

function TStack.Pop: integer;
var
  temp: PItem;
begin
  if Self.IsEmpty then
  begin
    result := 0;
    exit;
  end;
  temp := stack;
  stack := stack^.next;
  result := temp^.data;
  FreeMem(temp);
  dec(top);  
end;

function TStack.Print(position: integer): string;
var
  i: integer;
  temp: PItem;
  s: string;
begin
  if (position <= 0) or (position >= Self.GetLenth + 1) then exit;
  if Self.IsEmpty then exit;
  temp := stack;
  i := 1;
  while (i <> position) do
  begin
    inc(i);
    temp := temp^.next;
  end;
  s := 'position: ' + IntToStr(position) +
       '     address: ' + IntToHex(integer(temp), 10) + #$d + #$a +
       '     data:    ' + IntToStr(temp^.data) + #$d + #$a +
       '     next:    ' + IntToHex(integer(temp^.next), 10);
  result := s;
end;

procedure TStack.Push(num: integer);
var
  temp: PItem;
begin
  inc(top);
  GetMem(temp, sizeof(temp));
  temp^.data := num;
  temp^.next := nil;
  if stack = nil then
    stack := temp
  else
  begin
    temp^.next := stack;
    stack := temp;
  end;  
end;

//波形显示
procedure HawDrawWave(Buf: PChar; Length: LongInt; DesCanvas: TCanvas;
DH, DW: SmallInt; Min, Max: LongInt; DrawLineColor, DrawBackColor: TColor;
StartPoi: LongInt = 0; DrawLength: LongInt = 0);
var
  i: LongInt;
  Y: SmallInt;
  DesBitMap: TBitMap;
begin
  DesBitMap := TBitMap.Create;
  with DesBitMap do
  begin
    Width := DW;
    Height := DH;
    Canvas.Brush.Color := DrawBackColor;
    Canvas.Brush.Style := bsSolid;
    Canvas.Pen.Color := DrawLineColor;
    Canvas.Pen.Mode := pmCopy;
    Canvas.FillRect(Rect(0, 0, DW, DH));
    Canvas.MoveTo(0, DH div 2);
    Canvas.LineTo(DW, DH div 2);
  end;
  if ((Length = 0) or (Buf = NIL)) then
  begin
    BitBlt(DesCanvas.Handle, 0, 0, DW, DH, DesBitMap.Canvas.Handle, 0, 0, SRCCOPY);
    exit;
  end;
  if (StartPoi mod 2) = 1 then
    StartPoi := StartPoi + 1;
  if StartPoi >= Length then
    Startpoi := 2;
  if DrawLength div 2 > DW then
    DrawLength := DW * 2;
  if (StartPoi + DrawLength) > Length then
    DrawLength := Length - StartPoi;
  if DrawLength <= 0 then
    DrawLength := DW * 2;
  Max := Max - Min;
  for i := 0 to (DrawLength div 2 - 1) do
  begin
    if Max <> 0 then
      Y := Abs(PSmallInt(PChar(Buf) + StartPoi + i * 2)^ - Min) * DH div Max
    else
      Y := 0;
    Y := Abs(DH div 2 - Y);
    if Y >= (DH div 2) then continue;
    DesBitMap.Canvas.MoveTo(i, DH div 2 - Y);
    DesBitMap.Canvas.LineTo(i, DH div 2 + Y);
    if i > DW then break;
  end;
  BitBlt(DesCanvas.Handle, 0, 0, DW, DH, DesBitMap.Canvas.Handle, 0, 0, SRCCOPY);
  DesBitMap.Free;
end;

function GetFileSize(const FileName: string): cardinal;
var
  tmpHandle: THandle;
  tmpSize: cardinal;
begin
  tmpHandle := FileOpen(FileName, fmOpenRead);
  tmpSize := Windows.GetFileSize(tmpHandle, nil);
  FileClose(tmpHandle);
  result := tmpSize;
end;

end.

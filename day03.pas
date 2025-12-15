
Program Day03;

Uses Classes, StrUtils, SysUtils;

Const FileName = 'input/day03.txt';

Function FindMaxJoltage(Line: String; BatteriesCount: Integer): Int64;

Var FinalBatteryIndex: Integer;
  FinalBatteries: String;
  NextBatteryIndex: Integer;
  NextBestBattery: Integer;
  I: Integer;
  V: Integer;
Begin
  FinalBatteries := '';
  NextBatteryIndex := 1;
  For FinalBatteryIndex := 1 To BatteriesCount Do
    Begin
      NextBestBattery := StrToInt(Line[NextBatteryIndex]);
      NextBatteryIndex := NextBatteryIndex + 1;
      For I := NextBatteryIndex To Length(Line) - BatteriesCount + FinalBatteryIndex Do
        Begin
          V := StrToInt(Line[I]);
          If V > NextBestBattery Then
            Begin
              NextBestBattery := V;
              NextBatteryIndex := I + 1;
            End;
        End;
      FinalBatteries := FinalBatteries + IntToStr(NextBestBattery);
    End;
  FindMaxJoltage := StrToInt64(FinalBatteries);
End;

Var 
  Lines: TStringList;
  Line: String;
  Part1: Int64;
  Part2: Int64;

Begin
  Lines := TStringList.Create;
  Lines.LoadFromFile(FileName);

  Part1 := 0;
  Part2 := 0;
  For Line In Lines Do
    Begin
      Part1 := Part1 + FindMaxJoltage(Line, 2);
      Part2 := Part2 + FindMaxJoltage(Line, 12);
    End;

  WriteLn(Part1);
  WriteLn(Part2);
End.

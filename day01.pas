
Program Day01;

Uses Classes, SysUtils;

Const 
  FileName = 'input/day01.txt';

Var 
  Lines: TStringList;
  Line: string;
  Dial: Integer;
  Dir: Char;
  Amount: Integer;
  Part1: Integer;
  Part2: Integer;

Begin
  Lines := TStringList.Create;
  Lines.LoadFromFile(FileName);

  Dial := 50;
  Part1 := 0;
  Part2 := 0;

  For Line In Lines Do
    Begin
      Dir := Line[1];
      Amount := StrToInt(Copy(Line, 2, Length(Line)));
      While Amount > 0 Do
        Begin
          If Dir = 'L' Then
            Begin
              Dial := Dial - 1;
            End
          Else
            Begin
              Dial := Dial + 1;
            End;
          Amount := Amount - 1;
          If Dial < 0 Then
            Begin
              Dial := 99;
            End;
          If Dial >= 100 Then
            Begin
              Dial := 0;
            End;

          If Dial = 0 Then
            Begin
              Part2 := Part2 + 1;
            End;

        End;
      If Dial Mod 100 = 0 Then
        Begin
          Part1 := Part1 + 1;
        End;
    End;

  WriteLn(Part1);
  WriteLn(Part2);
End.

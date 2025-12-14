
Program Day02;

Uses Classes, StrUtils, SysUtils;

Const 
  FileName = 'input/day02.txt';

Var 
  Lines: TStringList;
  Ranges: TStringList;
  Range: string;
  RangeParts: array Of AnsiString;
  ID: Int64;
  Part1: Int64;
  Part2: Int64;

Function IsInvalidID(ID: String): Boolean;
Begin
  IsInvalidID := False;
  If Copy(ID, 1, Length(ID) Div 2) = Copy(ID, (Length(ID) Div 2) + 1, MaxInt) Then
    Begin
      IsInvalidID := True;
      Exit;
    End;
End;

Function IsInvalidID2(ID: String): Boolean;

Var IsOK: Boolean;
  ChunkLength: Integer;
  Chunk: string;
  NextChunkIndex: Integer;
Begin
  IsInvalidID2 := False;
  For ChunkLength := 1 To (Length(ID) Div 2) Do
    Begin
      Chunk := Copy(ID, 1, ChunkLength);
      NextChunkIndex := ChunkLength + 1;
      IsOK := True;
      While NextChunkIndex <= Length(ID) Do
        Begin
          If Chunk <> Copy(ID, NextChunkIndex, ChunkLength) Then
            Begin
              IsOK := False;
              IsInvalidID2 := False;
              Break;
            End;
          NextChunkIndex := NextChunkIndex + Length(Chunk);
        End;
      If IsOK Then
        Begin
          IsInvalidID2 := True;
          Exit;
        End;
    End;
End;

Begin
  Part1 := 0;
  Part2 := 0;

  Lines := TStringList.Create;
  Lines.LoadFromFile(FileName);

  Ranges := TStringList.Create;
  Ranges.Delimiter := ',';
  Ranges.DelimitedText := Lines[0];

  For Range In Ranges Do
    Begin
      RangeParts := SplitString(Range, '-');
      For ID := StrToInt64(RangeParts[0]) To StrToInt64(RangeParts[1]) Do
        Begin
          If IsInvalidID(IntToStr(ID))
            Then
            Begin
              Part1 := Part1 + ID;
            End;
          If IsInvalidID2(IntToStr(ID))
            Then
            Begin
              Part2 := Part2 + ID;
            End;
        End;
    End;

  WriteLn(Part1);
  WriteLn(Part2);
End.

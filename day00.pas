
Program Day00;

Uses Classes, SysUtils;

Const 
  FileName = 'input/day00.txt';

Var 
  Lines: TStringList;
  Line: string;

Begin
  If ParamCount = 0 Then
    Begin
      WriteLn('Hello, World!');
    End
  Else
    Begin
      WriteLn('Hello, ', ParamStr(1), '!');
    End;

  Lines := TStringList.Create;
  Lines.LoadFromFile(FileName);
  For Line In Lines Do
    Begin
      WriteLn(Line);
    End;

End.

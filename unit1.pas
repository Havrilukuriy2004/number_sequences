unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);

  private

  public

  end;

var
  Form1: TForm1;
  a1,a2,a3,d,s:real;
  n,i,b:integer;
  s1:string;
  a:array of real;

implementation

{$R *.lfm}

{ TForm1 }





procedure TForm1.Button1Click(Sender: TObject);
begin

     a1:=strtofloat(edit1.text);
     a2:=strtofloat(edit2.text);
     a3:=strtofloat(edit3.text);
    if a1*a3=a2*a2 then
    begin
      b:=1;
      d:=a2/a1;
      if abs(d)>1 then
      begin
      radiobutton1.checked:=true;
      panel1.caption:='Sorry, this suquence is doesn`t apply to geometric sequence with |q|<1';
      end;
      if abs(d)<1 then
      begin
      radiobutton2.checked:=true;
      s:=a1/(1-(d));
      panel1.caption:=floattostr(s);
      end;

    end
     else if a1+a3=a2+a2 then
    begin
      b:=2;
      d:=a2-a1;
      radiobutton3.checked:=true;
      panel1.caption:='Sorry, this suquence is doesn`t apply to geometric sequence with |q|<1';
    end
     else
     begin
      b:=3;
    panel2.caption:='Sorry, this suquence is doesn`t apply to standart type of sequence';
     radiobutton4.checked:=true;
     end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  n:=strtoint(edit4.text);
  setlength(a,n);
  a[1]:=a1;
  if b=1 then
  begin
    s:=(a1*exp(n*ln(d))-1)/(d-1);
    panel2.caption:=floattostr(s);
    a[1]:=a1;
     s1:=floattostr(a[1])+' ';
    for i:=2 to n do
    begin
     a[i]:=a[i-1]*d;
     s1:=s1+floattostr(a[i])+' ';
    end;
    panel3.caption:=s1;
  end
  else if b=2 then
  begin
    s:=(2*a1+d*(n-1))*0.5*n;
    panel2.caption:=floattostr(s);
    a[1]:=a1;
     s1:=floattostr(a[1])+' ';
    for i:=2 to n do
    begin
     a[i]:=a[i-1]+d;
     s1:=s1+floattostr(a[i])+' ';
    end;
    panel3.caption:=s1;
  end
  else if b=3 then
  begin
  panel2.caption:='Sorry, this suquence is doesn`t apply to standart type of sequence';
  panel3.caption:='Sorry, this suquence is doesn`t apply to standart type of sequence';
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     showmessage('Thank you for using this programm');
end;



end.


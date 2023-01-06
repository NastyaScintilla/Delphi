unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  x0,y0,n,h,i0,j0,p0,schet:integer;
   golova,rykalv,nogalv,telo,rykapr,nogapr,pobeda:TBitMap ;
   pole:array[1..10,1..10] of integer;
  hod:boolean;
implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
form2.Hide;
form1.show;
end;

function ochistka: boolean;
var i,j,k: integer;
    fd: boolean;
begin
  fd := false;
  ochistka:=true;
  repeat
    fd:=false;
    for I := 1 to n do
      for j := 1 to n do
      begin
        if (i<n-3) and (pole[i,j]=pole[i,j+1]) and (pole[i,j]=pole[i+2,j])   //5 col
        and (pole[i,j]=pole[i+3,j]) and (pole[i,j]=pole[i+4,j])then
          begin
            fd:=true;
            for  k:=i-1 downto 1 do
            begin
              pole[k+4,j]:=pole[k,j];
            end;
            schet:=schet+5;
            for k := 1 to 5 do
              pole[k,j]:=random(6)+1;
            ochistka:=false;
            break;

          end
        else if (i<n-2) and (pole[i,j]=pole[i+1,j]) and (pole[i,j]=pole[i+2,j])   //4 col
        and (pole[i,j]=pole[i+3,j]) then
          begin
            fd:=true;
            for  k:=i-1 downto 1 do
            begin
              pole[k+3,j]:=pole[k,j];
            end;
             schet:=schet+4;
            for k := 1 to 4 do
              pole[k,j]:=random(6)+1;
            ochistka:=false;
            break;

          end
        else if (i<n-1) and (pole[i,j]=pole[i+1,j]) and (pole[i,j]=pole[i+2,j]) then  //3 col
          begin
            fd:=true;
            for  k:=i-1 downto 1 do
            begin
              pole[k+2,j]:=pole[k,j];
            end;
             schet:=schet+3;
            for k := 1 to 3 do
              pole[k,j]:=random(6)+1;
            ochistka:=false;
            break;

          end
        else if (j<n-3) and (pole[i,j]=pole[i,j+1]) and (pole[i,j]=pole[i,j+2])   //5 row
        and (pole[i,j]=pole[i,j+3]) and (pole[i,j]=pole[i,j+4])then
          begin
            fd:=true;
            for  k:=i downto 2 do
            begin
               pole[k,j]:=pole[k-1,j];
               pole[k,j+1]:=pole[k-1,j+1];
               pole[k,j+2]:=pole[k-1,j+2];
               pole[k,j+2]:=pole[k-1,j+3];
               pole[k,j+2]:=pole[k-1,j+4];
            end;
             schet:=schet+5;
            pole[1,j]:=random(6)+1;
            pole[1,j+1]:=random(6)+1;
            pole[1,j+2]:=random(6)+1;
            pole[1,j+3]:=random(6)+1;
            pole[1,j+4]:=random(6)+1;
            ochistka:=false;
            break;

          end
        else if (j<n-2) and (pole[i,j]=pole[i,j+1]) and (pole[i,j]=pole[i,j+2])   //4 row
        and (pole[i,j]=pole[i,j+3]) then
          begin
            fd:=true;
            for  k:=i downto 2 do
            begin
               pole[k,j]:=pole[k-1,j];
               pole[k,j+1]:=pole[k-1,j+1];
               pole[k,j+2]:=pole[k-1,j+2];
               pole[k,j+2]:=pole[k-1,j+3];
            end;
            schet:=schet+4;
            pole[1,j]:=random(6)+1;
            pole[1,j+1]:=random(6)+1;
            pole[1,j+2]:=random(6)+1;
            pole[1,j+3]:=random(6)+1;
            ochistka:=false;
            break;

          end
        else if (j<n-1) and (pole[i,j]=pole[i,j+1]) and (pole[i,j]=pole[i,j+2]) then  //3 row
          begin
            fd:=true;
            for  k:=i downto 2 do
            begin
               pole[k,j]:=pole[k-1,j];
               pole[k,j+1]:=pole[k-1,j+1];
               pole[k,j+2]:=pole[k-1,j+2];
            end;
            schet:=schet+3;
            pole[1,j]:=random(6)+1;
            pole[1,j+1]:=random(6)+1;
            pole[1,j+2]:=random(6)+1;
            ochistka:=false;
            break;

          end
      end;
  until fd = false;

  form2.label1.Caption := 'Очки: ' + inttostr(schet);
end;

procedure TForm2.FormCreate(Sender: TObject);
        var i,j:integer;
begin
 x0:=10;
 y0:=10;
 n:=10;
 h:=50;
 hod:=true;
 randomize;
  for i:= 1 to 10 do
             for j := 1 to 10 do
               pole[i,j]:=random(6)+1;
    telo:= TBitMap.create;
  telo.LoadFromFile('telo.bmp');
  rykalv:= TBitMap.create;
  rykalv.LoadFromFile('rykalv.bmp');
  nogalv:= TBitMap.create;
  nogalv.LoadFromFile('nogalv.bmp');
  golova:= TBitMap.create;
  golova.LoadFromFile('golova.bmp');
  rykapr:= TBitMap.create;
  rykapr.LoadFromFile('rykapr.bmp');
  nogapr:= TBitMap.create;
  nogapr.LoadFromFile('nogapr.bmp');
  pobeda:= TBitMap.create;
  pobeda.LoadFromFile('pobeda.bmp');
 end;

procedure DrawPole (n, h, x0, y0 : integer);
var i, j, k, x, y,v,u : integer;
begin
   for i:= 1 to n do
	  begin
	    y:=y0 + (i-1)*h;
      for j:= 1 to n do
      begin
        x:=x0 + (j-1)*h;
        with Form2.Canvas do
			  begin
				   Pen.Color:= ClBlack;
				   Brush.Color:= ClWhite;
            Brush.Style:= BsSolid;
				   Rectangle(x, y, x + h, y + h);

        end;
      end;
    end;

 for i:= 1 to 10 do
 for j := 1 to 10 do
 begin
    v:=(i-1)*h+x0;
    u:=(j-1)*h+y0;
    case pole[i,j] of
    1: form2.Canvas.Draw(u,v,golova);
    2: form2.Canvas.Draw(u,v,rykapr);
    3: form2.Canvas.Draw(u,v,nogapr);
    4: form2.Canvas.Draw(u,v,telo);
    5: form2.Canvas.Draw(u,v,rykalv);
    6: form2.Canvas.Draw(u,v,nogalv);
    end;

 end;
end;

 procedure TForm2.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var i,j,u,v,k: integer;
   begin
   i:=((y-y0) div h) +1;
   j:=((x-x0) div h)+1;
   if hod then
   begin
    i0:=i;
    j0:=j;

    hod:=false;
   end
   else
   begin
   hod:=true;
   if ((i0-1=i) and (j0=j)) or ((i0+1=i) and (j0=j)) or ((j0-1=j) and (i0=i)) or ((j0+1=j)and (i0=i)) then
   begin
    k:=pole[i0,j0];
    pole[i0,j0]:=pole[i,j];
    pole[i,j]:=k;
    if ochistka then
    begin
      k:=pole[i0,j0];
      pole[i0,j0]:=pole[i,j];
      pole[i,j]:=k;
    end;
    DrawPole(n, h, x0, y0);
   end;
   end;
   if schet>=500 then
   begin
   form2.Canvas.Draw(form2.Width - 350,form2.height - 430,pobeda);
   ShowMessage('Победа!!!');
   end;
  
end;

procedure TForm2.FormPaint(Sender: TObject);
begin
  ochistka;

  DrawPole (n, h, x0, y0);
end;

procedure TForm2.Button2Click(Sender: TObject);
var i,j:integer;
begin
  randomize;
  schet :=0;
  for i:= 1 to 10 do
             for j := 1 to 10 do
               pole[i,j]:=random(6)+1;
  ochistka;
  DrawPole(n, h, x0, y0);
end;


end.


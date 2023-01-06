unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus;
  type Tpole = array[1..3,1..3] of integer;
type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Play1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    PaintBox1: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure Play1Click(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
  public
      procedure Drawpole;
  procedure CreatePole(var pole:Tpole);

    { Public declarations }
  end;

var
  Form1: TForm1;
   pole:Tpole;   i,j,dx,dy,c:word;
  Bitmap : TBitmap;
  Bitmap2 : TBitmap;


implementation

{$R *.dfm}
    procedure Tform1.Drawpole;
 var x,y,i,j:integer;
    begin
    dx:=Paintbox1.Width div 3;
    dy:=PaintBox1.Height div 3;
    with Paintbox1.Canvas do
    begin
    pen.Color:=clBlue;
    for i:=1 to 3 do
    for j:=1 to 3 do
    begin
     x:=(j-1)*dx;
     y:=(i-1)*dy;
     rectangle(x,y,x+dx,y+dy);
     end;
    end;
    end;

 procedure TForm1.CreatePole(var pole:Tpole);
 begin
  for i:=1 to 3 do
        for j:=1 to 3 do
         pole[i,j]:=0;
         end;


procedure TForm1.FormCreate(Sender: TObject);
begin
c:=0;
           Createpole(pole);
     Bitmap := TBitmap.create;
Bitmap.LoadFromFile('bitmap1.bmp');
Bitmap.Transparent:=true;
   Bitmap2 := TBitmap.create;
Bitmap2.LoadFromFile('bitmap2.bmp');
Bitmap2.Transparent:=true;

end;
procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var u,v:integer;
  procedure XYtoIJ(x,y:integer; var i,j:word);
begin
      j:=(x div dx)+1;
   i:=(y div dy)+1;
end;
      function Check_hor(i:word):boolean;
  var j,sum:integer;
begin
sum:=0;
for j:=1 to 3 do
sum:=sum+pole[i,j];
if sum=3 then check_hor:=true else check_hor:=false;
end;
     function Check_hor1(j:word):boolean;
  var i,sum1:integer;
begin
  sum1:=0;
for i:=1 to 3 do
sum1:=sum1+pole[i,j];
if sum1=3 then check_hor1:=true else check_hor1:=false;
end;
 function Check_hor2:boolean;
  var i,sum1:integer;
  begin
  sum1:=0;
for i:=1 to 3 do
sum1:=sum1+pole[i,i];
if sum1=3 then check_hor2:=true else check_hor2:=false;
end;
begin
   XYtoIJ(x,y,i,j);
  u:=(j-1)*dx;
  v:=(i-1)*dy;

   if    pole[i,j]=0 then
  if c mod 2=0 then
  begin
  paintbox1.canvas.draw(u,v,Bitmap);
  pole[i,j]:=1;
  c:=c+1;
  end
  else
  begin
  paintbox1.canvas.draw(u,v,Bitmap2);
  pole[i,j]:=7;
  c:=c+1;
  end;

     if check_hor(i) then  ShowMessage('Победа!')
     else
     if check_hor1(j) then  ShowMessage('Победа!')
     else
     if check_hor2 then  ShowMessage('Победа!');


end;


procedure TForm1.Play1Click(Sender: TObject);
begin
 Drawpole;
end;

end.

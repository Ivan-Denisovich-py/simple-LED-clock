/**
*A simple digital clock on APDE (Processing on Android)
by anusha-exe
*Inspired from The Coding Train video 
on seven-segment display by Daniel Shiffman
*Acknowledgments: Ivan-Denisovich-py (Guido The Guidebook)
*Works fine on my phone but
 if it's a laptop, you might
 want to scale it down by 0.5 in draw()
*/

//hex values for seven segment 0,1,2,3,...,9
int nums[]={0x7E,0x30,0x6D,0x79,0x33,0x5B,0x5F,0x70,0x7F,0x7B};

//Real Time
int h;
int r;
int m;
int n;
int sec;

//rect variables
int l_rect=130;
int b_rect=40;
int xpoint=230;
int ypoint=220;

void setup ()
{
  size(1500,800);
  frameRate(1);
}


void draw()
{
  background (0);
  strokeWeight(2);
  //Checking time
  h=hour()/10;
  r=hour()%10;
  m=minute()/10;
  n=minute()%10;
  sec=second();

  //four numbers
  seven_seg(nums[h], xpoint + 0*(180+l_rect)-100, ypoint, l_rect, b_rect);
  seven_seg(nums[r], xpoint + 1*(180+l_rect)-100, ypoint, l_rect, b_rect);
  seven_seg(nums[m], xpoint + 2*(180+l_rect)+70, ypoint, l_rect, b_rect);
  seven_seg(nums[n], xpoint + 3*(180+l_rect)+70, ypoint, l_rect, b_rect);
  if(frameCount%2==0)
  fill(220,0,0);
  else
  fill(220,0,0,70);
  rect(xpoint + 1*(180+l_rect)+180, ypoint+100, 60,60, 50);
  rect(xpoint + 1*(180+l_rect)+180, ypoint+240, 60, 60,50);
  
 
  }
  
int getColor(int value, int shift)
{//bitwise operation for alpha = 0 or 1
  int alpha=255*(value>>shift & 1);
  if(alpha==0)
  alpha=80; //partial opaqueness
  int g=0;
  int b=0;
  int r=220;
  return color(r,g,b,alpha);
  
}  
  
void seven_seg(int val, int x, int y, int length, int breadth)
{
  noStroke();
  //A
  fill(getColor(val,6));
  rect( x, y, length, breadth, 50);
  //B
  fill(getColor(val,5));
  rect( x+length, y+breadth, breadth, length, 50);
  //C
  fill(getColor(val,4));
  rect( x+length, y+2*breadth+length, breadth, length, 50);
  //D
  fill(getColor(val,3));
  rect( x, y+2*(breadth+length), length, breadth, 50);
  //E
  fill(getColor(val,2));
  rect( x-breadth, y+2*breadth+length, breadth, length, 50);
  //F
  fill(getColor(val,1));
  rect( x-breadth, y+breadth, breadth, length, 50);
  //G
  fill(getColor(val,0));
  rect( x, y+breadth+length, length, breadth, 50);
  
}

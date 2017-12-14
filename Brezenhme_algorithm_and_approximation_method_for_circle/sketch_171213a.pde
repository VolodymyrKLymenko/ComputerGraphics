class Point
{
  public int x;
  public int y;
  
  Point() {}
  
  Point(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
};

class Pixels
{
   ArrayList<Point> Pixels;
   
   Pixels() 
   {
     Pixels = new ArrayList<Point>();
   }
}

int xx = 0, yy = 0;
int R = 40;
int sacle = 3;
Pixels pxs = new Pixels();

void setup()
{
  size(320, 320);
}

void draw()
{
  Brezenham();
}


void Brezenham()
{
  translate(160, 160);
  scale(1, -1);
  
  Point p0 = new Point(0, (sacle*R)); 
  float del = 2*(1-sacle*R);
  float end = 0.0;
  float q;
  
  plot(new Point(0,0));
  
  while(p0.y >= end)
  {
    plot(p0);
    pxs.Pixels.add(new Point(p0.x, p0.y));

    if(del < 0)
    {
      q = 2*(del+p0.y) -1;
      
      if(q <= 0)
      {
        p0.x = p0.x + sacle;
        del = del + 2*p0.x+1;
        
        continue;
      }
      else
      {
        p0.x = p0.x + sacle;
        p0.y = p0.y - sacle;
        
        del = del + 2*p0.x - 2*p0.y + 2;
        
        continue;
      }
    }
    else if(del >= 0)
    {
       q = 2*del + 2*p0.x - 1;
       
       if(q <= 0)
       {
         p0.x = p0.x + sacle;
         p0.y = p0.y - sacle;
         
         del = del + 2*p0.x + 2*p0.y + 2;
         
         continue;
       }
       else
       {
         p0.y = p0.y - sacle;
         del = del - 2*p0.y + 1;
         
         continue;
       }
    }
    
  }
  
  ArrayList<Point> points_2 = new ArrayList<Point>();
  for (Point pnt : pxs.Pixels) {
    Point p = new Point((0-pnt.x), pnt.y);
    
    plot(p);
    points_2.add(p);
  }
  for (Point pnt : points_2) {
    pxs.Pixels.add(pnt);
  }

  ArrayList<Point> points_3 = new ArrayList<Point>();
  for (Point pnt : pxs.Pixels) {
    Point p = new Point(pnt.x, (0-pnt.y));
    
    plot(p);
    points_3.add(p);
  }
  for (Point pnt : points_3) {
    pxs.Pixels.add(pnt);
  }
}

void plot(Point lefCor)
{
  rect(lefCor.x, lefCor.y, sacle, sacle);
}
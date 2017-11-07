//кординати першого трикутника
float x1 = random(0,40), y1 = random(0,40), x2 = random(0, 40), y2 = random(50, 100), x3 = random(50, 100), y3 = random(0, 100);
  
//кординати другого трикутника
float a1 = random(200, 250), b1 = random(100, 150), a2 = random(200, 250), b2 = random(200, 250), a3 = random(270, 300), b3 = random(100, 300);

//рандомна точка в першому трикутнику
float rand1_x = random(x1, x2);
float rand1_y = random(y1, y2);

//рандомна точка в другому трикутнику
float rand2_x = random(a1, a2);
float rand2_y = random(b1, b2);

float tgA;

void setup()
{
  size(400, 400);
  
  setPoint();
}

void draw()
{
  background(255,255,255);
  
  fill(0,0,255);
  triangle(x1, y1, x2, y2, x3, y3);
  
  fill(255,255,0);
  triangle(a1, b1, a2, b2, a3, b3);
  
  line(rand1_x, rand1_y, rand2_x, rand2_y);

  move();
}


void move()
{
  if(!verifyIsEnd())
  {
      float prev_x1 = x1;
      float prev_x2 = x2;
      float prev_x3 = x3;
      
      if(rand1_x < rand2_x)
      {
        x1 = x1 + 0.2;
        x2 = x2 + 0.2;
        x3 = x3 + 0.2;
      }
      else
      {
        x1 = x1 - 0.2;
        x2 = x2 - 0.2;
        x3 = x3 - 0.2;
      }
      
      if(rand1_y < rand2_y)
      {
        y1 = y1 + (tgA * abs(x1-prev_x1));
        y2 = y2 + (tgA * abs(x2-prev_x2));
        y3 = y3 + (tgA * abs(x3-prev_x3));
      }
      else
      {
        y1 = y1 - (tgA * abs(x1-prev_x1));
        y2 = y2 - (tgA * abs(x2-prev_x2));
        y3 = y3 - (tgA * abs(x3-prev_x3));
      }

   }
}

boolean verifyIsEnd()
{
  if( isPointOnLine(x1, y1, a1, b1, a2,b2) || isPointOnLine(x1, y1, a1, b1, a3,b3) || isPointOnLine(x1, y1, a2, b2, a3,b3))
  {
    return true;
  }
  if( isPointOnLine(x2, y2, a1, b1, a2,b2) || isPointOnLine(x2, y2, a1, b1, a3,b3) || isPointOnLine(x2, y2, a2, b2, a3,b3))
  {
    return true;
  }
  if( isPointOnLine(x3, y3, a1, b1, a2,b2) || isPointOnLine(x3, y3, a1, b1, a3,b3) || isPointOnLine(x3, y3, a2, b2, a3,b3))
  {
    return true;
  }
  if( isPointOnLine(a1, b1, x1, y1, x2,y2) || isPointOnLine(a1, b1, x1, y1, x3,y3) || isPointOnLine(a1, b1, x2, y2, x3,y3))
  {
    return true;
  }
  if( isPointOnLine(a2, b2, x1, y1, x2,y2) || isPointOnLine(a2, b2, x1, y1, x3,y3) || isPointOnLine(a2, b2, x2, y2, x3,y3))
  {
    return true;
  }
  if( isPointOnLine(a3, b3, x1, y1, x2,y2) || isPointOnLine(a3, b3, x1, y1, x3,y3) || isPointOnLine(a3, b3, x2, y2, x3,y3))
  {
    return true;
  }

    return false;
}

boolean isPointOnLine(float p_x, float p_y, float a_x, float a_y, float b_x, float b_y)
{
  float len = LengthLine(a_x, a_y, b_x, b_y);
  
  float len_to_p1 = LengthLine(p_x, p_y, a_x, a_y);
  float len_to_p2 = LengthLine(p_x, p_y, b_x, b_y);
  
  return ( abs(len - (len_to_p1 + len_to_p2)) <= 0.02);
}
float LengthLine(float x_1, float y_1, float x_2, float y_2)
{
  return sqrt( abs(x_2 - x_1)*abs(x_2 - x_1) + abs(y_2 - y_1)*abs(y_2-y_1) );
}

void setPoint()
{
  float max_x = x1;
  float min_x = x1;
  if(x2>max_x)
  {
    max_x =x2;
  }
  else if(x3>max_x)
  {
    max_x =x3;
  }
  if(x2 < min_x)
  {
    min_x = x2;
  }
  else if(x3 < min_x)
  {
    min_x = x3;
  }
  
  float max_y = y1;
  float min_y = y1;
  if(y2>max_y)
  {
    max_y =y2;
  }
  else if(y3>max_y)
  {
    max_y =y3;
  }
  if(y2 < min_y)
  {
    min_y = y2;
  }
  else if(y3 < min_y)
  {
    min_y = y3;
  }
  
  rand1_x = random(min_x, max_x);
  rand1_y = random(min_y, max_y);
  
  while(!isInTriangle(rand1_x, rand1_y, x1,y1,x2,y2,x3,y3))
  {
    rand1_x = random(min_x, max_x);
    rand1_y = random(min_y, max_y);
  }
  
  
  max_x = a1;
  min_x = a1;
  if(a2>max_x)
  {
    max_x =a2;
  }
  else if(a3>max_x)
  {
    max_x =a3;
  }
  if(a2 < min_x)
  {
    min_x = a2;
  }
  else if(a3 < min_x)
  {
    min_x = a3;
  }
  
  max_y = b1;
  min_y = b1;
  if(b2>max_y)
  {
    max_y =b2;
  }
  else if(b3>max_y)
  {
    max_y =b3;
  }
  if(b2 < min_y)
  {
    min_y = b2;
  }
  else if(b3 < min_y)
  {
    min_y = b3;
  }
  
  rand2_x = random(min_x,max_x);
  rand2_y = random(min_y,max_y);
  
  while(!isInTriangle(rand2_x, rand2_y, a1,b1,a2,b2,a3,b3))
  {
    rand2_x = random(min_x,max_x);
    rand2_y = random(min_y,max_y);
  }
  
  tgA =  ((rand2_y - rand1_y) / (rand2_x - rand1_x));
}
boolean isInTriangle(float x, float y, float t_x1, float t_y1, float t_x2, float t_y2, float t_x3, float t_y3)
{
  float S   = SquareTriangle(t_x1, t_y1, t_x2, t_y2, t_x3, t_y3);
  float S_1 = SquareTriangle(t_x1, t_y1, t_x2, t_y2, x   , y   );
  float S_2 = SquareTriangle(t_x1, t_y1, x   , y   , t_x3, t_y3);
  float S_3 = SquareTriangle(x   , y   , t_x2, t_y2, t_x3, t_y3);
  
  float eps = 0.1;
  float Sum = (S_1 + S_2 + S_3);
  
  
  return (abs(S - Sum) <= eps);
}

float SquareTriangle(float x1, float y1, float x2, float y2, float x3, float y3)
{
    float side_1 = sqrt( (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) );
    float side_2 = sqrt( (x3-x1)*(x3-x1) + (y3-y1)*(y3-y1) );
    float side_3 = sqrt( (x2-x3)*(x2-x3) + (y2-y3)*(y2-y3) );
    
    float p = ( ( side_1 + side_2 + side_3) / (float)2 );
    
    return sqrt(p * (p - side_1) * (p - side_2) * (p - side_3));
}
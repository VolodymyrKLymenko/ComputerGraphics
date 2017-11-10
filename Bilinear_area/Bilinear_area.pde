//кутові точки
float[] p_00 = new float[] {random(0,1),random(0,1),random(0,1)} ;
float[] p_01 = new float[] {random(0,1),random(0,1),random(0,1)} ;
float[] p_10 = new float[] {random(0,1),random(0,1),random(0,1)} ;
float[] p_11 = new float[] {random(0,1),random(0,1),random(0,1)} ;

//для проектування на площини
float[][] proec_x = new float[][]{ {0,0,0}, {0,1,0}, {0,0,1} };
float[][] proec_y = new float[][]{ {1,0,0}, {0,0,0}, {0,0,1} };
float[][] proec_z = new float[][]{ {1,0,0}, {0,1,0}, {0,0,0} };

float size=190;
float size_x=20;
float size_y=500;

void setup() {
  
  background(255);
  size(700, 400);

  stroke(0);
  
  for(int i=0; i<=size_x; ++i)
  {
    for(int j=0; j<=size_y; ++j)
    {
      stroke(100,100,100);
      write_line( (i*(size/size_x))/size, (j*(size/size_y))/size, 'z');
      write_line( (j*(size/size_y))/size, (i*(size/size_x))/size, 'z');
    }
  }
    
      
  translate((size+10),0);
  for(int i=0; i<=size_x; ++i)
  {
    for(int j=0; j<=size_y; ++j)
    {
      write_line( (i*(size/size_x))/size, (j*(size/size_y))/size, 'y');
      write_line( (j*(size/size_y))/size, (i*(size/size_x))/size, 'y');
    }
  }
  
    translate((size+10),0);
  for(int i=0; i<=size_x; ++i)
  {
    for(int j=0; j<=size_y; ++j)
    {
      write_line( (i*(size/size_x))/size, (j*(size/size_y))/size, 'x');
      write_line( (j*(size/size_y))/size, (i*(size/size_x))/size, 'x');
    }
  }
  
}

void write_line(float x, float y, char vis)
{
 if(vis=='x')
 {
   float[] a = generate_on_vis(Q(x,y),proec_x);
   
   point(a[2]*size, a[1]*size);
 }
 else if(vis=='y')
 {
   float[] a = generate_on_vis(Q(x,y),proec_y);
   
   point(a[0]*size, a[2]*size);
 }
 else if(vis=='z')
 {
   float[] a = generate_on_vis(Q(x,y),proec_z);
   
   point(a[0]*size, a[1]*size);
 }
}


float[] generate_on_vis(float [] _pm, float[][] vis)
{
  float[] ret=new float[3];
  
  for(int i=0; i<3; ++i)
  {
    ret[i]=0;
    for(int j=0; j<3; ++j)
    {
      ret[i]+=_pm[j] * vis[j][i];
    }
  }
  return ret;
}

float[] Q(float u, float v)
{
  return addVectors( addVectors(multiplication(p_00,(1-u)*(1-v)),multiplication(p_01,(1-u)*v)) , addVectors( multiplication(p_10,u*(1-v) ), multiplication(p_11 , u*v)) );

}


float[] multiplication(float[] _arr,float _v)
{
  float[] ret=new float[_arr.length];
  for(int i=0;i<_arr.length;++i)
  {
    ret[i]=_arr[i]*_v;
  }
  return ret;
}

float[] addVectors(float[] _arr1,float[] _arr2)
{
  float[] ret=new float[_arr1.length];
  for(int i=0; i<_arr1.length; ++i)
  {
    ret[i]=_arr1[i]+_arr2[i];
  }
  return ret;
}

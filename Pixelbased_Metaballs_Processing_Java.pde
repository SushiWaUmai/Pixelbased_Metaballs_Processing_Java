Ball[] balls = new Ball[5];

int colorShift = 50;
int colorShiftAdd = 5;

void setup()
{
  size(512, 512);
   for(int i = 0; i < balls.length; i++)
     balls[i] = new Ball();
     
   colorMode(HSB);
}

void draw()
{
  clear();
  
  loadPixels();
  
  for(int y = 0; y < height; y++)
  {
    for(int x = 0; x < width; x++)
    {
      float sum = 0;
      for(Ball b : balls)
      {
        sum += b.BubbleDist(x, y);
      }
      sum = constrain(sum, 0, 255);
      pixels[y * height + x] = color((sum + colorShift) % 255, 255, 255);
    }
  }
  
  updatePixels();
  
  
  for(Ball b : balls)
  {
    b.update();
  }
  
  colorShift += colorShiftAdd;
  
  // save("img/img0.png");
}

float dist(PVector a, PVector b)
{
  return dist(a.x, a.y, b.x, b.y);
}

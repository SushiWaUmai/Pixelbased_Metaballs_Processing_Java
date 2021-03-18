public class Ball
{
   private float radius;
   private PVector vel;
   private PVector pos;
   
   public Ball(float radius, float velocity)
   {
     this(random(0, width), random(0, height), radius, velocity);
   }
   
   public Ball()
   {
     this(random(10, 30), 5);
   }

   public Ball(float velocity)
   {
     this(random(10, 30), velocity);
   }  
   
   public Ball(float x, float y, float radius, float velocity)
   {
     this.radius = radius;
     pos = new PVector(x, y);
     vel = PVector.random2D().mult(velocity);
   }
   
   public void update()
   {
     if(pos.x < 0 || pos.x > width)
       vel.x *= -1;
       
     if(pos.y < 0 || pos.y > height)
       vel.y *= -1;
       
     pos.x += vel.x;
     pos.y += vel.y;
     
     
     //circle(pos.x, pos.y, radius);
   }
   
   public float BubbleDist(float x, float y)
   {
     return 1 / (dist(pos.x, pos.y, x, y) / radius) * 255;
   }
}

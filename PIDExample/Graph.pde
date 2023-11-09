class Graph{
 //ArrayList<PVector> points = new ArrayList<PVector>();
 //PVector[] points;// = new PVector[width];
 PVector point;
 
 PVector pos, size;
 float step;
 float x;
 
 Graph(float x, float y, float Width, float Height, int MaxPoints){
   pos = new PVector(x, y);
   size = new PVector(Width, Height);
   
   step = Width/MaxPoints;
   
   point = new PVector(0, 0);
   //points = new PVector[int(size.y)];
 }
 
 void add(float y){
  point.set(x, y);// = new PVector(x, y);   
 }
 
 void draw(){
   if(x >= width)
     x=0;
     
   //println(x, width, x>=width);
   println(point.x, point.y);
   
   noStroke();
   fill(255);
   
   rect(x-2.5, pos.y-10, 2.5, size.y+10); 
   
   fill(0);
   //ellipse(x, pos.y+random(0, size.y), 5, 5);
   ellipse(point.x, map(point.y, 0, size.y, size.y, 0)+pos.y, 5, 5);
   
   x+=1;
 }
}

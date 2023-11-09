class Arm{
 float length = 0;
 PVector pos;
 float Width = 1;
 float Currentdelta = 0;
 float DesiredDelta = HALF_PI;
 boolean moving = true;
 PVector mouse;
 
 PVector box;
 
 PID pid = new PID(0, 0, 0, 5);
 
 Arm(float x, float y, float length, float Width){
   this.length = length;
   this.pos = new PVector(x, y);
   this.Width = Width;
   
   this.box = new PVector(this.pos.x-10, this.pos.y-(this.length+10), this.length+30);
 }
 
 void update(){
   mouse = new PVector(mouseX, mouseY);
   if(mouseDown && (mouse.x >= box.x && mouse.x <= (box.x+box.z)) && (mouse.y >= box.y && mouse.y <= (box.y+box.z))) //Within(mouse.x, mouse.y))
     setDesired(mouse.x, mouse.y);
   
   
   //if(mouseDown)
   //  Currentdelta -= radians(10);
     
   
   if(Currentdelta < 0)
     Currentdelta += radians(pid.r);
   else
     Currentdelta = 0;
    
   draw(); 
 }
 
 float getDistance(){
   
   //println(180-degrees(DesiredDelta), degrees(Currentdelta));
   
   return (180-degrees(DesiredDelta) - degrees(Currentdelta)); 
 }
 
 
 void draw(){
   
   rect(this.box.x, this.box.y, this.box.z, this.box.z);
   push();
     fill(255);
     translate(pos.x, pos.y);
     
     //rect(-10, -(this.length+10), this.length+30, this.length+30);
     
     
     
     //ellipse(0, 0, 2*this.length, 2*this.length);
     
     push();
       fill(150);
       rotate(2*HALF_PI+DesiredDelta);
       rect(0, 0, this.length, this.Width);
     pop();
     
     push();
       rotate(this.Currentdelta);
       rect(0, 0, this.length, this.Width);
     pop();
   pop();
   
   if(this.pid != null)
     this.pid.draw();
 }
 
 void forward(float delta){
   this.Currentdelta += delta;
 }
 
 void backward(float delta){
   this.Currentdelta -= delta;
 }
 
 void setDesired(float delta){
   this.DesiredDelta = delta;
 }
 
 void setDesired(float x, float y){
   DesiredDelta = pos.copy().sub(new PVector(x, y)).heading();
 }
 
 void startMoving(){
   this.moving = true;
 }
}

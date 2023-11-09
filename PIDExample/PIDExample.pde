//float gravity = 5;
boolean mouseDown = false;
Arm arm;
Graph graph; 

void setup(){
  size(800, 600);
  arm = new Arm(25, 225, 200, 10);
  graph = new Graph(0, 300, width, height-300, width);//float x, float y, float Width, float Height, int MaxPoints
  
  arm.pid.EnableText(arm.pos.x+200+50, arm.pos.y-arm.length);
  
  background(255);
}

void mousePressed(){
  mouseDown = true;
  arm.pid.pressed(mouseX, mouseY);
}

void mouseReleased(){
  mouseDown = false;
}

void draw(){
  //background(100);
  
  //graph.add(degrees(arm.Currentdelta) - degrees(arm.DesiredDelta));
  
  graph.add(arm.getDistance());
  
  //graph.add(random(0, 50));
  
  graph.draw();
  push();
    fill(color(180, 180, 255));
    rect(0, 0, width, 275);
  pop();
  
  arm.update();
}

float multiplier = 1;

void mouseWheel(MouseEvent event) {
  float e = -event.getCount();
  
  arm.pid.add(multiplier*e/1000);
}

void keyPressed(){
  if(key == 'q')
    multiplier = 5;
  else if(key == 'w')
    multiplier = 100;
  else if(key == 'e')
    multiplier = 1000;
}

void keyReleased(){
    multiplier = 1;
}

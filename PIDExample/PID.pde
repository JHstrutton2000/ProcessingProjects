class PID{
  float p, i, d, r, x, y;
  boolean drawing = false;
  
  PVector PBox, IBox, DBox, RBox, Colors;
  float RColor;
  
  PID(float p, float i, float d, float r){
    this.p = p;
    this.i = i;
    this.d = d;
    this.r = r;
  }
  
  void setP(float p){
    this.p = p;
    if(this.drawing)
       PBox.z = 7*("P: "+this.p).length();
  }  
  
  void setI(float i){
    this.i = i;
    if(this.drawing)
       IBox.z = 7*("I: "+this.i).length();
  }  
  
  void setD(float d){
    this.d = d;
    if(this.drawing)
       DBox.z = 7*("D: "+this.d).length();
  }
  
  void setR(float r){
    this.r = r;
    if(this.drawing)
       RBox.z = 7*("R: "+this.r).length();
  }
  
  void EnableText(float x, float y){
    this.drawing = true; 
    this.x = x;
    this.y = y;
    
    PBox = new PVector(x-5, y+2-12,  7*("P: "+this.p).length());
    IBox = new PVector(x-5, y+17-12, 7*("I: "+this.i).length());
    DBox = new PVector(x-5, y+32-12, 7*("D: "+this.d).length());
    RBox = new PVector(x-5, y+47-12, 7*("R: "+this.r).length());
    Colors = new PVector(255, 255, 255);
    RColor = 255;
  }
  
  void pressed(float x, float y){
    if(x >= PBox.x && x <= PBox.x+PBox.z && y >= PBox.y && y <= PBox.y+12){
      Colors.set(150, 255, 255);
      RColor = 255;
    }
    else if(x >= IBox.x && x <= IBox.x+IBox.z && y >= IBox.y && y <= IBox.y+12){
      Colors.set(255, 150, 255);
      RColor = 255;
    }
    else if(x >= DBox.x && x <= DBox.x+DBox.z && y >= DBox.y && y <= DBox.y+12){
      Colors.set(255, 255, 150);
      RColor = 255;
    }
    else if(x >= RBox.x && x <= RBox.x+RBox.z && y >= RBox.y && y <= RBox.y+12){
      Colors.set(255, 255, 255);
      RColor = 150;
    }
  }
  
  void add(float num){
    
    if(Colors.x == 150){
      p+=num;
      PBox = new PVector(x-5, y+2-12,  7*("P: "+this.p).length());
    }
    else if(Colors.y == 150){
      i+=num;
      IBox = new PVector(x-5, y+17-12, 7*("I: "+this.i).length());
    }
    else if(Colors.z == 150){
      d+=num;
      DBox = new PVector(x-5, y+32-12, 7*("D: "+this.d).length());
    }
    else if(RColor == 150){
      r+=num;
      RBox = new PVector(x-5, y+47-12, 7*("R: "+this.r).length());
    }
  }
  
  void draw(){
     if(drawing){
       push();
         
         noStroke();
         
         fill(Colors.x);
         rect(PBox.x, PBox.y, PBox.z, 12);
         
         fill(Colors.y);
         rect(IBox.x, IBox.y, IBox.z, 12);
         
         fill(Colors.z);
         rect(DBox.x, DBox.y, DBox.z, 12);
         
         fill(RColor);
         rect(RBox.x, RBox.y, RBox.z, 12);
         
         fill(0);
         text("P: "+this.p, x, y);
         text("I: "+this.i, x, y+15);
         text("D: "+this.d, x, y+30);
         text("R: "+this.r, x, y+45);
       pop();
       
       
       if(this.p < 0)
         this.p = 0;
       if(this.i < 0)
         this.i = 0;
       if(this.d < 0)
         this.d = 0;
       if(this.r < 0)
         this.r = 0;
     }
  }
}


ArrayList<particle> particles;
void setup() {
  size(400, 400);

  particles = new ArrayList<particle>();
  for (int i=0; i<(width*height)/25; i++) {
    particles.add(new particle(new PVector(random(width), random(height)), 10));
  }
}

void draw() {
  background(0);
  for (int i=0; i<particles.size(); i++) {
    particles.get(i).update();
    particles.get(i).draw();
  }
}



class particle {
  private PVector pos;
  private float r;
  private int grey = 20;

  PVector avoid = new PVector(width/2, height/2);


  particle(PVector pos, float r) {
    this.pos = pos;
    this.r = r;

    this.grey += random(-20, 20);

    //if (this.pos.copy().sub(avoid).mag() < 50) {
    //  this.pos.add(new PVector(200, 100));
    //}
  }

  void update() {
    float rx = random(-5, 5);
    float ry = random(-5, 5);

    //if (this.pos.copy().add(new PVector(rx, ry)).sub(avoid).mag() > 50) {
    this.pos.add(new PVector(rx, ry));
    //}

    if (this.pos.x < 0)
      this.pos.x = 0;
    else if (this.pos.x > width)
      this.pos.x = width;

    if (this.pos.y < 0)
      this.pos.y = 0;
    else if (this.pos.y > height)
      this.pos.y = height;
  }

  void draw() {
    fill(grey);
    noStroke();
    ellipse(this.pos.x, this.pos.y, r, r);
  }
}

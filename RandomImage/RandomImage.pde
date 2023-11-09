int x = 150; // Change this value to set the size of the image (x by x)

void setup() {
  size(100, 100);
  background(255); // Set the background to white
  
  // Generate random colors for each pixel
  for (int i = 0; i < x; i++) {
    for (int j = 0; j < x; j++) {
      int r = (int) random(256);
      int g = (int) random(256);
      int b = (int) random(256);
      stroke(r, g, b);
      point(i, j);
    }
  }
  save("test.png");
}

void draw() {
  // This function is intentionally left empty.
}

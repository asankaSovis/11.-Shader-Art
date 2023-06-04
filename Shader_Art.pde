float sizeRatio = 0;
int fracts = 2;
float time = 0;

void setup() {
  size(640, 640);
  fill(0, 0, 0, 0);
  
  sizeRatio = (width * 2 / height);
}

void draw() {
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      fColour pixelColour = mainImage(float(i) / width, float(height - j) / height);
      set(i, j, pixelColour.toColour());
    }
  }
  
  time += 0.05;
}

fColour mainImage(float x, float y) {
  fColour finalColour = new fColour();
  x = (x - 0.5) * sizeRatio * fracts ; y = (y - 0.5) * 2 * fracts;
  float x0 = x; float y0 = y;
  
  for (int i = 0; i < 2; i++) {
    x = fract(x * 1.5) - 0.5; y = fract(y * 1.5) - 0.5;
    
    float d = length(x, y) * exp(-length(x0, y0));
    fColour colour = palette(length(x0, y0) + (i * 0.4) + time);
    
    d = sin(d * 8 + time) / 8;
    d = abs(d);
    d = pow(0.03 / d, 1.2);
    colour.mult(d);
    
    finalColour.add(colour);
  }
  
  return finalColour;
}

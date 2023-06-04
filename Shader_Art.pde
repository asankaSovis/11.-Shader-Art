float sizeRatio = 0;
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
  
  time += 0.1;
}

fColour mainImage(float x, float y) {
  x = (x - 0.5) * sizeRatio; y = (y - 0.5) * 2;
  
  float d = length(x, y);
  fColour colour = palette(d + time);
  
  d = sin(d * 8 + time) / 8;
  d = abs(d);
  d = 0.02 / d;
  colour.mult(d);
  
  return colour;
}

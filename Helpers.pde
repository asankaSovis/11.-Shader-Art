class fColour {
  public float[] C = {0, 0, 0, 0};
  
  fColour(float r, float g, float b, float a) {
    C[0] = r; C[1] = g; C[2] = b; C[3] = a;
  }
  
  fColour(float r, float g, float b) {
    C[0] = r; C[1] = g; C[2] = b; C[3] = 1;
  }
  
  fColour(float i) {
    C[0] = i; C[1] = i; C[2] = i; C[3] = 1;
  }
  
  fColour() {
    C[0] = 0; C[1] = 0; C[2] = 0; C[3] = 1;
  }
  
  color toColour() {
    return color(C[0] * 255, C[1] * 255, C[2] * 255, C[3] * 255);
  }
  
  void add(fColour colour) {
    C[0] += colour.C[0]; C[1] += colour.C[1]; C[2] += colour.C[2];
  }
  
  void mult(float value) {
    C[0] *= value; C[1] *= value; C[2] *= value;
  }
}

float length(float x, float y) {
  return sqrt(sq(x) + sq(y));
}

float step(float threshold, float value) {
  if (value < threshold) {
    return 0;
  } else {
    return 1;
  }
}

float smoothStep(float edge0, float edge1, float x) {
  // Clamp x between 0 and 1
  float t = Math.max(0, Math.min(1, (x - edge0) / (edge1 - edge0)));
  
  // Smooth the step using Hermite interpolation
  return t * t * (3 - 2 * t);
}

float fract(float value) {
  return value - floor(value);
}

fColour palette(float t) {
  fColour a = new fColour(0.5, 0.5, 0.5);
  fColour b = new fColour(0.5, 0.5, 0.5);
  fColour c = new fColour(1, 1, 1);
  fColour d = new fColour(0.263, 0.416, 0.557);
  
  float[] colour = {0, 0, 0};
  
  for (int i = 0; i < 3; i++) {
    colour[i] = a.C[i] + b.C[i] * cos(6.28318 * (c.C[i] * t + d.C[i]));
  }
  
  return new fColour(colour[0], colour[1], colour[2]);
}

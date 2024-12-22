class Ecobot {
  float x, y;

  Ecobot(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void desenha() {
    rectMode(CORNER);
    
    // Corpo
    fill(200);
    rect(x, y-80, 50, 80, 10);
  }
}

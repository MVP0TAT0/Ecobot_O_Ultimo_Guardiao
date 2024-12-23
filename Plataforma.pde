class Plataforma {

  float x, y, w, h, top_left, top_right, bottom_left, bottom_right;

  Plataforma(float _x, float _y, float _w, float _h) {
    x=_x;
    y=_y;
    w=_w;
    h=_h;

    top_left = x;
    top_right = x + w;
    bottom_left = y;
    bottom_right = y + h;
  }

  void desenha() {
    rectMode(CORNER);
    fill(55,255,0);
    rect(x, y, w, h);
  }

  void colisao(Ecobot oEcobot) {
    //Detetar colisão
    if (top_left < oEcobot.right &&
      top_right > oEcobot.left &&
      bottom_left < oEcobot.bottom &&
      bottom_right > oEcobot.top) {
      println("colidindo");
      oEcobot.aCair=false;
      oEcobot.y = y - h/2 - 17;
    } else {
      println("nao colidindo");
    }
  }
}

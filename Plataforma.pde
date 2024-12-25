class Plataforma {

  float x, y, w, h, left, right, top, bottom;

  Plataforma(float _x, float _y, float _w, float _h) {
    x=_x;
    y=_y;
    w=_w;
    h=_h;

    //Hitbox da plataforma
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }

  void desenha() {
    rectMode(CENTER);
    fill(55, 255, 0);
    rect(x, y, w, h);
  }

  void colisao(Ecobot oEcobot) {
    //Detetar colisão
    if (left < oEcobot.right &&
      right > oEcobot.left &&
      top < oEcobot.bottom &&
      bottom > oEcobot.top) {
      println("colidindo");
      oEcobot.aCair=false;
      //puxa o ecobot para cima para nao ficar dentro da plataforma
      //oEcobot.y = y - h/2 - 26;
    } else {
      println("nao colidindo");
    }
  }
}

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

    // Terra
    fill(139, 69, 19);
    noStroke();
    rect(x, y, w, h);

    // Relva
    fill(34, 139, 34);
    rect(x, y - 5, w, h - 10);

    // Relva circular
    for (float i = x - w/2; i <= (x + w/2)-1; i += 20) {
      // Ajustar a posição para que os arcos fiquem na parte superior da plataforma
      arc(i+20/2, y -5, 21, 20, PI, TWO_PI); // 12 ajusta para a parte superior
    }
  }


  void colisao(Ecobot oEcobot) {
    //Detetar colisão
    if (left < oEcobot.right &&
      right > oEcobot.left &&
      top < oEcobot.bottom &&
      bottom > oEcobot.top) {
      println("a colidir com plataforma");
      oEcobot.aCair=false;
      // Evitar que o Ecobot passe para dentro da plataforma
      oEcobot.y = top - 68/2; // Ajustar a posição para ficar na parte superior da plataforma
    }
  }
}

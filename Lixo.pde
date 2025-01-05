class Lixo {

  float x, y, w, h;
  PImage imagem;

  Lixo(float _x, float _y, PImage _imagem) {
    x = _x;
    y = _y;
    w = 47;
    h = 67;
    imagem = _imagem;
    imageMode(CENTER);
  }

  void desenhaLixo() {
    imageMode(CENTER);
    image(imagem, x, y, w, h);
  }

  boolean colisaoLixo(Ecobot ecobot) {

    // Se o ecobot está a colidir...
    if (ecobot.right >= x - w/2 &&
      ecobot.left <= x + w/2 &&
      ecobot.bottom >= y - h/2 &&
      ecobot.top <= y + h/2) {
      somLixo.play(); //...então toca o som...
      return true;  // ...e o boolean devolve true
    }
    return false;  // Caso contrário, devolve false
  }
}

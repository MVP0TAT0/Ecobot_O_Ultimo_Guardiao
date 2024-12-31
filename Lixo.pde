class Lixo {

  float x, y, w, h;
  PImage imagem;

  Lixo(float _x, float _y, PImage _imagem) {
    x = _x;
    y = _y;
    w = 47;  // Tamanho padrão do caixote
    h = 67;  // Tamanho padrão do caixote
    imagem = _imagem;
    imageMode(CENTER);
  }

  void desenhaLixo() {
    imageMode(CENTER);
    image(imagem, x, y, w, h);
  }

  boolean colisaoLixo(Ecobot ecobot) {
    return !(ecobot.right < x - w/2 ||     // Ecobot está à esquerda do lixo
      ecobot.left > x + w/2 ||     // Ecobot está à direita do lixo
      ecobot.bottom < y - h/2 ||   // Ecobot está acima do lixo
      ecobot.top > y + h/2);       // Ecobot está abaixo do lixo
  }
}

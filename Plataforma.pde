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

    // Relva circular - por ChatGPT e ajustes de números/posições por nós
    for (float i = x - w/2; i <= (x + w/2)-1; i += 20) {
      // Ajustar a posição para que os arcos fiquem na parte superior da plataforma
      arc(i+20/2, y -5, 21, 20, PI, TWO_PI); // 12 ajusta para a parte superior
    }
  }


  void colisao(Ecobot oEcobot) {
    // Colisão com a parte superior da plataforma
    if (oEcobot.right > left && oEcobot.left < right && oEcobot.bottom > top && oEcobot.top < top) {
      oEcobot.y = top - 68 / 2;  // Ajusta a posição do Ecobot acima da plataforma
      oEcobot.aCair = false;     // Para de cair
    }

    // Colisão com a parte inferior da plataforma
    if (oEcobot.left < right && oEcobot.right > left && oEcobot.top < bottom && oEcobot.bottom > bottom) {
      oEcobot.aSaltar = false;   // Para de saltar
      oEcobot.aCair = true;      // Começa a cair
      oEcobot.y = bottom + 68 / 2;  // Ajusta a posição para baixo
    }

    // Colisão com a lateral esquerda da plataforma
    if (oEcobot.right > left && oEcobot.left < left && oEcobot.bottom > top && oEcobot.top < bottom) {
      oEcobot.y = top - 68 / 2; // Teleporta para o topo da plataforma
      oEcobot.x = left - 45 / 2 - 1; // Ajusta a posição para evitar colisões contínuas
      oEcobot.aCair = false;    // Para de cair
    }

    // Colisão com a lateral direita da plataforma
    if (oEcobot.left < right && oEcobot.right > right && oEcobot.bottom > top && oEcobot.top < bottom) {
      oEcobot.y = top - 68 / 2; // Teleporta para o topo da plataforma
      oEcobot.x = right + 45 / 2 + 1; // Ajusta a posição para evitar colisões contínuas
      oEcobot.aCair = false;    // Para de cair
    }
  }
}

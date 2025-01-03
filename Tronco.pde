class Tronco {
  float x, y, largura, altura;
  color cor1, cor2;
  float left, right, top, bottom;

  Tronco(float _x, float _y) {
    x = _x;
    y = _y;
    largura = 30;
    altura = 15;
    cor1 = color(139, 69, 19);
    cor2 = color(220, 185, 135);

    left = x - largura/2;
    right = x + largura/2;
    top = y - altura/2;
    bottom = y + altura/2;
  }

  void desenha() {
    // Desenho por ChatGPT, com ajustes de x e y por nós

    // Desenho do tronco
    fill(cor1);
    noStroke();
    rectMode(CENTER);
    rect(x, y, largura, altura, 6);

    // Desenho das linhas no tronco
    stroke(90, 45, 10);
    strokeWeight(2);
    for (float i = y - altura / 2 + 2; i < y + altura / 2; i += 2) {
      line(x - largura / 2 + 2, i, x + largura / 2 - 2, i);
    }

    // Desenho do círculo claro no tronco
    fill(cor2);
    noStroke();
    ellipse(x-largura/2, y, altura, altura); // O círculo agora está no centro do tronco

    // Desenho dos anéis no tronco
    stroke(cor1);
    strokeWeight(2);
    noFill();
    for (int i = 1; i <= 3; i++) {
      ellipse(x-largura/2, y, altura - i * 4, altura - i * 4); // Os anéis agora estão centrados no tronco
    }
  }


  void colisaoTronco(Ecobot oEcobot) {
    // Verificar se o Ecobot está no topo do tronco
    if (oEcobot.bottom >= top &&
      oEcobot.bottom <= top + 5 && // Margem para estabilidade (senao teleporta-se ao atingir os lados)
      oEcobot.right > left &&
      oEcobot.left < right) {

      // Permitir que o Ecobot esteja sobre o tronco apenas se não estiver a saltar
      if (!oEcobot.aSaltar) {
        oEcobot.aCair = false; // Impedir queda
        oEcobot.y = top - 68 / 2; // Ajustar a posição sobre o tronco
      }
      return; // Evitar outras verificações de colisão
    }

    // Colisão lateral (vindo da esquerda)
    if (oEcobot.top < bottom &&
      oEcobot.bottom > top &&
      oEcobot.right > left &&
      oEcobot.left <= left) {
      oEcobot.andarDireita = false;
      oEcobot.x = left - 45 / 2; // Evitar sobreposição lateral
    }

    // Colisão lateral (vindo da direita)
    if (oEcobot.top < bottom &&
      oEcobot.bottom > top &&
      oEcobot.left < right &&
      oEcobot.right >= right) {
      oEcobot.andarEsquerda = false;
      oEcobot.x = right + 45 / 2; // Evitar sobreposição lateral
    }
  }
}

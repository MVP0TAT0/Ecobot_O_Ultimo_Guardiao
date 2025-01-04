class Redbot {
  float x, y;
  float vel;
  boolean moverDireita;
  boolean moverEsquerda;

  float limiteEsquerda;
  float limiteDireita;

  // Hitbox do Redbot
  float left, right, top, bottom;

  Redbot(float _x, float _y, float _limiteEsquerda, float _limiteDireita) {
    rectMode(CENTER);
    x = _x;
    y = _y;
    vel = 3;

    limiteEsquerda = _limiteEsquerda;
    limiteDireita = _limiteDireita;

    moverDireita = true;

    // Hitbox do Redbot
    left = x - 15;
    right = x + 15;
    top = y - 20;
    bottom = y + 20;
  }

  void desenha() {
    float idle = sin(frameCount * 0.05) * 3; // Movimento cíclico
    float animPerna1 = sin(frameCount * 0.15) * 3;
    float animPerna2 = sin(frameCount * 0.15 + PI) * 3;

    if (moverDireita) {
      stroke(0);
      strokeWeight(1);

      // Pernas
      fill(220, 0, 0);
      rectMode(CENTER);
      rect(x - 10, y + 10 + animPerna1, 10, 30);
      rect(x + 10, y + 10 + animPerna2, 10, 30);

      // Pés
      fill(200, 0, 0);

      rect(x - 10, y + 25 + animPerna1, 10, 6, 3);
      rect(x + 10, y + 25 + animPerna2, 10, 6, 3);

      // Cabeça
      fill(240, 0, 0);
      rect(x, y + idle, 30, 30, 8);

      // Olhos
      fill(205, 205, 0);
      ellipse(x - 4, y + idle, 5, 5);
      ellipse(x + 10, y + idle, 5, 5);

      noStroke();
    } else if (moverEsquerda) {
      stroke(0);
      strokeWeight(1);

      // Pernas
      fill(220, 0, 0);
      rectMode(CENTER);
      rect(x - 10, y + 10 + animPerna1, 10, 30);
      rect(x + 10, y + 10 + animPerna2, 10, 30);

      // Pés
      fill(200, 0, 0);

      rect(x - 10, y + 25 + animPerna1, 10, 6, 3);
      rect(x + 10, y + 25 + animPerna2, 10, 6, 3);

      // Cabeça
      fill(240, 0, 0);
      rect(x, y + idle, 30, 30, 8);

      // Olhos
      fill(205, 205, 0);
      ellipse(x + 4, y + idle, 5, 5);
      ellipse(x - 10, y + idle, 5, 5);

      noStroke();
    }
    noStroke();

    // Desenhar hitbox visível
    fill(255, 0, 0, 100);
    noFill();
    rectMode(CORNERS);
    rect(left, top, right, bottom);

    fill(255, 255, 0, 100);
    noFill();  // - > Comentar para parar de desenhar hitbox visível
    rectMode(CORNERS);
    rect(left, top, right, bottom);
  }

  void mover() {
    // Movimento do Redbot dentro dos limites
  if (moverDireita) {
    x += vel;  
    if (x >= limiteDireita) {  // Inverte a direção quando atinge o limite direito
      moverDireita = false;
      moverEsquerda = true;
    }
  } else if (moverEsquerda) {
    x -= vel;  
    if (x <= limiteEsquerda) {  // Inverte a direção quando atinge o limite esquerdo
      moverEsquerda = false;
      moverDireita = true;
    }
  }

    // Atualiza hitbox do Redbot
    left = x - 15;
    right = x + 15;
    top = y - 20;
    bottom = y + 20;
  }

  // Verificar colisão com o Ecobot
  void colisao(Ecobot ecobot) {
    if (left < ecobot.right && right > ecobot.left && top < ecobot.bottom && bottom > ecobot.top) {
      energia = 0;
    }
  }
}

class Ecobot {
  float x, y;

  int vel;            //Velocidade do movimento

  int alturaSalto;    //Distância do salto
  float ySalto;       //Valor y do topo da distância do salto

  boolean andarEsquerda;
  boolean andarDireita;
  boolean aSaltar;
  boolean aCair;

  //Hitbox do Ecobot
  float left, right, top, bottom;

  Ecobot(float _x, float _y) {

    rectMode(CENTER);
    x = _x;
    y = _y;

    andarEsquerda = false;
    andarDireita = false;
    aSaltar = false;
    aCair = false;
    vel = 3;
    alturaSalto = 100;
    ySalto = y - alturaSalto;

    //Hitbox Ecobot
    left = x - 45/2;
    right = x + 45/2;
    top = y - 68/2;
    bottom = y + 68/2;
  }


  void desenha() {
    float idle = sin(frameCount * 0.05) * 3; // Movimento cíclico
    float animPerna1 = sin(frameCount * 0.15) * 3;
    float animPerna2 = sin(frameCount * 0.15 + PI) * 3;

    if (andarDireita) {

      stroke(0);
      strokeWeight(1);

      // Pernas
      fill(140, 140, 140);
      rectMode(CENTER);
      rect(x - 10, y + 20 + animPerna1, 10, 15);
      rect(x + 10, y + 20 + animPerna2, 10, 15);

      // Pés
      fill(120, 120, 120);

      rect(x - 10, y + 30 + animPerna1, 10, 6, 3);
      rect(x + 10, y + 30 + animPerna2, 10, 6, 3);

      // Cabeça
      fill(180, 180, 180);
      rect(x, y - 30 + idle, 25, 20, 5);

      // Olhos
      fill(50, 205, 50);
      ellipse(x - 6, y - 30 + idle, 5, 5);
      ellipse(x + 8, y - 30 + idle, 5, 5);

      // Braço direito para trás
      fill(120, 120, 120);
      rect(x + 19, y - 2 + idle, 8, 22, 3);

      // Ombro direito para trás
      fill(140, 140, 140);
      circle(x + 19, y - 12 + idle, 12);

      // Corpo
      fill(160, 160, 160);
      rect(x, y + idle, 30, 40, 8);

      // Braço esquerdo para a frente
      fill(120, 120, 120);
      rect(x - 19, y - 2 + idle, 8, 22, 3);

      //Ombro esquerdo para a frente
      fill(140, 140, 140);
      circle(x - 19, y - 12 + idle, 12);

      noStroke();
    } else if (andarEsquerda) {

      stroke(0);
      strokeWeight(1);

      // Pernas
      fill(140, 140, 140);
      rectMode(CENTER);
      rect(x - 10, y + 20 + animPerna1, 10, 15);
      rect(x + 10, y + 20 + animPerna2, 10, 15);

      // Pés
      fill(120, 120, 120);
      rect(x - 10, y + 30 + animPerna1, 10, 6, 3);
      rect(x + 10, y + 30 + animPerna2, 10, 6, 3);

      // Cabeça
      fill(180, 180, 180);
      rect(x, y - 30 + idle, 25, 20, 5);

      // Olhos
      fill(50, 205, 50);
      ellipse(x - 8, y - 30 + idle, 5, 5);
      ellipse(x + 6, y - 30 + idle, 5, 5);

      // Braço esquerdo para trás
      fill(120, 120, 120);
      rect(x - 19, y - 2 + idle, 8, 22, 3);

      // Ombro esquerdo para trás
      fill(140, 140, 140);
      circle(x - 19, y - 12 + idle, 12);

      // Corpo
      fill(160, 160, 160);
      rect(x, y + idle, 30, 40, 8);

      // Braço direito para a frente
      fill(120, 120, 120);
      rect(x + 19, y - 2 + idle, 8, 22, 3);

      //Ombro direito para a frente
      fill(140, 140, 140);
      circle(x + 19, y - 12 + idle, 12);

      noStroke();
    } else {
      stroke(0);
      strokeWeight(1);

      // Pernas
      fill(140, 140, 140);
      rectMode(CENTER);
      rect(x - 10, y + 20, 10, 15);
      rect(x + 10, y + 20, 10, 15);

      // Pés
      fill(120, 120, 120);
      rect(x - 10, y + 30, 10, 6, 3);
      rect(x + 10, y + 30, 10, 6, 3);

      // Cabeça
      fill(180, 180, 180);
      rect(x, y - 30 + idle, 25, 20, 5);

      // Olhos
      fill(50, 205, 50);
      ellipse(x - 8, y - 30 + idle, 5, 5);
      ellipse(x + 8, y - 30 + idle, 5, 5);

      // Braços
      fill(120, 120, 120);
      rect(x - 19, y - 2 + idle, 8, 22, 3);
      rect(x + 19, y - 2 + idle, 8, 22, 3);

      // Ombros
      fill(140, 140, 140);
      circle(x - 19, y - 12 + idle, 12);
      circle(x + 19, y - 12 + idle, 12);

      // Corpo
      fill(160, 160, 160);
      rect(x, y + idle, 30, 40, 8);

      noStroke();
    }
    // Desenhar hitbox visível
    fill(255, 0, 0, 100);
    noFill();
    rectMode(CORNERS);
    rect(left, top, right, bottom);
  }

  void mover() {
    if (andarDireita == true) {
      x += vel;
    }
    if (andarEsquerda == true) {
      x -= vel;
    }

    //Atualizar hitbox do Ecobot
    left = x - 45/2;
    right = x + 45/2;
    top = y - 68/2;
    bottom = y + 68/2;
  }

  void salto() {
    if (aSaltar == true) {
      y -= 5;
    }
  }

  void cair() {
    if (aCair == true) {
      y += 5;
    }
  }

  void topoSalto() {
    //Parar de saltar ao chegar ao topo do salto
    if (y <= ySalto) {
      aSaltar=false;
      aCair=true;
    }
  }

  //aterrar no chao
  void aterrar() {
    if (y >= height - 68/2) {
      aCair=false;
      y = height - 68/2;
    }
  }

  //Verificar se há colisão com qualquer plataformas
  //se não estiver a colidir, o jogador começa a cair
  void cairPlataforma(ArrayList<Plataforma> aListaPlataforma) {
    // Verificar se o Ecobot não está a meio de um salto
    // e verificar que o jogador não está no chão
    if (!aSaltar && y < height - 68) {

      boolean naPlataforma = false;

      for (Plataforma aPlataforma : aListaPlataforma) {
        // Verificar colisão com o topo da plataforma
        if (bottom >= aPlataforma.top - 1 &&   // Margem para evitar instabilidade
          bottom <= aPlataforma.top + 5 &&  // Considera uma pequena margem
          left < aPlataforma.right &&
          right > aPlataforma.left) {
          naPlataforma = true; // Está sobre a plataforma
          aCair = false;       // Para de cair
          y = aPlataforma.top - 68/2; // Ajusta o Ecobot sobre a plataforma
          break;
        }
      }

      // Se não está sobre nenhuma plataforma, começa a cair
      if (!naPlataforma) {
        aCair = true;
      }
    }
  }
}

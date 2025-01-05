class Ecobot {
  float x, y;

  float vel;          //Velocidade do movimento

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

    vel = 3; // Velocidade do salto
    alturaSalto = 100; // Altura máxima do salto
    ySalto = y - alturaSalto; // Saber o y da altura máxima do salto

    //Hitbox Ecobot
    left = x - 45/2;
    right = x + 45/2;
    top = y - 68/2;
    bottom = y + 68/2;
  }


  void desenha() {

    // Variável de animação com auxílio do ChatGPT e ajustes finais de valores por nós
    float idle = sin(frameCount * 0.05) * 3; // Movimento cíclico

    float animPerna1 = sin(frameCount * 0.15) * 3;
    float animPerna2 = sin(frameCount * 0.15 + PI) * 3;

    if (andarDireita) { // Desenho e animação quando anda para a direita

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
    } else if (andarEsquerda) { // Desenho e animação quando anda para a esquerda

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
    } else {  // Desenho e animação quando está parado
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

    // Hitbox visível quando o noFill() está desligado
    // Apenas para efeitos de debugging
    fill(255, 0, 0, 100);
    noFill();  // - > Comentar para desenhar hitbox visível
    rectMode(CORNERS);
    rect(left, top, right, bottom);
  }

  void mover() {
    if (andarDireita == true && x + 45 / 2 < width) {   // Movimento e impor limite de margem da janela
      x += vel;  // Movimento
      energia -= 0.15;  // Perde energia ao mover
    }
    if (andarEsquerda == true && x -45 / 2 > 0) {  // Movimento e impor limite de margem da janela
      x -= vel;
      energia -= 0.15;
    }

    //Atualizar hitbox do Ecobot
    left = x - 45/2;
    right = x + 45/2;
    top = y - 68/2;
    bottom = y + 68/2;
  }

  void salto() {
    if (aSaltar == true) {
      y -= 5;  // Salto
      energia -= 0.35;  // Perde energia ao saltar
    }
  }

  void cair() {
    if (aCair == true) {
      y += 5;  // Queda
    }
  }

  void topoSalto() {

    if (y <= ySalto) {  //Parar de saltar ao chegar ao topo do salto
      aSaltar=false;
      aCair=true;
    }
  }

  // Mistura do canal do Youtube mencionado na primeira linha, ChatGPT e ajustes próprios
  void cairPlataforma(Plataforma[] oArray) {   // Verificar se há colisão com qualquer plataforma, se não estiver a colidir, o jogador começa a cair

    if (!aSaltar) { // Verificar se o Ecobot não está a meio de um salto

      boolean naPlataforma = false;

      for (int i = 0; i < oArray.length; i++) {

        // Verificar colisão
        if (bottom >= oArray[i].top - 1 &&   // Margem para evitar instabilidade
          bottom <= oArray[i].top + 5 &&     // Considera uma pequena margem
          left < oArray[i].right &&
          right > oArray[i].left) {

          naPlataforma = true;        // Está sobre a plataforma
          aCair = false;              // Para de cair
          y = oArray[i].top - 68/2;   // Ajusta o Ecobot sobre a plataforma

          break;  // Ao detetar colisão com uma plataforma, para de tentar detetar nas outras
        }
      }

      // Se não está sobre nenhuma plataforma, começa a cair
      if (!naPlataforma) {
        aCair = true;
      }
    }
  }
}


// Teclas de movimento para Ecobot
void keyPressed() {
  if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    Ecobot.andarDireita = true;
  }

  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    Ecobot.andarEsquerda = true;
  }

  if ((key == 'w' || key == 'W' || keyCode == UP) && Ecobot.aSaltar == false && Ecobot.aCair == false) {
    Ecobot.aSaltar = true;
    Ecobot.ySalto = Ecobot.y - Ecobot.alturaSalto;
    saltar.play();
  }
}

void keyReleased() {
  if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    Ecobot.andarDireita = false;
  }

  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    Ecobot.andarEsquerda = false;
  }
}

class Overdrive {
  float x, y, w, h;
  float offset;  // Deslocamento para a animação
  float vel;     // Velocidade da animação

  // Função de temporizador com ajuda de ChatGPT
  boolean ativo = true; // Indica se o Overdrive ainda está disponível
  float tempoInicioEfeito; // Guarda o momento de início do efeito

  Overdrive(float _x, float _y) {
    x = _x;
    y = _y;
    w = 42;
    h = 49;
    offset = 0;
    vel = 0.15;
  }

  void desenhaOverdrive() {
    if (ativo) {
      // Atualiza o deslocamento para criar o efeito de levitação
      offset += vel;

      // Inverte a direção ao atingir os limites do movimento
      if (offset > 6 || offset < -6) {
        vel *= -1;
      }

      imageMode(CENTER);
      image(overdrive, x, y + offset, w, h);
    }
  }

  // Colisão com o item
  boolean colisaoOverdrive(Ecobot ecobot) {
    if (ativo && ecobot.right >= x - w / 2 &&  // Há colisão se colide e está ativo
      ecobot.left <= x + w / 2 &&
      ecobot.bottom >= y - h / 2 &&
      ecobot.top <= y + h / 2) {
      return true;
    }
    return false;
  }

  // Efeito de Overdrive
  void aplicarEfeito(Ecobot ecobot) {
    if (colisaoOverdrive(ecobot)) {
      tempoInicioEfeito = millis(); // Marca o início do efeito em milissegundos
      ativo = false;
      ecobot.vel = 6;
      energia += 35;

      // Toca o som de Overdrive
      somOverdrive.play();
    }

    // Desativa o efeito após 2 segundos
    if (millis() - tempoInicioEfeito > 2000) {  // Calculo por ChatGPT
      ecobot.vel = 3;
    }
  }
}

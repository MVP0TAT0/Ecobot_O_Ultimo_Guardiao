class Overdrive {
  float x, y, w, h;
  float offset;  // Deslocamento para a animação
  float vel;     // Velocidade da animação

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
    return ativo && !(ecobot.right < x - w / 2 ||
      ecobot.left > x + w / 2 ||
      ecobot.bottom < y - h / 2 ||
      ecobot.top > y + h / 2);
  }

  // Efeito de Overdrive
  void aplicarEfeito(Ecobot ecobot) {
    if (ativo && colisaoOverdrive(ecobot)) {
      tempoInicioEfeito = millis(); // Marca o início do efeito
      ativo = false;
      ecobot.vel = 6;
      energia += 20;
    }

    // Desativa o efeito após 2 segundos
    if (!ativo && millis() - tempoInicioEfeito > 2000) {
      ecobot.vel = 3;
    }
  }
}

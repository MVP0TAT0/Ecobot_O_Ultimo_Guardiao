class BolaEnergia {
  float x, y, d;
  float offset;  // Deslocamento para a animação
  float vel;     // Velocidade da animação

  BolaEnergia(float _x, float _y) {
    x = _x;
    y = _y;
    d = 20;
    offset = 0;
    vel = 0.15;
  }

  void desenhaBolaEnergia() {
    // Atualiza o deslocamento para criar o efeito de levitação
    offset += vel;

    // Inverte a direção ao atingir os limites do movimento
    if (offset > 6 || offset < -6) {
      vel *= -1;
    }

    fill(255, 255, 0);
    circle(x, y + offset, d);
  }


  // Colisão com o item
  boolean colisaoBolaEnergia(Ecobot ecobot) {
    return !(ecobot.right < x - d ||
      ecobot.left > x + d ||
      ecobot.bottom < y - d ||
      ecobot.top > y + d);
  }
}

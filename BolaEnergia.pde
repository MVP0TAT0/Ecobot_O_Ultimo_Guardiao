class BolaEnergia {
  float x, y, r;
  float offset;  // Deslocamento para a animação
  float vel;     // Velocidade da animação

  BolaEnergia(float _x, float _y) {
    x = _x;
    y = _y;
    r = 10;
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
    circle(x, y + offset, r*2);
  }


  // Colisão com o item
  boolean colisaoBolaEnergia(Ecobot ecobot) {

    // Se o ecobot está a colidir...
    if (ecobot.right >= x - r &&
      ecobot.left <= x + r &&
      ecobot.bottom >= y - r &&
      ecobot.top <= y + r) {
      bolinhas.play();  //...então toca o som...
      return true;  // ...e o boolean devolve true
    }
    return false;  // Caso contrário, devolve false
  }
}

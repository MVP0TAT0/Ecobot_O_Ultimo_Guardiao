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
    left = x - 25/2;
    right = x + 25/2;
    top = y - 50/2;
    bottom = y + 50/2;
  }

  void desenha() {

    // Corpo
    fill(255, 0, 0);
    rect(x, y, 25, 50, 10);
  }

  void mover() {
    if (andarDireita == true) {
      x += vel;
    }
    if (andarEsquerda == true) {
      x -= vel;
    }

    //Atualizar hitbox do Ecobot
    left = x - 25/2;
    right = x + 25/2;
    top = y - 50/2;
    bottom = y + 50/2;
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

  void aterrar() {
    if (y >= height - 50/2) {
      aCair=false;
      y = height - 50/2;
    }
  }

  //Verificar se há colisão com qualquer plataformas
  //se não estiver a colidir, o jogador começa a cair
  void cairPlataforma(ArrayList<Plataforma> aListaPlataforma) {
    // Verificar se o Ecobot não está a meio de um salto
    // e verificar que o jogador não está no chão
    if (!aSaltar && y < height - 25) {

      boolean naPlataforma = false;

      for (Plataforma aPlataforma : aListaPlataforma) {
        // Verificar colisão com o topo da plataforma
        if (bottom >= aPlataforma.top - 1 &&   // Margem para evitar instabilidade
          bottom <= aPlataforma.top + 5 &&  // Considera uma pequena margem
          left < aPlataforma.right &&
          right > aPlataforma.left) {
          naPlataforma = true; // Está sobre a plataforma
          aCair = false;       // Para de cair
          y = aPlataforma.top - 25; // Ajusta o Ecobot sobre a plataforma
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

// Função para desenhar nuvens
void desenharNuvem(float x, float y) {
  fill(255);
  noStroke();
  ellipse(x, y, 60, 40);
  ellipse(x - 30, y + 10, 50, 30);
  ellipse(x + 30, y + 10, 50, 30);
}

int larguraBarra = 300;
boolean energiaFreeze;

float energiaAtual() {
  return energia;
}

void energia() {

  int alturaBarra = 20;

  // Diminuir a energia ao longo do tempo
  if (energiaFreeze == false) {
    if (energia > 0) {
      energia -= 0.125; // Diminuir a energia
    }
  } else {
    energia = energiaAtual();
  }

  // Verificar se a energia acabou
  if (energia <= 0 && fase == 2) {
    energia = 0;  // Garantir que a energia não fique negativa
    println("Nivel 1 perdido!");
    fase = 4;
  } else if (energia <= 0 && fase == 5) {
    energia = 0;
    println("Nivel 2 perdido");
    fase = 7;
  }


  textAlign(LEFT);
  text("Energia", 26, 70);

  // Desenhar a barra de energia
  rectMode(CORNER);
  fill(255, 0, 0); // Cor vermelha
  noStroke();
  rect(30, 90, larguraBarra, alturaBarra); // Fundo da barra

  // Barra de energia (com a largura diminuindo conforme a energia)
  fill(255, 255, 0); // Cor verde
  rect(30, 90, larguraBarra * (energia / 100), alturaBarra); // Parte cheia da barra
}

void resetNivel1 () {

  // Reiniciar o Ecobot
  Ecobot = new Ecobot(500, height-68/2);

  // Reiniciar o array de lixos
  lixoArray1 = new Lixo[3];
  lixoArray1[0] = new Lixo(150, 950, lixoImg);
  lixoArray1[1] = new Lixo(width/2, 760, lixoImg);
  lixoArray1[2] = new Lixo(300, 560, lixoImg);


  // Reiniciar o estado dos lixos
  for (int i = 0; i < lixoColecionado.length; i++) {
    lixoColecionado[i] = false;
  }

  // Reiniciar energia
  energia = 100;
}

void resetNivel2 () {

  // Reiniciar o Ecobot
  Ecobot = new Ecobot(500, height-68/2);

  // Reiniciar o array de lixos
  lixoArray2 = new Lixo[3];
  lixoArray2[0] = new Lixo(150, 950, lixoImg);
  lixoArray2[1] = new Lixo(150, 660, lixoImg);
  lixoArray2[2] = new Lixo(825, 410, lixoImg);


  // Reiniciar o estado dos lixos
  for (int i = 0; i < lixoColecionado.length; i++) {
    lixoColecionado[i] = false;
  }

  // Reiniciar energia
  energia = 100;

  // Reset do item Overdrive
  Overdrive1 = new Overdrive(50, 950);
}

void resetNivel3 () {
}

void mousePressed() {
  //Botões Menu principal
  if (fase == 0) {
    //Encontrar posição do botão "Jogar"
    if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by + 50 - ba / 2 && mouseY <= by + 50 + ba / 2) {
      fase = 2;
    }
    //Encontrar posição do botão "Como jogar"
    if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by + 150 - ba / 2 && mouseY <= by + 150 + ba / 2) {
      fase = 1;
    }
    //Encontrar posição do botão "Sair"
    if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by + 250 - ba / 2 && mouseY <= by + 250 + ba / 2) {
      exit();
    }
  }
  //Botões Menu Como jogar
  if (fase == 1) {
    if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by - 200 - ba / 2 && mouseY <= by - 200 + ba / 2) {
      fase = 0;
    }
  }
}

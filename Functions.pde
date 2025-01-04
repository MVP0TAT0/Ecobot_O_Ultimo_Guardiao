// Função para desenhar nuvens
void desenharNuvem(float x, float y) {
  fill(255);
  noStroke();
  ellipse(x, y, 60, 40);
  ellipse(x - 30, y + 10, 50, 30);
  ellipse(x + 30, y + 10, 50, 30);
}

int larguraBarra = 300;

void energia() {

  int alturaBarra = 20;

  // Impedir que o Ecobot ganhe mais energia do que o máximo
  if (energia > 100) {
    energia = 100;
  }

  // Verificar se a energia acabou
  if (energia <= 0) {
    if (fase == 2) {
      energia = 0;  // Garantir que a energia não fique negativa
      println("Nivel 1 perdido!");
      fase = 4;
    } else if (fase == 5) {
      energia = 0;
      println("Nivel 2 perdido");
      fase = 7;
    } else if (fase == 8) {
      energia = 0;
      println("Nivel 3 perdido!");
      fase = 10;
    }
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
  lixoArray1[0] = new Lixo(500, 760, lixoImg);
  lixoArray1[1] = new Lixo(880, 660, lixoImg);
  lixoArray1[2] = new Lixo(100, 560, lixoImg);

  // Reiniciar o estado dos lixos
  for (int i = 0; i < lixoColecionado.length; i++) {
    lixoColecionado[i] = false;
  }

  // Reiniciar bolas de energia nível
  bolaEnergiaArray1 = new BolaEnergia [e1];
  bolaEnergiaArray1[0] = new BolaEnergia(660, 700);
  bolaEnergiaArray1[1] = new BolaEnergia(660, 500);
  bolaEnergiaArray1[2] = new BolaEnergia(100, 940);

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

  // Reiniciar bolas de energia
  bolaEnergiaArray2 = new BolaEnergia [e2];
  bolaEnergiaArray2[0] = new BolaEnergia(600, 700);
  bolaEnergiaArray2[1] = new BolaEnergia(350, 500);
}

void resetNivel3 () {

  // Reiniciar o Ecobot
  Ecobot = new Ecobot(500, height-68/2);

  // Reiniciar o array de lixos
  lixoArray3 = new Lixo[3];
  lixoArray3[0] = new Lixo(400, 760, lixoImg);
  lixoArray3[1] = new Lixo(500, 560, lixoImg);
  lixoArray3[2] = new Lixo(965, 560, lixoImg);

  // Reiniciar o estado dos lixos
  for (int i = 0; i < lixoColecionado.length; i++) {
    lixoColecionado[i] = false;
  }

  // Reiniciar energia
  energia = 100;

  // Reset do item Overdrive
  Overdrive2 = new Overdrive(750, 750);

  // Reiniciar bolas de energia
  bolaEnergiaArray3 = new BolaEnergia [e3];
  bolaEnergiaArray3[0] = new BolaEnergia(290, 500);
  bolaEnergiaArray3[1] = new BolaEnergia(650, 300);
}

void mousePressed() {
  //Botões Menu principal
  if (fase == 0) {
    //Encontrar posição do botão "Jogar"
    if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by + 50 - ba / 2 && mouseY <= by + 50 + ba / 2) {
      fase = 2;
    }
    //Encontrar posição do botão "Selecionar nível"
    if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by + 150 - ba / 2 && mouseY <= by + 150 + ba / 2) {
      fase = 12;
    }
    //Encontrar posição do botão "Como jogar"
    if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by + 250 - ba / 2 && mouseY <= by + 250 + ba / 2) {
      fase = 1;
    }
  }
  //Botão Menu Como jogar
  if (fase == 1) {
    if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by - 200 - ba / 2 && mouseY <= by - 200 + ba / 2) {
      fase = 0;
    }
  }

  //Botões Menu "Selecionar nível"
  if (fase == 12) {
    if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by - 200 - ba / 2 && mouseY <= by - 200 + ba / 2) {
      fase = 0;
    }
  }
}

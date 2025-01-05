// Desenhar nuvens
void desenharNuvem(float x, float y) {
  fill(255);
  noStroke();
  ellipse(x, y, 60, 40);
  ellipse(x - 30, y + 10, 50, 30);
  ellipse(x + 30, y + 10, 50, 30);
}

void energia() {

  int alturaBarra = 20;
  int larguraBarra = 300;

  // Impedir que o Ecobot ganhe mais energia do que o máximo
  if (energia > 100) {
    energia = 100;
  }

  // Verificar se a energia acabou
  if (energia <= 0) {

    energia = 0; // Garantir que a energia não fique negativa

    if (fase == 2) {
      println("Nivel 1 perdido!");
      fase = 4;
    } else if (fase == 5) {
      println("Nivel 2 perdido!");
      fase = 7;
    } else if (fase == 8) {
      println("Nivel 3 perdido!");
      fase = 10;
    }
  }


  textAlign(LEFT);
  text("Energia", 26, 70);

  // Barra de energia vermelha
  rectMode(CORNER);
  fill(255, 0, 0);
  noStroke();
  rect(30, 90, larguraBarra, alturaBarra);

  // Barra de energia amarela que diminui conforme a energia)
  fill(255, 255, 0);
  rect(30, 90, larguraBarra * (energia / 100), alturaBarra);
}

void resetNivel1 () {  // Reiniciar o estado e posição de todos os elementos não fixos

  // Reiniciar sons
  somMorrerTocado = false;
  somCompletoTocado = false;

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

  // Reiniciar sons
  somMorrerTocado = false;
  somCompletoTocado = false;

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

  // Reiniciar sons
  somMorrerTocado = false;
  somCompletoTocado = false;

  // Reiniciar o Ecobot
  Ecobot = new Ecobot(500, height-50);

  // Reiniciar os Redbot
  Redbot1 = new Redbot(100, height-50, 15, 985);
  Redbot2 = new Redbot(500, 565, 360, 630);

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
  bolaEnergiaArray3[1] = new BolaEnergia(650, 500);
}

// Fazer o som tocar só tocar 1 vez nas fases exatas
void playMorrerSound() {
  if ((fase == 4 || fase == 7 || fase == 10) && !somMorrerTocado) {
    morrer.play();
    somMorrerTocado = true;
  }
}

void playCompletoSound() {
  if ((fase == 3 || fase == 6 || fase == 9) && !somCompletoTocado) {
    completo.play();
    somCompletoTocado = true;
  }
}

void bg() {
  if (fase >= 2 && fase <= 10) {  // Fase entre 2 e 10
    if (!bgTocando) {
      bg.loop();  // Usa loop diretamente
      bgTocando = true;
    }
  } else {
    bg.stop();  // Para a música quando a fase não for entre 2 e 10
    bgTocando = false;
  }
}

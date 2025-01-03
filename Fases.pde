// Variáveis Botões
int bx = 500;
int by = 500;
int ba = 80;
int bl = 300;
color bColor = color(40, 155, 0);

// Menu Principal
void MenuPrincipal() {

  // Título do jogo
  background(255);
  textAlign(CENTER);
  fill(0);
  textSize(115);
  text("EcoBot", width/2, height/2-200);
  textSize(38);
  text("O ÚLTIMO GUARDIÃO", width/2, height/2-150);

  // Botão "Jogar"
  noStroke();
  rectMode(CENTER);
  fill(bColor);
  rect(bx, by+50, bl, ba, 25);
  fill(255);
  textSize(40);
  text("Jogar", bx, by+63);

  // Botão "Como jogar"
  fill(bColor);
  rect(bx, by+150, bl, ba, 25);
  fill(255);
  textSize(40);
  text("Como jogar", bx, by+163);

  // Botão "Sair"
  fill(bColor);
  rect(bx, by+250, bl, ba, 25);
  fill(255);
  textSize(40);
  text("Sair", bx, by+263);

  // Verificar se o cursor está em cima dos botões para mudar o seu ícone
  if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 && mouseY >= by + 50 - ba / 2 && mouseY <= by + 50 + ba / 2 ||
    mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 && mouseY >= by + 150 - ba / 2 && mouseY <= by + 150 + ba / 2 ||
    mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 && mouseY >= by + 250 - ba / 2 && mouseY <= by + 250 + ba / 2) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }

  // Mudar o botão ao dar hover
  // Botão "Jogar"
  if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 && mouseY >= by + 50 - ba / 2 && mouseY <= by + 50 + ba / 2) {
    stroke(bColor);
    strokeWeight(3);
    fill(255);
    rect(bx, by+50, bl, ba, 25);
    fill(bColor);
    textSize(40);
    text("Jogar", bx, by+63);
  }

  // Botão "Como jogar"
  if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 && mouseY >= by + 150 - ba / 2 && mouseY <= by + 150 + ba / 2) {
    stroke(bColor);
    strokeWeight(3);
    fill(255);
    rect(bx, by+150, bl, ba, 25);
    fill(bColor);
    textSize(40);
    text("Como jogar", bx, by+163);
  }

  // Botão "Sair"
  if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 && mouseY >= by + 250 - ba / 2 && mouseY <= by + 250 + ba / 2) {
    stroke(bColor);
    strokeWeight(3);
    fill(255);
    rect(bx, by+250, bl, ba, 25);
    fill(bColor);
    textSize(40);
    text("Sair", bx, by+263);
  }
}



// Jogo
// Nível 1

boolean[] lixoColecionado = {false, false, false};
float efeitoOverdriveTempo = 0;
boolean efeitoOverdriveAtivo = false;


void Nivel1() {

  noStroke();
  background(135, 206, 235);
  cursor(ARROW);

  // Desenhar nuvens
  desenharNuvem(150, 200);
  desenharNuvem(300, 70);
  desenharNuvem(600, 150);
  desenharNuvem(850, 250);
  desenharNuvem(380, 180);


  // Energia
  energia();

  // Funções Ecobot
  Ecobot.desenha();
  Ecobot.mover();
  Ecobot.salto();
  Ecobot.cair();
  Ecobot.topoSalto();
  Ecobot.aterrar();
  Ecobot.cairPlataforma(plataformaArray1);


  // Desenhar e verificar colisões com os lixos
  for (int i = 0; i < 3; i++) {
    if (lixoArray1[i] != null) { // Verificar se o lixo ainda existe
      lixoArray1[i].desenhaLixo(); // Desenhar o lixo no jogo

      if (lixoArray1[i].colisaoLixo(Ecobot)) { // Verificar colisão do Ecobot com o lixo
        lixoArray1[i] = null; // Remover o lixo da tela
        lixoColecionado[i] = true; // Marca o lixo como coletado no índice correspondente
        energia -= 10;
        println("Colisão com lixo no índice " + i);
      }
    }
  }

  // Desenhar e verificar colisões com as bolas de energia
  for (int i = 0; i < e1; i++) {
    if (bolaEnergiaArray1[i] != null) {
      bolaEnergiaArray1[i].desenhaBolaEnergia();

      if (bolaEnergiaArray1[i].colisaoBolaEnergia(Ecobot)) {
        bolaEnergiaArray1[i] = null;
        energia += 35;
        println("Colisão com bola de energia no índice " + i);
      }
    }
  }

  // Lixos colecionados
  textAlign(RIGHT);
  fill(255);
  text("Lixo colecionado", width-30, 70);

  // Desenhar as imagens de lixo no canto superior direito
  for (int i = 0; i < 3; i++) {
    if (lixoColecionado[i]) {
      image(lixoCor, width - 210 + i * 40, 110, 33.5, 43.5); // Exibir lixo coletado (verde)
    } else {
      image(lixoPreto, width - 210 + i * 40, 110, 33.5, 43.5); // Exibir lixo não coletado (preto)
    }
  }

  // Verificar se os lixos todos foram colecionados
  boolean todosLixos = true;

  for (int i = 0; i < 3; i++) {
    if (!lixoColecionado[i]) {
      todosLixos = false;
      break;
    }
  }

  // Mudar de nível se colecionar os 3 lixos
  if (todosLixos) {
    fase = 3; //Fase Nivel1_Concluido
  } else if (energia <= 0) {
    fase = 4; //Fase Nivel1_Falhado
  }

  // Troncos
  for (int i = 0; i < t1; i++) {
    troncoArray1[i].desenha();
    troncoArray1[i].colisaoTronco(Ecobot);
  }

  // Plataformas
  for (int i = 0; i < n1; i++) {
    plataformaArray1[i].desenha();
    plataformaArray1[i].colisao(Ecobot);
  }
}



// Nível 1 - Concluído
void Nivel1_Concluido() {
  // Fundo semi-transparente
  fill(255, 255, 255, 20);
  rect(width / 2, height / 2, 600, 400, 50);
  fill(0);
  textAlign(CENTER);
  text("Nível 1 concluído!", width / 2, height / 2 - 100);

  // Determinar se o cursor está sobre o botão
  boolean isHover = mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
    mouseY >= by + 50 - ba / 2 && mouseY <= by + 50 + ba / 2;

  // Desenhar o botão
  if (isHover) {
    textSize(40);
    cursor(HAND);
    stroke(bColor);
    strokeWeight(3);
    fill(255);
    rect(bx, by + 50, bl, ba, 25);
    fill(bColor);
    text("Próximo nível", bx, by + 63);
  } else {
    textSize(40);
    cursor(ARROW); // Mudar cursor para "seta"
    noStroke();
    fill(bColor); // Cor padrão
    rect(bx, by + 50, bl, ba, 25);
    fill(255);
    text("Próximo nível", bx, by + 63);
  }

  // Verificar clique no botão
  if (mousePressed && isHover) {
    resetNivel1(); // Reiniciar o estado do nível 1
    fase = 5; // Nivel 2
  }

  noStroke();
}

void Nivel1_Falhado() {

  // Fundo
  fill(255, 255, 255, 20);
  rect(width / 2, height / 2, 600, 400, 50);
  fill(0);
  textAlign(CENTER);
  text("O Ecobot ficou sem energia!", width / 2, height / 2 - 100);

  // Verificar se o cursor está sobre o botão
  boolean isHover = mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
    mouseY >= by + 50 - ba / 2 && mouseY <= by + 50 + ba / 2;

  // Desenhar o botão
  if (isHover) {
    textSize(40);
    cursor(HAND);
    stroke(bColor);
    strokeWeight(3);
    fill(255);
    rect(bx, by + 50, bl, ba, 25);
    fill(bColor);
    text("Repetir nível", bx, by + 63);
  } else {
    textSize(40);
    cursor(ARROW); // Mudar cursor para "seta"
    noStroke();
    fill(bColor); // Cor padrão
    rect(bx, by + 50, bl, ba, 25);
    fill(255);
    text("Repetir nível", bx, by + 63);
  }

  // Verificar clique no botão
  if (mousePressed && isHover) {
    resetNivel1(); // Reiniciar o estado do nível 1
    fase = 2; // Nivel 1
  }

  noStroke();
}

void Nivel2() {

  noStroke();
  background(135, 206, 235);
  cursor(ARROW);

  // Desenhar nuvens
  desenharNuvem(150, 200);
  desenharNuvem(300, 70);
  desenharNuvem(600, 150);
  desenharNuvem(850, 250);
  desenharNuvem(380, 180);

  // Energia
  energia();

  // Funções Ecobot
  Ecobot.desenha();
  Ecobot.mover();
  Ecobot.salto();
  Ecobot.cair();
  Ecobot.topoSalto();
  Ecobot.aterrar();
  Ecobot.cairPlataforma(plataformaArray2);

  // Overdrive
  if (Overdrive1 != null) {
    Overdrive1.desenhaOverdrive();
    Overdrive1.aplicarEfeito(Ecobot);
  }

  // Desenhar e verificar colisões com os lixos
  for (int i = 0; i < 3; i++) {
    if (lixoArray2[i] != null) { // Verificar se o lixo ainda existe
      lixoArray2[i].desenhaLixo(); // Desenhar o lixo no jogo

      if (lixoArray2[i].colisaoLixo(Ecobot)) { // Verificar colisão do Ecobot com o lixo
        lixoArray2[i] = null; // Remover o lixo da tela
        lixoColecionado[i] = true; // Marca o lixo como coletado no índice correspondente
        energia -= 10;
        println("Colisão com lixo no índice " + i);
      }
    }
  }

  // Desenhar e verificar colisões com as bolas de energia
  for (int i = 0; i < e2; i++) {
    if (bolaEnergiaArray2[i] != null) {
      bolaEnergiaArray2[i].desenhaBolaEnergia();

      if (bolaEnergiaArray2[i].colisaoBolaEnergia(Ecobot)) {
        bolaEnergiaArray2[i] = null;
        energia += 35;
        println("Colisão com bola de energia no índice " + i);
      }
    }
  }

  // Lixos colecionados
  textAlign(RIGHT);
  fill(255);
  text("Lixo colecionado", width-30, 70);

  // Desenhar as imagens de lixo no canto superior esquerdo
  for (int i = 0; i < 3; i++) {
    if (lixoColecionado[i]) {
      image(lixoCor, width - 210 + i * 40, 110, 33.5, 43.5); // Exibir lixo coletado (verde)
    } else {
      image(lixoPreto, width - 210 + i * 40, 110, 33.5, 43.5); // Exibir lixo não coletado (preto)
    }
  }

  // Verificar se os lixos todos foram colecionados
  boolean todosLixos = true;

  for (int i = 0; i < 3; i++) {
    if (!lixoColecionado[i]) {
      todosLixos = false;
      break;
    }
  }

  // Mudar de nível se colecionar os 3 lixos
  if (todosLixos) {
    fase = 8; //Nivel 3
  }

  // Funções Plataformas
  for (int i = 0; i < n2; i++) {
    plataformaArray2[i].desenha();
    plataformaArray2[i].colisao(Ecobot);
  }
}

// Nivel 2 - Concluído
void Nivel2_Concluido() {

  // Fundo semi-transparente
  fill(255, 255, 255, 20);
  rect(width / 2, height / 2, 600, 400, 50);
  fill(0);
  textAlign(CENTER);
  text("Nível 1 concluído!", width / 2, height / 2 - 100);

  // Determinar se o cursor está sobre o botão
  boolean isHover = mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
    mouseY >= by + 50 - ba / 2 && mouseY <= by + 50 + ba / 2;

  // Desenhar o botão
  if (isHover) {
    textSize(40);
    cursor(HAND);
    stroke(bColor);
    strokeWeight(3);
    fill(255);
    rect(bx, by + 50, bl, ba, 25);
    fill(bColor);
    text("Próximo nível", bx, by + 63);
  } else {
    textSize(40);
    cursor(ARROW); // Mudar cursor para "seta"
    noStroke();
    fill(bColor); // Cor padrão
    rect(bx, by + 50, bl, ba, 25);
    fill(255);
    text("Próximo nível", bx, by + 63);
  }

  // Verificar clique no botão
  if (mousePressed && isHover) {
    resetNivel2(); // Reiniciar o estado do nível 1
    fase = 8; // Nivel 3
  }

  noStroke();
}

void Nivel2_Falhado() {

  // Fundo
  fill(255, 255, 255, 20);
  rect(width / 2, height / 2, 600, 400, 50);
  fill(0);
  textAlign(CENTER);
  text("O Ecobot ficou sem energia!", width / 2, height / 2 - 100);

  // Verificar se o cursor está sobre o botão
  boolean isHover = mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
    mouseY >= by + 50 - ba / 2 && mouseY <= by + 50 + ba / 2;

  // Desenhar o botão
  if (isHover) {
    textSize(40);
    cursor(HAND);
    stroke(bColor);
    strokeWeight(3);
    fill(255);
    rect(bx, by + 50, bl, ba, 25);
    fill(bColor);
    text("Repetir nível", bx, by + 63);
  } else {
    textSize(40);
    cursor(ARROW); // Mudar cursor para "seta"
    noStroke();
    fill(bColor); // Cor padrão
    rect(bx, by + 50, bl, ba, 25);
    fill(255);
    text("Repetir nível", bx, by + 63);
  }

  // Verificar clique no botão
  if (mousePressed && isHover) {
    resetNivel2(); // Reiniciar o estado do nível 2
    fase = 5; // Nivel 2
  }

  noStroke();
}


// Menu "Como jogar"
void ComoJogar() {

  noStroke();
  background(0);
  text("COMO JOGAR", bx, by);

  fill(155, 40, 0);
  rect(bx, by-200, bl, ba, 25);
  fill(255);
  textSize(40);
  text("Voltar", bx, by-186);

  if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
    mouseY >= by -200 - ba / 2 && mouseY <= by -200 + ba / 2)
    cursor(HAND);
  else
    cursor(ARROW);
}

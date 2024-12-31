//Menu Principal
void MenuPrincipal() {
  //Título do jogo
  background(255);
  textAlign(CENTER);
  fill(0);
  textSize(115);
  text("EcoBot", width/2, height/2-200);
  textSize(38);
  text("O ÚLTIMO GUARDIÃO", width/2, height/2-150);

  //Botão "Jogar"
  noStroke();
  rectMode(CENTER);
  fill(bColor);
  rect(bx, by+50, bl, ba, 25);
  fill(255);
  textSize(40);
  text("Jogar", bx, by+63);

  //Botão "Como jogar"
  fill(bColor);
  rect(bx, by+150, bl, ba, 25);
  fill(255);
  textSize(40);
  text("Como jogar", bx, by+163);

  //Botão "Sair"
  fill(bColor);
  rect(bx, by+250, bl, ba, 25);
  fill(255);
  textSize(40);
  text("Sair", bx, by+263);

  //Verificar se o cursor está em cima dos botões para mudar o seu ícone
  if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 && mouseY >= by + 50 - ba / 2 && mouseY <= by + 50 + ba / 2 ||
    mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 && mouseY >= by + 150 - ba / 2 && mouseY <= by + 150 + ba / 2 ||
    mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 && mouseY >= by + 250 - ba / 2 && mouseY <= by + 250 + ba / 2) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }

  //Mudar o botão ao dar hover
  //Botão "Jogar"
  if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 && mouseY >= by + 50 - ba / 2 && mouseY <= by + 50 + ba / 2) {
    stroke(bColor);
    strokeWeight(3);
    fill(255);
    rect(bx, by+50, bl, ba, 25);
    fill(bColor);
    textSize(40);
    text("Jogar", bx, by+63);
  }

  //Botão "Como jogar"
  if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 && mouseY >= by + 150 - ba / 2 && mouseY <= by + 150 + ba / 2) {
    stroke(bColor);
    strokeWeight(3);
    fill(255);
    rect(bx, by+150, bl, ba, 25);
    fill(bColor);
    textSize(40);
    text("Como jogar", bx, by+163);
  }

  //Botão "Sair"
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



//Jogo
//Nível 1

boolean[] lixoColecionado = {false, false, false}; // Global, fora de qualquer função

void Nivel1() {

  noStroke();
  background(135, 206, 235);
  cursor(ARROW);

  // Desenhar nuvens
  desenharNuvem(150, 200);
  desenharNuvem(300, 100);
  desenharNuvem(600, 150);
  desenharNuvem(850, 250);

  // Energia
  energia();

  // Funções Ecobot
  Ecobot.desenha();
  Ecobot.mover();
  Ecobot.salto();
  Ecobot.cair();
  Ecobot.topoSalto();
  Ecobot.aterrar();
  Ecobot.cairPlataforma(listaPlataforma);

  // Desenhar e verificar colisões com os lixos
  for (int i = 0; i < 3; i++) {
    if (lixoArray[i] != null) { // Verificar se o caixote ainda existe
      lixoArray[i].desenhaLixo();

      if (lixoArray[i].colisaoLixo(Ecobot)) {
        lixoArray[i] = null; // Remove o lixo ao detetar colisão
        lixoColecionado[i] = true; // Marca o lixo como coletado
        println("Colisão com lixo!");
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
      image(lixoCor, width-210 + i * 40, 110, 33.5, 43.5); // Desenhar a imagem verde do lixo
    } else {
      image(lixoPreto, width-210 + i * 40, 110, 33.5, 43.5); // Desenhar a imagem preta do lixo
    }
  }

  // Funções Plataformas
  for (Plataforma aPlataforma : listaPlataforma) {
    aPlataforma.desenha();
    aPlataforma.colisao(Ecobot);
  }
}



//Fase 2
void Nivel2() {
}



//Menu "Como jogar"
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

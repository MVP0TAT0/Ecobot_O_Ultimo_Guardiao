Ecobot Ecobot;

//Fases
int fase = 0;
// 0 -> Menu inicial
// 1 -> Jogo
// 2 -> Menu "Como jogar"

//Botões
int bx = 500;
int by = 500;
int ba = 80;
int bl = 300;

void setup() {
  size(1000, 1000);
  Ecobot = new Ecobot(50, height-50);
  frameRate(60);
}

void draw() {

  switch(fase) {
  case 0:

    //Título do jogo
    background(255);
    textAlign(CENTER);
    fill(0);
    textSize(115);
    text("EcoBot", width/2, height/2-200);
    textSize(38);
    text("O ÚLTIMO GUARDIÃO", width/2, height/2-150);
    noStroke();

    //Botão "Jogar"
    rectMode(CENTER);
    fill(40, 155, 0);
    rect(bx, by+50, bl, ba, 25);
    fill(255);
    textSize(40);
    text("Jogar", bx, by+63);

    //Botão "Controles"
    rectMode(CENTER);
    fill(40, 155, 0);
    rect(bx, by+150, bl, ba, 25);
    fill(255);
    textSize(40);
    text("Como jogar", bx, by+163);

    //Botão "Sair"
    rectMode(CENTER);
    fill(40, 155, 0);
    rect(bx, by+250, bl, ba, 25);
    fill(255);
    textSize(40);
    text("Sair", bx, by+263);

    //Verificar se o cursor está em cima dos botões
    if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by + 50 - ba / 2 && mouseY <= by + 50 + ba / 2 ||
      mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by + 150 - ba / 2 && mouseY <= by + 150 + ba / 2 ||
      mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by + 250 - ba / 2 && mouseY <= by + 250 + ba / 2)
      cursor(HAND);
    else
      cursor(ARROW);

    break;

  case 1:
    background(0);
    Ecobot.desenha();
    Ecobot.mover();
    Ecobot.salto();
    Ecobot.cair();
    Ecobot.topoSalto();
    Ecobot.aterrar();

    rectMode(CENTER);
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
    break;


  case 2:
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
    break;
  }
}

void mousePressed() {
  //Botões Menu principal
  if (fase == 0) {
    //Encontrar posição do botão "Jogar"
    if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by + 50 - ba / 2 && mouseY <= by + 50 + ba / 2) {
      fase = 1;
    }
    //Encontrar posição do botão "Como jogar"
    if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by + 150 - ba / 2 && mouseY <= by + 150 + ba / 2) {
      fase = 2;
    }
    //Encontrar posição do botão "Sair"
    if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by + 250 - ba / 2 && mouseY <= by + 250 + ba / 2) {
      exit();
    }
  }
  //Botões jogo
  if (fase == 1) {
    if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by - 200 - ba / 2 && mouseY <= by - 200 + ba / 2) {
      fase = 0;
    }
  }
  //Botões Menu Como jogar
  if (fase == 2) {
    if (mouseX >= bx - bl / 2 && mouseX <= bx + bl / 2 &&
      mouseY >= by - 200 - ba / 2 && mouseY <= by - 200 + ba / 2) {
      fase = 0;
    }
  }
}

void keyPressed() {
  if (key == 'd') {
    Ecobot.andarDireita=true;
  }

  if (key == 'a') {
    Ecobot.andarEsquerda=true;
  }

  if (key == 'w' && Ecobot.aSaltar==false && Ecobot.aCair==false) {
    Ecobot.aSaltar=true;
    Ecobot.ySalto = Ecobot.y - Ecobot.alturaSalto;
  }
}


void keyReleased() {
  if (key == 'd') {
    Ecobot.andarDireita=false;
  }

  if (key == 'a') {
    Ecobot.andarEsquerda=false;
  }
}

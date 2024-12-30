//Funções de movimento e colisão provenientes do canal: https://www.youtube.com/@chriswhitmirelessons220

//Classes
Ecobot Ecobot;
Plataforma Plat1, Plat2, Plat3;

//Arraylist - Mesma coisa que Array, mas não tem número fixo, pode-se acrescentar e remover
ArrayList <Plataforma> listaPlataforma;

//Fases
int fase = 0;
// 0 -> Menu inicial
// 1 -> Jogo
// 2 -> Menu "Como jogar"

//Variáveis Botões
int bx = 500;
int by = 500;
int ba = 80;
int bl = 300;
color bColor = color(40, 155, 0);

//Energia
float energia = 100;

void setup() {
  size(1000, 1000);
  frameRate(60);

  //Criar Ecobot e plataforma
  Ecobot = new Ecobot(50, height-68/2);

  //Criar Plataformas
  Plat1 = new Plataforma(width/2, 900, 300, 20);
  Plat2 = new Plataforma(width-200, 820, 200, 20);
  Plat3 = new Plataforma(width/2, height-10, width, 20);

  listaPlataforma = new ArrayList<Plataforma>();
  listaPlataforma.add(Plat1);
  listaPlataforma.add(Plat2);
  listaPlataforma.add(Plat3);
}

void draw() {

  //Switch para ir mudando de fase (0,1,2,etc)
  switch(fase) {

  case 0: //Menu inicial

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

    break;

  case 1: //Jogo
    noStroke();
    background(135, 206, 235);
    cursor(ARROW);

    //// Desenhar nuvens
    desenharNuvem(150, 200);
    desenharNuvem(300, 100);
    desenharNuvem(600, 150);
    desenharNuvem(850, 250);

    //Energia
    energia();

    //Funções Ecobot
    Ecobot.desenha();
    Ecobot.mover();
    Ecobot.salto();
    Ecobot.cair();
    Ecobot.topoSalto();
    Ecobot.aterrar();
    Ecobot.cairPlataforma(listaPlataforma);

    //Funções Plataformas
    for (Plataforma aPlataforma : listaPlataforma) {
      aPlataforma.desenha();
      aPlataforma.colisao(Ecobot);
    }
    break;


  case 2: //Menu "Como jogar"
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

// Funções de movimento e colisão provenientes do canal: https://www.youtube.com/@chriswhitmirelessons220

// Imagem do lixo
PImage lixoImg;
PImage lixoPreto;
PImage lixoCor;

// Imagem dos itens
PImage overdrive;

//
Overdrive Overdrive1;

// Classe Ecobot
Ecobot Ecobot;

// Classes com Arrays
Plataforma[] plataformaArray1, plataformaArray2, plataformaArray3;
Lixo[] lixoArray1, lixoArray2, lixoArray3;
Tronco[] troncoArray1, troncoArray2;
BolaEnergia[] bolaEnergiaArray1, bolaEnergiaArray2, bolaEnergiaArray3;

// Número de plataformas por nível
int n1 = 7; // Nível 1
int n2 = 9; // Nível 2
int n3 = 12;// Nível 3

// Número de troncos por nível
int t1 = 12; // Nível 1
int t2 = 6;

// Número de bolas de energia por nível
int e1 = 3;
int e2 = 3;

// Fases
int fase = 0;
// 0 -> Menu inicial
// 1 -> Jogo
// 2 -> Menu "Como jogar"

// Energia
float energia = 100;

void setup() {
  size(1000, 1000);
  frameRate(60);

  // Criar Ecobot
  Ecobot = new Ecobot(500, height-50);

  // Criar Plataformas Nível 1
  plataformaArray1 = new Plataforma [n1];
  plataformaArray1[0] = new Plataforma(width/2, height-10, width, 20); //Chão
  plataformaArray1[1] = new Plataforma(270, 900, 160, 20);
  plataformaArray1[2] = new Plataforma(500, 800, 200, 20);
  plataformaArray1[3] = new Plataforma(800, 800, 160, 20);
  plataformaArray1[4] = new Plataforma(880, 700, 80, 20);
  plataformaArray1[5] = new Plataforma(520, 600, 500, 20);
  plataformaArray1[6] = new Plataforma(100, 600, 80, 20);


  // Criar Plataformas Nível 2
  plataformaArray2 = new Plataforma [n2];
  plataformaArray2[0] = new Plataforma(width/2, height-10, width, 20); //Chão
  plataformaArray2[1] = new Plataforma(width-100, 900, 100, 20);
  plataformaArray2[2] = new Plataforma(500, 800, 60, 20);
  plataformaArray2[3] = new Plataforma(750, 800, 160, 20);
  plataformaArray2[4] = new Plataforma(300, 800, 60, 20);
  plataformaArray2[5] = new Plataforma(150, 700, 100, 20);
  plataformaArray2[6] = new Plataforma(300, 600, 100, 20);
  plataformaArray2[7] = new Plataforma(550, 500, 260, 20);
  plataformaArray2[8] = new Plataforma(825, 450, 100, 20);

  // Criar Troncos Nível 1
  // Pilha #1 de troncos
  troncoArray1 = new Tronco [t1];
  troncoArray1[0] = new Tronco(450-15, 600-17);
  // Restantes troncos são criados com base na posição do primeiro
  troncoArray1[1] = new Tronco(troncoArray1[0].x+15, troncoArray1[0].y);
  troncoArray1[2] = new Tronco(troncoArray1[0].x+30, troncoArray1[0].y);
  troncoArray1[3] = new Tronco(troncoArray1[0].x+15-7.5, troncoArray1[0].y-15);
  troncoArray1[4] = new Tronco(troncoArray1[0].x+30-7.5, troncoArray1[0].y-15);
  troncoArray1[5] = new Tronco(troncoArray1[0].x+15, troncoArray1[0].y-30);

  // Pilha #2 de troncos
  troncoArray1[6] = new Tronco(320-15, 900-17);
  // Restantes troncos são criados com base na posição do primeiro
  troncoArray1[7] = new Tronco(troncoArray1[6].x+15, troncoArray1[6].y);
  troncoArray1[8] = new Tronco(troncoArray1[6].x+30, troncoArray1[6].y);
  troncoArray1[9] = new Tronco(troncoArray1[6].x+15-7.5, troncoArray1[6].y-15);
  troncoArray1[10] = new Tronco(troncoArray1[6].x+30-7.5, troncoArray1[6].y-15);
  troncoArray1[11] = new Tronco(troncoArray1[6].x+15, troncoArray1[6].y-30);


  // Criar bolas de energia nível 1
  bolaEnergiaArray1 = new BolaEnergia [e1];
  bolaEnergiaArray1[0] = new BolaEnergia(660, 700);
  bolaEnergiaArray1[1] = new BolaEnergia(660, 500);
  bolaEnergiaArray1[2] = new BolaEnergia(100, 940);

  // Criar bolas de energia nível 2
  bolaEnergiaArray2 = new BolaEnergia [e2];
  bolaEnergiaArray2[0] = new BolaEnergia(600, 700);
  bolaEnergiaArray2[1] = new BolaEnergia(350, 500);

  // Criar bolas de energia nível 3



  // Criar Lixos Nível 1
  lixoImg = loadImage("lixo.png");
  lixoArray1 = new Lixo[3];
  lixoArray1[0] = new Lixo(500, 760, lixoImg);
  lixoArray1[1] = new Lixo(880, 660, lixoImg);
  lixoArray1[2] = new Lixo(100, 560, lixoImg);

  // Criar Lixos Nível 2
  lixoImg = loadImage("lixo.png");
  lixoArray2 = new Lixo[3];
  lixoArray2[0] = new Lixo(150, 950, lixoImg);
  lixoArray2[1] = new Lixo(150, 660, lixoImg);
  lixoArray2[2] = new Lixo(825, 410, lixoImg);

  // Score de lixo não colecionado
  lixoPreto = loadImage("lixoPreto.png");

  // Score de lixo colecionado
  lixoCor = loadImage("lixo.png");

  // Itens especiais
  overdrive = loadImage("overdrive.png");
  Overdrive1 = new Overdrive(50, 950);
}

void draw() {

  // Switch case para ir mudando de fases
  switch(fase) {

  case 0:
    MenuPrincipal();
    //Nivel2();
    break;

  case 1:
    ComoJogar();
    break;

  case 2:
    Nivel1();
    break;

  case 3:
    Nivel1_Concluido();
    break;

  case 4:
    Nivel1_Falhado();
    break;

  case 5:
    Nivel2();
    break;

  case 6:
    Nivel2_Concluido();
    break;

  case 7:
    Nivel2_Falhado();
    break;

  case 8:
    //Nivel3();
    break;

  case 9:
    //Nivel3_Concluido();
    break;

  case 10:
    //Nivel3_Falhado();
    break;

  case 11:
    //Vitoria
    break;
  }
}

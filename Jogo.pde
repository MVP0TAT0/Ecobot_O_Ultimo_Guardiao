// Funções de movimento do ecobot e colisão de plataformas provenientes do canal: https://www.youtube.com/@chriswhitmirelessons220

// Sons
import processing.sound.*;
SoundFile morrer, vitoria, bolinhas, somOverdrive, saltar, somLixo, completo, bg;

boolean somVitoriaTocado = false;
boolean somMorrerTocado = false;
boolean somCompletoTocado = false;
boolean bgTocando = false;

// Imagem do lixo
PImage lixoImg;
PImage lixoPreto;
PImage lixoCor;

// Imagem dos itens
PImage overdrive;

// Imagem "Como jogar" e "Vitoria"
PImage ComoJogar, Vitoria, Background;

// Classe Overdrive
Overdrive Overdrive1, Overdrive2;

// Classe Ecobot
Ecobot Ecobot;

// Classe RedBot
Redbot Redbot1, Redbot2;

// Classes com Arrays
Plataforma[] plataformaArray1, plataformaArray2, plataformaArray3;
Lixo[] lixoArray1, lixoArray2, lixoArray3;
Tronco[] troncoArray1, troncoArray2, troncoArray3;
BolaEnergia[] bolaEnergiaArray1, bolaEnergiaArray2, bolaEnergiaArray3;

// Número de plataformas por nível
int n1 = 7; // Nível 1
int n2 = 9; // Nível 2
int n3 = 12;// Nível 3

// Número de troncos por nível
int t1 = 12; // Nível 1
int t2 = 3;  // Nível 2
int t3 = 20; // Nível 3

// Número de bolas de energia por nível
int e1 = 3;  // Nível 1
int e2 = 2;  // Nível 2
int e3 = 2;  // Nível 3

// Fases do jogo
int fase = 0; // Começar no Menu inicial

// Energia
float energia = 100;

void setup() {
  size(1000, 1000);
  frameRate(60);

  // Criar Sons
  morrer = new SoundFile(this, "morrer.mp3");
  vitoria = new SoundFile(this, "vitoria.mp3");
  bolinhas = new SoundFile(this, "bolinhas.mp3");
  somOverdrive = new SoundFile(this, "overdrive.mp3");
  saltar = new SoundFile(this, "saltar.mp3");
  somLixo = new SoundFile(this, "lixo.mp3");
  completo = new SoundFile(this, "completo.mp3");
  bg = new SoundFile(this, "bg.mp3");

  // Criar Ecobot
  Ecobot = new Ecobot(500, height-50);

  // Criar Redbot
  Redbot1 = new Redbot(100, height-50, 15, 985);
  Redbot2 = new Redbot(500, 565, 360, 630);

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

  // Criar Plataformas Nível 3
  plataformaArray3 = new Plataforma [n3];
  plataformaArray3[0] = new Plataforma(width/2, height-10, width, 20); //Chão
  plataformaArray3[1] = new Plataforma(900, 900, 60, 20);
  plataformaArray3[2] = new Plataforma(750, 800, 120, 20);
  plataformaArray3[3] = new Plataforma(400, 800, 60, 20);
  plataformaArray3[4] = new Plataforma(200, 800, 60, 20);
  plataformaArray3[5] = new Plataforma(50, 700, 100, 20);
  plataformaArray3[6] = new Plataforma(200, 600, 60, 20);
  plataformaArray3[7] = new Plataforma(500, 600, 300, 20);
  plataformaArray3[8] = new Plataforma(750, 500, 140, 20);
  plataformaArray3[9] = new Plataforma(960, 600, 80, 20);
  plataformaArray3[10] = new Plataforma(600, 400, 60, 20);
  plataformaArray3[11] = new Plataforma(825, 300, 200, 20);

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

  // Criar Troncos Nível 2
  troncoArray2 = new Tronco [t1];
  troncoArray2[0] = new Tronco(550, 500-17);
  // Restantes troncos são criados com base na posição do primeiro
  troncoArray2[1] = new Tronco(troncoArray2[0].x+15, troncoArray2[0].y);
  troncoArray2[2] = new Tronco(troncoArray2[0].x+7.5, troncoArray2[0].y-15);

  // Criar Troncos Nível 3
  // Pilha #1 de troncos
  troncoArray3 = new Tronco [t3];
  troncoArray3[0] = new Tronco(790, 500-17);
  // Restantes troncos são criados com base na posição do primeiro
  troncoArray3[1] = new Tronco(troncoArray3[0].x+15, troncoArray3[0].y);
  troncoArray3[2] = new Tronco(troncoArray3[0].x, troncoArray3[0].y-15);
  troncoArray3[3] = new Tronco(troncoArray3[0].x+15, troncoArray3[0].y-15);
  troncoArray3[4] = new Tronco(troncoArray3[0].x, troncoArray3[0].y-30);
  troncoArray3[5] = new Tronco(troncoArray3[0].x+15, troncoArray3[0].y-30);
  troncoArray3[6] = new Tronco(troncoArray3[0].x, troncoArray3[0].y-45);
  troncoArray3[7] = new Tronco(troncoArray3[0].x+15, troncoArray3[0].y-45);
  troncoArray3[8] = new Tronco(troncoArray3[0].x, troncoArray3[0].y-60);
  troncoArray3[9] = new Tronco(troncoArray3[0].x+15, troncoArray3[0].y-60);
  troncoArray3[10] = new Tronco(troncoArray3[0].x, troncoArray3[0].y-75);
  troncoArray3[11] = new Tronco(troncoArray3[0].x+15, troncoArray3[0].y-75);
  troncoArray3[12] = new Tronco(troncoArray3[0].x, troncoArray3[0].y-90);
  troncoArray3[13] = new Tronco(troncoArray3[0].x+15, troncoArray3[0].y-90);
  troncoArray3[14] = new Tronco(troncoArray3[0].x, troncoArray3[0].y-105);
  troncoArray3[15] = new Tronco(troncoArray3[0].x+15, troncoArray3[0].y-105);
  troncoArray3[16] = new Tronco(troncoArray3[0].x+7.5, troncoArray3[0].y-120);

  // Pilha #2 de troncos
  troncoArray3[17] = new Tronco(895, 300-17);
  troncoArray3[18] = new Tronco(troncoArray3[17].x+15, troncoArray3[17].y);
  troncoArray3[19] = new Tronco(troncoArray3[17].x+7.5, troncoArray3[17].y-15);

  // Criar bolas de energia nível 1
  bolaEnergiaArray1 = new BolaEnergia [e1];
  bolaEnergiaArray1[0] = new BolaEnergia(660, 700);
  bolaEnergiaArray1[1] = new BolaEnergia(660, 500);
  bolaEnergiaArray1[2] = new BolaEnergia(100, 940);

  // Criar bolas de energia nível 2
  bolaEnergiaArray2 = new BolaEnergia [e2];
  bolaEnergiaArray2[0] = new BolaEnergia(600, 700);
  bolaEnergiaArray2[1] = new BolaEnergia(200, 600);

  // Criar bolas de energia nível 3
  bolaEnergiaArray3 = new BolaEnergia [e3];
  bolaEnergiaArray3[0] = new BolaEnergia(290, 500);
  bolaEnergiaArray3[1] = new BolaEnergia(650, 500);

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

  // Criar Lixos Nível 3
  lixoImg = loadImage("lixo.png");
  lixoArray3 = new Lixo[3];
  lixoArray3[0] = new Lixo(400, 760, lixoImg);
  lixoArray3[1] = new Lixo(500, 560, lixoImg);
  lixoArray3[2] = new Lixo(965, 560, lixoImg);

  // Score de lixo não colecionado
  lixoPreto = loadImage("lixoPreto.png");

  // Score de lixo colecionado
  lixoCor = loadImage("lixo.png");

  // Itens especiais
  overdrive = loadImage("overdrive.png");
  Overdrive1 = new Overdrive(50, 950);
  Overdrive2 = new Overdrive(750, 750);
}

void draw() {
  // Switch case para ir mudando de fases
  switch(fase) {
  case 0:
    MenuPrincipal();
    break;

  case 1:
    ComoJogar();
    break;

  case 2:
    Nivel1();
    bg();
    break;

  case 3:
    Nivel1_Concluido();
    playCompletoSound();
    break;

  case 4:
    Nivel1_Falhado();
    playMorrerSound();
    break;

  case 5:
    Nivel2();
    bg();
    break;

  case 6:
    Nivel2_Concluido();
    playCompletoSound();
    break;

  case 7:
    Nivel2_Falhado();
    playMorrerSound();
    break;

  case 8:
    Nivel3();
    bg();
    break;

  case 9:
    Nivel3_Concluido();
    playCompletoSound();
    break;

  case 10:
    Nivel3_Falhado();
    playMorrerSound();
    break;

  case 11:
    Vitoria();

    bg.stop();

    if (!somVitoriaTocado) { // Se o som de Vitoria não tiver sido tocado ainda, toca
      vitoria.play();
      somVitoriaTocado = true; // Impede que o som volte a tocar todos os frames
    }
    break;

  case 12:
    Selecionar_Nivel();
    break;
  }
}

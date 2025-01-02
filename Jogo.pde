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

// Posição e número de plataformas por nível
int n1 = 6; // Nível 1
int n2 = 9; // Nível 2
int n3 = 12;// Nível 3

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
  Ecobot = new Ecobot(500, height-68/2);

  // Criar Plataformas Nível 1
  plataformaArray1 = new Plataforma [n1];
  plataformaArray1[0] = new Plataforma(width/2, height-10, width, 20); //Chão
  plataformaArray1[1] = new Plataforma(320, 900, 100, 20);
  plataformaArray1[2] = new Plataforma(width/2, 800, 220, 20);
  plataformaArray1[3] = new Plataforma(780, 800, 160, 20);
  plataformaArray1[4] = new Plataforma(880, 700, 80, 20);
  plataformaArray1[5] = new Plataforma(520, 600, 500, 20);

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

  // Criar Lixos Nível 1
  lixoImg = loadImage("lixo.png");
  lixoArray1 = new Lixo[3];
  lixoArray1[0] = new Lixo(150, 950, lixoImg);
  lixoArray1[1] = new Lixo(width/2, 760, lixoImg);
  lixoArray1[2] = new Lixo(300, 560, lixoImg);

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

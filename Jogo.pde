// Funções de movimento e colisão provenientes do canal: https://www.youtube.com/@chriswhitmirelessons220

// Imagem do lixo
PImage lixoImg;
PImage lixoPreto;
PImage lixoCor;

// Classe Ecobot
Ecobot Ecobot;

// Classes com Arrays
Plataforma[] plataformaArray;
Lixo[] lixoArray;

// Número de plataformas por nível
int n1 = 6; // Nível 1
int n2 = 10; // Nível 2

// Fases
int fase = 0;
// 0 -> Menu inicial
// 1 -> Jogo
// 2 -> Menu "Como jogar"

// Energia
float energia = 200;

void setup() {
  size(1000, 1000);
  frameRate(60);

  // Criar Ecobot
  Ecobot = new Ecobot(50, height-68/2);

  // Criar Plataformas Nível 1
  plataformaArray = new Plataforma [n1];
  plataformaArray[0] = new Plataforma(width/2, height-10, width, 20); //Chão
  plataformaArray[1] = new Plataforma(320, 900, 100, 20);
  plataformaArray[2] = new Plataforma(width/2, 800, 220, 20);
  plataformaArray[3] = new Plataforma(780, 800, 160, 20);
  plataformaArray[4] = new Plataforma(880, 700, 80, 20);
  plataformaArray[5] = new Plataforma(520, 600, 500, 20);

  // Criar Lixos Nível 1
  lixoImg = loadImage("lixo.png");
  lixoArray = new Lixo[3]; // Exemplo com 3 caixotes
  lixoArray[0] = new Lixo(150, 950, lixoImg);
  lixoArray[1] = new Lixo(width/2, 760, lixoImg);
  lixoArray[2] = new Lixo(300, 560, lixoImg);

  // Score de lixo não colecionado
  lixoPreto = loadImage("lixoPreto.png");

  // Score de lixo colecionado
  lixoCor = loadImage("lixo.png");
}

void draw() {

  // Switch case para ir mudando de fases
  switch(fase) {

  case 0:

    MenuPrincipal();

    break;

  case 1:

    Nivel1();

    break;


  case 2:

    ComoJogar();

    break;

  case 3:

    Nivel2();

    break;
  }
}

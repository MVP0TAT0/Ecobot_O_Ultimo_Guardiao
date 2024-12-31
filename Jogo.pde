//Funções de movimento e colisão provenientes do canal: https://www.youtube.com/@chriswhitmirelessons220

//Imagem do lixo
PImage lixoImg;
PImage lixoPreto;
PImage lixoCor;

//Classes
Ecobot Ecobot;
Plataforma Plat1, Plat2, Plat3;

//Arraylist - Mesma coisa que Array, mas não tem número fixo, pode-se acrescentar e remover
ArrayList <Plataforma> listaPlataforma;

//Arrays
Lixo[] lixoArray;

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
  Plat1 = new Plataforma(width-200, 820, 200, 20);
  Plat2 = new Plataforma(width/2, 900, 300, 20);
  Plat3 = new Plataforma(width/2, height-10, width, 20);

  listaPlataforma = new ArrayList<Plataforma>();
  listaPlataforma.add(Plat1);
  listaPlataforma.add(Plat2);
  listaPlataforma.add(Plat3);

  // Criar um array de lixos
  lixoImg = loadImage("lixo.png");
  lixoArray = new Lixo[3]; // Exemplo com 3 caixotes
  lixoArray[0] = new Lixo(width/2, height - 170, lixoImg);
  lixoArray[1] = new Lixo(200, 950, lixoImg);
  lixoArray[2] = new Lixo(750, height - 250, lixoImg);

  // Lixo score
  lixoPreto = loadImage("lixoPreto.png");

  // Lixo preenchido
  lixoCor = loadImage("lixo.png");
}

void draw() {

  //Switch case para ir mudando de fase (0,1,2,etc)
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
  }
}

// Função para desenhar nuvens
void desenharNuvem(int x, int y) {
  fill(255);
  noStroke();
  ellipse(x, y, 60, 40);
  ellipse(x - 30, y + 10, 50, 30);
  ellipse(x + 30, y + 10, 50, 30);
}

void energia() {
  int larguraBarra = 200;
  int alturaBarra = 20;

  // Diminuir a energia ao longo do tempo (por exemplo, a cada 60 frames)
  if (energia > 0) {
    energia -= 0.1; // Diminuir a energia
  }

  // Verificar se a energia acabou
  if (energia <= 0) {
    energia = 0;  // Garantir que a energia não fique negativa
    // Aqui pode adicionar código para finalizar o jogo
    println("Jogo perdido!");
    fase = 0;
  }

  textAlign(LEFT);
  text("Energia", 26, 70);

  // Desenhar a barra de energia
  rectMode(CORNER);
  fill(255, 0, 0); // Cor vermelha
  noStroke();
  rect(30, 90, larguraBarra, alturaBarra); // Fundo da barra

  // Barra de energia (com a largura diminuindo conforme a energia)
  fill(255, 255, 0); // Cor verde
  rect(30, 90, larguraBarra * (energia / 100), alturaBarra); // Parte cheia da barra
}

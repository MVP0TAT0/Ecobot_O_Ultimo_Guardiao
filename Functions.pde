// Função para desenhar nuvens
void desenharNuvem(int x, int y) {
  fill(255);
  noStroke();
  ellipse(x, y, 60, 40);
  ellipse(x - 30, y + 10, 50, 30);
  ellipse(x + 30, y + 10, 50, 30);
}

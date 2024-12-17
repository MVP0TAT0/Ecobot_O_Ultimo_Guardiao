class Robot {
  float x, y;

  Robot(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void desenha() {

    // Corpo
    fill(200);
    rect(x, y + 70, 100, 150, 10);

    // ECO-BOT
    fill(50);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("ECOBOT", x + 50, y + 145);

    // Cabeça
    fill(180);
    rect(x - 10, y, 120, 80, 15);

    // Olhos
    fill(255);
    ellipse(x + 20, y + 30, 20, 20);
    ellipse(x + 80, y + 30, 20, 20);

    // Pupilas
    fill(50);
    ellipse(x + 20, y + 30, 10, 10);
    ellipse(x + 80, y + 30, 10, 10);

    // Boca
    noFill();
    stroke(255, 100, 100);
    strokeWeight(4);
    arc(x + 50, y + 60, 50, 20, 0, PI);

    // Antenas
    stroke(0);
    strokeWeight(1);
    line(x + 10, y, x - 10, y - 30);
    line(x + 90, y, x + 110, y - 30);

    // Bolas das antenas
    stroke(0);
    strokeWeight(1);
    fill(255, 100, 0);
    ellipse(x - 10, y - 30, 10, 10);
    ellipse(x + 110, y - 30, 10, 10);

    // Braços
    stroke(0);
    strokeWeight(1);
    fill(180);
    rect(x - 30, y + 100, 30, 80, 10,0,0,0);
    rect(x + 100, y + 100, 30, 80, 0,10,0,0);

    // Pernas
    stroke(0);
    strokeWeight(1);
    fill(180);
    rect(x + 10, y + 220, 30, 50, 0,0,10,10);
    rect(x + 60, y + 220, 30, 50, 0,0,10,10);
  }
}

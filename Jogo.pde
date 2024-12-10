Robot robot;

void setup() {
  size(400, 400);
  background(220);
  
  // Create a robot instance at position (150, 100)
  robot = new Robot(150, 100);
}

void draw() {
  background(220);
  robot.display();
  noLoop();
}

class Robot {
  float x, y; // Position of the robot
  
  Robot(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    // Robot body
    fill(200);
    rect(x, y + 70, 100, 150, 10);

    // Text on chest
    fill(50);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("ECO-BOT", x + 50, y + 145);

    // Robot head
    fill(180);
    rect(x - 10, y, 120, 80, 15);

    // Eyes
    fill(255);
    ellipse(x + 20, y + 30, 20, 20);
    ellipse(x + 80, y + 30, 20, 20);

    // Pupils
    fill(50);
    ellipse(x + 20, y + 30, 10, 10);
    ellipse(x + 80, y + 30, 10, 10);

    // Mouth (smile)
    noFill();
    stroke(255, 100, 100);
    strokeWeight(4);
    arc(x + 50, y + 60, 50, 20, 0, PI);

    // Antennas
    stroke(150);
    strokeWeight(4);
    line(x + 10, y, x - 10, y - 30);
    line(x + 90, y, x + 110, y - 30);

    // Antenna ends
    noStroke();
    fill(255, 100, 0);
    ellipse(x - 10, y - 30, 10, 10);
    ellipse(x + 110, y - 30, 10, 10);

    // Arms
    fill(180);
    rect(x - 30, y + 100, 30, 80, 10);
    rect(x + 100, y + 100, 30, 80, 10);

    // Legs
    fill(180);
    rect(x + 10, y + 220, 30, 50, 5);
    rect(x + 60, y + 220, 30, 50, 5);
  }
}

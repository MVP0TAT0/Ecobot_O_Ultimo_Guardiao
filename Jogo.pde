Robot robot;

void setup() {
  size(1080,1080);

}

void draw() {
  background(220);  
  robot = new Robot(mouseX, mouseY);
  robot.display();
}

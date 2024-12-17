Robot robot;

void setup() {
  size(1080,1080);

}

void draw() {
  background(220);  
  robot = new Robot(mouseX-50, mouseY-70);
  robot.desenha();
}

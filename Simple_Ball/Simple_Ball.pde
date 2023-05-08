Ball ball;

void setup() {
  size(800, 600);
  ball=new Ball();
}


void draw() {
  background(0);
  ball.update();
  ball.display();
}


class Ball {
  float xpos;
  float ypos;
  float xspd;
  float yspd;
  color col;

  Ball() {
    xpos=width/2;
    ypos=height/2;
    float angle=random(TWO_PI);
    xspd=cos(angle)*5;
    yspd=sin(angle)*5;
    col=color(random(150, 255), random(150, 255), random(40));
  }

  void update() {
    xpos+=xspd;
    if (xpos<20 || xpos>width-20) {
      xspd*=-1;
    }
    ypos+=yspd;
    if (ypos<20 || ypos>height-20) {
      yspd*=-1;
    }
  }

  void display() {
    fill(col);
    noStroke();
    ellipse(xpos, ypos, 40, 40);
  }
}

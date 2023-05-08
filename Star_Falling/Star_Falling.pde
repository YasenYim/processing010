import processing.video.*;

Capture cam;

Star[]stars;

void setup() {
  size(1280, 720);

  stars=new Star[200];
  for (int i=0; i<stars.length; i++) {
    stars[i]=new Star();
  }

  cam=new Capture(this, 1280, 720, 30);
  cam.start();
}

void draw() {
  if (cam.available()) {
    cam.read();
  }
  image(cam,0,0);
  for (int i=0; i<stars.length; i++) {
    stars[i].update();
    stars[i].display();
  }
}

class Star {
  float xpos;
  float ypos;

  float yspd;
  color col;
  float size;

  Star() {
    size=20;
    xpos=random(size, width-size);
    ypos=random(-height, -size);
    col=color(random(150, 255), random(150, 255), random(50));
    yspd=random(2, 5);
  }

  void update() {
    ypos+=yspd;
    
    if(ypos>0 && ypos<height-1){
      recede(cam);
    }

    if (ypos>height+size) {
      ypos=-size;
      xpos=random(size, width-size);
    }
  }
  
  void recede(PImage img){
    while(brightness(img.get(int(xpos),int(ypos)))<127 && ypos>1){
      ypos--;
    }
  }


  void display() {
    pushMatrix();
    translate(xpos, ypos);
    fill(col);
    beginShape();
    for (int i=0; i<10; i++) {
      float angle=i*TWO_PI/10-PI/2;
      if (i%2==0) {
        vertex(cos(angle)*size, sin(angle)*size);
      } else {
        vertex(cos(angle)*size*0.4, sin(angle)*size*0.4);
      }
    }
    endShape(CLOSE);
    popMatrix();
  }
}

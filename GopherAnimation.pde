// convert -delay 0 -loop 0 -alpha set -dispose previous gopher*.png gopher.gif

PGraphics pg;

Animation walkingGopher;
Animation seeingGopher;

int x, y;
int speed;
int stopPosition;
boolean isWalking;

void setup() {
  size(100, 100);
  frameRate(10);
  walkingGopher = new Animation("walking_gopher/", 3);
  seeingGopher = new Animation("seeing_gopher/", 12);
  walkingGopher.setSize(width, height);
  seeingGopher.setSize(width, height);
  x = -walkingGopher.getWidth();
  y = 0;
  speed = 10;
  isWalking = true;
  stopPosition = speed + x % speed;
}

void draw() { 
  background(255);
  if (x == stopPosition && isWalking) {
    isWalking = false;
  }
  
  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  if (isWalking) {
    walkingGopher.display(pg, x, y);
    x += speed;
    if (x > width) {
      x = -walkingGopher.getWidth();
      //exit();
    }
  } else {
    seeingGopher.display(pg, x, y);
    if (seeingGopher.isLast()) {
      isWalking = true;
      x += speed;
    }
  }
  pg.endDraw();
  image(pg, 0, 0);
  //pg.save("frames/gopher" + nf(frameCount, 4) + ".png");
}
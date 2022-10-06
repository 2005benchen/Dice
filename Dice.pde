int sum = 0;

void setup() {
  noLoop();
  size (1000, 1000);
  drawBackground();
  textAlign(CENTER);
}

void drawBackground() {
  fill (255, 255, 255);
  rect (0, 0, 1000, 1000);
  for (int c = 0; c <= 1000; c++) {
    strokeWeight(5);
    stroke(200, 200, c, 30);
    line(0, c, 1000, c);
  }
}

void draw() {
  drawBackground();
  for (int y = 50; y <= 1000; y+= 100) {
    for (int x = 50; x <= 1000; x+= 100) {
      Die bob = new Die(x, y);
      bob.roll();
      bob.show();
      sum+=bob.dots;
    }
  }
  text ("There are " + sum + " dots", 333, 990);
}

void mousePressed() {
  redraw();
  sum = 0;
}

class Die //models one single dice cube
{
  //member variable declarations here
  int myX, myY, dots;

  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
  }
  void roll() {
    dots = (int)(Math.random()*6)+1;
  }
  void show() {
    fill((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    noStroke();
    rect(myX-25, myY-25, 50, 50, 20);
    fill(0);
    if (dots == 1) {
      ellipse(myX, myY, 10, 10);
    } else if (dots == 2) {
      ellipse(myX-12.5, myY-12.5, 10, 10);
      ellipse(myX+12.5, myY+12.5, 10, 10);
    } else if (dots == 3) {
      ellipse(myX, myY, 10, 10);
      ellipse(myX+12.5, myY-12.5, 10, 10);
      ellipse(myX-12.5, myY+12.5, 10, 10);
    } else if (dots == 4) {
      ellipse(myX-12.5, myY-12.5, 10, 10);
      ellipse(myX+12.5, myY+12.5, 10, 10);
      ellipse(myX+12.5, myY-12.5, 10, 10);
      ellipse(myX-12.5, myY+12.5, 10, 10);
    } else if (dots == 5) {
      ellipse(myX, myY, 10, 10);
      ellipse(myX-12.5, myY-12.5, 10, 10);
      ellipse(myX+12.5, myY+12.5, 10, 10);
      ellipse(myX+12.5, myY-12.5, 10, 10);
      ellipse(myX-12.5, myY+12.5, 10, 10);
    } else if (dots == 6) {
      ellipse(myX-12.5, myY-12.5, 10, 10);
      ellipse(myX+12.5, myY+12.5, 10, 10);
      ellipse(myX+12.5, myY-12.5, 10, 10);
      ellipse(myX-12.5, myY+12.5, 10, 10);
      ellipse(myX-12.5, myY, 10, 10);
      ellipse(myX+12.5, myY, 10, 10);
    }
  }
}

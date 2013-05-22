class Triangle {
  float x1, x2, x3, y1, y2, y3;
  int col;
  
  public Triangle() {
    randomize();
  }


  Triangle clone() {
    Triangle t = new Triangle("");
    t.x1=x1;
    t.x2=x2;
    t.x3=x3;
    t.y1=y1;
    t.y2=y2;
    t.y3=y3;
    t.col=col;
    return t;    
  }  
  
  public Triangle(String a) {
    //dummy constructor
  }

  //rndomize color
  void randomizeColor() {
    if (COLOR_MODE) {
      //return color(int(random(255)), int(random(255)), int(random(255)), random(255));
      int c=srcColor[int(random(srcColor.length))];
      col=color(red(c), green(c), blue(c), random(255));
      return;
    }

    col=color(int(random(255)), random(224));
  }

  void randomize() {
    randomizeVectors();
    randomizeColor();
  }

  void draw() {
    fill(col);
    triangle(x1, y1, x2, y2, x3, y3);
  }


  void randomizeVectors() {    
    float angle = random(360);
    float l1 = random(monaImg.width/8);
    float l2 = random(monaImg.height/8);

    float x = random(monaImg.width);
    float y = random(monaImg.height);
    
    float deg = (angle) % TWO_PI;
    float f = x+cos(deg)*l1;
    x1 = f>monaImg.width ? monaImg.width: f;
    f = y+sin(deg)*l2;
    y1 = f>monaImg.height ? monaImg.height: f;

    deg = (1*2*THIRD_PI + angle) % TWO_PI;
    f = x+cos(deg)*l1;
    x2 = f>monaImg.width ? monaImg.width: f;
    f = y+sin(deg)*l2;
    y2 = f>monaImg.height ? monaImg.height: f;
    
    deg = (2*2*THIRD_PI + angle) % TWO_PI;
    f = x+cos(deg)*l1;
    x3 = f>monaImg.width ? monaImg.width: f;
    f = y+sin(deg)*l2;
    y3 = f>monaImg.height ? monaImg.height: f;
  }
}

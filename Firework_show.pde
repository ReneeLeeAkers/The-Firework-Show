//-------------------------------------------------
//firework:
Firework[] fs = new Firework[50];
boolean once;

//-------------------------------------------------
//images:
PImage[] images = new PImage[2];
int imageIndex = 0;

//-------------------------------------------------
//bubbles:

ArrayList<Bubbles> bubbles;

Bubbles b;

//-------------------------------------------------
void setup() {
  size(1200, 1200);
//-------------------------------------------------
//images:
    images [0]  = loadImage("1.png");
    images [1] = loadImage ("2.png");

//-------------------------------------------------
//firework:
  for (int i = 0; i < fs.length; i++){
    fs[i] = new Firework();
    
//-------------------------------------------------
//bubbles:  
    bubbles = new ArrayList<Bubbles>();
  }
}
 
//-------------------------------------------------
  void draw() {
noStroke();
  fill(50,0,40,20);
  rect(0,0,width,height);
  for (int i = 0; i < fs.length; i++){
    fs[i].draw();
  }

//-------------------------------------------------
//images:
if (mouseX >= 600) {
  image(images[0], mouseX,mouseY, 150, 150);
} 

else{ 
  image(images[1], mouseX,mouseY, 100, 100);
} 

//-------------------------------------------------
//bubbles:  
 b= new Bubbles();

  b.setPosition(width/2, height/2);
  
  //p.gravity = 10.0f;
  b.size = random(20,40);
  b.setSpeed(random( -1.0f, 1.0f), random( -1.0f, 1.0f));
  b.setColour(color(random(255),random(255),random(255)));

  bubbles.add(b);
  
  for (int i =0; i <bubbles.size();i++)
  {
    Bubbles b = bubbles.get(i);
    b.drawBubbles();
    b.update();  
  }
    
    for (int i =0; i <bubbles.size();i++)
  {
    
    if((b.x < -100) || (b.x > width)) {
      bubbles.remove(i); 
    }
     if((b.y < -100) || (b.y > width)) {
      bubbles.remove(i); 
    }
    b.drawBubbles();
    b.update();  
  }
  
   textSize(40);
text("Push ENTER to start", 0, 60);
  

//-------------------------------------------------
//star:    
  ellipse (random(width), random(height), 10,10);

  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 100.0);
  star(0, 0, 60, 140, 5); 
  popMatrix();
}

//------------------------------------------------- 
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
  
  textSize(65);
fill(230, 140); 
text("R", 0, 60);
text("E", 20, 70);
text("N", 40, 80);
text("E", 60, 90);
text("E", 80, 100); 



}

void mouseReleased(){
  once = false;
  for (int i = 0; i < fs.length; i++){
    if((fs[i].hidden)&&(!once)){
      fs[i].launch();
      once = true;
    }
//-------------------------------------------------
//bubbles: 

 b= new Bubbles();

  b.setPosition(width/2, height/2);
  
  //p.gravity = 10.0f;
  b.size = random(1, 10);
  b.setSpeed(random( -1.0f, 1.0f), random( -1.0f, 1.0f));
  b.setColour(color(random(255),random(255),random(255)));

  bubbles.add(b);
  
  
}
}
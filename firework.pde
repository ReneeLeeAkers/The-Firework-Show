class Firework{
  float x, y, oldX,oldY, ySpeed, targetX, targetY, explodeTimer, flareWeight, flareAngle;
  int flareAmount, duration;
  boolean launched,exploded,hidden;
  color flare;
  Firework(){
    launched = false;
    exploded = false;
    hidden = true;
  }
  void draw(){
    if((launched)&&(!exploded)&&(!hidden)){
      launchMaths();
      strokeWeight(2);
      stroke(255);
      line(x,y,oldX,oldY);
    }
    if((!launched)&&(exploded)&&(!hidden)){
      explodeMaths();
      noStroke();
      strokeWeight(flareWeight);
      stroke(flare);
      for(int i = 0; i < flareAmount + 1; i++){
          pushMatrix();
          translate(x,y);
          point(sin(radians(i*flareAngle))*explodeTimer,cos(radians(i*flareAngle))*explodeTimer);
          popMatrix();
       }
    }
    if((!launched)&&(!exploded)&&(hidden)){
      //do nothing
    }
  }
  void launch(){
    x = oldX = mouseX + ((random(5)*100) - 25);
    y = oldY = height;
    targetX = mouseX;
    targetY = mouseY;
    ySpeed = random(3) + 5;
    flare = color(random(3)*150 + 200,random(3)*200 + 105,random(3)*200 + 50);
    flareAmount = ceil(random(50)) + 50;
    flareWeight = ceil(random(3));
    duration = ceil(random(4))*100 + 50;
    flareAngle = 360/flareAmount;
    launched = true;
    exploded = false;
    hidden = false;
  }
  void launchMaths(){
    oldX = x;
    oldY = y;
    if(dist(x,y,targetX,targetY) > 6){
      x += (targetX - x)/2;
      y += -ySpeed;
    }else{
      explode();
    }
  }
  void explode(){
    explodeTimer = 0;
    launched = false;
    exploded = true;
    hidden = false;
  }
  void explodeMaths(){
    if(explodeTimer < duration){
      explodeTimer+= 0.4;
    }else{
      hide();
    }
  }
  void hide(){
    launched = false;
    exploded = false;
    hidden = true;
  
    saveFrame(); 
  }
}
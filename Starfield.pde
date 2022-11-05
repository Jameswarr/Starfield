Particle [] particles;
void setup() {
  size(200,200);
  particles = new Particle[300];
  for(int i = 0; i < particles.length; i++) {
    particles[i] = new NormalParticle();
  }
  particles[0] = new OddballParticle();
  frameRate(30);
  fill(0);
}

void draw() {
  fill(250,250,0,0);
  for(int i = 0; i < particles.length; i++) {
    particles[i].show();
    particles[i].move();
  }
}

interface Particle {
  public void move();
  public void show();
}

class NormalParticle implements Particle {
  double normalX, normalY, dAngle;
  int dSpeed;
  NormalParticle() {
    normalX = 150;
    normalY = 50;
    dSpeed = (int)(Math.random()*20)+1;
    dAngle = Math.PI*2*Math.random();
  }
  public void move() {
    normalX = normalX + dSpeed * (Math.random()*Math.sin(dAngle));
    normalY = normalY + dSpeed * (Math.random()*Math.cos(dAngle));
  }
  public void show() {
    fill((float)(Math.random()*255)+1, (float)(Math.random()*55)+100, 255, (float)(Math.random()*20)+150);
    noStroke();
    ellipse((float)normalX,(float)normalY,3,3);
  }
}

class OddballParticle implements Particle {
  double oddX, oddY;
  OddballParticle() {
    oddX = (Math.random()*30)+30;
    oddY = (Math.random()*30)+30;
  }
  public void move() {
    oddX = (Math.random()*12)+155;
    oddY = (Math.random()*12)+50;
  }
  public void show() {
    fill(50,255,255);
    stroke(10);
    ellipse((float)oddX,(float)oddY,3,3);
    fill(50,250,50);
    ellipse((float)oddX,(float)oddY,5,5);
  }
}

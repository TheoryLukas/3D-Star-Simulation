Mover[] movers = new Mover[500000];

Attractor a;

float angle = 0;

boolean rotation = true;

void setup() 
{
  size(1920,900,P3D);
  smooth();
  background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,0.4),random(-width/2,width/2),random(-height/32,height/32),random(-400,400)); 
  }
  a = new Attractor();
}

void draw() 
{  
  background(0);
  sphereDetail(8);
  lights();
  translate(width/2,height/2);
  if (rotation)
  {
    rotateY(angle);
    rotateX(angle);
    rotateZ(angle);
  }

  
  a.display();

  for (int i = 0; i < movers.length; i++) 
  {
    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);

    movers[i].update();
    movers[i].display();
  }
  
  angle += 0.003;
}

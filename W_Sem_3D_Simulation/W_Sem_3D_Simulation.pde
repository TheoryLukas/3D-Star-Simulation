Mover3D[] movers = new Mover3D[10000];
Mover3D[] mover;

Attractor a;

float angle = 0;

boolean rotation = true;

void setup()
{
  size(1800, 900, P3D);
  smooth();
  background(255);
  for (int i = 0; i < (movers.length * 0.7); i++)
  {
    movers[i] = new Mover3D(random(0.1, 0.4), random(-width/16, width/16), random(-height/16, height/16), random(-100, 100));
  }
  for (int i = Math.round(movers.length * 0.7); i < movers.length; i++)
  {
    movers[i] = new Mover3D(random(0.1, 0.4), random(-width/2, width/2), random(-height/32, height/32), random(-400, 400));
  }
  a = new Attractor();
}

void draw()
{
  background(0);
  sphereDetail(8);
  lights();
  translate(width/2, height/2);
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

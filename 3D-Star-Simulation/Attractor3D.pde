
class Attractor 
{
  float mass;
  PVector location;
  float g;

  Attractor() 
  {
    location = new PVector(0,0);
    mass = 20;
    g = 0.4;
  }


  PVector attract(Mover3D m) 
  {
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    force.normalize();
    float strength = (g * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }

  void display() {
    stroke(255);
    noFill();
    pushMatrix();
    translate(location.x,location.y,location.z);
    sphere(mass*2);
    popMatrix();
  }
}

class Orb {

  PVector center;
  PVector velocity;
  PVector acceleration;
  float bsize;
  float mass;
  color c;
  int charge;
  boolean showElectromagnetic = false;

  Orb() {
    bsize = random(10, MAX_SIZE);
    float x = random(bsize / 2, width - bsize / 2);
    float y = random(bsize / 2, height - bsize / 2);
    center = new PVector(x, y);
    mass = random(10, 100);
    velocity = new PVector();
    acceleration = new PVector();
    setColor();
    charge = (int)random(-2, 3);
  }

  Orb(float x, float y, float s, float m) {
    bsize = s;
    mass = m;
    center = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
    setColor();
    charge = (int)random(-2, 3);
  }

  void move() {
    xBounce();
    yBounce();
    velocity.add(acceleration);
    center.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector scaleForce = force.copy();
    scaleForce.div(mass);
    acceleration.add(scaleForce);
  }

  PVector getDragForce(float cd) {
    float dragMag = velocity.mag();
    dragMag = -0.5 * dragMag * dragMag * cd;
    PVector dragForce = velocity.copy();
    dragForce.normalize();
    dragForce.mult(dragMag);
    return dragForce;
  }

  PVector getGravity(Orb other, float G) {
    float strength = G * mass * other.mass;
    float r = max(center.dist(other.center), MIN_SIZE);
    strength = strength / pow(r, 2);
    PVector force = other.center.copy();
    force.sub(center);
    force.mult(strength);
    return force;
  }

  PVector getSpring(Orb other, int springLength, float springK) {
    PVector direction = PVector.sub(other.center, this.center);
    direction.normalize();
    float displacement = this.center.dist(other.center) - springLength;
    float mag = springK * displacement;
    direction.mult(mag);
    return direction;
  }

  PVector getElectromagnetic(Orb other, float K) {
    if (charge == 0 || other.charge == 0) {
      return new PVector(0, 0);
    }
    float r = max(center.dist(other.center), MIN_SIZE);
    float strength = K * charge * other.charge / (r * r);
    PVector force = PVector.sub(other.center, center);
    force.normalize();
    force.mult(strength);
    return force;
  }

  boolean yBounce() {
    if (center.y > height - bsize / 2) {
      velocity.y *= -1;
      center.y = height - bsize / 2;
      return true;
    } else if (center.y < bsize / 2) {
      velocity.y *= -1;
      center.y = bsize / 2;
      return true;
    }
    return false;
  }

  boolean xBounce() {
    if (center.x > width - bsize / 2) {
      center.x = width - bsize / 2;
      velocity.x *= -1;
      return true;
    } else if (center.x < bsize / 2) {
      center.x = bsize / 2;
      velocity.x *= -1;
      return true;
    }
    return false;
  }

  boolean collisionCheck(Orb other) {
    return (this.center.dist(other.center) <= (this.bsize / 2 + other.bsize / 2));
  }

  void setColor() {
    color c0 = color(0, 255, 255);
    color c1 = color(0);
    c = lerpColor(c0, c1, (mass - MIN_SIZE) / (MAX_MASS - MIN_SIZE));
  }

  void display() {
    noStroke();
    if (showElectromagnetic) {
      if (charge > 0) {
        fill(255, 0, 0);
      } else if (charge < 0) {
        fill(0, 0, 255);
      } else {
        fill(0, 255, 0);
      }
    } else {
      fill(c);
    }
    circle(center.x, center.y, bsize);
    if (showElectromagnetic) {
      fill(255);
      textAlign(CENTER, CENTER);
      textSize(bsize * 0.3);
      String chargeText = (charge >= 0) ? "+" + str(charge) : str(charge);
      text(chargeText, center.x, center.y);
    }
  }
  
}

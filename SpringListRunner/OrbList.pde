class OrbList {

  OrbNode front;

  OrbList() {
    front = null;
  }

  void addFront(OrbNode o) {
    o.next = front;
    front = o;
  }

  void populate() {
    front = null;
    OrbNode orb;
    orb = new FixedOrb(width / 2, height / 2, random(MIN_SIZE * 2, MAX_SIZE * 2), random(MIN_MASS * 2, MAX_MASS * 2));
    addFront(orb);
    for (int i = 0; i < NUM_ORBS - 1; i++) {
      orb = new OrbNode();
      addFront(orb);
    }
  }

  void display() {
    OrbNode curr = front;
    while (curr != null) {
      curr.display();
      curr = curr.next;
    }
  }

  void applyGravity(float gConstant) {
    OrbNode curr = front;
    while (curr != null) {
      OrbNode other = curr.next;
      while (other != null) {
        PVector grav = curr.getGravity(other, gConstant);
        curr.applyForce(grav);
        grav = other.getGravity(curr, gConstant);
        other.applyForce(grav);
        other = other.next;
      }
      curr = curr.next;
    }
  }

  void applyDrag(float dCoef) {
    OrbNode curr = front;
    while (curr != null) {
      float distFromCenter = dist(curr.center.x, curr.center.y, width / 2, height / 2);
      if (distFromCenter > 250) {
        PVector dragForce = curr.getDragForce(dCoef);
        curr.applyForce(dragForce);
      }
      curr = curr.next;
    }
  }

  void applySprings(int springLength, float springK) {
    OrbNode curr = front;
    while (curr != null) {
      curr.applySpring(springLength, springK);
      curr = curr.next;
    }
  }

  void applyElectromagnetic(float kConstant) {
    OrbNode curr = front;
    while (curr != null) {
      curr.showElectromagnetic = true;
      OrbNode other = curr.next;
      while (other != null) {
        other.showElectromagnetic = true;
        PVector electromagnetic = curr.getElectromagnetic(other, kConstant);
        curr.applyForce(electromagnetic);
        electromagnetic = other.getElectromagnetic(curr, kConstant);
        other.applyForce(electromagnetic);
        other = other.next;
      }
      curr = curr.next;
    }
  }
  
  void cancelElectromagnetic()  {
    OrbNode curr = front;
    while (curr.next != null)  {
      curr.showElectromagnetic = false;
      curr = curr.next;
    }
    curr.showElectromagnetic = false;
  }

  void run() {
    OrbNode curr = front;
    while (curr != null) {
      curr.move();
      curr = curr.next;
    }
  }
}

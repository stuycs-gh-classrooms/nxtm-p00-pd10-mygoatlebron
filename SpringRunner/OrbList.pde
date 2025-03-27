/*===========================
  OrbList (ALL WORK GOES HERE)

  Class to represent a Linked List of OrbNodes.

  Instance Variables:
    OrbNode front:
      The first element of the list.
      Initially, this will be null.

  Methods to work on:
    0. addFront
    1. populate
    2. display
    3. applySprings
    4. applyGravity
    5. run
    6. removeFront
    7. getSelected
    8. removeNode

  When working on these methods, make sure to
  account for null values appropraitely. When the program
  is run, no NullPointerExceptions should occur.
  =========================*/

class OrbList {

  OrbNode front;

  /*===========================
    Contructor
    Does very little.
    You do not need to modify this method.
    =========================*/
  OrbList() {
    front = null;
  }//constructor

  /*===========================
    addFront(OrbNode o)

    Insert o to the beginning of the list.
    =========================*/
 void addFront(OrbNode o) {
    if (front != null) {
      front.previous = o;
      o.next = front;
    }
    front = o;
  }//addFront


  /*===========================
    populate(int n, boolean ordered)

    Clear the list.
    Add n randomly generated  orbs to the list,
    using addFront.
    If ordered is true, the orbs should all
    have the same y coordinate and be spaced
    SPRING_LEGNTH apart horizontally.
    =========================*/
  void populate(int n, boolean ordered) {
    // clear the list
    front = null;
    
    if (ordered) {
      // set a constant y (for example, half the height)
      float y = height / 2;
      // determine a starting x value to center the row (optional)
      float totalLength = (n - 1) * SPRING_LENGTH;
      float startX = width/2 - totalLength/2;
      for (int i = 0; i < n; i++) {
        // Create an orb with x, y; random size and mass within given ranges.
        float x = startX + i * SPRING_LENGTH;
        float s = random(MIN_SIZE, MAX_SIZE);
        float m = random(MIN_MASS, MAX_MASS);
        OrbNode node = new OrbNode(x, y, s, m);
        addFront(node);
      }
    }
    else {
      // add n random orbs using the default constructor
      for (int i = 0; i < n; i++) {
        addFront(new OrbNode());
      }
    }
  }//populate


  /*===========================
    display(int springLength)

    Display all the nodes in the list using
    the display method defined in the OrbNode class.
    =========================*/
   void display() {
    OrbNode current = front;
    while (current != null) {
      current.display();
      current = current.next;
    }
  }//display


  /*===========================
    applySprings(int springLength, float springK)

    Use the applySprings method in OrbNode on each
    element in the list.
    =========================*/
void applySprings(int springLength, float springK) {
    OrbNode current = front;
    while (current != null) {
      current.applySprings(springLength, springK);
      current = current.next;
    }
  }//applySprings


  /*===========================
    applyGravity(Orb other, float gConstant)

    Use the getGravity and applyForce methods
    to apply gravity crrectly.
    =========================*/
    void applyGravity(Orb other, float gConstant) {
    OrbNode current = front;
    while (current != null) {
      PVector gravityForce = current.getGravity(other, gConstant);
      current.applyForce(gravityForce);
      current = current.next;
    }
  }//applyGravity


  /*===========================
    run(boolean bounce)

    Call run on each node in the list.
    =========================*/
 void run(boolean bounce) {
    OrbNode current = front;
    while (current != null) {
      current.move(bounce);
      current.display();
      current = current.next;
    }
  }//applySprings


  /*===========================
    removeFront()

    Remove the element at the front of the list, i.e.
    after this method is run, the former second element
    should now be the first (and so on).
    =========================*/
 void removeFront() {
    if (front != null) {
      front = front.next;
      if (front != null) {
        front.previous = null;
      }
    }
  }//removeFront

  /*===========================
    getSelected(float x, float y)

    If there is a node at (x, y), return
    a reference to that node.
    Otherwise, return null.

    See isSlected(float x, float y) in
    the Orb class (line 115).
    =========================*/
    OrbNode getSelected(int x, int y) {
    OrbNode current = front;
    while (current != null) {
      if (current.isSelected(x, y)) {
        return current;
      }
      current = current.next;
    }
    return null;
  }//getSelected

  /*===========================
    removeNode(OrbNode o)

    Removes o from the list. You can
    assume o is an OrbNode in the list.
    You cannot assume anything about the
    position of o in the list.
    =========================*/
   void removeNode(OrbNode o) {
    // if o is the first node
    if (o == front) {
      removeFront();
      return;
    }
    // otherwise, link its previous and next nodes
    if (o.previous != null) {
      o.previous.next = o.next;
    }
    if (o.next != null) {
      o.next.previous = o.previous;
    }
  }//removeNode
}

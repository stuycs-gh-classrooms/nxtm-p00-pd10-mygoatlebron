class FixedOrb extends OrbNode  {

  FixedOrb(float x, float y, float s, float m)  {
    super(x, y, s, m);
    c = color(255, 0, 0);
  }

  FixedOrb()  {
    super();
    c = color(255, 0, 0);
  }
  
  @Override
  void move()  {
  }
  
}

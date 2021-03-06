class HUD {

  private HeroShip hero;
  private PFont font;
  private final int TEXTSIZE = 12;

  public HUD(HeroShip hero) {
    this.hero = hero;
    font = createFont("PressStart2P-Regular.ttf", TEXTSIZE);
    textFont(font);
  }


  void draw() {
   fill(255,255,255);
   text(" -*- Space Blaster -*- ", 300, 15); 
    for (int i = 0; i < hero.getHp(); i++) {
      fill(0,255,0);
      stroke(0,255,0);
      //rechtecke zeichnen mit jeweils 15 pixeln bstand von x/y
      rect(5 + i*15 ,5,10,10);
    }
  }
}
class Laser {

  private final int LASER_SPEED = 4;
  private HeroShip hero;
  private int hp;
  private int x;
  private int y;
  private final int WIDTH = 7;
  private final int HEIGHT= 3;

  public Laser(HeroShip hero) {
    this.hero = hero;
    hp = 1;
    x = hero.getCenterX()+ hero.getWidth()/2;
    y = hero.getCenterY()- HEIGHT/2;
  }

  void draw() {
    move();
    stroke(228,0,88);
    fill(228, 0, 88);
    rect(x, y, WIDTH, HEIGHT);
  }

  void move() {
    x += LASER_SPEED; 
    if( x > width){
      hp = 0;
      System.out.println("Laser entfernt");
    }
  }

  boolean collide(int enemyX, int enemyY, int enemyWidth, int enemyHeight) {
    if (enemyX <= x + WIDTH && enemyX + enemyWidth >= x && enemyY <= y + HEIGHT && enemyY + enemyHeight >= y) {
      return true;
    } else {
      return false;
    }
  }

  public void reduceHp() {
    hp--;
  }

  public int getHp() {
    return hp;
  }
}
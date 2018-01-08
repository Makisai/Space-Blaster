import java.util.Iterator;
import ddf.minim.*;


class Level {
  
  private int score;

  private Minim minim;
  private AudioPlayer music;
  
  private ArrayList<Enemy> baddies;
  private HeroShip hero;
  private ArrayList<Laser> eduard;
  private 

  public Level(HeroShip hero,SpaceGame game) {
    score = 0;    
    
    //Hintergrundmusik
    minim = new Minim (game);
    music = minim.loadFile ("science_blaster.mp3");
    music.play();
    
    this.hero = hero;
    eduard = new ArrayList<Laser>();
    
    baddies = new ArrayList<Enemy>();
    baddies.add(new Enemy(width + 100, 25, 3, 1));
    baddies.add(new Enemy(width + 150, 50, 3, 2));
    baddies.add(new Enemy(width + 200, 75, 3, 3));
    baddies.add(new Enemy(width + 300, 150, 3, 1));
    baddies.add(new Enemy(width + 350, 125, 3, 1));
    baddies.add(new Enemy(width + 400, 100, 3, 1));
    baddies.add(new Enemy(width + 700, 50, 3, 2));
    baddies.add(new Enemy(width + 700, 100, 3, 2));
    baddies.add(new Enemy(width + 900, 175, 3, 1));
  }

  void draw() {
    for (Laser l : eduard) {
      l.draw();
    }
    //schleife läuft solange noch elemente e(neue temporäre variable -- wie i in normaler for schleife) vom typ Enemy in der liste baddies sind
    for (Enemy e : baddies) {
      //Draw aus der enemyklasse wird aufgerufen
      e.draw();
      if (hero.collide(e.getX(), e.getY(), e.getX2(), e.getY2())) {
        e.setHp(0);
        hero.reduceHp();
      }
      for (Laser l : eduard) {
        if (l.collide(e.getX(), e.getY(), e.getX2(), e.getY2())) {
          //wenn der "aktulle" laser mit dem "aktuellen" gegner kollidiert reduziere die HP um 1
          e.setHp(e.getHp() - 1);
          l.reduceHp();
          score += 5;
        }
      }
    }
    // cleanup methode, die alle sachen mit null leben löscht
    cleanUp();
  }

  void addLaser() {
    eduard.add(new Laser(hero));
  }

  void cleanUp() {
    Iterator<Enemy> i1 = baddies.iterator();
    while (i1.hasNext()) {
      //gibt enemy an der stelle i zurück
      Enemy e = i1.next();
      if (e.getHp() <= 0) {
        i1.remove();
      }

      Iterator<Laser> i2 = eduard.iterator();
      while (i2.hasNext()) {
        //gibt laser an der stelle i zurück
        Laser l = i2.next();
        if (l.getHp() <= 0) {
          i2.remove();
        }
      }
    }
  }
}
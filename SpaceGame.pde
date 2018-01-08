public static final int STATE_MENU = 0;
public static final int STATE_GAME = 1;
public static final int STATE_END = 2;

private int state;
private Starfield theField;
private HeroShip heroShip;
private Level l1;
private HUD hud;
private Menu menu;

void setup() {
  size(860, 240);

  state = STATE_MENU;

  theField = new Starfield( 100 );

  PImage heroImage = loadImage("shippybig.png");
  heroShip = new HeroShip (100, height/2, 5, heroImage);

  //übergeben vom hier erzeughten Hero Ship an die Level Klasse und die SpaceGame klasse selbst für die Musik
  l1 = new Level(heroShip, this);

  hud = new HUD(heroShip);

  menu = new Menu();

  frameRate( 35 );
  smooth();
}

void draw() {
  background(0);
  switch (state) {
  case STATE_MENU:
    menu.draw();
    break;
  case STATE_GAME:
    theField.draw();
    heroShip.draw();
    l1.draw();
    hud.draw();
    break;
  }
}

//Listener - wird aufgerufen, wenn Taste gedrückt wird
void keyTyped() {
  switch (state) {
  case STATE_MENU:
    if (key == ' ') {
      setState(STATE_GAME);
    }
    break;
  case STATE_GAME:
    //feuert wenn gedrückte Taste der angegebene Character ist
    if (key == ' ') {
      l1.addLaser();
    }
    break;
  }
}

//Listener
void keyPressed() {
  if (keyCode == UP) {
    heroShip.up();
  } else if (keyCode == DOWN) {
    heroShip.down();
  }
}


public void setState(int currentState) {
  state = currentState;
}
class Menu {

  private PImage menuImage;

  public Menu() {
    this.menuImage = loadImage("start.png");
  }

  void draw() {
    image(menuImage, 0, 0, width, height);
  }
}
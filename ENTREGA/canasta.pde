class Canasta {
  float posY;
  float posX;
  PImage img;
  Canasta() {
    posY= height-60;
    img = loadImage("images/canasta.png");
  }

  void dibujarcanasta(float x) {
    posX = x;
    image(img, posX, posY);
    println(posX + " / " + posY );
  }
}

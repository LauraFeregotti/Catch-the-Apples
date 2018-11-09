class Manzanapasada{
  float posX;
  float posY;
  PImage imagen2;
  
 Manzanapasada(){
   imagen2= loadImage("images/manzanapasada.png");
   posX=(int(random(0, 8)) * 60 ) + 60/2;
   posY = random(-1000, -3000);
 }
 void dibujarmanzanapasada(){
   
  image(imagen2,posX,posY); 
   
 }
 
  void movermanzanaspasadas(float vel) {
    posY=posY+ vel;

    if ( posY > height+60/2 ) {
      posY = random(-1000, -3000);
      posX = (int(random(0, 10)) * 60 ) + 60/2;
    }
  }
}

class Manzanabuena{
  
  float posX;
  float posY;
  PImage imagen;
 Manzanabuena(){
   imagen= loadImage("images/Manzana.png");
   posX= (int(random(0, 10)) * 60 ) + 60/2;
   posY= random(-100, -2000);
   
 }
 void dibujarmanzanabuena(){
  image(imagen, posX, posY); 
   
 }
 
 void caermanzanabuena(float vel){
     posY= posY+ vel;
 if ( posY > height + 60 ) { 
      posX= (int(random(0, 10)) * 60 ) + 60/2;
      posY = random(-100, -2000);
      vel=(random(2,4));
    }
 }
  
}

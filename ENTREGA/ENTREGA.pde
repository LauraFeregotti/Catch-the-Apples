Juego j;
void setup(){
size(600,600);
j= new Juego(20000);
fill(0);
textSize(50);

}

void draw(){
background(0);
j.jugar();
/*j.colisionbuena();
j.colisionmala();
j.colisionmala2();
j.colisionbuena2();*/
}

void mousePressed()
{
 j.mousePressed(); 
}
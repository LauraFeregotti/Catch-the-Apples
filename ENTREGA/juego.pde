class Juego {
  Contador puntaje;
  PImage menu7;
  PImage instruc;
  PImage fondo2;
  PImage fondo;
  PImage imagen3;
  String estado;
  int t_base;  
  int t_cant; 
  int time = 0;
  int cant= 20;
  int puntos;
  Canasta c;

  Manzanabuena [] m= new Manzanabuena[cant];
  Manzanapasada [] p= new Manzanapasada[cant-15];

  Manzanabuena[] m2= new Manzanabuena[cant-10];
  Manzanapasada[] p2= new Manzanapasada[cant];



  Juego(int tc) 
  {
    menu7=loadImage("images/menu7.jpg");
    puntos=0;
    fondo2=loadImage("images/fondo.jpg");
    fondo=loadImage("images/fondo2.jpg");
    puntaje= new Contador();
    imagen3= loadImage("images/menu3.png");

    instruc = loadImage("images/intro6.jpg");


    //t_base = millis();  
    t_cant = tc;
    c = new Canasta(); 
    for ( int i = 0; i<cant; i++ ) {
      m[i] = new Manzanabuena();
    }
    for ( int i = 0; i<cant-15; i++ ) {
      p[i] = new Manzanapasada();
    }
    for ( int i = 0; i<cant-10; i++ ) {
      m2[i] = new Manzanabuena();
    }
    for ( int i = 0; i<cant; i++ ) {
      p2[i] = new Manzanapasada();
    }

    estado= "menu";
  }

  void jugar() {

    if ( estado.equals("menu") ) {
      image(menu7, 0, 0);

      /*if (mousePressed && estado== "menu") estado = "instrucciones";*/
    } else if  ( estado.equals("instrucciones") ) {
      background(0);
      image(instruc, 0, 0);
      /*if (mousePressed) estado = "jugando";*/

      t_base = millis();
    } else if  ( estado.equals("jugando") ) {
      image(fondo, 0, 0);
      fill(0);
      textSize(40);
      text("Nivel 1", 20, 100);
      time = (t_base + t_cant) - millis();
      if ( time >= 0 ) {
        text(time/1000, height-60, 100);
      }
      fill(255);
      text("Puntaje"+ puntos, 20, 50);
      c.dibujarcanasta(mouseX); 
      for ( int i = 0; i<cant; i++ ) {
        m[i].dibujarmanzanabuena();
        m[i].caermanzanabuena(random(0.5, 5));
      }

      for ( int i = 0; i<cant-15; i++ ) 
      {
        p[i].dibujarmanzanapasada();
        p[i].movermanzanaspasadas(random(5, 10));
      }

      colisionbuena();
      colisionmala();


      if (puntos <30 && time<=0) {
        estado="perdiste";
      } else if (puntos >=30 /*&& time<=0*/){
        estado= "nivel2";
        /*println("Pasando al nivel 2");*/
        t_base = millis();

        for ( int i = 0; i<cant-10; i++ ) {
          m2[i] = new Manzanabuena();
        }
        for ( int i = 0; i<cant; i++ ) {
          p2[i] = new Manzanapasada();
        }
      }
    } else if  ( estado.equals("nivel2") ) {
      image(fondo2, 0, 0);
      text("Nivel 2", 0, 100);

      time = (t_base + t_cant) - millis();

      if ( time >= 0 ) {
        text(time/1000, height-60, 100);
      }/* else 
       {
       if (estado=="nivel2") 
       {
       t_base = millis();
       t_cant = 20000;
       }
       }*/

      fill(255);
      text("Puntaje "+ puntos, 20, 50); /* espacio */
      c.dibujarcanasta(mouseX); 
      for ( int i = 0; i<cant-10; i++ ) {
        m2[i].dibujarmanzanabuena();
        m2[i].caermanzanabuena(random(0.5, 5));
      }

      for ( int i = 0; i<cant; i++ ) {
        p2[i].dibujarmanzanapasada();
        p2[i].movermanzanaspasadas(random(8, 10));
      }

      colisionbuena2();
      colisionmala2();

      if (puntos <60 && time<=0) {
        estado="perdiste";
      } else if (puntos >=60 /*&& time<=0 && estado=="nivel2"*/) {
        estado= "ganaste";
      }
    } else if  ( estado.equals("perdiste") ) {
      background(0);
      fill(184, 201, 148);
      textSize(70);
      text("PERDISTE!", width/2-150, height/2-100);
      textSize(30);
      fill(189, 24, 41);
      text("haz click para reiniciar", width-450, height-300);
      /*if (mousePressed) estado="menu";*/
    } else if ( estado.equals("ganaste") ) {
      background(0);
      fill(184, 201, 148);
      textSize(70);
      text("GANASTE!", width/2-150, height/2-100);
      textSize(30);
      fill(189, 24, 41);
      text("haz click para reiniciar", width-500, height-300);
      /*if (mousePressed) estado="menu";*/
    }
  }

  void mousePressed()
  {
    if ( estado.equals("menu") ) {
      estado = "instrucciones";
    } else if  ( estado.equals("instrucciones") ) {
      estado = "jugando";
    } else if ( estado.equals("perdiste") ||  estado.equals("ganaste") ){
      estado = "menu";
    }
  }

  /*void colisiones()
   {
   if( estado.equals("jugando") )
   {
   colisionbuena();
   colisionmala();
   }
   else if( estado.equals("nivel2") )
   {
   colisionbuena2();
   colisionmala2();
   }
   
   }*/

  void colisionbuena() {

    for ( int i = 0; i<m.length; i++ ) {
      if ( dist(c.posX, c.posY, m[i].posX, m[i].posY) < 100 ) {
        puntos++;
        m[i].posX=(int(random(0, 10)) * 60 ) + 60/2;
        m[i].posY= random(-100, 0);
      }
    }
  }
  void colisionmala() {
    for ( int i = 0; i<p.length; i++ ) {
      if ( dist(c.posX, c.posY, p[i].posX, p[i].posY) < 60 ) {

        puntos--;
        p[i].posX=(int(random(0, 10)) * 60 ) + 60/2;
        p[i].posY= random(-100, 0);
      }
    }
  }


  void colisionmala2() {
    for ( int i = 0; i<p2.length; i++ ) {
      if ( dist(c.posX, c.posY, p2[i].posX, p2[i].posY) < 60 ) {

        puntos--;
        p2[i].posX=(int(random(0, 10)) * 60 ) + 60/2;
        p2[i].posY= random(-100, 0);
      }
    }
  }


  void colisionbuena2() {
    for ( int i = 0; i<m2.length; i++ ) {
      if ( dist(c.posX, c.posY, m2[i].posX, m2[i].posY) < 60 ) {
        puntos++;
        m2[i].posX=(int(random(0, 10)) * 60 ) + 60/2;
        m2[i].posY= random(-100, 0);
      }
    }
  }
}

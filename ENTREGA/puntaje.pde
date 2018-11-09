class Contador {
  int tam;
  int puntos;

  Contador() {
    tam=60;
    puntos=0;
  }

  void dibujar() {
    fill(255);
    text("Puntaje"+ puntos, 20, 50);
  }
}
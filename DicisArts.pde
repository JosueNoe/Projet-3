Maestro Benjamin;
Maestro ReyesEspino;
Maestro Zarate;
Maestro SiuYi;
Maestro Cordi;

int Mono = 0;
int Mono1 = -1;
int Mono2 = -1;
int qx = 0;
int qy = 0;
int M1x = 10;
int M1y = 250;
int M2x = 450;
int M2y = 0;
int xataque=0;
int yataque = 50;
int xvida = 550;
int yvida = 10;
int pantalla = 0;
int turno = 1;
String Elemento[] = {"Edicion","Programacion","Esteroides","Cine","Tesis"};

//Dibujos
PImage BenjaminFoto;
PImage EspinoFoto;
PImage ZarateFoto;
PImage SiuyiFoto;
PImage CordiFoto;

//Nombre, vida, ataque, defensa, elemento, dibujo
 void setup(){
   
   size(1000,750);
   background(0);
  BenjaminFoto = loadImage("1.png");
  EspinoFoto = loadImage("2.png");
  CordiFoto = loadImage("5.png");
  ZarateFoto = loadImage("3.png");
  SiuyiFoto = loadImage("4.png");
  
  Benjamin = new Maestro("Benjamin", 100, 10, 15, 2, 0);
  ReyesEspino = new Maestro("Reyes Espino", 100, 18, 20, 4, 1);
  Zarate = new Maestro("Zarate", 100,19,17,5,2);
  SiuYi = new Maestro("Siu Yi", 100, 14, 12,1,3);
  Cordi = new Maestro("Victor", 100, 20,19,3,4);
  
}

void draw(){
  if(pantalla == 0)
    {
      if(key==0)
      {
        background(0);
        fill(191,random(255),0);
        textSize(30);
        text("Presione ESPACE para Continuar", 250, 400);
        inicio();
      }
      else
      {
        key=0;
        pantalla=1;
      }
    }
    if(pantalla==1)
    {
      background(243,93,208);
      fill(242,random(100),205);
      rect(qx,qy,200,750);
      
      textSize(40); 
      fill(128,247,243);
      text("Seleccione Personaje N y M \nSeleccionando con ENTER\nAtaque Letra a",200, 400);
      Benjamin.Dibujar(0,-50,0,0);
      ReyesEspino.Dibujar(1,200,0,0);
      Zarate.Dibujar(2,200,-10,0);
      SiuYi.Dibujar(3,200,0,0);
      Cordi.Dibujar(4,150,-5,0);
      
    }
    
    if(pantalla==2){
      background(185,random(100),242);
      Benjamin.Dibujarvida();
      ReyesEspino.Dibujarvida();
      Benjamin.Dibujar(Mono1,M1x,M1y,1);
      ReyesEspino.Dibujar(Mono2,M2x,M2y,2);
      if(ReyesEspino.vida>0 && Benjamin.vida>0){
        if(key=='a'){
          if(turno==1) Benjamin.ataque1();
          if(turno==2) ReyesEspino.ataque1();
         }
        if(key=='s')
        {
          if(turno==1) Benjamin.ataque2();
          if(turno==2) ReyesEspino.ataque2();
        }
        if(key=='d')
        {
          if(turno==1) Benjamin.ataque3();
          if(turno==2) ReyesEspino.ataque3();
        }
      }
      
      if(Benjamin.vida<=0){
        textSize(32); 
        fill(191,random(255),0);
        text("Game Over \nWIN JUGADOR 2 \nNUEVA PARTIDA R", -250, -100);
      }
      if(ReyesEspino.vida<=0){
        textSize(32); 
        fill(191,random(255),0);
        text("Game Over \nWIN JUGADOR 1 \nNUEVA PARTIDA R", -250, -100);
      }
    }
}

class Maestro 
{
  String nombre;
  int vida;
  int ataque;
  int defensa;
  int elemento;
  int dibujo;
  int Jugador;
  
  Maestro(String nombre_, int vida_, int ataque_,int defensa_, int elemento_, int dibujo_)
  {
    nombre = nombre_;
    vida = vida_;
    ataque = ataque_;
    defensa = defensa_;
    elemento = elemento_;
    dibujo = dibujo_;
  }

void Dibujar(int dibujo_,int x,int y, int jugador)
{
  Jugador=jugador;
  translate(x,y);
  switch(dibujo_){
   case 0: // Benjamin
    //translate(x,y); 
    image(BenjaminFoto,50,0);
   break;
   
   case 1: //ReyesEspino
   //translate(200,0);
   image(EspinoFoto,50,30);
    
   break;
   
   case 2://Zarate
   //translate(200,30);
   image(ZarateFoto,50,50);
  
  break;
  
  case 3: //Siu Yi
  //translate (200,20);
   image(SiuyiFoto,50,10);
  
  break;
  
  case 4: //el cordi
  
  image(CordiFoto,90,30);
  
  break;
   
    }//switch
  }//Dibujar
  
  void Dibujarvida()
  {
    int ps=vida;//ps=puntos de salud
    if(Jugador==1)
    {
      fill(random(1255),255,0);
      rect(10,10,ps*4,50);
    }
    if(Jugador==2)
    {
      fill(random(255),255,0);
      rect(xvida,yvida,ps*4,50);
    }
  }
  
  void ataque1()
  {
    int y=(int)random(110);
    int r=(int)random(100);
    int danio=12;        
    int critico = (int)random(100);
    if(critico>=0 && critico<=30) danio=(int)(1.5*danio);
   
    //jugador 1 Ataque
    if(Jugador==1){
      fill(random(255),50,100);
      ellipse(xataque-700, 50, r, r);
      xataque = xataque+5;
      
      if(xataque==800){
        xvida=xvida+ danio*5;
        ReyesEspino.vida=ReyesEspino.vida-danio;
        xataque = 0;
        turno=2;
        key = 0;
      }
    }
    
    //jugador 2 Ataque
    if(Jugador==2){
      fill(random(255),50,100);
      rect(xataque, 50, r, r);
      xataque = xataque-5;
      
      if(xataque==-300){
        key = 0;
        turno=1;
        Benjamin.vida=Benjamin.vida-danio;
        xataque = 0;
      }
    }
  }
  
  void ataque2()
  {
    int danio=16;        
    int critico = (int)random(100);
    if(critico>=0 && critico<=20) danio=(int)(1.5*danio);
    fill(50, random(255),100);
    int y1,y2,y3;
    y1=(int)random(25);
    y2=(int)random(25);
    y3=(int)random(25);
    
    //Ataque 2 jugador 1
    if(Jugador==1)
    {
      triangle(xataque-700,50+y1,xataque -750,50+y2,xataque-600,50+y3);
      //triangle(-700,50,-800,60,-750,70);
      xataque = xataque + 5;
      if(xataque==750)
      {
        xvida=xvida + danio*5;
        key=0;
        turno=2;
        Benjamin.vida=Benjamin.vida - danio;
        xataque = 0;
      }
    }
    //______________ataque 2 jugador 2
    if(Jugador==2)
    {
      triangle(xataque,50-y1,xataque-50,50-y2,xataque+30,50-y3);
      //triangle(0,50,10,60,50,70);
      xataque = xataque - 5;
      if(xataque==-700)
      {
        key=0;
        turno=1;
        ReyesEspino.vida=ReyesEspino.vida-danio;
        xataque = 0;
      }
    }
  }
  void ataque3()
  {
    int y=(int)random(30);
    int r=(int)random(30);
    
    int danio=20;        
    int critico = (int)random(100);
    if(critico>=0 && critico<=10) danio=(int)(1.5*danio);
    //Ataque 3 jugador 1
    if(Jugador==1)
    {
      fill(50,100,random(255));
      ellipse(xataque-700, 50+y, r+60, r);
      xataque = xataque+5;
      if(xataque==1000)
      {
        key=0;
        turno=2;
        xvida=xvida+danio*5;
        Benjamin.vida=Benjamin.vida-danio;
        xataque = 0;
      }
    }
    //Ataque 3 Jugador 2
    if(Jugador==2)
    {
      fill(50,100,random(255));
      ellipse(xataque, 50-y, r+60, r);
      xataque = xataque-5;
      if(xataque==-700)
      { 
        key=0;
        turno=1;
        ReyesEspino.vida=ReyesEspino.vida-danio;
        xataque = 0;
      }
    }
  
  }
}//Clase


void inicio(){
  fill(155,95,240);
  noStroke(); 
}

void keyPressed(){
  if(pantalla==1)
  {
    if(Mono >=0 && Mono<=4)
    {
      if(key=='m')
      {
        if(Mono==4) return;
        qx=qx+200;
        Mono = Mono+1;
        key=0;
      }
      if(key=='n')
      {
        if(Mono==0) return;
        qx=qx-200;
        Mono = Mono-1;
        key=0;
      }
      if(Mono1==-1)
      {
        if(key=='\n')
        {
          Mono1 = Mono;
          Mono2 = -2;
          Mono = 0;
          qx = 0;
          qy = 0;
          key = 0;          
        }
      }
      if(Mono2==-2)
      {       
        if(key=='\n')
        {
          Mono2 = Mono;
          Mono = 0;
          qx = 0;
          qy = 0;
          key = 0;  
          pantalla = 2;
        }
      }

    }
  }
  if(pantalla==2)
  {
    if(ReyesEspino.vida<=0 || Benjamin.vida<=0)
    {
      if(key=='r')
      {
        pantalla=0;
        
      }
    }
  }
}


import controlP5.*;

ControlP5 cp5;

JSONObject json_db;

PFont font_oro;
PFont font_fiat;
PFont font_cripto;

PImage img_oro_inicio;
PImage img_fiat_inicio;
PImage img_cripto_inicio;


String intro_mercancia;
String intro_fiat;
String intro_cripto;


//canvas vars
    int ancho; 
    int x_1; 
    int x_2; 
    int x_3; 
    int x_4; 
    int altura_img_inicio; 



void setup() {
  surface.setTitle("Lord of the Coins"); 
  size(1700,975);
  loadData();
  
  //canvas setup
  
  cp5 = new ControlP5(this);
  
    ancho = width/3;
    x_1 = 0;
    x_2 = x_1+ancho;
    x_3 = x_2+ancho;
    x_4 = x_3+ancho;
    altura_img_inicio = height-400;
  
  
  //data setup
  
  JSONObject d_mercancia = json_db.getJSONObject("D-mercancia");
   intro_mercancia = d_mercancia.getString("INTRO");
   intro_mercancia = fix_line(intro_mercancia);
  println("HOLAA: "+intro_mercancia);
  
  JSONObject d_fiat = json_db.getJSONObject("D-fiat");
   intro_fiat = d_fiat.getString("INTRO");
   intro_fiat = fix_line(intro_fiat);
  println("HOLAA: "+intro_fiat);
  
  JSONObject d_cripto = json_db.getJSONObject("D-crypto");
   intro_cripto = d_cripto.getString("INTRO");
   intro_cripto = fix_line(intro_cripto);
  println("HOLAA: "+intro_cripto);
  
  
  /// prepare initial controls
  PImage[] imgs = {img_oro_inicio,img_oro_inicio,img_oro_inicio};
  cp5.addButton("elijo_oro")
     .setValue(1)
     .setPosition(140,300)
     //.setPosition(img_oro_inicio, x_1, 0, ancho, altura_img_inicio)
     .setImages(imgs)
     .updateSize()
     .hide()
     ;
     
  
  
  
}

void loadData(){
  json_db = loadJSONObject("model/DB.json");
  
  // set presentation parameters
  font_oro = createFont("fonts/Italianno/Italianno-Regular.ttf",24);
  font_fiat = createFont("fonts/Cinzel/Cinzel-VariableFont_wght.ttf",17);
  font_cripto = createFont("fonts/Turret_Road/TurretRoad-Regular.ttf",17);
  
  img_oro_inicio = loadImage ( "images/oro_basic.png");
  img_fiat_inicio = loadImage ( "images/fiat_basic.png");
  img_cripto_inicio = loadImage ( "images/cripto_basic.png");
    
}

// text tuning functions
String fix_line(String my_line){
  //my_line = join (my_line.split("(?<=\\G.{55})"),"\n");
  my_line =  my_line.replace(".",".\n")
                    .replace("?","?\n")
                    .replace("!","!\n")
                    .replace(",",",\n")
                    .replace("  ","\n")
                    .replace("\n\n","\n")
                    .replace("-","\n")
                    .replace("!!","!");  
 return my_line; 
}



//mouse functions:
/*
boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void update(int x, int y) {
if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
  } else {
    rectOver = false;
  }
}
*/

void draw(){
  //update(mouseX, mouseY);
  background(255);
  noStroke();
  fill(0);
  textFont(font_oro);
  text(intro_mercancia, 20, 700);
  
  textFont(font_fiat);
  text(intro_fiat, 550, 700);
  
  textFont(font_cripto);
  text(intro_cripto, 1200, 700);
  
  

  
 
  
    img_oro_inicio.resize(ancho, altura_img_inicio);
    img_fiat_inicio.resize(ancho, altura_img_inicio);
    img_cripto_inicio.resize(ancho, altura_img_inicio);
  
  
     //oro canvas
  
  image (img_oro_inicio, x_1, 0, ancho, altura_img_inicio);
  
   //fiat canvas
  
  image (img_fiat_inicio, x_2, 0, ancho, altura_img_inicio);
  
  
    // cripto canvas
  
  image (img_cripto_inicio, x_3, 0, ancho, altura_img_inicio);
  
  
  
}


public void controlEvent(ControlEvent theEvent) {
  println("CONTROL EVENT: "+theEvent.getController().getName());
}

public void elijo_oro(int theValue) {
  println("a button event from a button: "+theValue);

}

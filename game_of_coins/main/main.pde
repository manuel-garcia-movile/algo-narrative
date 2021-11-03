/**

Lord of the money es un juego experimental donde
@Sr. Blacksun (Programador)
@Especulativo (Filosofo)
@Exon Stigmata (Artista grafico)

exploran la narrativa de tres formas de dinero: 
El dinero mercancia (Metales preciosos)
El dinero fiat (Dinero creado por el gobierno basado en deuda)
El cripto dinero

**/

import controlP5.*;

ControlP5 cp5;

JSONObject json_db;

PFont font_oro;
PFont font_fiat;
PFont font_cripto;

PImage img_oro_inicio;
PImage img_fiat_inicio;
PImage img_cripto_inicio;

PImage img_oro_final;
PImage img_fiat_final;
PImage img_cripto_final;


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
    
Textlabel textlabelIntro_oro;
Textlabel textlabelIntro_fiat;
Textlabel textlabelIntro_cripto;
Textlabel textlabel_problem;

JSONObject current_problem = null;


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
    
   img_oro_inicio.resize(ancho, altura_img_inicio);
   img_fiat_inicio.resize(ancho, altura_img_inicio);
   img_cripto_inicio.resize(ancho, altura_img_inicio);
    
    
  PImage[] imgs = {img_oro_inicio,img_oro_inicio,img_oro_inicio};
  cp5.addButton("elijo_oro")
     .setValue(1)
     .setPosition(0,0) //140,300
     .setImages(imgs)
     .updateSize()
     //.hide()
     ;
     
     
  PImage[] imgs_fiat_btn = {img_fiat_inicio,img_fiat_inicio,img_fiat_inicio};
  cp5.addButton("elijo_fiat")
     .setValue(2)
     .setPosition(ancho,0) //140,300
     .setImages(imgs_fiat_btn)
     .updateSize()
     //.hide()
     ;   
     
  PImage[] imgs_cripto_btn = {img_cripto_inicio,img_cripto_inicio,img_cripto_inicio};
  cp5.addButton("elijo_cripto")
     .setValue(3)
     .setPosition(ancho*2,0) //140,300
     .setImages(imgs_cripto_btn)
     .updateSize()
     //.hide()
     ;     

  
  textlabelIntro_oro = cp5.addTextlabel("label_intro_oro")
                    .setText(intro_mercancia)
                    .setPosition(20,600)
                    .setColorValue(0x00000000) // amarillo 0xffffff00
                    .setFont(font_oro);
                    
  textlabelIntro_oro.draw(this);  
  
  textlabelIntro_fiat = cp5.addTextlabel("label_intro_fiat")
                    .setText(intro_fiat)
                    .setPosition(550,600)
                    .setColorValue(0x00000000) // amarillo 0xffffff00
                    .setFont(font_fiat);
                    
  textlabelIntro_fiat.draw(this);   
  
  
  textlabelIntro_cripto = cp5.addTextlabel("label_intro_cripto")
                    .setText(intro_cripto)
                    .setPosition(1200,600)
                    .setColorValue(0x00000000) // amarillo 0xffffff00
                    .setFont(font_cripto);
                    
  textlabelIntro_cripto.draw(this); 
  
  
  
}

void loadData(){
  json_db = loadJSONObject("model/DB.json");
  
  // set presentation parameters
  font_oro = createFont("fonts/Italianno/Italianno-Regular.ttf",33);
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
                    .replace(":",":\n")
                    .replace("…","...\n")
                    .replace("  ","\n")
                    .replace("\n\n","\n")
                    .replace("-","\n")
                    .replace("!!","!");  
 return my_line; 
}





void draw(){
  //update(mouseX, mouseY);
  background(255);
  noStroke();
  fill(0);
}

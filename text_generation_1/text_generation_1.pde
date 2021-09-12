/*
  text_generation_1, by 220  (2021@Kant)
  Michael Scott's Markov based meme generator
  Code distributed under MIT license
  Michael Scott images, character and show dialog property of NBCUniversal
  Please provide credit where it is due
  
  2-2-0.online
  github.com/2-2-0

  Algorithmic narrative lab resource
  Markov meme generator
  
  Features and methods:
  - Creation of text based on actual show dialog
  - Uses Markov/n-grams to predict new text
 */


import rita.*;

import java.util.HashMap;
import java.util.Map;

RiMarkov rm;
RiMarkov rm_fiat;
RiMarkov rm_cripto;
PImage [] images;
PImage [] images_fiat;
PImage [] images_cripto;


PShape [] shapes_oro;
PShape [] shapes_fiat;
PShape [] shapes_cripto;


PImage img;
String line;
PShape shape_oro;
PGraphics pg_oro;

PImage img_fiat;
String line_fiat;
PShape shape_fiat;
PGraphics pg_fiat;

PImage img_cripto;
String line_cripto;
PShape shape_cripto;
PGraphics pg_cripto;

PFont font;


/// ke comience el du du du duelo!

class Attack{

  public String linea;
  public int ethos_attack;
  public int pathos_attack;
  public int logos_attack;
  
}

class Memero{

  public String nombre;
  public int ethos_level=10;
  public int pathos_level=10;
  public int logos_level=10;
  Boolean still_Alive=true;
    
}

Map<String, Attack> ataques_turno;
Memero memero_oro = new Memero();
Memero memero_fiat = new Memero();
Memero memero_cripto = new Memero();

// the more you try to be free, the more restraints you confront
void setup () {
  
 

memero_oro.nombre="Memero del Oro";
memero_fiat.nombre="Memero del Fiat";
memero_cripto.nombre="Memero del Cripto";
  
  
  
  
  size (1850, 675); //1200,675
  // set Markov engine and load Michael's show's dialog lines into it
  rm = RiTa.markov (3);
  rm.addText (join (loadStrings ("/home/manuel/taller_narrativas/mis_codigos/algo-narrative/text_generation_1/data/quotes_oro_es.txt"), ""));
  
  rm_fiat = RiTa.markov (3);
  rm_fiat.addText (join (loadStrings ("/home/manuel/taller_narrativas/mis_codigos/algo-narrative/text_generation_1/data/quotes_fiat_es.txt"), ""));
  
  rm_cripto = RiTa.markov (3);
  rm_cripto.addText (join (loadStrings ("/home/manuel/taller_narrativas/mis_codigos/algo-narrative/text_generation_1/data/quotes_cripto_es.txt"), ""));
  
  // load images
  images = new PImage [8];
  images_fiat = new PImage [8];
  images_cripto = new PImage [8];
  for (int i=0; i<images.length; i++) {
    images [i] = loadImage ( "oro_"+(i+1)+".jpg");
    images_fiat [i] = loadImage ( "fiat_"+(i+1)+".jpg");
    images_cripto [i] = loadImage ( "cripto_"+(i+1)+".jpg");    
  }
  
  // set presentation parameters
  font = loadFont ("Impact-52.vlw");
  textFont (font, 24);// font 52
  textAlign (CENTER, BOTTOM);
  noStroke ();
  
  // produce first meme!
  generate ();
}
// no matter how hard, sometimes things seem impossible to free yourself...
void draw () {

  background (0);
  
  
  int ancho = width/3;
  int x_1 = 0;
  int x_2 = x_1+ancho;
  int x_3 = x_2+ancho;
  int x_4 = x_3+ancho;
  
 
  
    img.resize(ancho, height);
    img_fiat.resize(ancho, height);
    img_cripto.resize(ancho, height);
  
    int w_oro = img.width;
    int h_oro = img.height;
    int w_fiat = img_fiat.width;
    int h_fiat = img_fiat.height;
    int w_cripto = img_cripto.width;
    int h_cripto = img_cripto.height;

  
  image (img, x_1, 0, ancho, height);
  image (img_fiat, x_2, 0, ancho, height);
  image (img_cripto, x_3, 0, ancho, height);
  
  
  float x_oro_text = w_oro/2;//width * 0.25;
  
  textAlign(CENTER, BOTTOM);
  fill (0);
  text (line, x_oro_text+2, h_oro-18); //52,0 , w-100, w-18 x1 y1 x2 y2
  fill (255);
  text (line, x_oro_text, h_oro-20); //50,0 , w-100. w-20
  
  
  
  
  float x_fiat_text = x_3-(ancho/2);//width * 0.5;
  
  textAlign(CENTER, BOTTOM);
  fill (0);
  text (line_fiat, x_fiat_text+2, h_fiat-18); //52,0 , w-100, w-18 x1 y1 x2 y2
  fill (255);
  text (line_fiat, x_fiat_text, h_fiat-20); //50,0 , w-100. w-20
  
  
  float x_cripto_text = x_4-(ancho/2);//width * 0.5;
  
  textAlign(CENTER, BOTTOM);
  fill (0);
  text (line_cripto, x_cripto_text+2, h_cripto-18); //52,0 , w-100, w-18 x1 y1 x2 y2
  fill (255);
  text (line_cripto, x_cripto_text, h_cripto-20); //50,0 , w-100. w-20
  
}
// ...but obstacles are set only by yourself - you attach yourself to them!
Map <String,Attack> generate () {
  
  Map<String,Attack> ataques = new HashMap<String,Attack>();
  
  Attack ataque_oro = new Attack();
  // use RiTa's Markov to produce a new line
  line = join (rm.generate (1), "\n");
  line = join (line.split("(?<=\\G.{60})"),"\n");
  line =  line.replace(".",".\n").replace("?","?\n").replace("!","!\n").replace(",",",\n").replace("!!","!");
  //line = join (line.split("(?<=\\G.{60})"),"\n");
  
  ataque_oro.linea = line;
  ataque_oro.ethos_attack = (int)random (0, 2);
  ataque_oro.pathos_attack = (int)random (0, 2);
  ataque_oro.logos_attack = (int)random (0, 2);
  
  ataques.put("ataque_oro",ataque_oro);
  
  Attack ataque_fiat = new Attack();
  
  line_fiat = join (rm_fiat.generate (1), "\n");
  line_fiat = join (line_fiat.split("(?<=\\G.{60})"),"\n");
  line_fiat =  line_fiat.replace(".",".\n").replace("?","?\n").replace("!","!\n").replace(",",",\n").replace("!!","!");
  
  ataque_fiat.linea = line_fiat;
  ataque_fiat.ethos_attack = (int)random (0, 2);
  ataque_fiat.pathos_attack = (int)random (0, 2);
  ataque_fiat.logos_attack = (int)random (0, 2);
  
  ataques.put("ataque_fiat",ataque_fiat);
  
  Attack ataque_cripto = new Attack();
  
  line_cripto = join (rm_cripto.generate (1), "\n");
  line_cripto = join (line_cripto.split("(?<=\\G.{60})"),"\n");
  line_cripto =  line_cripto.replace(".",".\n").replace("?","?\n").replace("!","!\n").replace(",",",\n").replace("!!","!");
  
  ataque_cripto.linea = line_cripto;
  ataque_cripto.ethos_attack = (int)random (0, 2);
  ataque_cripto.pathos_attack = (int)random (0, 2);
  ataque_cripto.logos_attack = (int)random (0, 2);
  
  ataques.put("ataque_cripto",ataque_cripto);
  
  // pick any random image
  img = images [(int)random (0, images.length)];
  img_fiat = images_fiat [(int)random (0, images.length)];
  img_cripto = images_cripto [(int)random (0, images.length)];
  

  
  return ataques;
}
void keyTyped () {
  turno();
  //ataques_turno = generate ();
}
void mouseClicked () {
  turno();
  //ataques_turno = generate ();
}
// so, in order to be free, just BECOME free! Also 1517


void turno(){

    ataques_turno = generate ();
    
    Attack ataque_oro = ataques_turno.get("ataque_oro");
    Attack ataque_fiat = ataques_turno.get("ataque_fiat");
    Attack ataque_cripto = ataques_turno.get("ataque_cripto");
    
    // oro recibe ataque
    memero_oro.ethos_level = memero_oro.ethos_level - ataque_fiat.ethos_attack - ataque_cripto.ethos_attack;
    memero_oro.pathos_level = memero_oro.pathos_level - ataque_fiat.pathos_attack - ataque_cripto.pathos_attack;
    memero_oro.logos_level = memero_oro.logos_level - ataque_fiat.logos_attack - ataque_cripto.logos_attack;
    
    println("Memero Oro ante estos momoazos: Ethos="+memero_oro.ethos_level+" Pathos="+memero_oro.pathos_level+" Logos="+memero_oro.logos_level);
    regla_ethos(memero_oro);
    regla_pathos(memero_oro);
    regla_logos(memero_oro);
    
    
    // fiat recibe ataque
    memero_fiat.ethos_level = memero_fiat.ethos_level - ataque_oro.ethos_attack - ataque_cripto.ethos_attack;
    memero_fiat.pathos_level = memero_fiat.pathos_level - ataque_oro.pathos_attack - ataque_cripto.pathos_attack;
    memero_fiat.logos_level = memero_fiat.logos_level - ataque_oro.logos_attack - ataque_cripto.logos_attack;
    
    println("Memero Fiat ante estos momoazos: Ethos="+memero_fiat.ethos_level+" Pathos="+memero_fiat.pathos_level+" Logos="+memero_fiat.logos_level);
    regla_ethos(memero_fiat);
    regla_pathos(memero_fiat);
    regla_logos(memero_fiat);
    
    
    // cripto recibe ataque
    memero_cripto.ethos_level = memero_cripto.ethos_level - ataque_oro.ethos_attack - ataque_fiat.ethos_attack;
    memero_cripto.pathos_level = memero_cripto.pathos_level - ataque_oro.pathos_attack - ataque_fiat.pathos_attack;
    memero_cripto.logos_level = memero_cripto.logos_level - ataque_oro.logos_attack - ataque_fiat.logos_attack;
    
    println("Memero Cripto ante estos momoazos: Ethos="+memero_fiat.ethos_level+" Pathos="+memero_fiat.pathos_level+" Logos="+memero_fiat.logos_level);
    regla_ethos(memero_fiat);
    regla_pathos(memero_fiat);
    regla_logos(memero_fiat);
    


}


void regla_ethos(Memero memero){
  if(memero.ethos_level<=0){
    println(memero.nombre+" se siente ingnorante y promete investigar sobre el tema ( U_U) "); 
    memero.still_Alive=false;
  }
} 


void regla_pathos(Memero memero){
  if(memero.pathos_level<=0){
    println(memero.nombre+" ya se enojo y esta agrediendo ( >_< ) "); 
    memero.still_Alive=false;
  }
} 

void regla_logos(Memero memero){
  if(memero.logos_level<=0){
    println(memero.nombre+" se siente tonto. Pide disculpas por sus tonterias ( @_@) "); 
    memero.still_Alive=false;
  }
}

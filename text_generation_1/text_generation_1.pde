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

PImage img_final_ethos;
PImage img_final_pathos;
PImage img_final_logos;
PImage img_win_final;

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
  
  public String mood="";
  public String mood_ethos="";
  public String mood_pathos="";
  public String mood_logos="";
  public PImage badge_meme;
    
}

Map<String, Attack> ataques_turno;
Memero memero_oro = new Memero();
Memero memero_fiat = new Memero();
Memero memero_cripto = new Memero();

// the more you try to be free, the more restraints you confront
void setup () {
  
  surface.setTitle("Guerra de memes economicos"); 

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
  
  img_final_ethos = loadImage ( "ethos_final.jpg");
  img_final_pathos = loadImage ( "pathos_final.jpg");
  img_final_logos = loadImage ( "logos_final.jpg");
  img_win_final = loadImage ( "win_final.jpg");
  
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
    img_final_ethos.resize(ancho, height);
    img_final_pathos.resize(ancho, height);
    img_final_logos.resize(ancho, height);
    img_win_final.resize(ancho, height);
  
    int w_oro = img.width;
    int h_oro = img.height;
    int w_fiat = img_fiat.width;
    int h_fiat = img_fiat.height;
    int w_cripto = img_cripto.width;
    int h_cripto = img_cripto.height;

  
  regla_victoria();
  
  //oro canvas
  /*
  if(!memero_oro.still_Alive)
  {
    img = memero_oro.badge_meme;
    line = memero_oro.mood;
  }
  */
  
  image (img, x_1, 0, ancho, height);
  
  float x_oro_text = w_oro/2;//width * 0.25;
  
  textAlign(CENTER, BOTTOM);
  fill (0);
  text (line, x_oro_text+2, h_oro-18); //52,0 , w-100, w-18 x1 y1 x2 y2
  fill (255);
  text (line, x_oro_text, h_oro-20); //50,0 , w-100. w-20
  
  
  
  
  //fiat canvas
  /*
  if(!memero_fiat.still_Alive)
  {
    img_fiat = memero_fiat.badge_meme;
    line_fiat = memero_fiat.mood;
  }
  */
  
  image (img_fiat, x_2, 0, ancho, height);
  
  float x_fiat_text = x_3-(ancho/2);//width * 0.5;
  
  textAlign(CENTER, BOTTOM);
  fill (0);
  text (line_fiat, x_fiat_text+2, h_fiat-18); //52,0 , w-100, w-18 x1 y1 x2 y2
  fill (255);
  text (line_fiat, x_fiat_text, h_fiat-20); //50,0 , w-100. w-20
  
  
  
  
  // cripto canvas
  /*
  if(!memero_cripto.still_Alive)
  {
    img_cripto = memero_cripto.badge_meme;
    line_cripto = memero_cripto.mood;
  }
  
  */
  
  image (img_cripto, x_3, 0, ancho, height);
  
  float x_cripto_text = x_4-(ancho/2);//width * 0.5;
  
  textAlign(CENTER, BOTTOM);
  fill (0);
  text (line_cripto, x_cripto_text+2, h_cripto-18); //52,0 , w-100, w-18 x1 y1 x2 y2
  fill (255);
  text (line_cripto, x_cripto_text, h_cripto-20); //50,0 , w-100. w-20
  
  
  
  
  
}


void regla_victoria(){
 
  if(!memero_oro.still_Alive)
  {
    img = memero_oro.badge_meme;
    line = memero_oro.mood;
  }
  
   if(!memero_fiat.still_Alive)
  {
    img_fiat = memero_fiat.badge_meme;
    line_fiat = memero_fiat.mood;
  }
  
   if(!memero_cripto.still_Alive)
  {
    img_cripto = memero_cripto.badge_meme;
    line_cripto = memero_cripto.mood;
  }
  
  if(memero_oro.still_Alive && !memero_fiat.still_Alive && !memero_cripto.still_Alive)
  {
     memero_oro.badge_meme = img_win_final;
     img = memero_oro.badge_meme; 
     memero_oro.ethos_level = 10;
     memero_oro.pathos_level =10;
     memero_oro.logos_level = 10;
  }
  
  if(memero_fiat.still_Alive && !memero_oro.still_Alive && !memero_cripto.still_Alive)
  {
     memero_fiat.badge_meme = img_win_final;
     img_fiat = memero_fiat.badge_meme; 
     memero_fiat.ethos_level = 10;
     memero_fiat.pathos_level =10;
     memero_fiat.logos_level = 10;
  }
  
  if(memero_cripto.still_Alive && !memero_oro.still_Alive && !memero_fiat.still_Alive)
  {
     memero_cripto.badge_meme = img_win_final;
     img_cripto = memero_cripto.badge_meme; 
     memero_cripto.ethos_level = 10;
     memero_cripto.pathos_level =10;
     memero_cripto.logos_level = 10;
  }  

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
    
    println("Memero Cripto ante estos momoazos: Ethos="+memero_cripto.ethos_level+" Pathos="+memero_cripto.pathos_level+" Logos="+memero_cripto.logos_level);
    regla_ethos(memero_cripto);
    regla_pathos(memero_cripto);
    regla_logos(memero_cripto);
    


}


void regla_ethos(Memero memero){
  if(memero.ethos_level<=0){
    memero.mood_ethos = memero.nombre+" se siente ingnorante \n y promete investigar sobre el tema ( U_U) "; 
    println(memero.mood_ethos); 
    memero.badge_meme = img_final_ethos;
    memero.mood = memero.mood+"\n"+memero.mood_ethos;
    memero.still_Alive=false;
  }
} 


void regla_pathos(Memero memero){
  if(memero.pathos_level<=0){
    memero.mood_pathos = memero.nombre+" ya se enojo \n y esta agrediendo a todos ( >_< ) "; 
    println(memero.mood_pathos); 
    memero.badge_meme = img_final_pathos;
    memero.mood = memero.mood+"\n"+memero.mood_pathos;
    memero.still_Alive=false;
  }
} 

void regla_logos(Memero memero){
  if(memero.logos_level<=0){    
    memero.mood_logos = memero.nombre+" se siente tonto \n y pide disculpas ( @_@) "; 
    memero.badge_meme = img_final_logos;
    memero.mood = memero.mood+"\n"+memero.mood_logos;
    println(memero.mood_logos);     
    memero.still_Alive=false;
  }
}

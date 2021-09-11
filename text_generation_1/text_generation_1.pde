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

// the more you try to be free, the more restraints you confront
void setup () {
  
 
  
  
  
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
  
  //pg_oro = initSurfaceX();
  //pg_fiat = initSurfaceX();
  //pg_cripto = initSurfaceX();
  
  //  pg_oro.background(0);
  //pg_oro.rect(x_1, 0, width/3, height); //(width >> 1, height >> 1, width*.5, height*.5);
  //img.mask( pg_oro.get() );
  
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
  
  
  
  /*
  fill (0);
  text (line_fiat, 52+x_2, height-18);
  fill (255);
  text (line_fiat, 50+x_2, height-20);
  
  fill (0);
  text (line_cripto, 104+x_3, height-18);
  fill (255);
  text (line_cripto, 100+x_3, height-20);
  */
}
// ...but obstacles are set only by yourself - you attach yourself to them!
void generate () {
  // use RiTa's Markov to produce a new line
  line = join (rm.generate (1), "\n");
  line = join (line.split("(?<=\\G.{60})"),"\n");
  line =  line.replace(".",".\n").replace("?","?\n").replace("!","!\n").replace(",",",\n").replace("!!","!");
  //line = join (line.split("(?<=\\G.{60})"),"\n");
  
  line_fiat = join (rm_fiat.generate (1), "\n");
  line_fiat = join (line_fiat.split("(?<=\\G.{60})"),"\n");
  line_fiat =  line_fiat.replace(".",".\n").replace("?","?\n").replace("!","!\n").replace(",",",\n").replace("!!","!");
  
  line_cripto = join (rm_cripto.generate (1), "\n");
  line_cripto = join (line_cripto.split("(?<=\\G.{60})"),"\n");
  line_cripto =  line_cripto.replace(".",".\n").replace("?","?\n").replace("!","!\n").replace(",",",\n").replace("!!","!");
  
  // pick any random image
  img = images [(int)random (0, images.length)];
  img_fiat = images_fiat [(int)random (0, images.length)];
  img_cripto = images_cripto [(int)random (0, images.length)];
  

  
  
}
void keyTyped () {
  generate ();
}
void mouseClicked () {
  generate ();
}
// so, in order to be free, just BECOME free! Also 1517

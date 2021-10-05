

JSONObject json_db;

PFont font_oro;
PFont font_fiat;
PFont font_cripto;


String intro_mercancia;
String intro_fiat;
String intro_cripto;

void setup() {
  size(1500,975);
  loadData();
  
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
  
  
  
}

void loadData(){
  json_db = loadJSONObject("model/DB.json");
  
  // set presentation parameters
  font_oro = createFont("fonts/Italianno/Italianno-Regular.ttf",24);
  font_fiat = createFont("fonts/Cinzel/Cinzel-VariableFont_wght.ttf",17);
  font_cripto = createFont("fonts/Turret_Road/TurretRoad-Regular.ttf",17);

  
}

String fix_line(String my_line){
  //my_line = join (my_line.split("(?<=\\G.{55})"),"\n");
  my_line =  my_line.replace(".",".\n").replace("?","?\n").replace("!","!\n").replace(",",",\n").replace("  ","\n").replace("\n\n","\n").replace("-","\n").replace("!!","!");  
 return my_line; 
}


void draw(){
  background(255);
  fill(0);
  textFont(font_oro);
  text(intro_mercancia, 2, 525);
  
  textFont(font_fiat);
  text(intro_fiat, 500, 525);
  
  textFont(font_cripto);
  text(intro_cripto, 1000, 525);
}

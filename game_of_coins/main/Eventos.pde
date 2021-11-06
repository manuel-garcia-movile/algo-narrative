

final String KEY_ORO = "D-mercancia";
final String KEY_FIAT = "D-fiat";
final String KEY_CRIPTO = "D-crypto";

Textlabel textlabelProblema;
Textlabel textlabelSeduccion;
Textlabel textlabelExcusa;


public void controlEvent(ControlEvent theEvent) {
  println("CONTROL EVENT: "+theEvent.getController().getName());
}

public void elijo_oro(int theValue) {
  println("a button event from a button: "+theValue);
  if(isReady()) {oro_journey();}
  ready++;
}


public void elijo_fiat(int theValue) {
  println("a button event from a button: "+theValue);
  if(isReady()) {fiat_journey();}
  ready++;
}

public void elijo_cripto(int theValue) {
  println("a button event from a button: "+theValue);
  if(isReady()) {cripto_journey();}
  ready++;
}


void oro_journey(){
  hideIntros();
  cp5.getController("elijo_fiat").hide();
  cp5.getController("elijo_cripto").hide();
  
  escenario(KEY_ORO);
                 
}

void fiat_journey(){
  hideIntros();
  cp5.getController("elijo_oro").hide();
  cp5.getController("elijo_cripto").hide();
  
  escenario(KEY_FIAT);

}

void cripto_journey(){
  hideIntros();
  cp5.getController("elijo_fiat").hide();
  cp5.getController("elijo_oro").hide();
  
  escenario(KEY_CRIPTO);
  
}


void hideIntros(){    
  textlabelIntro_oro.hide();
  textlabelIntro_fiat.hide();
  textlabelIntro_cripto.hide();
}



void escenario(String keyMoneda){
  
  JSONObject moneda = json_db.getJSONObject(keyMoneda);
  JSONArray problemas = moneda.getJSONArray("problemas");
  
  // c/u tiene siempre 3 problemas disponibles
  int index = (int)random (0, 2);
  
  JSONObject problema = null;
  
  //busca un problema que no haya ocurrido
  for(int i = 0; i< problemas.size(); i++){
    
    problema = problemas.getJSONObject(i);
    String DONE = problema.getString("DONE");
  
  
    if(DONE==null){ // still problem?    
      break;
    }else{ // no more problems for you
      problema = null;
    }
  
  }
  
  if(problema != null){
    face_problem(problema, keyMoneda);
  }else{
    finalizar(moneda, keyMoneda);
  }
  


} 



void face_problem(JSONObject problema, String keyMoneda){

   problema.setString("DONE","TRUE");
    
   te_doy_problema(problema,keyMoneda);

}



void finalizar(JSONObject moneda,String keyMoneda){
println("ADIOS");

//hideIntros();
  cp5.getController("elijo_oro").hide();
  cp5.getController("elijo_cripto").hide();

JSONObject FINAL = moneda.getJSONObject("FINAL");
String textoFinal = fix_line(FINAL.getString("texto")); 


PFont fuente = null;
PImage imagen_final = null;

switch(keyMoneda){
  case KEY_ORO:{
                fuente = font_oro;
                imagen_final = loadImage ( "images/Oro Dead.jpeg");
                break;
              }
  case KEY_FIAT:{
                fuente = font_fiat;
                imagen_final = loadImage ( "images/FIAT Dead.jpeg");
                break;
              }
  case KEY_CRIPTO:{
                fuente = font_cripto;
                imagen_final = loadImage ( "images/Crypto Dead.jpeg");
                break;
              }
            
}


imagen_final.resize(width, height);
     
  PImage[] imgs_fiat_btn = {imagen_final,imagen_final,imagen_final};
  Button end_button = (Button)cp5.getController("elijo_fiat"); 
  //tome la del fiat porque esta al centro y como es el final no habra nada mas que hacer 
  
     end_button
     .setPosition(0,0) //140,300
     .setImages(imgs_fiat_btn)
     .updateSize()
     .lock() // un boton que no deje hacer nada
     .show()
     ;   

//clean all text:
textlabelIntro_oro.setText("").show();
textlabelIntro_fiat.setText("").show();
textlabelIntro_cripto.setText("").show();
textlabel_problem.setText("").show();


textlabel_problem
                   .setText(textoFinal)
                   .setFont(fuente)
                   .setPosition(30,400)
                   .setColorValue(0xffffffff)
                   .show();



}


/**
Misterioso comportamiento hace que se activen todos los eventos del 
mouse al abrir la aplicacion. 
La vida es corta, asi que solo voy a meter un
contador para que no este chingando con eso y quiza algun dia alguien lo arregle bien.
**/

int ready = 0;

boolean isReady(){
return (ready>2? true: false);
}

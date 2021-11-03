

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

  //JSONObject problema = problemas.getJSONObject(index);
  problema.setString("DONE","TRUE");
  String txtProblema = fix_line(problema.getString("problema"));
  String txtExcusa = fix_line(problema.getString("EXCUSA"));
  
  JSONArray seducciones = problema.getJSONArray("SEDUCCIONES");
  
 //por logica maximo deberia hacer 2 seducciones: 
 for (int i = 0; i< seducciones.size(); i++) {
   JSONObject seduccion = seducciones.getJSONObject(i);
   String tipo_moneda_seduccion = seduccion.getString("tipo");
   String texto_seduccion = fix_line(seduccion.getString("texto")); 
   
   
   /// lo pondrmoes en otros transision
   /*
   switch(tipo_moneda_seduccion){
         case KEY_ORO:{
                   textlabelIntro_oro
                   .setText(texto_seduccion)
                   .show();
                   cp5.getController("elijo_oro").show();
                   break;
                 }
          case KEY_FIAT:{
                   textlabelIntro_fiat
                   .setText(texto_seduccion)
                   .show();
                   cp5.getController("elijo_fiat").show();
                   break;
                 }
          case KEY_CRIPTO:{
                   textlabelIntro_cripto
                   .setText(texto_seduccion)
                   .show();
                   cp5.getController("elijo_cripto").show();
                   break;
                 }            
     default:{break;}
   }
  */
   
 }
  
    /// lo pondremso en otros transision
    
    /*
    textlabelExcusa = cp5.addTextlabel("label_excusa")
                         .setPosition(200,900)
                         .setColorValue(0x00000000)
                         .setText(txtExcusa)
                         .hide();
    textlabelExcusa.draw(this);
    
    */
    
    te_doy_problema(problema,keyMoneda);

/*
     switch(keyMoneda){
         case KEY_ORO:{
                      
                   textlabelIntro_oro
                   .setText(txtProblema)
                   .show();
                   cp5.getController("elijo_oro").show();
                   
                   textlabelExcusa                   
                   .setFont(font_oro)
                   .show();
                   
                   
                   
                   break;
                 }
          case KEY_FIAT:{
                   textlabelIntro_fiat
                   .setText(txtProblema)
                   .show();
                   cp5.getController("elijo_fiat").show();
                   
                   textlabelExcusa                   
                   .setFont(font_fiat)
                   .show();

                   break;
                 }
          case KEY_CRIPTO:{
                   textlabelIntro_cripto
                   .setText(txtProblema)
                   .show();
                   cp5.getController("elijo_cripto").show();
                   
                   textlabelExcusa                   
                   .setFont(font_cripto)
                   .show();

                   break;
                 }            
     default:{break;}
   }
*/


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



textlabelIntro_oro
                   .setText(textoFinal)
                   .setFont(fuente)
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

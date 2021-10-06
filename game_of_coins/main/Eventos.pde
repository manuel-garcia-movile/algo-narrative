

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

}

void cripto_journey(){
  hideIntros();
  cp5.getController("elijo_fiat").hide();
  cp5.getController("elijo_oro").hide();
}


void hideIntros(){    
  textlabelIntro_oro.hide();
  textlabelIntro_fiat.hide();
  textlabelIntro_cripto.hide();
}



void escenario(String keyMoneda){
  
  JSONObject moneda = json_db.getJSONObject(keyMoneda);
  JSONArray problemas = moneda.getJSONArray("problemas");
  
  // c/u solo tiene 3 problemas disponibles
  int index = (int)random (0, 2);
  
  JSONObject problema = problemas.getJSONObject(index);
  String txtProblema = problema.getString("problema");
  String txtExcusa = problema.getString("EXCUSA");
  
  
  PFont fuente = (keyMoneda == KEY_ORO ? font_oro : (keyMoneda == KEY_FIAT ? font_fiat : font_cripto) );
  
   textlabelProblema = cp5.addTextlabel("label_problema")
                    .setText(txtProblema)
                    .setPosition(100,50)
                    .setColorValue(0x00000000) // amarillo 0xffffff00
                    .setFont(fuente);
                    
  textlabelProblema.draw(this);  
  
  textlabelExcusa = cp5.addTextlabel("label_excusa")
                    .setText(txtExcusa)
                    .setPosition(10,100)
                    .setColorValue(0x00000000)
                    .setFont(fuente);
                    
  textlabelExcusa.draw(this); 
  
  

} 






/**
Misterioso comportamiento hace que se activen todos los eventos del 
mouse al abrir la aplicacion. La vida es corta, asi que solo voy a meter un
contador para que no este chingando con eso y quiza algun dia alguien lo arregle bien.
**/

int ready = 0;

boolean isReady(){
return (ready>2? true: false);
}




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
  cp5.getController("elijo_fiat").hide();
  cp5.getController("elijo_cripto").hide();

}

void fiat_journey(){
  cp5.getController("elijo_oro").hide();
  cp5.getController("elijo_cripto").hide();

}

void cripto_journey(){
  cp5.getController("elijo_fiat").hide();
  cp5.getController("elijo_oro").hide();
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

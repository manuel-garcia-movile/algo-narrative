String current_keyMoneda="";


void te_doy_problema(JSONObject problema,String keyMoneda){
println("Veamos el problema de "+keyMoneda);

String txtProblema = fix_line(problema.getString("problema"));

current_problem = problema;
current_keyMoneda = keyMoneda;

 // a mimir estos botones
 cp5.getController("elijo_oro").hide();
 cp5.getController("elijo_fiat").hide();
 cp5.getController("elijo_cripto").hide();

PFont fuente = null;
PImage imagen_problema = null;

switch(keyMoneda){
  case KEY_ORO:{
                fuente = font_oro;
                imagen_problema = loadImage ("images/Oro.jpeg");
                break;
              }
  case KEY_FIAT:{
                fuente = font_fiat;
                imagen_problema = loadImage ("images/FIAT.jpeg");
                break;
              }
  case KEY_CRIPTO:{
                fuente = font_cripto;
                imagen_problema = loadImage ("images/Crypto.jpeg");
                break;
              }
            
}


imagen_problema.resize(width, height);
     
  PImage[] imgs_problem_btn = {imagen_problema,imagen_problema,imagen_problema};
 
  
 cp5.addButton("problema_button")
     .setPosition(0,0) //140,300
     .setImages(imgs_problem_btn)
     .updateSize()
     //.lock()
     .show()
     ;   


textlabel_problem = cp5.addTextlabel("label_problem")
                   .setText(txtProblema)
                   .setFont(fuente)
                   .setPosition(100,400)
                   .setColorValue(0xffffffff)
                   //.setColorValue(0x00000000)
                   .show();


}




public void problema_button(int theValue) {
  println("a button event from a button: "+theValue);
  println("Ir a dar excusa...");
  te_doy_excusa();
  
}



void te_doy_excusa(){
  println("Veamos ahora la excusa de "+current_keyMoneda);
  String txtExcusa = fix_line(current_problem.getString("EXCUSA"));
  PFont fuente = null;
  PImage imagen_excusa = null;
  PImage imagen_btn_excusa = null;
  PImage imagen_btn_excusa_2 = null;
  Button excusa_button = null;
  
  int ancho_img_excusa = 0;
  
  switch(current_keyMoneda){
  case KEY_ORO:{
                fuente = font_oro;
                imagen_excusa = loadImage ("images/Oro Ang.jpeg");
                imagen_btn_excusa = loadImage ("images/Oro Ang NoBG.png");
                imagen_btn_excusa_2 = loadImage ("images/Oro Sed NoBG.png");
                excusa_button = (Button)cp5.getController("elijo_oro");
                ancho_img_excusa = 0;
                break;
              }
  case KEY_FIAT:{
                fuente = font_fiat;
                imagen_excusa = loadImage ("images/FIAT Ang.jpeg");
                imagen_btn_excusa = loadImage ("images/FIAT Ang NoBG.png");
                imagen_btn_excusa_2 = loadImage ("images/FIAT Sed NoBG.png");
                excusa_button = (Button)cp5.getController("elijo_fiat");
                ancho_img_excusa = ancho;
                break;
              }
  case KEY_CRIPTO:{
                fuente = font_cripto;
                imagen_excusa = loadImage ("images/Crypto Ang.jpeg");
                imagen_btn_excusa = loadImage ("images/Crypto Ang NoBG.png");
                imagen_btn_excusa_2 = loadImage ("images/Crypto Sed NoBG.png");
                excusa_button = (Button)cp5.getController("elijo_cripto");
                ancho_img_excusa = ancho*2;
                break;
              }
            
}
  
  

  
  imagen_btn_excusa.resize(ancho, altura_img_inicio); //ancho, altura_img_inicio
  imagen_btn_excusa_2.resize(ancho, altura_img_inicio); //ancho, altura_img_inicio
     
  PImage[] imgs_excusa_btn = {imagen_btn_excusa,imagen_btn_excusa_2,imagen_btn_excusa};
  //Button excusa_button = (Button)cp5.getController("problema_button");
  
   excusa_button
     .setImages(imgs_excusa_btn)
     .updateSize()
     .setPosition(ancho_img_excusa,0)
     //.lock()
     .show()
     ;   
     
 textlabel_problem.setText(txtExcusa)
                  .setPosition(ancho_img_excusa,600)
                  .show();    
  
  imagen_excusa.resize(width, height);
  img_fondo = imagen_excusa;
  //img_fondo.resize(width, height);
     
 /// vamos a seducirlo!
 te_doy_seducciones(current_problem,current_keyMoneda);
     
  
}



void te_doy_seducciones(JSONObject problema,String keyMoneda){
println("Ahora veamos como es seducido el usuario de "+keyMoneda);

((Button)cp5.getController("problema_button")).hide();

  JSONArray seducciones = problema.getJSONArray("SEDUCCIONES");
  
 //por logica maximo deberia hacer 2 seducciones: 
 for (int i = 0; i< seducciones.size(); i++) {
   JSONObject seduccion = seducciones.getJSONObject(i);
   String tipo_moneda_seduccion = seduccion.getString("tipo");
   String texto_seduccion = fix_line(seduccion.getString("texto")); 
   
   

   switch(tipo_moneda_seduccion){
         case KEY_ORO:{
                   textlabelIntro_oro
                   .setText(texto_seduccion)
                   .show();
                   
                   PImage[] imgs = {img_oro_nobg,img_oro_sed_nobg,img_oro_nobg};
                   Button seductor_btn = (Button)cp5.getController("elijo_oro");
                   seductor_btn.setImages(imgs).show();
                   break;
                 }
          case KEY_FIAT:{
                   textlabelIntro_fiat
                   .setText(texto_seduccion)
                   .show();
                   
                   PImage[] imgs = {img_fiat_nobg,img_fiat_sed_nobg,img_fiat_nobg};
                   Button seductor_btn = (Button)cp5.getController("elijo_fiat");
                   seductor_btn.setImages(imgs).show();
                   break;
                 }
          case KEY_CRIPTO:{
                   textlabelIntro_cripto
                   .setText(texto_seduccion)
                   .show();
                   
                   PImage[] imgs = {img_cripto_nobg,img_cripto_sed_nobg,img_cripto_nobg};
                   Button seductor_btn = (Button)cp5.getController("elijo_cripto");
                   seductor_btn.setImages(imgs).show();
                   break;
                 }            
     default:{break;}
   }
  
   
 }


}

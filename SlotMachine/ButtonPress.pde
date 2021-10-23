void mousePressed(){
  if (on_button()){
    
    if (left.is_active==true){
      left.is_active = false;
      outcomes[0] = left.current_symbol;
    } else if (middle.is_active==true){
      middle.is_active = false;
      outcomes[1] = middle.current_symbol;
    } else if (right.is_active == true){
      right.is_active = false;
      outcomes[2] = right.current_symbol;
      outcome();
    } else {
      // press the button again to restart
      restart();
      screen_text = "TRY AGAIN!";
    }
   
  }  
  
}

void restart(){
  /** re-sets the .is_active variables for each instance of Slot to true and subtracts the users score by 5. **/
   left.is_active = true;
   middle.is_active = true;
   right.is_active = true; 
   score -= 5; 
}


boolean on_button(){
  /** Determines if the mouse is on the red button 
      Code Inspired by: https://processing.org/examples/button.html
  **/
  
  float disX = 1290 - mouseX;
  float disY = 145 - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < 200/2 ) {
    return true;
  } else{
    return false;
  }
}

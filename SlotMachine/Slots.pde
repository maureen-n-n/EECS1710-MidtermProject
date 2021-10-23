/** Slots **/

class Slot {
  /** Defines a slot in the slot machine. **/
  int current_symbol;
  boolean is_active;

  Slot(){
    current_symbol = 0;
  }
  
  void choose_symbol(){
    /** randomly chooses a random number between 0 and 5 corresponding to the array symbols. **/
    if (is_active == true) {   
      current_symbol = int(random(symbols.length));
      delay(50);    
    }  
  }
 
}

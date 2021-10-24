void outcome(){ 
  /** **/
  if (left.is_active == false && middle.is_active == false && right.is_active == false){
    if (outcomes[0] == outcomes[1] && outcomes[0] == outcomes[2]){
      // all three slots are the same!
      if (outcomes[0] == 5){
        // JACKPOT! you rolled all 7s
        screen_text = "+ 100 POINTS";
        score += 100;
        jackpot.play();
        
      } else {
        println("all fruit");
        screen_text = "+50 POINTS";
        score +=50;
        kaching.play();
      }
      
      
      
    } else if (outcomes[0] == outcomes[1] || outcomes[0] == outcomes[2] || outcomes[1] == outcomes[2]) {
      // only one pair
      println("only one pair ");
      if (outcomes[0] == 5 && outcomes[1] == 5 || outcomes[0] == 5 && outcomes[2] ==5 || outcomes[1] == 5 && outcomes[2] == 5){
        screen_text = "+25 POINTS";
        score+= 25;
        kaching.play();
      } else {
        screen_text = "+15 POINTS";
        score += 15;
        kaching.play();
      }
      
         
    } else {
      // none of the slots are the same but if one is 7 add 10 to score
      if(outcomes[0] == 5 || outcomes[1] == 5 || outcomes[2] == 5){
        //one of the slots is a 7
        screen_text = "+5 POINTS";
        score += 5;
        coin.play();
      } else {
        screen_text = " +0 POINTS";
        aww.play();
      }
    }
  }
  
}

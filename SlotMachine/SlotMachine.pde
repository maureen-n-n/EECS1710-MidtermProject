/** EECS1710 Midterm Project - One Button Game
        -------- Slot Machine --------
**/

PFont font;
Slot left, middle, right;
PImage background, background2;
String[] symbolURLs = {"banana.png", "cherry.png", "lemon.png", "orange.png", "watermelon.png", "seven.png"};
int[] outcomes = new int[3];
PImage[] symbols = new PImage[symbolURLs.length];
int buttonx, buttony;
int score = 100;
String screen_text = "Press the red button to start!";


void setup() {
  textAlign(CENTER);
  font = loadFont("Dialog.bolditalic-48.vlw"); 
  textFont(font);

  left = new Slot();
  left.is_active = true;
  
  middle = new Slot();
  middle.is_active = true;
  
  right = new Slot();
  right.is_active = true;

  size(1400, 1000, P2D);
  for (int i=0; i<symbols.length; i++){
    symbols[i] = loadImage(symbolURLs[i]);
    symbols[i].resize(width/6, height/4);
  }
  
  background = loadImage("background.png");
  background2 = loadImage("background2.png");
}

void draw(){
  //fill(0, 0, 255);
  //ellipse(1290, 145, 200, 200);
  
  if (mousePressed && on_button()){
    image(background2, 0, 0);
  } else {
    image(background, 0,0);
  }
   
  // display score at top left
  textSize(50);
  text("SCORE: " + score, 200, 100);
  
  // displays text on the bottom screen
  fill(0);
  textSize(57);
  text(screen_text, width/2 - 50, 860);

 
  image(symbols[left.current_symbol],150,height/3);
  left.choose_symbol();
 
  
  image(symbols[middle.current_symbol], width/2 - 150, height/3);
  middle.choose_symbol();
  
  
  image(symbols[right.current_symbol], width - 470, height/3);
  right.choose_symbol();
  
  
}

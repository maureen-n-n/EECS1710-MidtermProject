/** EECS1710 Midterm Project - One Button Game
    ------------ Slot Machine ----------------
    For the one button game midterm project, I decided to emulate a simple slot machine.
    The slots have six symbols: banana, cherry, lemon, orange, watermelon and seven.
    
    Please read the README file on Github to see the different outcomes!
    
    sound credits:
    bgm.wav - https://www.youtube.com/watch?v=DCTggKrpMWs&t=26s&ab_channel=SirBaki
    crank.wav - https://www.youtube.com/watch?v=0jG6lNj2foM&ab_channel=DDosKey
    aww.wav - https://www.youtube.com/watch?v=cJJBtAVwz0c&ab_channel=SoundEffectDatabase
    kaching.wav - https://www.youtube.com/watch?v=4kVTqUxJYBA&ab_channel=GamingSoundFX
    coin.wav - https://www.youtube.com/watch?v=MFm2OAQ4sOQ&ab_channel=GFXSounds
    jackpot.wav - https://www.youtube.com/watch?v=UpkC0vMxdDU&ab_channel=SoundLibrary   
**/

// Importing and initializing the sound library and variables
import processing.sound.*;
SoundFile bgm, crank, aww, kaching, coin, jackpot;

// Initialize three instances of the Slot class
Slot left, middle, right;

PFont font;
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
  
  bgm = new SoundFile(this, "bgm.wav");
  crank = new SoundFile(this, "crank.wav");
  aww = new SoundFile(this, "aww.wav");
  kaching = new SoundFile(this, "kaching.wav");
  coin = new SoundFile(this, "coin.wav");
  jackpot = new SoundFile(this, "jackpot.wav");
  
  bgm.loop();

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
  if (mousePressed && on_button()){
    image(background2, 0, 0);
  } else {
    image(background, 0,0);
  }
   
  // display score at top left
  textSize(50);
  fill(#FFDB76);
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

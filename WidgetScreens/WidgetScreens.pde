
Screen screenOne; 
Screen screenTwo;
Widget forwardButton; 
Widget backwardButton;
int screen;
PFont stdFont;

final int EVENT_FORWARD=1;
final int EVENT_BACKWARD=2;
final int EVENT_NULL=0;



void setup() {
  size(650, 650);
  
  stdFont = loadFont("Impact-48.vlw");
  textFont(stdFont);

  screenOne = new Screen(color(230, 230, 100));
  screenTwo = new Screen(color(100, 230, 230));
  screen = 1;

  forwardButton=new Widget(180, 200, 300, 80, "Forwards -->", color(100), stdFont, EVENT_FORWARD);
  backwardButton=new Widget(180, 300, 300, 80, "<-- Backwards", color(100), stdFont, EVENT_BACKWARD);

  screenOne.addWidget(forwardButton);
  screenOne.addWidget(backwardButton);

  screenTwo.addWidget(forwardButton);
  screenTwo.addWidget(backwardButton);
}

void draw() {
  if (screen == 1) {
    screenOne.draw();
  } else {
    screenTwo.draw();
  }
}

void mousePressed() {
  if (screen == 1) {
    int event = screenOne.getEvent();
    switch(event) {
    case EVENT_FORWARD:
      screen = 2;
      break;
    case EVENT_BACKWARD:
      println("You can't go back");
      break;
    }
  } else {
    int event = screenTwo.getEvent();
    if (event == EVENT_BACKWARD) {
      screen = 1;
    } else if (event == EVENT_FORWARD) {
      println("You can't go forwards");
    }
  }
}

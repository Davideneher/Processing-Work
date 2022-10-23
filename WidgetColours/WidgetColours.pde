ArrayList widgetList;
PFont stdFont;
final int EVENT_BUTTON1=1;
final int EVENT_BUTTON2=2;
final int EVENT_BUTTON3=3;
final int EVENT_NULL=0;

Widget widget1, widget2, widget3;

color squareColor;
color borderColor;

void setup() {
  squareColor = color(0, 0, 0);
  borderColor = color(0, 0, 0);

  size(650, 650);

  textSize(60);
  stdFont=loadFont("Impact-48.vlw");
  textFont(stdFont);

  widget1=new Widget(0, 200, 200, 80, "Red", color(255, 0, 0), stdFont, EVENT_BUTTON1);
  widget2=new Widget(0, 300, 200, 80, "Green", color(0, 255, 0), stdFont, EVENT_BUTTON2);
  widget3=new Widget(0, 400, 200, 80, "Blue", color(0, 0, 255), stdFont, EVENT_BUTTON3);

  widgetList = new ArrayList();
  widgetList.add(widget1); 
  widgetList.add(widget2);
  widgetList.add(widget3);
}
void draw() {
  background(100, 100, 100);

  for (int i= 0; i<widgetList.size(); i++) {
    Widget widgets = (Widget)widgetList.get(i);
    if (mouseX > widgets.x && mouseX < widgets.x + widgets.width && mouseY > widgets.y && mouseY < widgets.y + widgets.height) {
      borderColor = color(255, 255, 255);
    } else {
      borderColor = color(0, 0, 0);
    }
    stroke(borderColor);
    strokeWeight(2);
    widgets.draw();
  }

  fill(squareColor);
  noStroke();
  rect(300, 300 , 80, 80);
}

void mousePressed() {
  int event;

  for (int i = 0; i<widgetList.size(); i++) {
    Widget widgets = (Widget) widgetList.get(i);
    event = widgets.getEvent(mouseX, mouseY);
    switch(event) {
    case EVENT_BUTTON1:
      println("button 1!");
      squareColor = color(255, 0, 0);
      break;
    case EVENT_BUTTON2:
      println("button 2!");
      squareColor = color(0, 255, 0);
      break;
    case EVENT_BUTTON3:
      println("button 3!");
      squareColor = color(0, 0, 255);
      break;
    }
  }
}

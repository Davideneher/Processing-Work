import controlP5.*;

ControlP5 cp5;

Chart myChart;

void setup() {
  size(400, 700);
  frameRate(50);
  smooth();
  cp5 = new ControlP5(this);
  cp5.printPublicMethodsFor(Chart.class);
  myChart = cp5.addChart("STOCKS")
               .setPosition(50, 50)
               .setSize(200, 200)
               .setRange(-20, 20)
               .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
               ;

  myChart.getColor().setBackground(color(255, 100));

  myChart.addDataSet("world");
  myChart.setColors("world", color(255));
  myChart.setData("world", new float[10]);

  myChart.setStrokeWeight(1.5);

}


void draw() {
  background(0);
    // add data on the right side of the chart
    myChart.addData("world",sin(frameCount*0.1)*10);
    // if the dataSet has more than the required data entries, delete the first one on the left
    if(myChart.getDataSet("world").size()>10) {
      myChart.removeData("world",0);
    }
}

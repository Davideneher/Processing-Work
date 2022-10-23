import controlP5.*;

ControlP5 cp5;
Chart myChart;

void setup() {
  size(400, 700);

  cp5 = new ControlP5(this);
  myChart = cp5.addChart("NASDAQ")
               .setPosition(50, 50)
               .setSize(200, 200)
               .setRange(0, 10)
               .setView(Chart.BAR)
               ;

  myChart.getColor().setBackground(color(255, 100));
  myChart.addDataSet("stocks");
  myChart.setColors("stocks", color(255,0,255) , color(255,0,0) );
  myChart.setData("stocks", new float[] {1,4,9,3,4,8,4,2,5,8,7,6,5,3,2,3});

}


void draw() {
  background(0);
  
  if(cp5.isMouseOver( myChart )) {
    String set = "stocks";
    int s = myChart.getDataSet( set ).size();
    int n = int( constrain( map( myChart.getPointer().x() , 0 , myChart.getWidth() , 0 , s ) , 0 , s ) ) ;
    float value =  myChart.getData( set , n ).getValue();
    println(String.format( "value for dataset %s : item %d = %.2f", set , n , value ) );
  }
}

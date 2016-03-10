ArrayList<PImage> pdfImageList = new ArrayList<PImage>();  // Declare a variable of type PImage
int nOfIcons = 1;
float aspectRatio = 1.414;
import controlP5.*;
ControlP5 cp5;
DropdownList d1;

void setup() {
  size(displayWidth,displayHeight);
  // for the drop down
  
  cp5 = new ControlP5(this);
  d1 = cp5.addDropdownList("number of pages").setPosition(100, 25);    
  customize(d1);
  
  // for the icons
  createImageList();
  windowInitializer();
  sizeOfIconsCalculator();
}

void customize(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
 
  for (int i=0;i<120;i++) {
    ddl.addItem(""+i, i);
  }
  //ddl.scroll(0);
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}


void draw() {
  background(0);  
  int currentIconNumber = 0;
  for (int i=0; i<nOfIcons; i++)
  {
    int[] currentDrawLocation = drawPositionSetter(currentIconNumber);
    float[] currentIconDimension = sizeRetriever(currentIconNumber);
    image(pdfImageList.get(i),currentDrawLocation[0],currentDrawLocation[1],currentIconDimension[0], currentIconDimension[1]);
    currentIconNumber = currentIconNumber+1;
  }
}
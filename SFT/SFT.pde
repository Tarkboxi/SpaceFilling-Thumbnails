ArrayList<PImage> pdfImageList = new ArrayList<PImage>();  // Declare a variable of type PImage
int nOfIcons = 1;
float aspectRatio = 1.414;
import controlP5.*;
ControlP5 cp5;
DropdownList d1;
int currentHoveredIcon = 0;
boolean fillThumb = false;
float[] filledThumbNail = new float[5];
boolean drawAgain = false;
PImage bgImage;
boolean eraseFill = false;

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
  
  int currentIconNumber = 0;
  background(0);  
  for (int i=0; i<nOfIcons; i++)
  {
    int[] currentDrawLocation = drawPositionSetter(currentIconNumber);
    float[] currentIconDimension = sizeRetriever(currentIconNumber);
    image(pdfImageList.get(i),currentDrawLocation[0],currentDrawLocation[1],currentIconDimension[0], currentIconDimension[1]);
    currentIconNumber = currentIconNumber+1;
  }
}

void customize(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
 
  for (int i=0;i<121;i++) {
    ddl.addItem(""+i, i);
  }
  //ddl.scroll(0);
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}

void draw() {
  int currentIconNumber = 0;
  if (drawAgain)
  {
    background(0);  
    for (int i=0; i<nOfIcons; i++)
    { 
      int[] currentDrawLocation = drawPositionSetter(currentIconNumber);
      float[] currentIconDimension = sizeRetriever(currentIconNumber);
      image(pdfImageList.get(i),currentDrawLocation[0],currentDrawLocation[1],currentIconDimension[0], currentIconDimension[1]);
      currentIconNumber = currentIconNumber+1;
    }
       saveFrame("/home1/grads/masokan/Desktop/processing-project/SpaceFilling-Thumbnails/SFT/data/savedFrame.jpg");
       delay(200);
       updateBg();
       drawAgain = false;
  }
  if (fillThumb)
    {
      SpaceFiller();
      if (fillThumb)
       {
        background(0);  
        image(bgImage,0,0,displayWidth, displayHeight);
        image(pdfImageList.get((int)filledThumbNail[4]),filledThumbNail[2],filledThumbNail[3],filledThumbNail[0], filledThumbNail[1]);
        eraseFill = true;
       }
    }
    if (!fillThumb)
    {
      if (eraseFill)
      {
        background(0);  
        image(bgImage,0,0,displayWidth, displayHeight);
      }
    }
}

void mouseMoved()
{
  checkForHit();
}
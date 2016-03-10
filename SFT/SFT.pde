PImage img;  // Declare a variable of type PImage
int nOfIcons = 25 ;
float aspectRatio = 1.414;


void setup() {
  size(displayWidth,displayHeight);
  //sizeOfIconsCalculator();
  // Make a new instance of a PImage by loading an image file
  img = loadImage("page-test.jpg"); // keep loadImage within setup, not in draw
  background(0);
  for (int i=0; i<nOfIcons; i++)
  {
    sizeOfIconsCalculator();
    image(img,insertPositionX,insertPositionY,(float) widthOfIcon, (float) heightOfIcon);
    currentIconNumber = currentIconNumber+1;
  }
}

void draw() {
  //
  // Draw the image to the screen at coordinate (0,0)
  
}
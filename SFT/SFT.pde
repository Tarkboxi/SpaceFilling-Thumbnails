ArrayList<PImage> pdfImageList = new ArrayList<PImage>();  // Declare a variable of type PImage
int nOfIcons = 12 ;
float aspectRatio = 1.414;


void setup() {
  size(displayWidth,displayHeight);
  createImageList();
  sizeOfIconsCalculator();
  background(0);  
}


void draw() {
  int currentIconNumber = 0;
  for (int i=0; i<nOfIcons; i++)
  {
    int[] currentDrawLocation = drawPositionSetter(currentIconNumber);
    float[] currentIconDimension = sizeRetriever(currentIconNumber);
    image(pdfImageList.get(i),currentDrawLocation[0],currentDrawLocation[1],currentIconDimension[0], currentIconDimension[1]);
    currentIconNumber = currentIconNumber+1;
  }
}
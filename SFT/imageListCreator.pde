void createImageList()
{
  
    PImage newImg;
    newImg = loadImage("page-test.jpg");
    for (int i = 0; i < 240 ; i++)
  {
    pdfImageList.add(newImg);
  }
}

void controlEvent(ControlEvent theEvent) {
   println("control called");
   nOfIcons = (int) d1.getValue();
   windowInitializer();
   sizeOfIconsCalculator();
}
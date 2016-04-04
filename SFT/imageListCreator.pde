PFont mono;

void createImageList()
{
  
    PImage newImg;
    mono = loadFont("CenturySchL-Roma-26.vlw");
  for (int i = 0; i < 120 ; i++)
  {
    newImg = loadImage(i+".jpg");
    pdfImageList.add(newImg);
  }
}

void updateBg()
{
  bgImage = loadImage("savedFrame.jpg");
}

void customize(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(255,255,255));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
 
  for (int i=0;i<121;i++) {
    ddl.addItem(""+i, i);
  }
  //ddl.scroll(0);
  ddl.setColorBackground(color(120, 120 , 120));
  ddl.setColorActive(color(0, 0, 0));
}
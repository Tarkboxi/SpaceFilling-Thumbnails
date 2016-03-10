void createImageList()
{
  for (int i = 0; i < 12 ; i++)
  {
    PImage newImg;
    newImg = loadImage("page-test.jpg");
    pdfImageList.add(newImg);
  }
}
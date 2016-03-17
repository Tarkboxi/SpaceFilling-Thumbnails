boolean mouseInside = false;
  
  
  
  
 void controlEvent(ControlEvent theEvent) {
   drawAgain = true;
   println("control called");
   nOfIcons = (int) d1.getValue();
 
   windowInitializer();
   sizeOfIconsCalculator();
}


 void checkForHit() 
 {
  fillThumb = false;
  for (int i=0 ; i<nOfIcons; i++)
  {
    float xStart = listOfXPositions.get(i);
    float yStart = listOfYPositions.get(i);

    float currentWidth = listOfWidths.get(i);
    float currentHeight = listOfHeights.get(i);
    
    if (mouseX > xStart && mouseX < ( xStart+currentWidth))
    {
      if (mouseY > yStart && mouseY < ( yStart+currentHeight) )
      {
        currentHoveredIcon = i;
        fillThumb = true;
      }
    }
  }
 }
 
 boolean checkClickHit()
 {
   for (int i=0 ; i<nOfIcons; i++)
  {
    float xStart = listOfXPositions.get(i);
    float yStart = listOfYPositions.get(i);

    float currentWidth = listOfWidths.get(i);
    float currentHeight = listOfHeights.get(i);
    
    if (mouseX > xStart && mouseX < ( xStart+currentWidth))
    {
      if (mouseY > yStart && mouseY < ( yStart+currentHeight) )
      {
        currentClickedIcon = i;
        return true;
      }
    }
  }
  return false;
 }

 
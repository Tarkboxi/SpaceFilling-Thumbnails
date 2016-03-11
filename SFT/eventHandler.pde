boolean mouseInside = false;
  
 void checkForHit() 
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
        currentHoveredIcon = i;
      }
    }
  }
 }

 